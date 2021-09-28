/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id int,
    name text,
    date_of_birth datetime,
    escape_attempts int,
    neutered binary,
    weight_kg decimal
);
