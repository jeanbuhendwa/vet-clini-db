/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    Id SERIAL PRIMARY KEY, 
    Name varchar(100) NOT NULL, 
    Date_of_Birth DATE NOT NULL, 
    Escape_Attempts INT NOT NULL, 
    Neutered BOOLEAN, 
    Weight_kg DECIMAL(10, 2) NOT NULL
);