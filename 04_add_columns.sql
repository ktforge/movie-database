-- extra info to help pick a movie for movie night
ALTER TABLE films ADD COLUMN runtime INTEGER;
ALTER TABLE films ADD COLUMN category TEXT;
ALTER TABLE films ADD COLUMN rating REAL;
ALTER TABLE films ADD COLUMN box_office BIGINT;

-- new columns start out empty
SELECT * FROM films;