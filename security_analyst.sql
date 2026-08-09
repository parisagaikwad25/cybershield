create database analyst1;

use analyst1;

create table security_analysts(
    analyst_id int primary key,
    analyst_name varchar(50),
    contact_details varchar(100)
);

insert into security_analysts values
(2001, 'Riya Deshmukh', 'riya.deshmukh@example.com, 9876543210');

insert into security_analysts values
(2002, 'Kunal Joshi', 'kunal.joshi@example.com, 9865432107');

insert into security_analysts values
(2003, 'Snehal Patil', 'snehal.patil@example.com, 9856123470');

insert into security_analysts values
(2004, 'Aman Kulkarni', 'aman.kulkarni@example.com, 9845012367');

insert into security_analysts values
(2005, 'Pooja Sharma', 'pooja.sharma@example.com, 9834567120');

insert into security_analysts values
(2006, 'Nikhil Rao', 'nikhil.rao@example.com, 9823456710');

insert into security_analysts values
(2007, 'Tanvi Mehta', 'tanvi.mehta@example.com, 9812345670');

insert into security_analysts values
(2008, 'Yash Thakur', 'yash.thakur@example.com, 9801234567');

select * from security_analysts;