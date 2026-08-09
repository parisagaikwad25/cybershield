CREATE DATABASE incident_management;
USE incident_management;
CREATE TABLE Severity_Levels (
    severity_id INT PRIMARY KEY,severity_name VARCHAR(50) NOT NULL,description VARCHAR(255)
);
INSERT INTO Severity_Levels VALUES(1, 'Low', 'Minor security incident with limited impact on systems or data.'),
(2, 'Medium', 'Security incident that affects a limited number of users or systems.'),
(3, 'High', 'Serious security incident that may cause significant damage or data loss.'),
(4, 'Critical', 'Severe security incident requiring immediate response due to major impact on systems, data or operations.');
SELECT * FROM Severity_Levels;





