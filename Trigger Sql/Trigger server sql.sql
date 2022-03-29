use DB_Programming
select * from Marks
create Table Marks
( 
   Marks_Science int,
   Marks_Math int,
   Marks_English int
)
/*First create trigger for insert*/

alter trigger MarkTrigger on Marks
after insert                                     -------------use for or after any both are same---------
as
declare @Marks_science int
declare @Marks_Math int                             -------------Declaring the variable------
declare @Marks_English int

select @Marks_science=Marks_science from inserted           ----------use for insert into table-------
select @Marks_Math=Marks_Math from inserted
select @Marks_English=Marks_English from inserted

if @Marks_science < 60
begin
print 'Student Marks Must be Greater than 60 in Science'
rollback
end
if @Marks_Math < 60
begin
print 'Student Marks Must be Greater than 60 in Math'
rollback
end
if @Marks_English < 60
begin
print 'Student Marks Must be Greater than 60 in English'
rollback
end
else
begin
print 'Student Enrollment Successfull'
end

select * from Marks

insert into Marks(Marks_science,Marks_Math,Marks_English)
values(50,91,69)

------------------------------=======================================-------------------------------------
----------------=============trigger for delete row=====================-----------------------------------

create Table Mark
( 
   Marks_Science int,
   Marks_Math int,
   Marks_English int
)
alter trigger DeleteTrigger on Marks
for delete
as
declare @Marks_science int
declare @Marks_Math int                             -------------Declaring the variable------
declare @Marks_English int

select @Marks_science=Marks_science from deleted           ----------use for insert into table-------
select @Marks_Math=Marks_Math from deleted
select @Marks_English=Marks_English from deleted

insert into mark(Marks_science,Marks_Math,Marks_English)       -------creating new table and inserted into table----  
values(@Marks_science,@Marks_Math,@Marks_English)
print 'Students Mark inserted Successfull'



select * from Marks
select * from mark

delete from Marks where Marks_science=70

---======================================================================================================================
--=================================================================================================================
--===================================   DDL TRIGGERS  ============================================================
use Address_Book_Service

create table demotrig
(                                                              ---------------creating table for DDL trigger-----
Name varchar (255)
)

                              ---Creating trigger to restrict a creating new table in database---

use Address_Book_Service                                      
go
create trigger TrggForTable                               --create/Alter trigger {Trigger Name}
ON database                                                 ------On where Either Database or Server(server Means all DB)--
for Create_Table                                              --for what Event ie Create_Table can add multiple event like Alter Drop--
as
begin
print 'you cannot create table in this database'
rollback                                                      -----To Cancel Command---
end
--=================================
create table demotrig1
(                                                              
Name varchar (255)
)
 

 -----------------------===========================================================------------------------------------
 ---------------------------=======================================================----------------------------------
 --------------------------------     DDL EVENT GROUP   -------------------------------

 /*Instead Of Creating New Trigger for All Events
 we can use their predefined Groups to avoid Multiple triggers
 For Table We Have (DDL_TABLE_EVENTS)
 FOR Procedure We have (DDL_PROCEDURE_EVENTS)
 FORFunction We have (DDL_FUNCTIONS_EVENTS)
 */

 use Address_Book_Service
 go
 create trigger TriggTableUsingEvents
 on Database
 for DDL_TABLE_EVENTS                                    --use of events to Create alter and Drop of Table--
 as
 begin
 print 'Use of Table Events'
 rollback
 end

 select * from Address_Book_Table                        ---------checking events----
 alter table Address_Book_Table Drop column type

--==========================================================================================================---------
--==========================================================================================================----
----------------------------------------Server Lavel trigger------------------------------------------------------

/* use of trigger on server lavel so it will work on all database you have
using events it will work on all DB*/


create trigger ServerTrig
on all server                     
for DDL_TABLE_EVENTS
as
begin
print'Cannot create table as Use of events In server Lavel'
rollback
end


--================================================================================================================
--===============================================================================================================
---------------------------------------------Audit Trigger------------------------------------------------------

/* First Created A table With Defined Parameters */

use DB_Programming
go
create table AuditTable
(
 DatabaseName varchar(255),
 TableName varchar(255),
 EventType varchar(255),
 LoginName varchar(255),
 SQLCommand varchar(255),
 AuditDateTime dateTime
)

               /* Now Creating Audit Trigger*/

alter trigger AuditTriggerEvent
on All server                                      --on all server bcz to check which database get updated by which user--
for DDL_TABLE_EVENTS
as
begin
declare @EventData xml                             --declaring localVariable in @ and its type is XML--
select @EventData=EVENTDATA()                      ------using PreDefined function of SQL ie EVENTDATA--
insert into DB_Programming.dbo.AuditTable (DatabaseName,TableName,EventType,LoginName,SQLCommand,AuditDateTime)
values 
(
  @EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(250)'),
  @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(250)'),
  @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(250)'),
  @EventData.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(250)'),
  @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(250)'),
  GetDate()
)
End
use [New Database]
go
create table ATable
(
 name varchar(200),
 lastname varchar(200)
)