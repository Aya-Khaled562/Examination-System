
CREATE PROC instr_crs_select
AS
BEGIN
SELECT *FROM Instructor 
END

instr_crs_select

CREATE PROC coures_select_sp
AS
BEGIN
   SELECT * FROM Course c
   END

coures_select_sp


CREATE PROC std_cs_select_sp
AS
BEGIN
SELECT* FROM
Student_course sc
END

std_cs_select_sp


CREATE PROC coures_select @id int
AS
BEGIN
   SELECT * FROM Course c
   WHERE c.courses_id = @id
   END

coures_select 2

CREATE PROC std_cs_select @id int
AS
BEGIN
SELECT* FROM
Student_course sc
WHERE sc.st_id = @id
END

std_cs_select 3