/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Agumon', DATE '2020-02-03', 0, true, 10.23)
('Gabumon', DATE '2018-11-15', 2, true, 8),
('Pikachu', DATE '2021-01-07', 1, false, 15.04),
('Devimon', DATE '2017-05-12', 5, true, 11),
('Charmander', DATE '2020-02-08', 0, false, -11),
('Plantmon', DATE '2022-11-15', 2, true, -5.7),
('Squirtle', DATE '1993-04-02', 3, false, -12.13),
('Angemon', DATE '2005-06-12', 1, true, -45),
('Boarmon', DATE '2005-06-07', 7, true, 20.4),
('Blossom', DATE '1998-10-13', 3, true, 17),

INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14)
('Jodie Whittaker', 38);

INSERT INTO species(name) VALUES ('Pokemon'), ('Digimon');

BEGIN;
UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Digimon') WHERE name like '%mon';
UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Pokemon') WHERE species_id is null;
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' or name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' or name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' or name = 'Boarmon';
COMMIT;

INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, DATE '2000-04-23'),
('Vet Maisy Smith', 26, DATE '2019-01-17'),
('Stephanie Mendez', 64, DATE '1981-05-04'),
('Jack Harkness', 38, DATE '2008-06-08');

INSERT INTO specializations (species_id, vets_id)
VALUES
((SELECT id from species WHERE name = 'Pokemon'), (SELECT id from vets WHERE name = 'William Tatcher')),
((SELECT id from species WHERE name = 'Digimon'), (SELECT id from vets WHERE name = 'Stephanie Mendez')),
((SELECT id from species WHERE name = 'Pokemon'), (SELECT id from vets WHERE name = 'Stephanie Mendez')),
((SELECT id from species WHERE name = 'Digimon'), (SELECT id from vets WHERE name = 'Jack Harkness'));