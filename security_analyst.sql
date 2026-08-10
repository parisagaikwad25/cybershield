create database analyst1;

use analyst1;

create table security_analysts(
    analyst_id int primary key,
    analyst_name varchar(50),
    contact_details varchar(100)
);

insert into security_analysts values
(2001, 'Aarav Sharma', 'aarav.sharma@example.com, 9876543210');

insert into security_analysts values
(2002, 'Priya Nair', 'priya.nair@example.com, 9865432107');

insert into security_analysts values
(2003, 'Vikram Singh', 'vikram.singh@example.com, 9856123470');

insert into security_analysts values
(2004, 'Meera Menon', 'meera.menon@example.com, 9845012367');

insert into security_analysts values
(2005, 'Kavya Iyer', 'kavya.iyer@example.com, 9834567120');

insert into security_analysts values
(2006, 'Arjun Deshmukh', 'arjun.deshmukh@example.com, 9823456710');

insert into security_analysts values
(2007, 'Ishita Shah', 'ishita.shah@example.com, 9812345670');

insert into security_analysts values
(2008, 'Karan Malhotra', 'karan.malhotra@example.com, 9801234567');

select * from security_analysts;
