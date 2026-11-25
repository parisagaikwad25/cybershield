
CREATE DATABASE analyst1;
USE analyst1;

CREATE TABLE security_analysts (
    analyst_id INT PRIMARY KEY,
    analyst_name VARCHAR(50) NOT NULL,
    contact_details VARCHAR(100),

    FOREIGN KEY (analyst_id)
        REFERENCES emp2.emp2(emp_id)
);

INSERT INTO security_analysts VALUES
(001, 'Aarav Sharma', 'aarav.sharma@example.com, 9876543210');

INSERT INTO security_analysts VALUES
(002, 'Priya Nair', 'priya.nair@example.com, 9865432107');

INSERT INTO security_analysts VALUES
(011, 'Vikram Singh', 'vikram.singh@example.com, 9856123470');

INSERT INTO security_analysts VALUES
(014, 'Meera Menon', 'meera.menon@example.com, 9845012367');

INSERT INTO security_analysts VALUES
(010, 'Kavya Iyer', 'kavya.iyer@example.com, 9834567120');

INSERT INTO security_analysts VALUES
(009, 'Arjun Deshmukh', 'arjun.deshmukh@example.com, 9823456710');

INSERT INTO security_analysts VALUES
(012, 'Ishita Shah', 'ishita.shah@example.com, 9812345670');

INSERT INTO security_analysts VALUES
(013, 'Karan Malhotra', 'karan.malhotra@example.com, 9801234567');

SELECT * FROM security_analysts;
