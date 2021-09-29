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