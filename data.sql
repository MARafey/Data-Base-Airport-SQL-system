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
  license_number INT NOT NULL,
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
  (2, 300, 6000),
  (3, 400, 8000);
INSERT INTO hangar (number, capacity, location)
VALUES
  (1, 5, 'New York'),
  (2, 10, 'Los Angeles'),
  (3, 15, 'Chicago');
INSERT INTO airplane (registration_number, plane_type, stored_in)
VALUES
  (10001, 1, 1),
  (10002, 2, 1),
  (10003, 3, 2);
INSERT INTO owner (ssn, name, address, telephone_number)
VALUES
  (1111, 'John Doe', '123 Main St, New York', '555-1234'),
  (2222, 'Jane Smith', '456 Elm St, Los Angeles', '555-5678'),
  (3333, 'Bob Johnson', '789 Oak St, Chicago', '555-9012');
INSERT INTO corporation (name, address, telephone_number)
VALUES
  ('Acme Corporation', '10 Main St, New York', '555-1111'),
  ('XYZ Corporation', '20 Elm St, Los Angeles', '555-2222'),
  ('ABC Corporation', '30 Oak St, Chicago', '555-3333');
INSERT INTO owns (registration_number, ssn, purchase_date)
VALUES
  (10003, 1111, '2022-01-01'),
  (10001, 2222, '2022-02-02'),
  (10002, 3333, '2022-03-03');
INSERT INTO employee (ssn, name, address, telephone_number, salary, shift_worked)
VALUES
  (4444, 'Mike Johnson', '456 Oak St, New York', '555-4444', 50000, 'Day'),
  (5555, 'Sara Davis', '789 Main St, Los Angeles', '555-5555', 60000, 'Night'),
  (6666, 'Mark Smith', '123 Elm St, Chicago', '555-6666', 70000, 'Day');
INSERT INTO pilot (ssn, name, address, telephone_number, license_number, restrictions)
VALUES
  (7777, 'Tom Jones', '10 Oak St, New York', '555-7777', 12345, 'None'),
  (8888, 'Mary Smith', '20 Elm St, Los Angeles', '555-8888', 23456, 'Glasses'),
  (222222222, 'John Smith', '20 Elm St, Los Angeles', '555-8588', 26456, 'Glasses'),
  (333333333, 'John Grey', '20 flie St, Los Angeles', '551-8008', 20456, 'Contacts'),
  (111111111, 'jordN jon', '22 Hell St, Los Angeles', '565-8788', 26856, 'None'),
  (9999, 'Steve Johnson', '30 Main St, Chicago', '555-9999', 34567, 'Contacts');
INSERT INTO person (ssn, name, address, telephone_number) VALUES
(111111111, 'John Smith', '123 Main St, Anytown USA', '555-1234'),
(222222222, 'Jane Doe', '456 Elm St, Anytown USA', '555-5678'),
(333333333, 'Bob Johnson', '789 Oak St, Anytown USA', '555-9012');
INSERT INTO flies (ssn, model_number) VALUES
(222222222, 1),
(333333333, 2),
(111111111, 1);
INSERT INTO works_on (ssn, model_number) VALUES
(4444, 1),
(5555, 2),
(6666, 3);
INSERT INTO service_record (service_id, date, hours, work_code) VALUES
(1, '2022-01-01', 10, 'AC1'),
(2, '2022-02-01', 5, 'AC2'),
(3, '2022-03-01', 8, 'AC3');
INSERT INTO plane_service (registration_number, service_id) VALUES
(10001, 1),
(10002, 2),
(10003, 3);
INSERT INTO maintain (ssn, service_id) VALUES
(4444, 1),
(5555, 2),
(6666, 3);
