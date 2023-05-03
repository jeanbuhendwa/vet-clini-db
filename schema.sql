/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    Id SERIAL PRIMARY KEY, 
    Name varchar(100) NOT NULL, 
    Date_of_Birth DATE NOT NULL, 
    Escape_Attempts INT NOT NULL, 
    Neutered BOOLEAN, 
    Weight_kg DECIMAL(10, 2) NOT NULL
);

-- Adding a new column to the animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

-- Create a table named owners
CREATE TABLE owners (Id SERIAL PRIMARY KEY, full_name VARCHAR(255) NOT NULL, age INT);

-- Create a table named species
CREATE TABLE species(Id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(Id);