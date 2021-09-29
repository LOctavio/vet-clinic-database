/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered = true and escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true; 
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg between 10.3 and 17.4;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete;
UPDATE animals SET weight_kg = weight_kg*(-1);
ROLLBACK TO delete;
UPDATE animals SET weight_kg = weight_kg*(-1) WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth between '1990-01-01' and '2000-12-31' GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name as owners_full_name, animals.name as animals_name FROM owners JOIN animals ON animals.owner_id = owners.id ORDER BY full_name;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE species.name = 'Digimon' and owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;
SELECT * FROM (SELECT owners.full_name, COUNT(*) as myCount FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name) as newTable WHERE myCount = (SELECT MAX(myCount) FROM (SELECT owners.full_name, COUNT(*) as myCount FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name) as newTable);