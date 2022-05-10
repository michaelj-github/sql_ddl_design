DROP DATABASE IF EXISTS  medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);


CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors (id) ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients (id) ON DELETE CASCADE,
    visit_date DATE NOT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases (id) ON DELETE CASCADE,
    visit_id INTEGER REFERENCES visits (id) ON DELETE CASCADE
);

INSERT INTO doctors (first_name, last_name) 
VALUES 
('John', 'Smith'),
('Mary', 'Jones');

INSERT INTO patients (first_name, last_name) 
VALUES 
('Steve', 'Johnson'),
('Linda', 'Brown');

INSERT INTO diseases (disease_name)
VALUES 
('Bronchitis'),
('Pneumonia'),
('Psoriasis'),
('Shingles');

INSERT INTO visits (doctor_id, patient_id, visit_date) 
VALUES 
('1', '1', '2022-01-10'),
('1', '2', '2022-01-11'),
('2', '1', '2022-01-12'),
('2', '2', '2022-01-13');

INSERT INTO diagnosis (disease_id, visit_id) 
VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '1'),
('2', '2'),
('2', '3'),
('2', '4'),
('3', '1'),
('3', '2'),
('4', '3');


-- SELECT 
--  v.visit_date AS visit_date,
--  p.first_name AS patient_first_name,
--  p.last_name AS patient_last_name,
--  d.first_name AS doctor_first_name,
--  d.last_name AS doctor_last_name,
--  s.disease_name AS disease_name
--  FROM visits v
--  JOIN patients p
--    ON p.id = v.patient_id
--  JOIN doctors d
--    ON d.id = v.doctor_id
--  JOIN diagnosis g
--    ON g.visit_id = v.id
--  JOIN diseases s
--    ON s.id = g.disease_id
--  ORDER BY patient_last_name, visit_date, disease_name;

