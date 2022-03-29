use DB_Programming
select * from EmpDetails

--======================================================================================================----
--========================Creating View Table For Single Table======================================

Create view EmpView ;                            -----------Creating View Table----
as
select * from EmpDetails                    --------Passing Sql Command-----------

Select * From EmpView                     ----------Fetching Table Using View----------

                         --If Want to Select Only A particular Column From Table Then use Alter View--
alter view EmpView
as 
Select * From EmpDetails 
Select * From EmpView
select * from Employee
 
---================================================================================================-----------
---=========================== View For MultiTable ===============================================

Create view MultiTableView;           ----------creating VieW TO join TAbles---------
as
select em.EmployeeID,em.FirstName,em.LastName,em.city,ed.salary from Employee em
join EmpDetails ed                              -----------ed is alias for EmpDetails Table-----
on em.EmployeeID=ed.EmployeeID                  -----Join Table On What Basis is mention here -------

select * from MultiTableView

--------------===========================================================================-------------------
----------=====================Update View table=======================================----------
/* If We added Some column in Table then 
it will Not show in ViewTable We HavE To Update The View Table
so For That */


alter table EmpDetails                         ------------------Here i added New Coumn in table-------
add RollNo int
select * from EmpView                           -------By esecuting this view Table New Column Is nOt shown there---

--update EmpDetails set RollNo=11 where EmployeeID=11

exec sp_refreshview  EmpView                      -- to see newly added column Use this command--


       /* we can provide Row And Column Lavel Security to database*/

--=============================================================================================================
            --========================Row Lavel Security========================

create view RowSecurity
as
select * from EmpDetails where salary>20000	
Select * From RowSecurity
	

                                  /*Same for Column lavel View*/	


--==========================================================================================================
--==========================================================================================================
--==========================================================================================================
-----------------------------------------SQL Cursors -----------------------------------------------------
create Table StudentMark
( 
   RollNo int Not null unique,
   FirstName varchar(255),
   LastName varchar(255),
   Marks_Science int,
   Marks_Math int,
   Marks_English int,
   Marks_Marathi int, 
   Marks_Hindi int
)
select * from StudentMark

Insert into StudentMark values
( '1','VIKAS','RAUT','65','78','60','76','70'),
( '2','SURAJ','GARUD','71','67','55','76','71'),
( '3','AJAY','MANE','65','78','81','69','77'),
( '4','UDAY','LANDGE','81','58','60','86','70'),
( '5','ANIL','TIDKE','40','50','59','56','60'),
( '6','SHILPA','KALE','71','78','60','76','70'),
('7','GAURI','SAKHARE','88','78','81','96','70')


declare		
   @RollNo int ,
   @FirstName varchar(255),
   @LastName varchar(255),
   @Marks_Science int,
   @Marks_Math int,
   @Marks_English int,
   @Marks_Marathi int,
   @Marks_Hindi int
declare                                              -------------Declare local variables------------
@TotalMarks int,
@percentage int


declare sCurser cursor for select RollNo,FirstName,LastName,Marks_Science,Marks_Math,Marks_English,Marks_Marathi,Marks_Hindi
from StudentMark

open sCurser                                --------------opening cursor-----------

fetch next from sCurser into @RollNo,@FirstName,@LastName,@Marks_Science,@Marks_Math,@Marks_English,@Marks_Marathi,@Marks_Hindi
print '*******************************************'
while @@FETCH_STATUS=0
begin 
	print concat('RollNo : ',@RollNo)
	print concat('FirstName : ',@FirstName)
	print concat('LastName : ',@LastName)
	print concat('Science : ',@Marks_Science)
	print concat('Math : ',@Marks_Math)
	print concat('English : ',@Marks_English)
	print concat('Marathi : ',@Marks_Marathi)
	print concat('Hindi : ',@Marks_Hindi)

	set @TotalMarks=@Marks_Science + @Marks_Math + @Marks_English + @Marks_Marathi + @Marks_Hindi;
	print concat('TotalMarks: ',@TotalMarks)
	set @percentage=@TotalMarks/5

	print concat('Percentage: ',@percentage)
	print '**************************************************'
    fetch next from sCurser into @RollNo,@FirstName,@LastName,@Marks_Science,@Marks_Math,@Marks_English,@Marks_Marathi,@Marks_Hindi
end

close sCurser  
deallocate sCurser



