-- Create patient table
DROP TABLE IF EXISTS patients;
CREATE TABLE patients(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(100),
	date_of_birth DATE
);

-- Create treatment table
DROP TABLE IF EXISTS treatments;
CREATE TABLE treatments(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(100),
	type varchar(100)
);


-- Create medical history table 
DROP TABLE IF EXISTS medical_histories;
CREATE TABLE medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INT REFERENCES patients(id),
	status varchar(100)
);