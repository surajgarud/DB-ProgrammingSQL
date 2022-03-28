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

select * from Employee
 
 --Update Table

 update EmpDetails
 set salary ='26759'
 where EmployeeID= 4


 ---Delete From Table

 delete from EmpDetails
 where EmployeeID in (5,6,7,8)
 /* to delete column from table*/
 alter table EmpDetails Drop column --(Column Name)--

 --Alter Table

 alter table EmpDetails
 add salary money

alter table employee
 add Gender varchar(6)

 -----------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------

 select * from DB_Table


 select * from Employee
 where FirstName='ram' or LastName='Tiwari'

 select * from Employee
 order by City

select count (*)  from Employee
where LastName = 'Tiwari'


select top 1 * from employee







sp_rename 'DB Table','Employee'





---------------------------------Section-1 ----------------------------------------------------------
select FirstName from employee;								  ----retrieve data from a table----

select * from Employee											 ---Get All Data From Table------------

select * from Employee where City= 'Pune'						 ----sort the result using where Claus-------

select City, COUNT (*) as Number from Employee where Address ='RamNager' group by City;-----Using OrderBy Claus-----


select * from Employee where city= 'Aurangabad' order by city    -----Get Result Using Order By Claus---------------


--------------------------------Section 2 -------------------------------------------------------------

select * from Employee order by city   -----Get Result Using Order By Claus ascending order------

select * from Employee order by city Desc  ---------Get Result Using Order By Claus Desccending order------

select * from Employee order by len(city)                -----------sorted by the length------------

--------------------------------Section 3 -------------------------------------------------------------

select * from Employee order by city offset 2 row   -------------skip the first 2 products-------------

select * from Employee order by city offset 1 row FETCH NEXT 2 ROWS only  ------------using fetch Keyword---


--------------------------------Section 4 -------------------------------------------------------------

select DISTINCT Address from Employee     ----------------Ignore Duplicate Values-----------

select * from Employee where City= 'Pune'	  ---------------- Finding rows----------

select * from Employee where City= 'Pune' and Gender='Male'  ------ Finding rows using AND keyword------

select * from Employee where City= 'Pune' or Gender='Male'    ------Finding rows that meet any of two conditions------

select FirstName,LastName from Employee WHERE FirstName LIKE 'S%' ---Using Like Keyword to find a string--

--------------------------------Section 5 -------------------------------------------------------------

-------------INNER JOIN------
CREATE SCHEMA SR;            ----created schema--
GO


CREATE TABLE SR.candidates(
    id INT PRIMARY KEY IDENTITY,                     -------------Creating Table------------
    FullName VARCHAR(100) NOT NULL
);

CREATE TABLE SR.employees(
    id INT PRIMARY KEY IDENTITY,                     -------------Creating Second------------
    FullName VARCHAR(100) NOT NULL
);


INSERT INTO                                    ----------------Inserting value into candidates table---------
    SR.candidates(FullName)
VALUES
    ('sam Karan'),            
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');
	                                       select * from  SR.candidates

INSERT INTO                               --------------Inserting value into candidates table------------
    SR.employees(FullName)
VALUES
    ('sam Karan'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');
	                                           select * from  SR.employees

	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making InnerJoin------------
FROM 
    SR.candidates c
    INNER JOIN SR.employees e 
        ON e.FullName = c.FullName;


------------------Left Join----------------

	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making LeftJoin------------
FROM 
    SR.candidates c
    Left JOIN SR.employees e 
        ON e.FullName = c.FullName;

------------------Right Join----------------
	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making RightJoin------------
FROM 
    SR.candidates c
    Right JOIN SR.employees e 
        ON e.FullName = c.FullName;



------------------Full Join----------------
	SELECT  
    c.id candidate_id,
    c.FullName candidate_name,
    e.id employee_id,
    e.FullName employee_name                   -----------Making FullJoin------------
FROM 
    SR.candidates c
    Full JOIN SR.employees e 
        ON e.FullName = c.FullName;