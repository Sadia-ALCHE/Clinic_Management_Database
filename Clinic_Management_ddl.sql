-- DATABASE SYSTEMS SUMMATIVE PROJECT
-- Group B(Clinic Appointment & Patient Management System)
-- Task II.1 – DDL: Schema, Relations, and Constraints

USE clinic_management_db;

-- TABLE 1: Patients --------

CREATE TABLE Patient (
    patient_id   VARCHAR(10)     NOT NULL      PRIMARY KEY,
    name         VARCHAR(100)    NOT NULL,
    age          INT             NOT NULL,
    contact      VARCHAR(20)     NOT NULL      UNIQUE,
    gender       VARCHAR(10)     NOT NULL,
    
    CONSTRAINT chk_patient_age   CHECK (age >= 1 AND age <= 120),
    CONSTRAINT chk_patient_gender CHECK (gender IN ('Male', 'Female', 'Other'))
);

-- TABLE 2: Doctors --------

CREATE TABLE Doctor (
    doctor_id      VARCHAR(10)     NOT NULL       PRIMARY KEY,
    name           VARCHAR(100)    NOT NULL,
    specialty      VARCHAR(100)    NOT NULL,
    start_time     TIME            NOT NULL,
    end_time       TIME            NOT NULL,
    
    CONSTRAINT chk_doctor_times  CHECK (end_time > start_time)
);

-- TABLE 3: DoctorAvailability  (resolves repeating group from 1NF) --------

CREATE TABLE DoctorAvailability (
    doctor_id          VARCHAR(10)     NOT NULL,
    available_day      VARCHAR(10)     NOT NULL,

    CONSTRAINT pk_doctoravailability  PRIMARY KEY (doctor_id, available_day),
    CONSTRAINT fk_da_doctor           FOREIGN KEY (doctor_id)
                                      REFERENCES Doctor(doctor_id)
                                      ON DELETE CASCADE
                                      ON UPDATE CASCADE,
    CONSTRAINT chk_available_day      CHECK (available_day IN
                                        ('Mon','Tue','Wed','Thu','Fri','Sat','Sun'))
);

-- TABLE 4: Department --------

CREATE TABLE Department (
    department_id       VARCHAR(10)     NOT NULL      PRIMARY KEY,
    department_name     VARCHAR(100)    NOT NULL,
    description         TEXT            DEFAULT NULL,

    CONSTRAINT uq_department_name     UNIQUE (department_name)
);

-- TABLE 5: Appointments --------
CREATE TABLE Appointment (
    appointment_id      VARCHAR(10)     NOT NULL    PRIMARY KEY,
    patient_id          VARCHAR(10)     NOT NULL,
    doctor_id           VARCHAR(10)     NOT NULL,
    department_id       VARCHAR(10)     NOT NULL,
    date                DATE            NOT NULL,
	time                TIME            NOT NULL,
    duration            INT             NOT NULL,
	purpose             VARCHAR(255)    NOT NULL,
    status              VARCHAR(15)     NOT NULL     DEFAULT 'Booked',
    
    CONSTRAINT fk_appt_patient         FOREIGN KEY (patient_id)
                                       REFERENCES Patient(patient_id)
                                       ON DELETE RESTRICT
                                       ON UPDATE CASCADE,
    CONSTRAINT fk_appt_doctor          FOREIGN KEY (doctor_id)
                                       REFERENCES Doctor(doctor_id)
                                       ON DELETE RESTRICT
                                       ON UPDATE CASCADE,
    CONSTRAINT fk_appt_department      FOREIGN KEY (department_id)
                                       REFERENCES Department(department_id)
                                       ON DELETE RESTRICT
                                       ON UPDATE CASCADE,
    CONSTRAINT chk_duration            CHECK (duration > 0),
    CONSTRAINT chk_status              CHECK (status IN ('Booked', 'Cancelled'))
);