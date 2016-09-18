-- 1. Which collars have a known owner? Display only collars
-- with known owners and those owners' names.

SELECT lost_dog_collars.dog_name AS lost, dog_owners.name AS owned
FROM lost_dog_collars
JOIN dog_owners
ON lost_dog_collars.dog_name = dog_owners.dog_name
WHERE dog_owners.name IS NOT NULL;

-- 2. For which collars is there no known owner?
-- Display only collars without known owners.

SELECT lost_dog_collars.dog_name AS lost, dog_owners.dog_name AS owned
FROM lost_dog_collars
LEFT JOIN dog_owners
ON (lost_dog_collars.dog_name = dog_owners.dog_name)
WHERE dog_owners.name IS NULL;

-- 3. What collars are in our possession? Display all collars in our
-- possession. If an owner exists for a given collar,
-- display that also.

SELECT lost_dog_collars.dog_name AS collars, dog_owners.name AS owners
FROM lost_dog_collars
LEFT JOIN dog_owners
ON lost_dog_collars.dog_name = dog_owners.dog_name;

-- 4. What owners do we know about? Display all owners known
-- to us. If a collar matches that owner, display the collar also.

SELECT dog_owners.name AS owners, lost_dog_collars.dog_name AS collars
FROM dog_owners
LEFT JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name;
