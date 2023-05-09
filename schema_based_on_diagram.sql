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

-- create invoices table
DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	total_amount DECIMAL(10,2),
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT REFERENCES medical_histories(id)
);

-- create invoice_items table
DROP TABLE IF EXISTS invoice_items;
CREATE TABLE invoice_items(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	unit_price DECIMAL(10,2),
	quantity INT,
	total_price DECIMAL(10,2),
	invoice_id INT REFERENCES invoices(id),
	treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX patient_id ON medical_histories(patient_id)

CREATE INDEX medical_history_id ON invoices(medical_history_id)

CREATE INDEX treatment_id ON invoice_items(treatment_id)

CREATE INDEX invoice_id ON invoice_items(invoice_id)

-- join tables

CREATE TABLE patients_medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	patient_id INT REFERENCES patients(id),
	medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items_medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	invoice_item_id INT REFERENCES invoice_items(id),
	medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatments_medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	treatment_id INT REFERENCES treatments(id),
	medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatments_invoice_items(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	treatment_id INT REFERENCES treatments(id),
	medical_history_id INT REFERENCES invoice_items(id)
);
