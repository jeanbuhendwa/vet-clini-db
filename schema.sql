/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    Id SERIAL PRIMARY KEY, 
    Name varchar(100) NOT NULL, 
    Date_of_Birth DATE NOT NULL, 
    Escape_Attempts INT NOT NULL, 
    Neutered BOOLEAN, 
    Weight_kg DECIMAL(10, 2) NOT NULL
);

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Create a table named owners
CREATE TABLE owners (Id SERIAL PRIMARY KEY, full_name VARCHAR(255) NOT NULL, age INT);

-- Create a table named species
CREATE TABLE species(Id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(Id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);


-- Create a table named vets
CREATE TABLE vets (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    age INT NOT NULL, 
    date_of_graduation DATE NOT NULL);