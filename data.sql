DROP TABLE IF EXISTS airplane;
DROP TABLE IF EXISTS corporation;
DROP TABLE IF EXISTS owns;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS pilot;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS flies;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS service_record;
DROP TABLE IF EXISTS hangar;
DROP TABLE IF EXISTS maintain;
DROP TABLE IF EXISTS plane_service;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS plane_type;

-- Create table for plane type
CREATE TABLE plane_type (
  model_number INT PRIMARY KEY,
  capacity INT NOT NULL,
  weight INT NOT NULL
);
-- Create table for hangar
CREATE TABLE hangar (
  number INT PRIMARY KEY,
  capacity INT NOT NULL,
  location VARCHAR(50) NOT NULL
);
-- Create table for airplane
CREATE TABLE airplane (
  registration_number INT PRIMARY KEY,
  plane_type INT NOT NULL,
  stored_in INT NOT NULL,
  FOREIGN KEY (plane_type) REFERENCES plane_type(model_number),
  FOREIGN KEY (stored_in) REFERENCES hangar(number)
);
-- Create table for owner
CREATE TABLE owner (
  ssn INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  telephone_number VARCHAR(20) NOT NULL
);
-- Create table for corporation
CREATE TABLE corporation (
  name VARCHAR(50) PRIMARY KEY,
  address VARCHAR(100) NOT NULL,
  telephone_number VARCHAR(20) NOT NULL
);
-- Create table for owns relationship
CREATE TABLE owns (
  registration_number INT NOT NULL,
  ssn INT NOT NULL,
  purchase_date DATE NOT NULL,
  PRIMARY KEY (registration_number, ssn),
  FOREIGN KEY (registration_number) REFERENCES airplane(registration_number),
  FOREIGN KEY (ssn) REFERENCES owner(ssn)
);
-- Create table for employee
CREATE TABLE employee (
  ssn INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  telephone_number VARCHAR(20) NOT NULL,
  salary INT NOT NULL,
  shift_worked VARCHAR(20) NOT NULL
);
-- Create table for pilot
CREATE TABLE pilot (
  ssn INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  telephone_number VARCHAR(20) NOT NULL,
  license_number VARCHAR(6) NOT NULL,
  restrictions VARCHAR(50) NOT NULL
);
-- Create table for person
CREATE TABLE person (
  ssn INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  telephone_number VARCHAR(20) NOT NULL
);
-- Create table for flies relationship
CREATE TABLE flies (
  ssn INT NOT NULL,
  model_number INT NOT NULL,
  PRIMARY KEY (ssn, model_number),
  FOREIGN KEY (ssn) REFERENCES pilot(ssn),
  FOREIGN KEY (model_number) REFERENCES plane_type(model_number)
);
-- Create table for works_on relationship
CREATE TABLE works_on (
  ssn INT NOT NULL,
  model_number INT NOT NULL,
  PRIMARY KEY (ssn, model_number),
  FOREIGN KEY (ssn) REFERENCES employee(ssn),
  FOREIGN KEY (model_number) REFERENCES plane_type(model_number)
);
-- Create table for service record
CREATE TABLE service_record (
  service_id INT PRIMARY KEY,
  date DATE NOT NULL,
  hours INT NOT NULL,
  work_code VARCHAR(10) NOT NULL
);
-- Create table for plane_service relationship
CREATE TABLE plane_service (
  registration_number INT NOT NULL,
  service_id INT NOT NULL,
  PRIMARY KEY (registration_number, service_id),
  FOREIGN KEY (registration_number) REFERENCES airplane(registration_number),
  FOREIGN KEY (service_id) REFERENCES service_record(service_id)
);
-- Create table for maintain relationship
CREATE TABLE maintain (
  ssn INT NOT NULL,
  service_id INT NOT NULL,
  PRIMARY KEY (ssn, service_id),
  FOREIGN KEY (ssn) REFERENCES employee(ssn),
  FOREIGN KEY (service_id) REFERENCES service_record(service_id)
);





-- planetype hanger airplane person employee service planeservice owns ownner maintain pilot flies workson 
--insertion
INSERT INTO plane_type (model_number, capacity, weight)
VALUES
  (1, 200, 5000),
  (2, 350, 6000),
  (3, 150, 8000),
  (4, 30, 6000),
  (5, 370, 7000),
  (6, 390, 5600),
  (7, 312, 5600),
  (8, 354, 3400),
  (9, 219, 8700),
  (10, 198, 6000),
  (11, 90, 9800),
  (12, 30, 4900),
  (13, 350, 5000),
  (14, 311, 9000),
  (15, 342, 8000),
  (16, 322, 9900),
  (17, 305, 7800),
  (18, 298, 7800),
  (19, 199, 8900),
  (20, 279, 7500);
INSERT INTO hangar (number, capacity, location)
VALUES
		  (1, 5, 'Karachi'),
		  (2, 10, 'Lahore'),
		  (3, 15, 'Hyderabad'),
		  (4, 5, 'New Karachi'),
		  (5, 10, 'Hyderabad'),
		  (6, 15, 'Islamabad'),
		  (7, 8, 'Hyderabad'),
		  (8, 10, 'Islamabad'),
		  (9, 9, 'Lahore'),
		  (10, 15, 'Karachi'),
		  (11, 9, 'Karachi'),
		  (12, 10, 'Islamabad'),
		  (13, 15, 'Islamabad'),
		  (14, 13, 'Lahore'),
		  (15, 9, 'Hyderabad'),
		  (16, 15, 'Islamabad'),
		  (17, 8, 'Hyderabad'),
		  (18, 11, 'Lahore'),
		  (19, 13, 'Karachi'),
		  (20, 11, 'Karachi');
INSERT INTO airplane (registration_number, plane_type, stored_in)
VALUES
		  (10001, 1, 1),
		  (10002, 2, 1),
		  (10003, 3, 2),
		  (10004, 1, 11),
		  (10005, 4, 12),
		  (10006, 3, 12),
		  (10007, 7, 14),
		  (10008, 12, 17),
		  (10009, 10, 20),
		  (10010, 20, 2),
		  (10011, 12, 11),
		  (10012, 20, 18),
		  (10013, 13, 20),
		  (10014, 17, 11),
		  (10015, 19, 16),
		  (10016, 19, 3),
		  (10017, 11, 5),
		  (10018, 2, 7),
		  (10019, 15, 9),
		  (10020, 16, 9);
INSERT INTO owner (ssn, name, address, telephone_number)
VALUES
			(123456789, 'Ayberk Mashwanis', '22, Clifton Road, Karachi', '555-1111'),
			(234567890, 'Wajeeb Kalmati', '17, Block B, North Nazimabad, Karachi', '555-2222'),
			(345678901, 'Dara Khawaja', '28, Gulberg III, Lahore', '555-3333'),
			(456789012, 'Nersi Lehri', '5, Model Town, Islamabad', '555-4444'),
			(567890123, 'Gaumata Jatoi', '11, Shahra-e-Faisal, Karachi', '555-5555'),
			(678901234, 'Human Sheedi', '23, Saddar, Rawalpindi', '555-6666'),
			(789012345, 'Yamansoy Jarral', '7, G-10 Markaz, Islamabad', '555-7777'),
			(890123456, 'Torhan Shaikh', '14, Defence Housing Authority, Lahore', '555-8888'),
			(901234567, 'Ikram Chachar', '9, Sector 5, Korangi Industrial Area, Karachi', '555-9999'),
			(012345678, 'Shahbod Shar', '33, Blue Area, Islamabad', '555-0000'),
			(321456789, 'Maria Perez', '12, Avenida Central, Panama City', '555-1111'),
			(432567890, 'Jorge Rodriguez', '23, Calle 50, Panama City', '555-2222'),
			(543678901, 'Isabella Hernandez', '45, Bella Vista, Panama City', '555-3333'),
			(654789012, 'Santiago Gomez', '67, San Francisco, Panama City', '555-4444'),
			(765890123, 'Mariana Torres', '89, Costa del Este, Panama City', '555-5555'),
			(876901234, 'Emilio Herrera', '101, Punta Pacifica, Panama City', '555-6666'),
			(987012345, 'Daniela Gonzalez', '77, El Cangrejo, Panama City', '555-7777'),
			(098123456, 'Mateo Navarro', '52, Marbella, Panama City', '555-8888'),
			(210234567, 'Camila Castillo', '36, Obarrio, Panama City', '555-9999'),
			(543219876, 'Nicolas Suarez', '28, Costa Sur, Panama City', '555-0000');
INSERT INTO corporation (name, address, telephone_number)
VALUES
		('OkCooperation', ' 202, Sector 23, Korangi Industrial Area', '555-1111'),
		('CooperationPro', ' A-202,Block-12', '555-2222'),
		('ABC Corporation', '#22, Khawaja Arcade 17-Wahdat Road', '555-3233'),
		('Ac Corporation', ' Kawish Crown Shahrah-e-Faisal', '555-1121'),
		('Kodak ', 'Khawaja House Muljee Street Kharadar,', '555-2202'),
		('Akina', 'Nazimabad Centre Nazimabad No.1,', '555-3300'),
		('Narcose', 'Shop # 19, Khalid Educational Centre, Lahore', '500-1111'),
		('Niga', 'Darbar Market Near Data Darbar,', '515-2202'),
		('Namasawa', '2, Sirki Road,', '551-3309'),
		('Zulfi', '3, Hassan Ali Affandy Building Opp.Preedly Police Station, Karachi', '552-3033'),
		('TechPlus', '17, Gulshan-e-Iqbal, Karachi', '555-4433'),
		('GlobalTech', '27-B, Model Town, Lahore', '555-3355'),
		('SmartLink', 'C-12, Faisal Town, Lahore', '555-2255'),
		('CreativeWorks', '14, Gulberg III, Lahore', '555-6677'),
		('InnovativeSolutions', '31, Blue Area, Islamabad', '555-9911'),
		('AlphaTech', '23-A, Gulberg II, Lahore', '555-7711'),
		('TechNexus', '8, DHA Phase 5, Karachi', '555-2255'),
		('VisionaryEnterprises', '15, F-7 Markaz, Islamabad', '555-8899'),
		('DigitalDreams', '33, Saddar, Rawalpindi', '555-4477'),
		('TechnoFuture', '21, Clifton, Karachi', '555-7788');
INSERT INTO owns (registration_number, ssn, purchase_date)
VALUES 
		(10001, 123456789, '2021-01-01'),
		(10002, 234567890, '2021-01-02'),
		(10003, 345678901, '2021-01-03'),
		(10004, 456789012, '2021-01-04'),
		(10005, 567890123, '2021-01-05'),
		(10006, 678901234, '2021-01-06'),
		(10007, 789012345, '2021-01-07'),
		(10008, 890123456, '2021-01-08'),
		(10009, 901234567, '2021-01-09'),
		(10010, 012345678, '2021-01-10'),
		(10011, 321456789, '2021-01-11'),
		(10012, 432567890, '2021-01-12'),
		(10013, 543678901, '2021-01-13'),
		(10014, 654789012, '2021-01-14'),
		(10015, 765890123, '2021-01-15'),
		(10016, 876901234, '2021-01-16'),
		(10017, 987012345, '2021-01-17'),
		(10018, 098123456, '2021-01-18'),
		(10019, 210234567, '2021-01-19'),
		(10020, 543219876, '2021-01-20');
INSERT INTO employee (ssn, name, address, telephone_number, salary, shift_worked)
VALUES
		(123456789, 'Ali Khan', 'Lahore, Pakistan', '0321-1234567', 50000, 'morning'),
		(234567890, 'Ayesha Ahmed', 'Islamabad, Pakistan', '0333-2345678', 60000, 'night'),
		(345678901, 'Ahmed Ali', 'Karachi, Pakistan', '0312-3456789', 55000, 'evening'),
		(456789012, 'Sara Ali', 'Peshawar, Pakistan', '0345-4567890', 45000, 'morning'),
		(567890123, 'Zahid Hussain', 'Rawalpindi, Pakistan', '0300-5678901', 65000, 'night'),
		(678901234, 'Sana Ahmed', 'Quetta, Pakistan', '0321-6789012', 55000, 'evening'),
		(789012345, 'Farhan Khan', 'Faisalabad, Pakistan', '0333-7890123', 50000, 'morning'),
		(890123456, 'Asma Riaz', 'Multan, Pakistan', '0312-8901234', 55000, 'night'),
		(901234567, 'Zainab Shah', 'Lahore, Pakistan', '0345-9012345', 60000, 'evening'),
		(012345678, 'Waqar Ali', 'Islamabad, Pakistan', '0300-1234567', 45000, 'morning'),
		(321456789, 'Mehak Khan', 'Karachi, Pakistan', '0321-2345678', 55000, 'night'),
		(432567890, 'Tariq Raza', 'Peshawar, Pakistan', '0333-3456789', 50000, 'evening'),
		(543678901, 'Hina Amin', 'Rawalpindi, Pakistan', '0312-4567890', 65000, 'morning'),
		(654789012, 'Sarmad Khan', 'Quetta, Pakistan', '0345-5678901', 55000, 'night'),
		(765890123, 'Fizza Ahmed', 'Faisalabad, Pakistan', '0300-6789012', 50000, 'evening'),
		(876901234, 'Junaid Ali', 'Multan, Pakistan', '0321-7890123', 60000, 'morning'),
		(987012345, 'Amina Riaz', 'Lahore, Pakistan', '0333-8901234', 55000, 'night'),
		(098123456, 'Rahat Shah', 'Islamabad, Pakistan', '0312-9012345', 45000, 'evening'),
		(210234567, 'Faisal Khan', 'Karachi, Pakistan', '0345-1234567', 65000, 'morning'),
		(543219876, 'Sara Ali', 'Peshawar, Pakistan', '0300-2345678', 55000, 'night');
INSERT INTO pilot (ssn, name, address, telephone_number, license_number, restrictions) 
VALUES
		(123456789, 'Ahmed Ali', 'Lahore, Pakistan', '+92-300-1234567', 'PL001', 'None'),
		(234567890, 'Aisha Khan', 'Karachi, Pakistan', '+92-301-2345678', 'PL002', 'Contacts'),
		(345678901, 'Zainab Ali', 'Islamabad, Pakistan', '+92-302-3456789', 'PL003', 'Glasses'),
		(456789012, 'Ali Ahmed', 'Multan, Pakistan', '+92-303-4567890', 'PL004', 'None'),
		(567890123, 'Sara Khan', 'Peshawar, Pakistan', '+92-304-5678901', 'PL005', 'Contacts'),
		(678901234, 'Hassan Ali', 'Rawalpindi, Pakistan', '+92-305-6789012', 'PL006', 'Glasses'),
		(789012345, 'Fatima Khan', 'Faisalabad, Pakistan', '+92-306-7890123', 'PL007', 'None'),
		(890123456, 'Ahsan Ahmed', 'Gujranwala, Pakistan', '+92-307-8901234', 'PL008', 'Contacts'),
		(901234567, 'Sadia Khan', 'Sialkot, Pakistan', '+92-308-9012345', 'PL009', 'Glasses'),
		(012345678, 'Sami Ali', 'Sargodha, Pakistan', '+92-309-0123456', 'PL010', 'None'),
		(32145-6789, 'Sana Khan', 'Hyderabad, Pakistan', '+92-310-1234567', 'PL011', 'Contacts'),
		(432567890, 'Taha Ahmed', 'Quetta, Pakistan', '+92-311-2345678', 'PL012', 'Glasses'),
		(543678901, 'Zara Ali', 'Gilgit, Pakistan', '+92-312-3456789', 'PL013', 'None'),
		(654789012, 'Waqar Khan', 'Mirpur Khas, Pakistan', '+92-313-4567890', 'PL014', 'Contacts'),
		(765890123, 'Hamza Ali', 'Muzaffarabad, Pakistan', '+92-314-5678901', 'PL015', 'Glasses'),
		(876901234, 'Hira Khan', 'Bahawalpur, Pakistan', '+92-315-6789012', 'PL016', 'None'),
		(987012345, 'Junaid Ahmed', 'Gwadar, Pakistan', '+92-316-7890123', 'PL017', 'Contacts'),
		(098123456, 'Aqsa Khan', 'Dera Ismail Khan, Pakistan', '+92-317-8901234', 'PL018', 'Glasses'),
		(210234567, 'Asad Ali', 'Chitral, Pakistan', '+92-318-9012345', 'PL019', 'None'),
		(543219876, 'Saman Khan', 'Khuzdar, Pakistan', '+92-319-0123456', 'PL020', 'Contacts')
INSERT INTO person (ssn, name, address, telephone_number) VALUES
	(123456789, 'Ali Khan', 'Lahore, Pakistan', '0333-1234567'),
	(234567890, 'Fatima Ahmed', 'Karachi, Pakistan', '0312-2345678'),
	(345678901, 'Usman Ali', 'Islamabad, Pakistan', '0321-3456789'),
	(456789012, 'Aisha Farooq', 'Rawalpindi, Pakistan', '0334-4567890'),
	(56789-0123, 'Ahmed Hassan', 'Peshawar, Pakistan', '0345-5678901'),
	(678901234, 'Sana Ali', 'Faisalabad, Pakistan', '0311-6789012'),
	(789012345, 'Zainab Malik', 'Multan, Pakistan', '0332-7890123'),
	(890123456, 'Imran Khan', 'Hyderabad, Pakistan', '0343-8901234'),
	(901234567, 'Mehwish Awan', 'Quetta, Pakistan', '0313-9012345'),
	(012345678, 'Hamza Ali', 'Lahore, Pakistan', '0322-0123456'),
	(321456789, 'Tariq Mahmood', 'Karachi, Pakistan', '0314-3214567'),
	(432567890, 'Hira Nadeem', 'Islamabad, Pakistan', '0335-4325678'),
	(543678901, 'Fawad Akram', 'Rawalpindi, Pakistan', '0315-5436789'),
	(654789012, 'Kashif Ali', 'Peshawar, Pakistan', '0324-6547890'),
	(765890123, 'Saima Hussain', 'Faisalabad, Pakistan', '0336-7658901'),
	(876901234, 'Nadeem Ahmed', 'Multan, Pakistan', '0316-8769012'),
	(987012345, 'Sadia Ali', 'Hyderabad, Pakistan', '0323-9870123'),
	(098123456, 'Ahsan Ali', 'Quetta, Pakistan', '0337-0981234'),
	(21023-4567, 'Bushra Malik', 'Lahore, Pakistan', '0317-2102345'),
	(543219876, 'Sana Khan', 'Karachi, Pakistan', '0325-5432198');
INSERT INTO flies (ssn, model_number)
VALUES
			(345678901, 6),
			(234567890, 2),
			(345678901, 3),
			(234567890, 8),
			(345678901, 1),
			(432567890, 5),
			(543219876, 8),
			(432567890, 7),
			(543219876, 1),
			(210234567, 2),
			(210234567, 7),
			(901234567, 4),
			(210234567, 1),
			(210234567, 5),
			(901234567, 3),
		(876901234, 4),
		(987012345, 8),
			(543678901, 7),
			(210234567, 6),
			(543678901, 2);
INSERT INTO works_on (ssn, model_number) VALUES
			(210234567,7),
			(123456789,4),
			(789012345,8),
			(654789012,5),
			(210234567,6),
			(654789012,4),
			(210234567,4),
			(654789012,7),
			(234567890,3),
			(789012345,1),
			(876901234,1),
			(901234567,6),
			(123456789,3),
			(901234567,4),
			(876901234,8),
			(876901234,3),
			(098123456,3),
			(123456789,8),
			(789012345,6),
			(789012345,3);
INSERT INTO service_record (service_id, date, hours, work_code) VALUES
		(1,'2021-01-08',7,'AC8'),
		(2,'2000-02-08',14,'AC6'),
		(3,'2019-03-08',13,'AC10'),
		(4,'2021-11-08',3,'AC8'),
		(5,'2022-12-08',20,'AC4'),
		(6,'2020-09-08',1,'AC7'),
		(7,'2020-04-08',17,'AC2'),
		(8,'2018-06-08',8,'AC10'),
		(9,'2019-03-08',11,'AC3'),
		(10,'2018-07-08',8,'AC6'),
		(11,'2019-06-08',3,'AC3'),
		(12,'2018-09-08',10,'AC8'),
		(13,'2017-11-08',17,'AC2'),
		(14,'2019-05-08',10,'AC4'),
		(15,'2022-05-08',20,'AC5'),
		(16,'2023-04-08',19,'AC5'),
		(17,'2002-12-08',11,'AC4'),
		(18,'2002-03-08',12,'AC1'),
		(19,'2019-11-08',14,'AC3'),
		(20,'2018-03-08',17,'AC2');
INSERT INTO plane_service (registration_number, service_id) VALUES
		(10004,8),
		(10018,16),
		(10014,16),
		(10007,13),
		(10010,2),
		(10003,8),
		(10011,20),
		(10004,7),
		(10001,7),
		(10013,17),
		(10012,9),
		(10008,10),
		(10003,11),
		(10003,4),
		(10008,16),
		(10010,3),
		(10003,19),
		(10010,8),
		(10014,17),
		(10012,3);
INSERT INTO maintain (ssn, service_id) VALUES
		(456789012,7),
		(098123456,16),
		(654789012,16),
		(789012345,13),
		(012345678,2),
		(345678901,8),
		(321456789,20),
		(456789012,8),
		(123456789,7),
		(543678901,17),
		(432567890,9),
		(890123456,10),
		(345678901,11),
		(345678901,4),
		(890123456,16),
		(012345678,3),
		(345678901,19),
		(012345678,8),
		(654789012,17),
		(432567890,3);
