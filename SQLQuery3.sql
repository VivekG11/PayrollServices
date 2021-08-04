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

update Employe_Payroll set Phone = 73388,Address = 'Manthani',BasicPay=20000,Deductions = 1500,IncomeTax=500  where name = 'Kumar';

update Employe_Payroll set Phone = 96296,Address = 'Vizag',BasicPay=22000,Deductions = 1600,IncomeTax=600  where name = 'Aditya';

update Employe_Payroll set Phone = 96762,Address = 'KADAPA',BasicPay=24000,Deductions = 1700,IncomeTax=700  where name = 'Pavani';

update Employe_Payroll set Phone = 70950,Address = 'Karimnagar',BasicPay=26000,Deductions = 1700,IncomeTax=700  where id = 1;

update Employe_Payroll set TaxablePay = BasicPay - Deductions;

update Employe_Payroll set NetPay = TaxablePay - IncomeTax;

select * from Employe_Payroll;

update Employe_Payroll set startDate = '2020-03-29' where id = 1;

update Employe_Payroll set startDate = '2019-12-20' where id = 2;

update Employe_Payroll set startDate = '2020-01-02' where name = 'Aditya';

update Employe_Payroll set startDate = '2018-06-11' where id = 3;

update Employe_Payroll set startDate = '2017-11-28' where id = 5;

update Employe_Payroll set startDate = '2018-06-25' where id = 6;

-----Creating Company Table -------------

create table Company(
CompanyId int identity(1,1) primary key,
CompanyName varchar(100));

select * from Company;

insert into Company values('TVS'),('NXT'),('CTS');

------Creating Employee Table--------
 create table Employee(
 EmployeId int identity(1,1) primary key,
 CompanyId int FOREIGN KEY REFERENCES Company(CompanyId),
 EmployeName varchar(50),
 Phone bigint,
 Address varchar(150),
 StartDate date,
 gender char(1),
 );

 ----creating payroll table-------

 create table Payroll(
 EmployeId int FOREIGN KEY REFERENCES Employee(EmployeId),
 BasicPay bigint,
 Taxablepay int,
 Incometax int,
 Deductions int,
 Netpay bigint);

--------create Department Table--------

create table Department(
DeptId int identity(1,1) primary key,
DeptName varchar(100));

-------create EmployeeDepartment Table------

create table EmployeDepartment(
DeptId int FOREIGN KEY REFERENCES Department(DeptId),
EmployeId int FOREIGN KEY REFERENCES Employee(EmployeId));

-----Inserting Values into Employee table------
insert into Employee values (2,'Arun',95757,'Hyderabad','2020-10-02','M');

insert into Employee values
(1,'Akhil',90298,'Peddapalle','2019-09-17','M'),
(3,'Vinay',97009,'warangal','2017-04-17','M'),
(2,'Meghana',88976,'Bhpl','2018-06-25','F');

select * from Employee;

-----Inserting values into payroll table-----

select * from Payroll;

insert into Payroll(EmployeId,BasicPay,Incometax,Deductions) values (3,22000,500,1000),(5,24000,700,1000),(6,26000,800,1500),(7,25000,600,1000);

update Payroll set Taxablepay = BasicPay - Deductions;

update Payroll set Netpay = Taxablepay - Incometax;

select * from Payroll;

sp_help ;

insert into Department values ('HR'),('TESTING'),('DEVELOPER'),('TECHSUPPORT');

select * from Department;

------DepartmenTable-----

insert into EmployeDepartment values(1,3),(2,5),(3,6),(4,7);

select * from EmployeDepartment;

select CmpId,CompanyName,EmpId,EmployeName,Address,Phone,StartDate,gender,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay,DeptName
FROM Company
INNER JOIN Employee on Company.CmpId = Employee.CompanyId
INNER JOIN Payroll on Payroll.EmpId = Employee.EmployeId
INNER JOIN EmployeDepartment on Employee.EmployeId = EmployeDepartment.EmployeId
INNER JOIN Department on Department.DeptId = EmployeDepartment.DeptId;

EXEC sp_RENAME 'Company.CompanyId' , 'CmpId', 'COLUMN';

alter table Company RENAME CompanyId to CmpId;  


------Retrieving Data based on certain period-----------
SELECT CmpId CompanyName,EmployeId,EmployeName
From Company
INNER JOIN Employee on Company.CmpId = Employee.CompanyId where StartDate BETWEEN Cast('2017-03-01' as Date) and cast('2019-11-11' as Date);

-------retrieving Employe Count------------
select Count(EmpId) as "EmployeeCount" , gender 
from Employee
INNER JOIN Payroll on Employee.EmployeId = Payroll.EmpId group by gender;

------Finding MInimum Salary------------

select EmpId,EmployeName,BasicPay
From Employee
INNER JOIN Payroll on Employee.EmployeId = Payroll.EmpId
where BasicPay =(select min(BasicPay) From Payroll);

 -------------- Finding Maximum Salary------------

select EmpId,EmployeName,BasicPay
From Employee
INNER JOIN Payroll on Employee.EmployeId = Payroll.EmpId
where BasicPay =(select max(BasicPay) From Payroll);

------Finding Average Pay------------
select AVG(BasicPay) as "AveragePay", gender From Employee
INNER JOIN Payroll on Employee.EmployeId = Payroll.EmpId group by gender;
