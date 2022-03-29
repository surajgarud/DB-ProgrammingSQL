select * from EmpDetails											 ---Get All Data From Table------------

select * from EmpDetails where EmployeeID= 11

/* to create indexing use this query*/
create clustered index EmpIndex
on EmpDetails (EmployeeId asc)

--=================================================================================-------------------------
--======================================Rename Index=================================
EXEC sp_rename                       
        N'EmpDetails.[PK__EmpDetai__7AD04FF1D97D5B0C]',  --table Name.Old Index Name-----
        N'EmpIndex' ,										----New index Name----
        N'INDEX';

--===============================================================================================
------------------------------To Enable/Disable Index------------------------------
ALTER INDEX index_name                    ---------------give IndexName Which Want to disable----
ON table_name								------TableName For Which table Index--------
DISABLE/REBUILD;								----use required Function key DISABLE and REBUILD for enable--

--===============================================================================================
------------------------------To Drop Index------------------------------
DROP INDEX index_name          ------Name of index Want to drop----
ON table_name;					--on which table index ---
