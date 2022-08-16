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
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation date
);

CREATE TABLE specializations(
    id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    animal_id INT REFERENCES animals(id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE,
    date_of_visit DATE
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120); 

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) 
SELECT * FROM (SELECT id FROM animals) animal_ids, 
(SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email)
select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

CREATE INDEX idx_serial_id ON visits(animal_id);
CREATE INDEX idx_vet_id ON visits(vet_id) WHERE email = 'owner_18327@mail.com';
CREATE INDEX idx_vet ON visits(vet_id) WHERE vet_id = 2;



