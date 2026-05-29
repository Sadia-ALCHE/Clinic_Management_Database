-- DATABASE SYSTEMS SUMMATIVE PROJECT
-- Group B(Clinic Appointment & Patient Management System)
-- Task II.2 – DML: Data Insertion 

-- INSERT: Patient -------

INSERT INTO Patient (patient_id, name, age, contact, gender) VALUES
('P001', 'Kingston Adeniyi', 21, '55186584', 'Male'),
('P002', 'Mariam Ali',        1,  '24461547', 'Female'),
('P003', 'Abdul Karim',      120, '55174262', 'Male'),
('P004', 'Junior Pope',       54, '21456879', 'Male'),
('P005', 'Acher Minster',     24, '54455429', 'Male');

-- INSERT: Doctor  (5 rows) -------

INSERT INTO Doctor (doctor_id, name, specialty, start_time, end_time) VALUES
('D001', 'Dr. Amina Mensah',  'General Consultation', '08:00:00', '16:00:00'),
('D002', 'Dr. Kojo Asante',   'Radiology',            '09:00:00', '15:00:00'),
('D003', 'Dr. Nana Yeboah',   'Cardiology',           '10:00:00', '17:00:00'),
('D004', 'Dr. Selina Owusu',  'Dentistry',            '08:30:00', '14:30:00'),
('D005', 'Dr. Michael Adjei', 'Physiology',           '09:00:00', '13:00:00');

-- INSERT: DoctorAvailability ---------

INSERT INTO DoctorAvailability (doctor_id, available_day) VALUES
-- D001: Mon, Wed, Fri
('D001', 'Mon'), ('D001', 'Wed'), ('D001', 'Fri'),
-- D002: Tue, Thu
('D002', 'Tue'), ('D002', 'Thu'),
-- D003: Mon, Tue, Thu
('D003', 'Mon'), ('D003', 'Tue'), ('D003', 'Thu'),
-- D004: Wed, Fri
('D004', 'Wed'), ('D004', 'Fri'),
-- D005: Mon, Thu, Sat
('D005', 'Mon'), ('D005', 'Thu'), ('D005', 'Sat');

-- INSERT: Department --------

INSERT INTO Department (department_id, department_name, description) VALUES
('DEPT01', 'General Consultation', 'Routine checkups and GP visits'),
('DEPT02', 'Dental',               'Oral health and dental procedures'),
('DEPT03', 'Radiology',            'Imaging and X-ray services'),
('DEPT04', 'Cardiology',           'Heart and cardiovascular care'),
('DEPT05', 'Physiotherapy',        'Physical rehabilitation and therapy');

-- INSERT: Appointment ---------

INSERT INTO Appointment
    (appointment_id, patient_id, doctor_id, department_id, date, time, duration, purpose, status)
VALUES
('A001', 'P001', 'D001', 'DEPT01', '2026-10-02', '10:30:00', 30, 'Annual Checkup',       'Booked'),
('A002', 'P002', 'D002', 'DEPT02', '2026-12-03', '15:00:00', 45, 'Tooth Cleaning',        'Booked'),
('A003', 'P003', 'D004', 'DEPT03', '2026-01-15', '11:00:00', 20, 'Chest X-Ray',           'Booked'),
('A004', 'P004', 'D003', 'DEPT04', '2026-01-16', '14:00:00', 60, 'Back Pain Treatment',   'Booked'),
('A005', 'P005', 'D005', 'DEPT05', '2026-01-16', '09:30:00', 45, 'Heart Consultation',    'Booked'),
('A006', 'P001', 'D002', 'DEPT02', '2026-01-17', '15:00:00', 30, 'Cavity Filling',        'Cancelled');


-- DELIBERATE REFERENTIAL INTEGRITY VIOLATION --------------

-- Uncomment to test:
/*
INSERT INTO Appointment 
    (appointment_id, patient_id, doctor_id, department_id, date, time, duration, purpose, status)
VALUES
('A008', 'P999', 'D001', 'DEPT02', '2026-06-15', '09:00:00', 30, 'Invalid Patient Test', 'Booked');
*/
