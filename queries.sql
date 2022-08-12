/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * from animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attemps < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attemps FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT COUNT(name) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MAX(weight_kg) AS Max_weight, MIN(weight_kg) AS Min_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS AVG_escape_attempts FROM animals WHERE 
    date_of_birth >= '1990-01-01' AND date_of_birth < '2001-01-01' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT name, full_name FROM animals JOIN owners ON owner_id = owners.id AND owners.id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT species.name, animals.name FROM animals JOIN species ON species_id = species.id AND species.id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.id, full_name, name FROM animals RIGHT JOIN owners ON owner_id = owners.id;

-- How many animals are there per species?
SELECT species.name, COUNT(animals.name) FROM species JOIN animals ON species.id = species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT full_name, animals.name AS Species_Name FROM animals JOIN owners ON owner_id = owners.id AND owners.id = 2 WHERE animals.name LIKE '%mon%';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT full_name, animals.name FROM owners JOIN animals ON owners.id = owner_id AND owners.id = 5 WHERE escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(*) AS Animal_Count FROM owners JOIN animals ON owners.id = owner_id GROUP BY full_name
HAVING COUNT (full_name) = (
    SELECT MAX(count)
    FROM (
        SELECT full_name, COUNT(*) FROM owners JOIN animals ON owners.id = owner_id GROUP BY full_name
    ) func);
