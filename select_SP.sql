
--instructor--
CREATE PROC instructor_select_sp
AS
	BEGIN
	SELECT *FROM Instructor 
END

instructor_select_sp

GO

CREATE PROC instructor_select_by_id_sp  @id int
AS
	BEGIN
	SELECT *FROM Instructor 
	WHERE insrt_id = @id
END
instructor_select_by_id_sp 1

GO
----------------------------------------------------------------------------------------------------
--instructor Course --

CREATE PROC instructor_course_select_sp
AS
	BEGIN
	SELECT *FROM Instructor_courses  
END

instructor_course_select_sp

GO

CREATE PROC instructor_select_by_course_id_sp  @course_id int
AS
	BEGIN
	SELECT *FROM Instructor_courses  
	WHERE course_id = @course_id
END

instructor_select_by_course_id_sp 3

GO

CREATE PROC instructor_select_by_instructor_id_sp  @instructor_id int
AS
	BEGIN
	SELECT *FROM Instructor_courses  
	WHERE instr_id = @instructor_id
END

instructor_select_by_instructor_id_sp 1

----------------------------------------------------------------------------------------------------
-- Course --
CREATE PROC coures_select_sp
AS
BEGIN
   SELECT * FROM Course c
   END

coures_select_sp

GO
CREATE PROC coures_select_by_id @id int
AS
	BEGIN
	   SELECT * FROM Course c
	   WHERE c.courses_id = @id
END

coures_select_by_id 2

-----------------------------------------------------------------------------------------------
-- Student Courses --
CREATE PROC std_cs_select_sp
AS
	BEGIN
	SELECT* FROM
	Student_course sc
END
std_cs_select_sp

GO

CREATE PROC std_cs_select_by_id @id int
AS
	BEGIN
	SELECT* FROM
	Student_course sc
	WHERE sc.st_id = @id
END

std_cs_select_by_id 3

GO
-----------------------------------------------------------------------------------

----Mayar---------
CREATE PROCEDURE question_select_by_id @q_id INT 
AS 
BEGIN
	SELECT * FROM Question WHERE q_id=@q_id
END

question_select_by_id 2


CREATE PROCEDURE qChoice_select_by_id @q_id INT
AS 
BEGIN
	SELECT * FROM Question_choices WHERE q_id = @q_id 
END

qChoice_select_by_id 2