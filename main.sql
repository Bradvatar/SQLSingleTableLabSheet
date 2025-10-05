
-- Single Table Lab Sheet

CREATE TABLE pet (
  name VARCHAR(20),
  owner VARCHAR(20),
  species VARCHAR(20),
  sex CHAR(1),
  checkups SMALLINT UNSIGNED,
  birth DATE,
  death DATE
);

INSERT INTO pet (name,owner,species,sex,checkups,birth,death) VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

. schema
. table

-------------------------------------------------

SELECT * FROM pet;

-------------------------------------------------

-- Q1-1 owners and pet names for female pets
SELECT owner, name FROM pet WHERE sex = 'f';

-- Q1-2 names and birth dates of dogs
SELECT name, birth FROM pet WHERE species = 'dog';

-- Q1-3 owners of birds (distinct)
SELECT DISTINCT owner FROM pet WHERE species = 'bird';

-- Q1-4 species of female pets (distinct)
SELECT DISTINCT species FROM pet WHERE sex = 'f';

-- Q1-5 names and birth dates of cats or birds
SELECT name, birth FROM pet WHERE species IN ('cat','bird');

-- Q1-6 names and species of female cats or birds
SELECT name, species FROM pet
WHERE sex = 'f' AND species IN ('cat','bird');

-------------------------------------------------

-- Q2-1 pet's name ends with "er" or "all"
SELECT owner, name FROM pet
WHERE name LIKE '%er' OR name LIKE '%all';

-- Q2-2 pets whose owner's name contains 'e'
SELECT name FROM pet WHERE owner LIKE '%e%';

-- Q2-3 pet names not ending with "fy"
SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4 pet names where owner is 4 letters long
SELECT name FROM pet WHERE owner LIKE '____';

-- Q2-5 owners whose names begin and end with A–E (case-insensitive)
SELECT DISTINCT owner
FROM pet
WHERE LOWER(SUBSTR(owner,1,1)) IN ('a','b','c','d','e')
  AND LOWER(SUBSTR(owner,LENGTH(owner),1)) IN ('a','b','c','d','e');

-- Q2-6 same, but case-sensitive (GLOB is case-sensitive)
SELECT DISTINCT owner
FROM pet
WHERE owner GLOB '[A-E]*[A-E]';

-------------------------------------------------

-- Q3-1 average check-ups per owner
SELECT owner, AVG(checkups) AS avg_checkups
FROM pet GROUP BY owner;

-- Q3-2 number of pets per species (ascending)
SELECT species, COUNT(*) AS cnt
FROM pet GROUP BY species ORDER BY cnt ASC;

-- Q3-3 number of pets of each species per owner
SELECT owner, species, COUNT(*) AS cnt
FROM pet GROUP BY owner, species
ORDER BY owner, species;

-- Q3-4 distinct species count per owner
SELECT owner, COUNT(DISTINCT species) AS distinct_species
FROM pet GROUP BY owner;

-- Q3-5 number of pets by known gender
SELECT sex, COUNT(*) AS cnt
FROM pet
WHERE sex IS NOT NULL AND sex <> ''
GROUP BY sex;

-- Q3-6 number of birds per owner
SELECT owner, COUNT(*) AS bird_count
FROM pet WHERE species = 'bird' GROUP BY owner;

-- Q3-7 total check-ups per owner
SELECT owner, SUM(checkups) AS total_checkups
FROM pet GROUP BY owner;

-------------------------------------------------



