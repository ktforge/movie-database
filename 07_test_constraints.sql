-- should fail: the lion king is already in the table
INSERT INTO films (name, release_year)
VALUES ('The Lion King', 2019);

-- should fail: renaming 1917 to a name that already exists
UPDATE films
SET name = 'The Dark Knight'
WHERE name = '1917';

-- should fail: two movies already share a rating of 8.5
ALTER TABLE films
ADD CONSTRAINT unique_rating UNIQUE (rating);