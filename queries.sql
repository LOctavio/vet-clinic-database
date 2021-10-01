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

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' and date_of_visit = (SELECT MAX(visits.date_of_visit) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher');
SELECT COUNT(*) FROM visits JOIN animals ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez';
SELECT vets.name, species.name from vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = specializations.species_id;
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' and visits.date_of_visit between '2020-04-01' and '2020-08-30';
SELECT animals_name FROM (SELECT animals.name as animals_name, COUNT(visits.animals_id) as number_of_visits FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name) as newTable WHERE number_of_visits = (SELECT MAX(number_of_visits) FROM (SELECT animals.name as animals_name, COUNT(visits.animals_id) as number_of_visits FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name) as newTable);
SELECT animals.name as animals_name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' and visits.date_of_visit = (SELECT MIN(visits.date_of_visit) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith');
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name, visits.date_of_visit from animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit = (SELECT MAX(date_of_visit) FROM visits);
SELECT COUNT(visits.*) FROM visits LEFT JOIN specializations ON visits.vets_id = specializations.vets_id LEFT JOIN species ON specializations.species_id = species_id WHERE species.name is null;
SELECT species.name, COUNT(vets.*) FROM species JOIN animals ON species.id = animals.species_id JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name ='Maisy Smith' GROUP BY species.name;