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
