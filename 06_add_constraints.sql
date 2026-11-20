-- no two movies can have the same name
ALTER TABLE films
ADD CONSTRAINT unique_name UNIQUE (name);