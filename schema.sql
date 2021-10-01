/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id serial,
    name varchar(20),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species varchar(20);

CREATE TABLE owners(
    id serial,
    full_name varchar(30),
    age int,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id serial,
    name varchar(20),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id int;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD owner_id int;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets(
    id serial,
    name varchar(30),
    age int,
    date_of_graduation date,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    species_id int,
    vets_id int,
    FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
    animals_id int,
    vets_id int,
    date_of_visit date,
    FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE
);