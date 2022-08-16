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

-- Who was the last animal seen by William Tatcher?
SELECT vets.name vet_name, animals.name animal_name, visits.date_of_visit FROM
    animals JOIN visits ON animals.id = animal_id JOIN
    vets ON vets.id = vet_id
    WHERE vets.id = 1 ORDER BY date_of_visit DESC;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) FROM animals JOIN visits ON animals.id = animal_id JOIN
    vets ON vets.id = vet_id
    WHERE vets.id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name vets_name, species.name specializations FROM species 
    JOIN specializations ON species.id = species_id 
    RIGHT JOIN vets ON vets.id = vet_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name, animals.name animal_name, visits.date_of_visit FROM animals
    JOIN visits ON animals.id = animal_id
    JOIN vets ON vets.id = vet_id
    WHERE date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vets.id = 3;

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(vets.id) AS visits FROM animals
    JOIN visits ON animals.id = animal_id
    JOIN vets ON vets.id = vet_id
    GROUP BY animals.name ORDER BY visits DESC;

-- Who was Maisy Smith's first visit?
SELECT vets.name name, animals.name animal_name, date_of_visit FROM vets
    JOIN visits ON vets.id = vet_id
    JOIN animals ON animals.id = animal_id
    WHERE vets.id = 2 ORDER BY date_of_visit ASC;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name animal_name, date_of_birth, weight_kg, neutered, vets.name vets_name, age vets_age, date_of_graduation FROM vets
    vet_clinic-# JOIN visits ON vets.id = vet_id
    JOIN animals ON animals.id = animal_id
    JOIN animals ON animals.id = animal_id
    ORDER BY date_of_visit DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM animals
    JOIN visits on animals.id = animal_id
    JOIN vets ON vets.id = vet_id
    WHERE vets.id = 2;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) FROM animals
    JOIN visits ON animals.id = animal_id
    JOIN vets ON vets.id = vet_id
    JOIN species ON species.id = animals.species_id
    WHERE vets.id = 2 GROUP BY species.name ORDER BY count DESC;







EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 6;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

CREATE INDEX idx_serial_id ON visits(animal_id, vet_id, email);
ANALYZE;