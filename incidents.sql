create database incident2;

use incident2;

create table incidents(
    incident_id int primary key,
    description varchar(255),
    incident_date date,
    status varchar(50),
    reporting_employee int,
    incident_type int,
    severity int,
    affected_device int
);

insert into incidents values
(5001, 'Employee received a suspicious email requesting login credentials.', '2026-07-01', 'Open', 001, 10011, 2, 1011);

insert into incidents values
(5002, 'Malicious software was detected on an employee laptop.', '2026-07-03', 'Under Investigation', 002, 10012, 3, 1012);

insert into incidents values
(5003, 'Files on the employee computer were encrypted and a ransom demand was displayed.', '2026-07-05', 'Open', 003, 10013, 4, 1015);

insert into incidents values
(5004, 'Unauthorized login attempt was detected on a company system.', '2026-07-08', 'Resolved', 004, 10014, 3, 1014);

insert into incidents values
(5005, 'Confidential employee information was accessed without authorization.', '2026-07-10', 'Under Investigation', 005, 10015, 4, 1013);

insert into incidents values
(5006, 'Multiple failed password attempts were detected on an employee account.', '2026-07-12', 'Resolved', 006, 10016, 2, 1016);

insert into incidents values
(5007, 'An employee reported repeated threatening messages through an online platform.', '2026-07-15', 'Open', 007, 10017, 2, 1017);

insert into incidents values
(5008, 'An employee account was suspected of being misused to access restricted information.', '2026-07-18', 'Under Investigation', 008, 10018, 3, 1014);

insert into incidents values
(5009, 'A suspicious email attachment containing malicious content was opened by an employee.', '2026-07-20', 'Resolved', 009, 10011, 2, 1013);

insert into incidents values
(5010, 'Ransomware activity was detected on a workstation and several files became inaccessible.', '2026-07-22', 'Open', 010, 10013, 4, 1017);

select * from incidents;