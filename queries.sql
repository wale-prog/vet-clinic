/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempt int,
    neutered boolean,
    weight_kg dec,
    primary key(id),
    species char(45)
);