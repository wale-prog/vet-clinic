/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered,weight_kg ) VALUES ('Agumon', '2020-02-03', 0, true, 10.23 );
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered,weight_kg ) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered,weight_kg ) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered,weight_kg ) VALUES ('Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES('Sam Smith', 34), ('Jennifer Orwell', 19),
('Bob', 45), ('Melody Pond', 77), 
('Dean Winchester', 14), ('Jody Whittaker', 38);

INSERT INTO species (name)
VALUES('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon%';
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon%';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO specializations(species_id, vet_id)
VALUES(1, 1), (2, 3), (1, 3), (2, 4);

INSERT INTO visits(animal_id, vet_id, date_of_visit)
VALUES(15, 1, '2020-05-24'), (15, 3, '2020-07-22'), (16, 4, '2021-02-02'),
(17, 2, '2020-01-05'), (17, 2, '2020-03-08'), (17, 2, '2020-05-14'),
(18, 3, '2021-05-04'), (19, 4, '2021-02-24'), (20, 2, '2019-12-21'),
(20, 1, '2020-08-10'), (20, 2, '2021-04-07'), (21, 3, '2019-09-29'),
(22, 4, '2020-10-03'), (22, 4, '2020-11-04'), (23, 2, '2019-01-24'),
(23, 2, '2019-05-15'), (23, 2, '2020-02-27'), (23, 2, '2020-08-03'),
(24, 3, '2020-05-24'), (24, 1, '2021-01-11');