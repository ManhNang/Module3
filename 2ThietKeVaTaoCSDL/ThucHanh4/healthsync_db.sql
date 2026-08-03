CREATE DATABASE IF NOT EXISTS healthsync_db;
USE healthsync_db;

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50)
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME NOT NULL,
    is_active BOOLEAN DEFAULT TRUE, 
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

ALTER TABLE Appointments
DROP COLUMN is_active,
ADD status ENUM('PENDING', 'CONFIRMED', 'CHECKED_IN', 'COMPLETED', 'CANCELLED'),
ADD deposit_amount DECIMAL(10, 2) DEFAULT 0, 
ADD penalty_fee DECIMAL(10, 2) DEFAULT 0,
ADD cancel_reason VARCHAR(255);

CREATE TABLE Prescriptions (
	prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE,
    medication_details TEXT,
    issued_date DATETIME,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Patients (full_name, phone) VALUES ('Tran Manh Nang', '0386455170'), ('Nguyen Tien Thang', '0987654321');
INSERT INTO Doctors (full_name, specialty) VALUES ('BS. Ronaldo', 'Phu Khoa');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, deposit_amount)
VALUES (1, 1, '2026-08-05 09:00:00', 'PENDING', 500000.00);

UPDATE Appointments SET status = 'CHECKED_IN' WHERE appointment_id = 1;
UPDATE Appointments  SET status = 'COMPLETED' WHERE appointment_id = 1;

INSERT INTO Prescriptions (appointment_id, medication_details, issued_date)
VALUES (1, 'Paracetamol 500mg - 10 viên, Uong ngay 2 lan sau an; Amoxicillin 500mg - 14 vien', NOW());

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, deposit_amount)
VALUES (2, 1, '2026-08-06 14:00:00', 'CONFIRMED', 300000.00);

UPDATE Appointments SET status = 'CANCELLED', cancel_reason = 'Ban viec dot xuat', penalty_fee = 150000.00 WHERE appointment_id = 2;

SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    a.status,
    pr.medication_details,
    pr.issued_date
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Prescriptions pr ON a.appointment_id = pr.appointment_id
WHERE a.status = 'COMPLETED';

SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    a.deposit_amount AS tiền_cọc,
    a.penalty_fee AS phí_phạt,
    (a.deposit_amount - a.penalty_fee) AS tiền_hoàn_trả,
    a.cancel_reason AS lý_do_hủy
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
WHERE a.status = 'CANCELLED';

