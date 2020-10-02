DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor (
	Doc_id INT NOT NULL,
	Doc_first_name VARCHAR(20) NOT NULL,
    Doc_last_name VARCHAR(20) NOT NULL,
    Doc_mobile VARCHAR(50) NULL DEFAULT NULL,
    Doc_specialization VARCHAR(45) NOT NULL,
    Doc_salary INT NULL DEFAULT NULL,
    Doc_address VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (Doc_id)
    );

DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient (
	P_id INT NOT NULL,
	P_first_name VARCHAR(20) NOT NULL,
    P_last_name VARCHAR(20) NOT NULL,
    P_dob DATE NOT NULL,
    P_mobile VARCHAR(50) NULL DEFAULT NULL,
    P_address VARCHAR(255) NOT NULL,
    P_insurence VARCHAR(255),
    Doc_id INT NOT NULL,
    PRIMARY KEY (P_id),
    CONSTRAINT fkDoctorPatients FOREIGN KEY (Doc_id) REFERENCES Doctor (Doc_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
DROP TABLE IF EXISTS Medical_Record;   
CREATE TABLE Medical_Record (
	P_problem VARCHAR(20) NULL DEFAULT NULL,
    Date_of_examination DATETIME NULL DEFAULT NULL,
    P_id INT NOT NULL,
    CONSTRAINT fKPatientRecord FOREIGN KEY (P_id) REFERENCES Patient (P_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );

DROP TABLE IF EXISTS Room;   
CREATE TABLE Room (
	Room_id INT NOT NULL,
    Room_period DATETIME NULL DEFAULT NULL,
    Room_type VARCHAR(20) NOT NULL,
    P_id INT NOT NULL,
    PRIMARY KEY (Room_id),
    CONSTRAINT fKPatientRoom FOREIGN KEY (P_id) REFERENCES Patient (P_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
DROP TABLE IF EXISTS Medicine;   
CREATE TABLE Medicine (
	Medi_id INT NOT NULL,
	Medi_quantity INT NULL DEFAULT NULL,
    Medi_price int NOT NULL,
    P_id INT NOT NULL,
    PRIMARY KEY (Medi_id),
    CONSTRAINT fKPatientMedi FOREIGN KEY (P_id) REFERENCES Patient (P_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );

DROP TABLE IF EXISTS Nurse;    
CREATE TABLE Nurse (
	N_id INT NOT NULL,
    N_name VARCHAR(45) NOT NULL,
    N_mobile VARCHAR(55) DEFAULT NULL,
    N_dob DATE NOT NULL,
    Room_id INT NOT NULL,
    PRIMARY KEY (N_id),
    CONSTRAINT fKRoomNurse FOREIGN KEY (Room_id) REFERENCES Room (Room_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
use hospital;

INSERT INTO Doctor
VALUES
(101, 'Ajit','Sharma', 7788498482, 'Cardiologist', 542135,null),
(102, 'Ramesh','kumar', 6027849494, 'Audiologist', 5441235, 'Chennai');

SELECT * FROM Doctor;


INSERT INTO Patient
VALUES
(1, 'Rahul','Raj', '1978-05-27', 6045218763, 'Bihar', 'qwertyuiop', 102),
(2, 'Ramesh','Athe', '1999-11-01', 7740562398, 'Delhi', 'asdfghjkl', 101);

ALTER TABLE Patient add P_name VARCHAR(40) as  (concat(P_first_name, ' ',P_last_name));

DROP TABLE Room;

SELECT * FROM Patient;

SELECT * FROM Doctor;
INSERT INTO Doctor
VALUES
(103, 'Advay','Aggarwal', 7788498482, 'Urologist', 100000,'Punjab'),
(104, 'Mithil','Anchan', 6027849494, 'ENT', 298765, 'Karnataka'),
(105,'Udit','Pal', 6754321098, 'Pediatricians', 564379, 'Mumbai'),
(106, 'Akash','Kumar', 7788498482, 'Cardiologist', 123456,'Bihar'),
(107, 'kshitiz','Michael', 6027849494, 'Audiologist', 898765, 'Gwalior'),
(108, 'Jagrut','Nemade', 6027849495, 'Cardiologist', 1000900, 'Pune'),
(109, 'Akarsh','Maurya', 6027849494, 'Urologist', 563421, 'Mira Society'),
(110, 'xyz','dbms', 6027849494, 'Audiologist', 342312, 'Hyd');

select avg(Doc_salary), Doc_specialization
from Doctor
group by Doc_specialization;

