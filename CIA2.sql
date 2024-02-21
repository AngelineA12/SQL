CREATE DATABASE CIA_2;
use CIA_2;
use lab3;
-- Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
-- Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
-- Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status ENUM('Scheduled', 'Cancelled', 'Completed'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
-- Medical History Table
CREATE TABLE medical_history (
    history_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis VARCHAR(255),
    treatment_plan TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
-- Medications Table
CREATE TABLE medications (
    medication_id INT PRIMARY KEY,
    patient_id INT,
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);


INSERT INTO patients VALUES
(1, 'Angeline', 'Charles', '1990-05-15', 'Male', '1234567890', 'john.doe@example.com', '123 Main St'),
(2, 'Peter', 'Samuel', '1985-08-22', 'Female', '9876543210', 'jane.smith@example.com', '456 Oak St'),
(3, 'Karthik', 'Raj', '1990-08-15', 'Male', '9876543210', 'karthik.raj@example.com', '123 Anna Nagar'),
(4, 'Priya', 'Venkatesh', '1985-02-20', 'Female', '8765432109', 'priya.venkatesh@example.com', '456 Koyambedu'),
(5, 'George', 'Thomas', '1978-07-10', 'Male', '7654321098', 'george.thomas@example.com', '789 Velachery');

-- Doctors Table
INSERT INTO doctors VALUES
(1, 'Dr. Michael', 'Smith', 'Cardiologist', '5551112222', 'michael.smith@example.com'),
(2, 'Dr. Sarah', 'Jones', 'Orthopedic Surgeon', '5553334444', 'sarah.jones@example.com'),
(3, 'Dr. Anitha', 'Kumar', 'Gynecologist', '5555555555', 'anitha.kumar@example.com'),
(4, 'Dr. Ramesh', 'Natarajan', 'Oncologist', '5554443333', 'ramesh.natarajan@example.com'),
(5, 'Dr. Elizabeth', 'John', 'Pediatrician', '5553332222', 'elizabeth.john@example.com');

-- Appointments Table
INSERT INTO appointments VALUES
(1, 1, 1, '2024-01-10 09:00:00', 'Scheduled'),
(2, 2, 3, '2024-01-11 10:30:00', 'Completed'),
(3, 3, 2, '2024-01-12 14:00:00', 'Scheduled'),
(4, 4, 1, '2024-01-13 11:45:00', 'Completed'),
(5, 5, 3, '2024-01-14 10:30:00', 'Scheduled');

INSERT INTO medical_history VALUES
(1, 1, 'Diabetes Checkup', 'Regular monitoring of blood sugar levels.'),
(2, 2, 'Allergy Assessment', 'Identifying and managing allergic reactions.'),
(3, 3, 'Physical Therapy', 'Rehabilitation for a previous injury.'),
(4, 4, 'Annual Checkup', 'Comprehensive health examination.'),
(5, 5, 'Depression Evaluation', 'Assessment of mental health condition.');

INSERT INTO medications VALUES
(1, 1, 'Insulin', '10 units daily', '2024-02-01', '2024-02-28'),
(2, 2, 'Antihistamine', 'Once a day', '2024-02-02', '2024-02-15'),
(3, 3, 'Pain Reliever', 'As needed', '2024-02-03', '2024-02-20'),
(4, 4, 'Vitamin D Supplement', '2000 IU daily', '2024-02-04', '2024-02-18'),
(5, 5, 'Antidepressant', '20mg daily', '2024-02-05', '2024-02-28');


-- Retrieve patient and medical history
SELECT patients.*, medical_history.history_id, medical_history.diagnosis, medical_history.treatment_plan
FROM patients
JOIN medical_history ON patients.patient_id = medical_history.patient_id;

-- Retrieve information about patients about who completed their appointment
SELECT *
FROM patients
WHERE patient_id IN (SELECT patient_id FROM appointments where status = 'completed');

-- Create a view to represent information about patients, doctors, appointments, medical history, and medications
CREATE VIEW PatientInfo AS
SELECT
    patients.patient_id,
    patients.first_name AS patient_first_name,
    patients.last_name AS patient_last_name,
    patients.dob,
    patients.gender,
    patients.contact_number AS patient_contact_number,
    patients.email AS patient_email,
    patients.address AS patient_address,
    doctors.doctor_id,
    doctors.first_name AS doctor_first_name,
    doctors.last_name AS doctor_last_name,
    doctors.specialty,
    doctors.contact_number AS doctor_contact_number,
    doctors.email AS doctor_email,
    appointments.appointment_id,
    appointments.appointment_date,
    appointments.status AS appointment_status,
    medical_history.history_id,
    medical_history.diagnosis,
    medical_history.treatment_plan,
    medications.medication_id,
    medications.medication_name,
    medications.dosage,
    medications.start_date AS medication_start_date,
    medications.end_date AS medication_end_date
FROM
    patients
LEFT JOIN appointments ON patients.patient_id = appointments.patient_id
LEFT JOIN doctors ON appointments.doctor_id = doctors.doctor_id
LEFT JOIN medical_history ON patients.patient_id = medical_history.patient_id
LEFT JOIN medications ON patients.patient_id = medications.patient_id;
SELECT * From PatientInfo;

-- Update the first entry in the patients table, setting both first and last names
UPDATE patients
SET 
    first_name = 'Ruby',
    last_name = 'Michell'
WHERE patient_id = 2;
SELECT * from patients;
UPDATE patients
SET 
    email = 'ruby.michell@gmail.com'
WHERE patient_id = 2;
SELECT * from patients;
UPDATE patients
SET 
    first_name = 'Peter',
    last_name = 'Samuel'
WHERE patient_id = 1;
SELECT * from patients;
UPDATE patients
SET 
    email = 'peter.samuel@gmail.com'
WHERE patient_id = 1;
SELECT * from patients;

ALTER TABLE patients
ADD COLUMN gaurdian_contact VARCHAR(100);
SELECT * FROM patients;

select patient_id, first_name,gender,contact_number,email from patients
where patient_id IN ( SELECT patient_id from appointments
where status = 'Scheduled');