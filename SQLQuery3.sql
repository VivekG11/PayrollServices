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

alter table Employe_Payroll add gender char(1);

update Employe_Payroll set gender = 'M';

update Employe_Payroll set gender = 'F' where name = 'Pavani';

select * from Employe_Payroll;

select sum(salary) as Totalsalary, gender from Employe_Payroll group by gender;

select avg(salary) as Totalsalary , gender from Employe_Payroll group by gender;

select min(salary) as Totalsalary, gender from Employe_Payroll group by gender;

select max(salary) as Totalsalary, gender from Employe_Payroll group by gender;

select count(salary) as Totalsalary from employee_payroll;

alter table Employe_Payroll add Phone bigint;

alter table Employe_Payroll add Address varchar(300);

alter table Employe_Payroll add Department varchar(100) not null default 'SALES';

select * from Employe_Payroll;
--------UC8---------

alter table Employe_Payroll add BasicPay bigint;

alter table Employe_Payroll add Deductions int;

alter table Employe_Payroll add TaxablePay int;

alter table Employe_Payroll add IncomeTax int;

alter table Employe_Payroll add NetPay bigint;

select * from Employe_Payroll;
--------UC9---------------


insert into Employe_Payroll values('Guna',54874,'2000-09-29','M',7991456,'Manthani','Marketing',20000,2000,200,900,16900);

insert into Employe_Payroll values('Vivek',55784,'2020-09-29','M',733886,'Pdpl','Marketing',30000,2000,200,1000,26800);
