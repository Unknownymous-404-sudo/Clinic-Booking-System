# 🏥 Clinic Booking System — MySQL Database

## 📋 Project Description

The **Clinic Booking System** is a relational database designed using MySQL to manage appointments, doctors, patients, prescriptions, and medications in a medical clinic setting. The system is normalized to ensure data integrity and supports essential functionality for scheduling appointments, managing medical records, and assigning treatments.

This project showcases the implementation of primary keys, foreign keys, unique constraints, 1-to-many and many-to-many relationships — all fundamental principles of relational database design.

---

## ⚙️ Features

- Manage **Doctors** and their **Specializations**
- Register **Patients** and schedule **Appointments**
- Link **Prescriptions** and **Medications** to appointments
- Ensure data consistency with proper constraints and relationships

---

## 🏗️ Database Schema

Includes 7 fully normalized tables:

1. `Specializations`
2. `Doctors`
3. `Patients`
4. `Appointments`
5. `Prescriptions`
6. `Medications`
7. `Prescription_Medication` (join table for many-to-many relationship)

---

## 🚀 Setup Instructions

### ✅ Prerequisites

- MySQL Server (8.0+ recommended)
- MySQL Workbench, phpMyAdmin, or any MySQL client
- SQL script file: `clinic_booking_system.sql` (contains the schema)

### 📦 How to Run

1. **Create a new MySQL database:**

   ```sql
   CREATE DATABASE clinic_booking;
   USE clinic_booking;

2. **Import the SQL schema:**

- If using the command line:
# mysql -u your_username -p clinic_booking < clinic_booking_system.sql

- Or, copy and paste the SQL script into your MySQL Workbench or phpMyAdmin and execute it.

3. **Insert sample data (optional):**

- Add doctors, patients, appointments, and prescriptions using INSERT statements or interface tools.