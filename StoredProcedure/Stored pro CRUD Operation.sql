use DB_Programming

CREATE PROCEDURE SelectAllCity
AS
SELECT * FROM Employee
GO;
SelectAllCity
------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
create table EmpDetails
(
    EmployeeID int identity(1,1) primary key,
    FirstName varchar(255),
    LastName varchar(255),
    Address varchar(255),
    City varchar(255),
	MobileNo varchar(13),
	Gender varchar(6)     
);
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
------------------------------Create And Insert By StoresProcedure-------------------------------------


create procedure SPEmployee   
(   
    @FirstName varchar(255),
    @LastName varchar(255),
    @Address varchar(255),
    @City varchar(255),
	@MobileNo varchar(13),
	@Gender varchar(6)
)   
as    
Begin    
    Insert into EmpDetails (FirstName,LastName,Address,City,MobileNo,Gender)    
    Values 
			('sai','Kamble','Pune','pune','8567193155','FeMale')
	 
End
SELECT * FROM EmpDetails
EXEC SPEmployee @FirstName = '@FirstName',@LastName = '@LasteName',@Address='@Address',@City ='@City',@MobileNo = '@MobileNo',@Gender = '@Gender'

-----------------------------------------------------------------------------------------------------------
creste procedure GetAllEntries  
as   
Begin   
select
	
    FirstName,
    LastName,
    Address,
    City,
	MobileNo,
	Gender

 from  EmpDetails
End

exec GetAllEntries;
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------------------------------Update Table Using StoredProcedure ------------------------------------------------------

alter procedure UpdateEmployee     
(     
     @FirstName varchar(255),
    --@LastName varchar(255),
    @Address varchar(255),
    @City varchar(255),
	--@MobileNo varchar(13),
	@Gender varchar(6)   
)     
as     
begin     
   Update EmpDetails      
   set 
	   FirstName=@FirstName,     
	   Address=@Address,     
	   City=@City,   
	   Gender=@Gender     
	   where EmployeeID= 4     
End

UpdateEmployee  @FirstName = 'Vikas',@Address='Borivali',@City ='Mumbai',@Gender = 'Male'

SELECT * FROM EmpDetails


---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------Delete Rows Using StoredProcedure---------------------------------------

Create procedure DeleteEmployee
(     
  @EmployeeID int     
)     
as     
begin     
   Delete from EmpDetails where EmployeeID=@EmployeeID

End
DeleteEmployee @EmployeeID=10

SELECT * FROM EmpDetails
