-- Create patient table
DROP TABLE IF EXISTS patients;
CREATE TABLE patients(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(100),
	date_of_birth DATE
);