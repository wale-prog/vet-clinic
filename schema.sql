/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempt int,
    neutered boolean,
    weight_kg dec,
    primary key(id),
    CONSTRAINT fk_animals_species_id 
        FOREIGN KEY (species_id) 
            REFERENCES species(id);
    CONSTRAINT fk_animals_owner_id
        FOREIGN KEY (owner_id)
            REFERENCES owners(id);
);

ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE owners (
    id INT SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
)

CREATE TABLE species (
    id INT SERIAL PRIMARY KEY,
    name VARCHAR(255)
)

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owber_id INT;