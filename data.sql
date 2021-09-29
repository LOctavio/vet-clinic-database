/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Agumon', DATE '2020-02-03', 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Gabumon', DATE '2018-11-15', 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Pikachu', DATE '2021-01-07', 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Devimon', DATE '2017-05-12', 5, true, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Charmander', DATE '2020-02-08', 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Plantmon', DATE '2022-11-15', 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Squirtle', DATE '1993-04-02', 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Angemon', DATE '2005-06-12', 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Boarmon', DATE '2005-06-07', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Blossom', DATE '1998-10-13', 3, true, 17);

INSERT INTO owners(full_name, age)
values ('Sam Smith', 34);
INSERT INTO owners(full_name, age)
values ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age)
values ('Bob', 45);
INSERT INTO owners(full_name, age)
values ('Melody Pond', 77);
INSERT INTO owners(full_name, age)
values ('Dean Winchester', 14);
INSERT INTO owners(full_name, age)
values ('Jodie Whittaker', 38);

INSERT INTO species(name)
values ('Pokemon');
INSERT INTO species(name)
values ('Digimon');

BEGIN;
UPDATE animals SET species_id = 2 WHERE name like '%mon';
UPDATE animals SET species_id = 1 WHERE species_id is null;
COMMIT;

BEGIN;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' or name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' or name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' or name = 'Boarmon';
COMMIT;