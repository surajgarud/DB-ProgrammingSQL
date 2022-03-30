--===========================================================================================------
-------------------------------------------System Define Function-----------------------
use DB_Programming
select getdate()
select APP_NAME()
select CURRENT_USER

Declare @name varchar(255)
set @name='Garud'
select coalesce(@name,'SURAJ')            -----If we provide Value For Name then It Will Take That Value Of It Will Take Default Value--

-------=========================================================================------------------
-----------------------------------------Scalar Function----------------------------------------
create function AddDigit(@A INT, @B INT)
returns int
as
begin
declare @result int
set @result=@A + @B
return @result
end

/*  To call this function have to use SELECT query
    With the SCHEMA And Pass The Parameters.
*/
select dbo.AddDigit(6,65)              


-------=========================================================================------------------
-----------------------------------------Table Function---------------------------------------- 
/*	we cant use Begin and End In this FUnction
*/
select * from Mark
create function GetStudentList(@Marks_Science int)
returns Table                                        --Here Returns Is Table So it Makes TAble Function--
as
return select * from Mark where Marks_Science > @Marks_Science
 
 /*  To call this Table function 
	Use this Select Query
*/
 select * from dbo.GetStudentList(59)

 -------=========================================================================------------------
-----------------------------------------Multi STatement Table Valued Function---------------------------------------- 


select * from EmpDetails
select * from Employee
CREATE FUNCTION udfContacts()
    RETURNS @Table TABLE (
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
		Address varchar(100),
		City varchar(100),
		MobileNo VARCHAR(25),
		Gender varchar(6),
		contact_type VARCHAR(20)
    )
AS
BEGIN
    INSERT INTO @Table
    SELECT 
         FirstName,
        LastName ,
		Address,
		City,
        MobileNo ,
		Gender,
        'Student'
    FROM
        Employee;

    INSERT INTO @Table
    SELECT 
       FirstName,
        LastName ,
		Address,
		City,
        MobileNo ,
		Gender,
        'Marks'
    FROM
        EmpDetails;
    RETURN;
END;

/* To execute This Function Use this Query */ 
SELECT 
    * 
FROM
    udfContacts();

	/*	To drop Function Use This Query
	*/	


	DROP FUNCTION IF EXISTS udfContacts;
