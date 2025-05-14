CREATE DATABASE IF NOT EXISTS clinic_booking_system;
USE clinic_booking_system;

-- 1. Specializations
CREATE TABLE Specializations (
    SpecializationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    SpecializationID INT NOT NULL,
    FOREIGN KEY (SpecializationID) REFERENCES Specializations(SpecializationID)
);

-- 3. Patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL
);

-- 4. Appointments
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- 5. Prescriptions
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    Notes TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- 6. Medications
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);

-- 7. Prescription_Medication (Many-to-Many)
CREATE TABLE Prescription_Medication (
    PrescriptionID INT NOT NULL,
    MedicationID INT NOT NULL,
    Dosage VARCHAR(100) NOT NULL,
    PRIMARY KEY (PrescriptionID, MedicationID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

-- Let's Insert Some Data Into The Table
-- Insert a specialization
INSERT INTO Specializations (Name) VALUES ('Cardiologist');

-- Insert a doctor
INSERT INTO Doctors (FullName, Email, Phone, SpecializationID)
VALUES ('Dr. James Kamau', 'james@clinic.com', '0745786098', 1);

-- Insert a patient
INSERT INTO Patients (FullName, Email, Phone, DateOfBirth, Gender)
VALUES ('Esther Mwende', 'esthermwende@gmail.com', '0768112005', '2002-05-14', 'Female');

-- Book an appointment
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason)
VALUES (1, 1, '2025-05-12 10:00:00', 'Chest pain');

-- Add a prescription
INSERT INTO Prescriptions (AppointmentID, Notes)
VALUES (1, 'Monitor blood pressure daily.');

-- Add medications
INSERT INTO Medications (Name, Description)
VALUES ('Aspirin', 'Pain reliever and blood thinner');

-- Link prescription and medication
INSERT INTO Prescription_Medication (PrescriptionID, MedicationID, Dosage)
VALUES (1, 1, '1 tablet twice a day');




