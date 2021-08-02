create database Payrool_Services;

use payroll_serivce;
--------UC1--------------

create table Employe_Payroll
(
id int identity(1,1),
name varchar (100) not null,
salary float,
startDate date
)
-------uc2--------
