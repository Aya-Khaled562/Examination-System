
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

<<<<<<< HEAD:select_SP.sql
qChoice_select_by_id 2
=======
GO

qChoice_select_by_id 3


----------------------------Student----------------------------
CREATE PROC student_select_sp
AS
BEGIN
	SELECT * FROM Student s
END

student_select_sp

CREATE PROC student_select_by_id_sp  @st_id INT
AS
BEGIN
	SELECT * FROM Student s WHERE s.st_id = @st_id
END

student_select_by_id_sp 5


----------------------------Department---------------------------
CREATE PROC department_select_sp
AS
BEGIN
	SELECT * FROM Department d
END

department_select_sp

CREATE PROC department_select_by_id_sp @dept_id INT
AS
BEGIN
	SELECT * FROM Department d WHERE d.dept_id = @dept_id
END

department_select_by_id_sp 3

