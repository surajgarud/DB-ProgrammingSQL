select * from Marks

---=============================================================================================-------------------
---------=========================================================================================-----------------
---------------------------------------------Auto Commit Transction------------------------------------------------
/* aoto commit is by default commit so Trancount shows 0 */

insert into Marks (Marks_Science,Marks_Math,Marks_English)
values
(
  60,63,96                                        
)
delete from Marks where Marks_Science = 50
select @@TRANCOUNT

---=============================================================================================-------------------
---------=========================================================================================-----------------
---------------------------------------------Implicit Transction------------------------------------------------

set implicit_transactions on
insert into Marks (Marks_Science,Marks_Math,Marks_English)      ---Implicit start from this line---
values
(
  70,93,86                                        
)
update marks set Marks_Science = 90 where Marks_Math=91
delete from Marks where Marks_Science = 60
select @@TRANCOUNT as openTransaction
commit                                                  ------If rollback use then Any one condition False It Will Not Execute----

select @@TRANCOUNT as openTransaction

---=============================================================================================-------------------
---------=========================================================================================-----------------
---------------------------------------------Explicit Transction------------------------------------------------
begin transaction                                                    ---explicit start from this line---
insert into Marks (Marks_Science,Marks_Math,Marks_English)     
values
(
  70,93,86                                        
)
update marks set Marks_Science = 90 where Marks_Math=91
delete from Marks where Marks_Science = 60
select @@TRANCOUNT as openTransaction
commit                                                  ------If rollback use then Any one condition False It Will Not Execute----

select @@TRANCOUNT as openTransaction

---=============================================================================================-------------------
---------=========================================================================================-----------------
---------------------------------------------savepoint Transction------------------------------------------------

/* We can use this Transaction for Partially 
   Commit And Rollback purpose
*/
select * from Marks
begin transaction                                                    ---explicit start from this line---
insert into Marks (Marks_Science,Marks_Math,Marks_English)     
	values
	(
	  80,93,86                                        
	)
save transaction deletepoint
	delete from Marks where Marks_Science = 70                --here using Commit For Insert Transaction And
	delete from Marks where Marks_Science = 90                  --RollBack for Delete Transaction-
	delete from Marks where Marks_Science = 70
	Rollback transaction deletepoint
Commit
/* By using This Partial transction We Can Insert Into Table
   Bcz We Made Commit For Insert But For Delete
   We Make RollBack Statemetn So delete Statement Will Not Affect Our Table
   Bcz We ARe Making It RollBAck
*/