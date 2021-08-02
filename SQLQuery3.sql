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

insert into Employe_Payroll values('Vivek',45432,'1999-06-11'),('Pavani',65784,'2000-02-17'),('Kumar',34562,'2002-09-12'),('Aditya',23511,'2000-09-21');


--------UC3-------------------

select * from Employe_Payroll;
---------UC4-----------------

select  salary, name  from Employe_Payroll where name='Kumar';

select salary , name from Employe_Payroll where startDate between cast('2000-01-01' as date) and  getdate(); 
