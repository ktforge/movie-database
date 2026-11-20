-- fill in the new columns for movies already in the table
UPDATE films
SET runtime = 88,
    category = 'animation',
    rating = 8.5,
    box_office = 968750709
WHERE name = 'The Lion King';

UPDATE films
SET runtime = 127,
    category = 'drama',
    rating = 7.2,
    box_office = 612060372
WHERE name = 'The Passion of the Christ';

UPDATE films
SET runtime = 152,
    category = 'action',
    rating = 9.0,
    box_office = 1008480203
WHERE name = 'The Dark Knight';

UPDATE films
SET runtime = 165,
    category = 'western',
    rating = 8.5,
    box_office = 426076540
WHERE name = 'Django Unchained';

UPDATE films
SET runtime = 119,
    category = 'war',
    rating = 8.2,
    box_office = 384580017
WHERE name = '1917';

-- every column should be filled in now
SELECT * FROM films;