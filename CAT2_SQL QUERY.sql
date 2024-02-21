create database mongodb;
use mongodb;
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female'),
    Birthdate DATE,
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);
CREATE TABLE MedicalHistory (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DateOfVisit DATE,
    Diagnosis VARCHAR(255),
    Medications VARCHAR(255),
    CONSTRAINT fk_patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE
);
CREATE TABLE Vitals (
    VitalsID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    CheckupDate DATE,
    BloodPressure VARCHAR(50),
    HeartRate INT,
    Temperature DECIMAL(4,1),
    CONSTRAINT fk_patient_vitals FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE
);
CREATE TABLE LabResults (
    LabResultID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    TestName VARCHAR(100),
    Result DECIMAL(8,2),
    Units VARCHAR(20),
    TestDate DATE,
    CONSTRAINT fk_patient_lab FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE
);
CREATE TABLE DiabetesPrediction (
    PredictionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Pregnancies INT,
    Glucose INT,
    BloodPressure INT,
    SkinThickness INT,
    Insulin INT,
    BMI DOUBLE,
    DiabetesPedigreeFunction DOUBLE,
    Age INT,
    Outcome INT,
    PredictionDate DATE,
    CONSTRAINT fk_patient_prediction FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE
);
-- Insert 15 entries into the Patients table
INSERT INTO Patients (FirstName, LastName, Gender, Birthdate, ContactNumber, Email, Address)
VALUES
    ('John', 'Mathew', 'Male', '1990-01-15', '9876543210', 'john.mathew@example.com', '123 Main St, City'),
    ('Anna', 'George', 'Female', '1985-03-20', '8765432109', 'anna.george@example.com', '456 Oak St, Town'),
    ('Joseph', 'Thomas', 'Male', '1988-07-12', '7890123456', 'joseph.thomas@example.com', '789 Pine St, Village'),
    ('Mary', 'Philip', 'Female', '1992-04-30', '8901234567', 'mary.philip@example.com', '101 Maple St, Town'),
    ('Thomas', 'George', 'Male', '1995-09-18', '9012345678', 'thomas.george@example.com', '222 Cedar St, City'),
    ('Susan', 'John', 'Female', '1987-12-05', '1234567890', 'susan.john@example.com', '333 Elm St, Village'),
    ('Daniel', 'Joseph', 'Male', '1980-06-25', '2345678901', 'daniel.joseph@example.com', '444 Oak St, City'),
    ('Elizabeth', 'Samuel', 'Female', '1998-11-08', '3456789012', 'elizabeth.samuel@example.com', '555 Pine St, Town'),
    ('Philip', 'Daniel', 'Male', '1983-02-14', '4567890123', 'philip.daniel@example.com', '666 Maple St, Village'),
    ('Catherine', 'Jacob', 'Female', '1993-08-22', '5678901234', 'catherine.jacob@example.com', '777 Cedar St, City'),
    ('Michael', 'Mathew', 'Male', '1982-05-10', '6789012345', 'michael.mathew@example.com', '888 Elm St, Town'),
    ('Sara', 'George', 'Female', '1989-10-02', '7890123456', 'sara.george@example.com', '999 Pine St, Village'),
    ('David', 'Joseph', 'Male', '1996-03-17', '8901234567', 'david.joseph@example.com', '111 Oak St, City'),
    ('Rachel', 'Philip', 'Female', '1986-09-28', '9012345678', 'rachel.philip@example.com', '222 Maple St, Town'),
    ('George', 'Thomas', 'Male', '1991-04-14', '1234567890', 'george.thomas@example.com', '333 Cedar St, Village');
Select * from patients;
-- Insert 15 entries into the MedicalHistory table
INSERT INTO MedicalHistory (PatientID, DateOfVisit, Diagnosis, Medications)
VALUES
    (1, '2023-01-05', 'Hypertension', 'Medication A'),
    (2, '2022-11-10', 'Diabetes', 'Insulin'),
    (3, '2021-08-15', 'Migraine', 'Painkillers'),
    (4, '2020-12-02', 'High Cholesterol', 'Statins'),
    (5, '2022-02-28', 'Asthma', 'Inhaler'),
    (6, '2023-03-20', 'Allergies', 'Antihistamines'),
    (7, '2022-07-08', 'Arthritis', 'Anti-inflammatory'),
    (8, '2021-05-12', 'Depression', 'Antidepressants'),
    (9, '2020-11-01', 'Gastritis', 'Antacids'),
    (10, '2022-09-25', 'Thyroid Disorder', 'Thyroid Medication'),
    (11, '2020-04-15', 'Chronic Pain', 'Pain Management'),
    (12, '2023-10-10', 'Anxiety', 'Anxiolytics'),
    (13, '2021-06-30', 'Insomnia', 'Sleeping Pills'),
    (14, '2020-03-17', 'COPD', 'Bronchodilators'),
    (15, '2022-12-05', 'Kidney Stones', 'Pain Relief');
-- Insert 15 entries into the Vitals table
INSERT INTO Vitals (PatientID, CheckupDate, BloodPressure, HeartRate, Temperature)
VALUES
    (1, '2023-01-05', '120/80', 75, 98.6),
    (2, '2022-11-10', '130/85', 80, 99.2),
    (3, '2021-08-15', '110/70', 72, 98.0),
    (4, '2020-12-02', '125/85', 78, 98.4),
    (5, '2022-02-28', '118/75', 70, 98.8),
    (6, '2023-03-20', '122/78', 68, 98.7),
    (7, '2022-07-08', '128/82', 75, 99.0),
    (8, '2021-05-12', '115/70', 80, 98.2),
    (9, '2020-11-01', '135/90', 85, 99.5),
    (10, '2022-09-25', '120/80', 72, 98.9),
    (11, '2020-04-15', '130/85', 76, 98.3),
    (12, '2023-10-10', '112/72', 70, 98.1),
    (13, '2021-06-30', '126/84', 78, 99.1),
    (14, '2020-03-17', '115/75', 74, 98.5),
    (15, '2022-12-05', '128/80', 77, 98.7);
-- Insert 15 entries into the LabResults table
INSERT INTO LabResults (PatientID, TestName, Result, Units, TestDate)
VALUES
    (1, 'Blood Sugar', 110, 'mg/dL', '2023-01-05'),
    (2, 'Cholesterol', 180, 'mg/dL', '2022-11-10'),
    (3, 'Hemoglobin', 14.5, 'g/dL', '2021-08-15'),
    (4, 'Triglycerides', 120, 'mg/dL', '2020-12-02'),
    (5, 'Lung Function', 85, '%', '2022-02-28'),
    (6, 'IgE Level', 120, 'IU/mL', '2023-03-20'),
    (7, 'Erythrocyte Sedimentation Rate', 15, 'mm/hr', '2022-07-08'),
    (8, 'Serotonin Level', 35, 'ng/mL', '2021-05-12'),
    (9, 'Stomach pH', 4.0, '', '2020-11-01'),
    (10, 'Thyroid Stimulating Hormone', 2.5, 'uIU/mL', '2022-09-25'),
    (11, 'Pain Biomarkers', 25, 'ng/mL', '2020-04-15'),
    (12, 'Cortisol Level', 18, 'ug/dL', '2023-10-10'),
    (13, 'Melatonin Level', 5, 'ng/mL', '2021-06-30'),
    (14, 'Lung Capacity', 3.2, 'L', '2020-03-17'),
    (15, 'Calcium Oxalate', 8.0, 'mg/dL', '2022-12-05');
-- Insert 15 entries into the DiabetesPrediction table
INSERT INTO DiabetesPrediction (PatientID, Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age, Outcome, PredictionDate)
VALUES
    (1, 2, 120, 70, 23, 80, 25.5, 0.45, 32, 0, '2023-01-05'),
    (2, 3, 150, 80, 25, 100, 28.0, 0.60, 40, 1, '2022-11-10'),
    (3, 1, 110, 65, 20, 75, 24.0, 0.35, 28, 0, '2021-08-15'),
    (4, 4, 140, 75, 22, 90, 26.2, 0.50, 35, 1, '2020-12-02'),
    (5, 2, 130, 72, 21, 85, 25.0, 0.40, 30, 0, '2022-02-28'),
    (6, 3, 125, 68, 20, 78, 23.5, 0.38, 27, 0, '2023-03-20'),
    (7, 5, 135, 78, 24, 95, 27.5, 0.55, 38, 1, '2022-07-08'),
    (8, 2, 115, 70, 22, 80, 24.8, 0.42, 33, 0, '2021-05-12'),
    (9, 1, 105, 65, 19, 70, 22.0, 0.30, 25, 0, '2020-11-01'),
    (10, 3, 140, 75, 23, 92, 26.8, 0.48, 36, 1, '2022-09-25'),
    (11, 4, 125, 72, 20, 88, 25.5, 0.44, 31, 0, '2020-04-15'),
    (12, 2, 130, 68, 21, 85, 24.9, 0.41, 29, 1, '2023-10-10'),
    (13, 1, 120, 74, 19, 78, 23.2, 0.37, 26, 0, '2021-06-30'),
    (14, 5, 138, 80, 25, 98, 28.3, 0.58, 39, 1, '2020-03-17'),
    (15, 3, 142, 76, 22, 94, 27.0, 0.52, 34, 0, '2022-12-05');
