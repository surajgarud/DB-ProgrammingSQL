--database Created
create database DB_Programming
use DB_Programming

--creating table
create table Employee
(
    EmployeeID int identity(1,1) primary key,
    FirstName varchar(255),
    LastName varchar(255),
    Address varchar(255),
    City varchar(255)      
);
 insert into Employee values
 
	('Ram','Tiwari','RamNager','Aurangabad'),
	('Suresh','Rana','VitthalNager','Pune'),
	('Suraj','Garud','Hadapsar','Pune')

select * from EmpDetails
 
 --Update Table

 update Employee
 set Gender ='Male'
 where EmployeeID= 1


 ---Delete From Table

 delete from EmpDetails
 where EmployeeID in (5,6,7,8)

 --Alter Table

 alter table employee
 add MobileNo varchar(13)

alter table employee
 add Gender varchar(6)

 -----------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------

 select * from DB_Table


 select * from Employee
 where not FirstName='ram'

 select * from Employee
 order by City

select * from Employee
where MobileNo is not null


select top 1 * from employee







sp_rename 'DB Table','Employee'