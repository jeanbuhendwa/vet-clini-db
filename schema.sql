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