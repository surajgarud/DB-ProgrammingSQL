use DB_Programming

CREATE PROCEDURE SelectAllCity
AS                                                  -----Section 1------
SELECT * FROM Employee
GO;
SelectAllCity                   ---Any keyword Can use--
exec SelectAllCity            ----
------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
alter table EmpDetails
(                                                 -----storedProcedure with parameters----
    EmployeeID int identity(1,1) primary key,
    FirstName  varchar(255),
    LastName varchar(255),
    Address varchar(255),
    City varchar(255),
    MobileNo varchar(13),
	Gender varchar(6),
	Salary money not null
 
);
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
------------------------------Create And Insert By StoresProcedure-------------------------------------


alter procedure SPEmployee   
(   
    @FirstName varchar(255),
    @LastName varchar(255),
    @Address varchar(255),
    @City varchar(255),
	@MobileNo varchar(13),
	@Gender varchar(6),
	@Salary int
)   
as    
Begin    
    Insert into EmpDetails (FirstName,LastName,Address,City,MobileNo,Gender,salary)    
    Values 
			(@FirstName,@LastName,@Address,@City,@MobileNo,@Gender,@Salary) 
	 
End
SELECT * FROM EmpDetails
EXEC SPEmployee @FirstName = '@FirstName',@LastName = '@LasteName',@Address='@Address',@City ='@City',@MobileNo = '@MobileNo',@Gender = '@Gender',@Salary='@Salary'

-----------------------------------------------------------------------------------------------------------
creste procedure GetAllEntries  
as   
Begin                       -----------------------it defines A Block where We execute SQL statement-----------
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
     @salary money   
)     
as     
begin     
   Update EmpDetails      
   set                            -------------Assign Value we use SET------------
	   Salary=@salary  
	   where EmployeeID= 11
End

UpdateEmployee  @salary='39145'

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

select City, COUNT (*) from EmpDetails WHERE Address='Hadapsar' GROUP BY Gender ORDER BY Gender;

------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
Declare
 @FirstName varchar(100)                          ---------------Declare valriables---------
 
 set @FirstName = 'suraj'
 select 
  FirstName,
  LastName,
  City
From EmpDetails where @FirstName= FirstName--,@LastName = LastName
order by LastName

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-------------------------------------section 2(ControlFlowStatement)-------------------------------------------------------------------
BEGIN
    DECLARE @salary INT;

    SELECT 
       @salary='15000'
    FROM                                      ------------------use of if else statement-----------
      EmpDetails

    SELECT  @salary

    IF  @salary > 10000
    BEGIN
        PRINT 'Great! The Salary Is MoreThan 10,000';
    END
    ELSE
    BEGIN
        PRINT 'Salary is Less Than 10,000';
    END
END

SELECT * FROM EmpDetails
-----------------------------------------------------
DECLARE @counter INT=0;
                                   ------------------use Of While statement---------------------
WHILE @counter <= 10
BEGIN
    PRINT @counter;
    SET @counter = @counter+1;
END

------------------------------------------------------
DECLARE @count INT=2;
                                   ------------------use Of While statement with Break---------------------
WHILE @count <= 10
BEGIN
    PRINT @count;
    SET @count = @count+1;
	IF @count >= 4
        BREAK;
END

------------------------------------------------------
DECLARE @coun INT=0;
                                   ------------------use Of While statement with Continue---------------------
WHILE @coun < 5	
BEGIN
    SET @coun = @coun+1;
	IF @coun = 4
        Continue;
		PRINT @coun;
END

---------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------Section 3(Handling Exceptions)-------------------------------------

create PROC divide
(                                     --------------Creating Divide Procedure-----------------
    @a int,
    @b int,                            ------------------variables-----------------
    @c int output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO

DECLARE @s int;                      -----------------------calling Addition Procedure-------------------
exec  divide 7,0,@s output
print @s

drop proc Multiplication

--------------------------------------------------------

DECLARE 
    @ErrorMessage  NVARCHAR(4000), 
    @ErrorSeverity INT, 
    @ErrorState    INT;                   ---------------Raise Error With Try Catch Block--------------------

BEGIN TRY
    RAISERROR('Error occurred in the TRY block.', 17, 1);
END TRY
BEGIN CATCH
    SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;


