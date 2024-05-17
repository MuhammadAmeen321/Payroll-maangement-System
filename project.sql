CREATE DATABASE PayrolSystem;
USE PayrolSystem;
CREATE TABLE Employee (
    emp_ID INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(255),
    lname VARCHAR(255),
    gender varchar(30),
    age varchar(30),
    contact_add INT,
    emp_email VARCHAR(255),
    emp_pass int
);
INSERT INTO Employee (fname, lname, gender, age, emp_email, emp_pass) VALUES
('John', 'Doe', 'Male', '30', 'john.doe@example.com', 123456),
('Jane', 'Smith', 'Female', '25', 'jane.smith@example.com', 654321);




CREATE TABLE Admin (
    admin_ID INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(255),
    lname VARCHAR(255),
    gender varchar(30),
    age varchar(30),
    contact_add INT,
    admin_email VARCHAR(255),
    admin_pass int
);
INSERT INTO Admin (fname, lname, gender, age, admin_email, admin_pass) VALUES
('Admin', 'Adminson', 'Male', '40', 'admin@example.com', 123456);




CREATE TABLE Job_Department (
    job_ID INT PRIMARY KEY AUTO_INCREMENT,
    job_dept VARCHAR(30),
    name VARCHAR(30),
    description VARCHAR(30),
    salary_range int 
);

INSERT INTO Job_Department (job_dept, name, description, salary_range) VALUES
('HR', 'HR Manager', 'Managing HR operations', 70000),
('IT', 'Software Developer', 'Developing software', 80000);









CREATE TABLE Salary_or_Bonus (
    salary_ID INT PRIMARY KEY AUTO_INCREMENT,
    job_ID INT,
    amount INT,
    annual DATE,
    bonus DATE,
    FOREIGN KEY (job_ID) REFERENCES Job_Department(job_ID)
);



INSERT INTO Salary_or_Bonus (job_ID, amount, annual, bonus) VALUES
(1, 60000, '2024-01-01', '2024-12-31'),
(2, 70000, '2024-01-01', '2024-12-31');



CREATE TABLE Leave (
    leave_ID INT PRIMARY KEY AUTO_INCREMENT,
    emp_ID INT,
    date DATE,
    status VARCHAR(30),
    reason TEXT,
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
);

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Your INSERT statement for the Leave table here
INSERT INTO Leave (emp_ID, date, status, reason) VALUES
(1, '2024-05-01', 'Approved', 'Vacation'),
(2, '2024-05-02', 'Pending', 'Sick leave');

-- Re-enable foreign key checks
SET foreign_key_checks = 1;





CREATE TABLE Payroll (
    payroll_ID INT PRIMARY KEY AUTO_INCREMENT,
    emp_ID INT,
    job_ID INT,
    salary_ID INT,
    leave_ID INT,
    date DATE,
    report TEXT,
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID),
    FOREIGN KEY (job_ID) REFERENCES Job_Department(job_ID),
    FOREIGN KEY (salary_ID) REFERENCES Salary_or_Bonus(salary_ID),
    FOREIGN KEY (leave_ID) REFERENCES Leave(leave_ID)
);

SET foreign_key_checks = 0;

INSERT INTO Payroll (emp_ID, job_ID, salary_ID, leave_ID, date, report) VALUES
(1, 1, 1, 1, '2024-05-01', 'Monthly report for May 2024'),
(2, 2, 2, 2, '2024-05-02', 'Monthly report for May 2024');

SET foreign_key_checks = 1;




CREATE TABLE Deduction (
    deduction_ID INT PRIMARY KEY AUTO_INCREMENT,
    emp_ID INT,
    amount DECIMAL,
    deduction_date DATE,
    reason TEXT,
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
);


-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Insert data into the Deduction table
INSERT INTO Deduction (emp_ID, amount, deduction_date, reason) VALUES
(1, 100.00, '2024-05-01', 'Late attendance'),
(2, 50.00, '2024-05-02', 'Medical expenses');

-- Re-enable foreign key checks
SET foreign_key_checks = 1;


select  emp_id from employee;









CREATE TABLE Category (
    category_ID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    status VARCHAR(10)
);



-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Insert data into the Category table
INSERT INTO Category (name, description, status) VALUES
('General', 'General category', 'Active'),
('Management', 'Management category', 'Inactive');

-- Re-enable foreign key checks
SET foreign_key_checks = 1;