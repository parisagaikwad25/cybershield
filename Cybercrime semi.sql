-- =========================================================
-- CREATE DATABASE
-- =========================================================

DROP DATABASE IF EXISTS cybercrime_management;

CREATE DATABASE cybercrime_management;

USE cybercrime_management;


-- =========================================================
-- 1. DEPARTMENT TABLE
-- =========================================================

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

INSERT INTO Department (dept_id, dept_name) VALUES
(101, 'Cybercrime Investigation'),
(102, 'Threat Intelligence'),
(103, 'Digital Forensic Department'),
(104, 'Cyber Security Operations'),
(105, 'Incident Response'),
(106, 'Cybercrime Prevention');


-- =========================================================
-- 2. CLIENT TABLE
-- Clients are people who report cybercrime incidents
-- =========================================================

CREATE TABLE Client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    contact_details VARCHAR(150)
);

INSERT INTO Client (client_id, client_name, contact_details) VALUES
(1001, 'Riya Desai', 'riya.desai@gmail.com'),
(1002, 'Aditya Joshi', 'aditya.joshi@gmail.com'),
(1003, 'Snehal Patil', 'snehal.patil@gmail.com'),
(1004, 'Manish Kulkarni', 'manish.kulkarni@gmail.com'),
(1005, 'Pooja Shah', 'pooja.shah@gmail.com'),
(1006, 'Nikhil Mehta', 'nikhil.mehta@gmail.com'),
(1007, 'Tanvi Rao', 'tanvi.rao@gmail.com'),
(1008, 'Omkar Deshmukh', 'omkar.deshmukh@gmail.com'),
(1009, 'Neha Kapoor', 'neha.kapoor@gmail.com'),
(1010, 'Raj Malhotra', 'raj.malhotra@gmail.com');


-- =========================================================
-- 3. SECURITY ANALYST TABLE
-- Each analyst belongs to a department
-- =========================================================

CREATE TABLE Security_Analyst (
    analyst_id INT PRIMARY KEY,
    analyst_name VARCHAR(100) NOT NULL,
    contact_details VARCHAR(150),
    dept_id INT NOT NULL,

    CONSTRAINT fk_analyst_department
        FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

INSERT INTO Security_Analyst
(analyst_id, analyst_name, contact_details, dept_id) VALUES
(2001, 'Aarav Sharma', 'aarav.sharma@example.com', 101),
(2002, 'Priya Nair', 'priya.nair@example.com', 105),
(2003, 'Vikram Singh', 'vikram.singh@example.com', 104),
(2004, 'Meera Menon', 'meera.menon@example.com', 103),
(2005, 'Kavya Iyer', 'kavya.iyer@example.com', 102),
(2006, 'Arjun Deshmukh', 'arjun.deshmukh@example.com', 101),
(2007, 'Ishita Shah', 'ishita.shah@example.com', 106),
(2008, 'Karan Malhotra', 'karan.malhotra@example.com', 105);


-- =========================================================
-- 4. DEVICE TABLE
-- Devices are assigned to Security Analysts
-- =========================================================

CREATE TABLE Device (
    device_id INT PRIMARY KEY,
    device_name VARCHAR(100) NOT NULL,
    analyst_id INT NOT NULL,

    CONSTRAINT fk_device_analyst
        FOREIGN KEY (analyst_id)
        REFERENCES Security_Analyst(analyst_id)
);

INSERT INTO Device
(device_id, device_name, analyst_id) VALUES
(1011, 'Dell Laptop', 2001),
(1012, 'HP Laptop', 2002),
(1013, 'MacBook Pro', 2004),
(1014, 'Windows Server', 2003),
(1015, 'MacBook Air', 2004),
(1016, 'Lenovo Laptop', 2006),
(1017, 'Dell Desktop', 2005);


-- =========================================================
-- 5. INCIDENT TYPE TABLE
-- =========================================================

CREATE TABLE Incident_Type (
    incident_type_id INT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

INSERT INTO Incident_Type
(incident_type_id, type_name, description) VALUES
(10011, 'Phishing',
 'Fraudulent emails or messages used to steal sensitive information or login credentials.'),

(10012, 'Malware',
 'Malicious software infects a computer or network and may damage or steal data.'),

(10013, 'Ransomware',
 'Malware that encrypts files and demands payment to restore access.'),

(10014, 'Unauthorized Access',
 'An unauthorized person gains access to a system, account or network.'),

(10015, 'Data Breach',
 'Sensitive or confidential information is accessed, exposed or stolen without authorization.'),

(10016, 'Password Attack',
 'An attacker attempts to obtain or bypass a users password.'),

(10017, 'Cyberstalking',
 'Repeated online harassment, monitoring or threatening behavior toward an individual.'),

(10018, 'Insider Threat',
 'An authorized user misuses their access to compromise security.');


-- =========================================================
-- 6. SEVERITY LEVEL TABLE
-- =========================================================

CREATE TABLE Severity_Level (
    severity_id INT PRIMARY KEY,
    severity_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

INSERT INTO Severity_Level
(severity_id, severity_name, description) VALUES
(1, 'Low',
 'Minor security incident with limited impact.'),

(2, 'Medium',
 'Security incident affecting a limited number of users or systems.'),

(3, 'High',
 'Serious security incident that may cause significant damage or data loss.'),

(4, 'Critical',
 'Severe security incident requiring immediate response.');


-- =========================================================
-- 7. INCIDENT TABLE
-- Client reports the incident
-- Incident affects a device
-- =========================================================

CREATE TABLE Incident (
    incident_id INT PRIMARY KEY,
    description VARCHAR(255),
    incident_date DATE,
    status VARCHAR(50),

    client_id INT NOT NULL,
    incident_type_id INT NOT NULL,
    severity_id INT NOT NULL,
    affected_device INT NOT NULL,

    CONSTRAINT fk_incident_client
        FOREIGN KEY (client_id)
        REFERENCES Client(client_id),

    CONSTRAINT fk_incident_type
        FOREIGN KEY (incident_type_id)
        REFERENCES Incident_Type(incident_type_id),

    CONSTRAINT fk_incident_severity
        FOREIGN KEY (severity_id)
        REFERENCES Severity_Level(severity_id),

    CONSTRAINT fk_incident_device
        FOREIGN KEY (affected_device)
        REFERENCES Device(device_id)
);


INSERT INTO Incident
(incident_id, description, incident_date, status,
 client_id, incident_type_id, severity_id, affected_device)
VALUES

(5001,
 'Client received a suspicious email requesting login credentials.',
 '2026-07-01',
 'Open',
 1001, 10011, 2, 1011),

(5002,
 'Malicious software was detected on a client system.',
 '2026-07-03',
 'Under Investigation',
 1002, 10012, 3, 1012),

(5003,
 'Files were encrypted and a ransom demand was displayed.',
 '2026-07-05',
 'Open',
 1003, 10013, 4, 1015),

(5004,
 'Unauthorized login attempt was detected.',
 '2026-07-08',
 'Resolved',
 1004, 10014, 3, 1014),

(5005,
 'Confidential information was accessed without authorization.',
 '2026-07-10',
 'Under Investigation',
 1005, 10015, 4, 1013),

(5006,
 'Multiple failed password attempts were detected.',
 '2026-07-12',
 'Resolved',
 1006, 10016, 2, 1016),

(5007,
 'Client reported repeated threatening messages online.',
 '2026-07-15',
 'Open',
 1007, 10017, 2, 1017),

(5008,
 'Suspicious account activity was detected.',
 '2026-07-18',
 'Under Investigation',
 1008, 10018, 3, 1014),

(5009,
 'A malicious email attachment was opened.',
 '2026-07-20',
 'Resolved',
 1009, 10011, 2, 1013),

(5010,
 'Ransomware activity was detected.',
 '2026-07-22',
 'Open',
 1010, 10013, 4, 1017);


-- =========================================================
-- 8. INCIDENT ASSIGNMENT TABLE
-- Assigns an incident to a Security Analyst
-- =========================================================

CREATE TABLE Incident_Assignment (
    assignment_id INT PRIMARY KEY,
    incident_id INT NOT NULL,
    analyst_id INT NOT NULL,
    assignment_date DATE,

    CONSTRAINT fk_assignment_incident
        FOREIGN KEY (incident_id)
        REFERENCES Incident(incident_id),

    CONSTRAINT fk_assignment_analyst
        FOREIGN KEY (analyst_id)
        REFERENCES Security_Analyst(analyst_id)
);

INSERT INTO Incident_Assignment
(assignment_id, incident_id, analyst_id, assignment_date) VALUES

(301, 5001, 2001, '2026-07-01'),
(302, 5002, 2006, '2026-07-03'),
(303, 5003, 2004, '2026-07-05'),
(304, 5004, 2002, '2026-07-08'),
(305, 5005, 2003, '2026-07-10'),
(306, 5006, 2002, '2026-07-13'),
(307, 5007, 2007, '2026-07-16'),
(308, 5008, 2003, '2026-07-18'),
(309, 5009, 2001, '2026-07-21'),
(310, 5010, 2004, '2026-07-22');


-- =========================================================
-- 9. INVESTIGATION TABLE
-- Analyst investigates the incident
-- =========================================================

CREATE TABLE Investigation (
    investigation_id INT PRIMARY KEY,
    incident_id INT NOT NULL,
    analyst_id INT NOT NULL,
    investigation_date DATE,
    findings VARCHAR(255),

    CONSTRAINT fk_investigation_incident
        FOREIGN KEY (incident_id)
        REFERENCES Incident(incident_id),

    CONSTRAINT fk_investigation_analyst
        FOREIGN KEY (analyst_id)
        REFERENCES Security_Analyst(analyst_id)
);

INSERT INTO Investigation
(investigation_id, incident_id, analyst_id,
 investigation_date, findings) VALUES

(401, 5001, 2001, '2026-07-01',
 'Phishing attempt was confirmed and credentials were targeted.'),

(402, 5002, 2006, '2026-07-04',
 'Malware was detected and identified as the source of suspicious activity.'),

(403, 5003, 2004, '2026-07-05',
 'Ransomware encrypted multiple files and displayed a ransom demand.'),

(404, 5004, 2002, '2026-07-08',
 'Unauthorized login attempt was traced and account credentials were secured.'),

(405, 5005, 2003, '2026-07-11',
 'Unauthorized access to confidential information was confirmed.'),

(406, 5006, 2002, '2026-07-13',
 'Multiple failed login attempts were detected.'),

(407, 5007, 2007, '2026-07-16',
 'Threatening messages were traced to a suspicious online account.'),

(408, 5008, 2003, '2026-07-18',
 'Suspicious access to restricted information was detected.'),

(409, 5009, 2001, '2026-07-21',
 'Malicious email attachment was confirmed.'),

(410, 5010, 2004, '2026-07-22',
 'Ransomware activity was confirmed and files were encrypted.');


-- =========================================================
-- 10. RESPONSE ACTION TABLE
-- =========================================================

CREATE TABLE Response_Action (
    action_id INT PRIMARY KEY,
    incident_id INT NOT NULL,
    action_description TEXT NOT NULL,
    action_date DATE NOT NULL,

    CONSTRAINT fk_action_incident
        FOREIGN KEY (incident_id)
        REFERENCES Incident(incident_id)
);

INSERT INTO Response_Action
(action_id, incident_id, action_description, action_date) VALUES

(501, 5001,
 'Reset client password and blocked suspicious sender.',
 '2026-07-01'),

(502, 5002,
 'Isolated infected system and removed malware.',
 '2026-07-04'),

(503, 5003,
 'Isolated affected computer from the network.',
 '2026-07-05'),

(504, 5003,
 'Started recovery of encrypted files from backups.',
 '2026-07-06'),

(505, 5004,
 'Secured affected account and reset credentials.',
 '2026-07-08'),

(506, 5005,
 'Restricted access to confidential information.',
 '2026-07-11'),

(507, 5005,
 'Reviewed access logs.',
 '2026-07-12'),

(508, 5006,
 'Locked affected account and reset password.',
 '2026-07-13'),

(509, 5007,
 'Reported threatening account and preserved evidence.',
 '2026-07-16'),

(510, 5008,
 'Restricted account access to sensitive information.',
 '2026-07-18'),

(511, 5008,
 'Reviewed account activity and access logs.',
 '2026-07-19'),

(512, 5009,
 'Blocked malicious attachment and scanned system.',
 '2026-07-21'),

(513, 5010,
 'Isolated ransomware-infected workstation.',
 '2026-07-22'),

(514, 5010,
 'Started file recovery using backups.',
 '2026-07-23'),

(515, 5010,
 'Blocked ransomware activity and restricted network access.',
 '2026-07-23');


-- =========================================================
-- 11. AUDIT LOG TABLE
-- Records analyst activity and timestamp
-- =========================================================

CREATE TABLE Audit_Log (
    log_id INT PRIMARY KEY,
    analyst_id INT NOT NULL,
    action_performed VARCHAR(255) NOT NULL,
    action_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    incident_id INT NOT NULL,

    CONSTRAINT fk_audit_analyst
        FOREIGN KEY (analyst_id)
        REFERENCES Security_Analyst(analyst_id),

    CONSTRAINT fk_audit_incident
        FOREIGN KEY (incident_id)
        REFERENCES Incident(incident_id)
);


INSERT INTO Audit_Log
(log_id, analyst_id, action_performed, incident_id)
VALUES

(601, 2001,
 'Investigated phishing incident.',
 5001),

(602, 2006,
 'Investigated malware incident.',
 5002),

(603, 2004,
 'Investigated ransomware incident.',
 5003),

(604, 2002,
 'Investigated unauthorized access.',
 5004),

(605, 2003,
 'Investigated data breach.',
 5005),

(606, 2002,
 'Investigated password attack.',
 5006),

(607, 2007,
 'Investigated cyberstalking complaint.',
 5007),

(608, 2003,
 'Investigated insider threat.',
 5008),

(609, 2001,
 'Investigated malicious attachment.',
 5009),

(610, 2004,
 'Investigated ransomware activity.',
 5010);


-- =========================================================
-- CHECK ALL TABLES
-- =========================================================

SHOW TABLES;
SELECT
    c.client_id,
    c.client_name,

    i.incident_id,
    i.incident_date,
    i.status,
    i.description AS incident_description,

    it.type_name AS incident_type,

    sl.severity_name AS severity,

    dv.device_id,
    dv.device_name,

    device_analyst.analyst_name AS device_assigned_to,

    dept.dept_name AS analyst_department,

    investigator.analyst_name AS investigating_analyst,

    ia.assignment_date,

    inv.investigation_date,
    inv.findings,

    ra.action_id,
    ra.action_description,
    ra.action_date,

    al.log_id,
    al.action_performed,
    al.action_timestamp

FROM Client c

JOIN Incident i
    ON c.client_id = i.client_id

JOIN Incident_Type it
    ON i.incident_type_id = it.incident_type_id

JOIN Severity_Level sl
    ON i.severity_id = sl.severity_id

JOIN Device dv
    ON i.affected_device = dv.device_id

JOIN Security_Analyst device_analyst
    ON dv.analyst_id = device_analyst.analyst_id

JOIN Department dept
    ON device_analyst.dept_id = dept.dept_id

JOIN Incident_Assignment ia
    ON i.incident_id = ia.incident_id

JOIN Security_Analyst investigator
    ON ia.analyst_id = investigator.analyst_id

JOIN Investigation inv
    ON i.incident_id = inv.incident_id
    AND ia.analyst_id = inv.analyst_id

LEFT JOIN Response_Action ra
    ON i.incident_id = ra.incident_id

LEFT JOIN Audit_Log al
    ON i.incident_id = al.incident_id
    AND ia.analyst_id = al.analyst_id

ORDER BY i.incident_id, ra.action_id;