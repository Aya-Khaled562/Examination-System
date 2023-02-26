-- Instructor --
CREATE PROCEDURE instructor_delete_sp @Ins_ID varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE insrt_id = @Ins_ID
END

instructor_delete_sp 1
GO

-----------------------------------------------------------------
--Instructor Courses -- 
CREATE PROCEDURE instructor_courses_delete_by_insId_sp @Instructor_Id varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE insrt_id = @Instructor_Id
END

GO

CREATE PROCEDURE instructor_courses_delete_by_crsId_sp @Course_Id varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE @Course_Id = @Course_Id
END

GO
-------------------------------------------------------------------
---------Courese
CREATE PROCEDURE couress_delete_by_courese @coures_id VARCHAR(50)
AS
BEGIN
   DELETE FROM Course WHERE courses_id = @coures_id
END
-----------
--Student Coures

CREATE PROCEDURE st_crs_delete_by_id @st_id INT
AS
BEGIN
   DELETE FROM Student_course WHERE st_id =@st_id
END


CREATE PROCEDURE st_crs_delete_by_cr_id @crs_id INT
AS
BEGIN
   DELETE FROM Student_course WHERE course_id = @crs_id
END

-----Mayar-----
CREATE PROCEDURE question_delete_by_id @q_id INT
AS 
BEGIN 
	IF @q_id IN (SELECT q_id FROM Question)
		BEGIN
			DELETE FROM Question WHERE q_id=@q_id
		END
	ELSE 
		BEGIN
			PRINT('The Id inserted isn't exist')
		END
END 

question_delete_by_id 10

CREATE PROCEDURE choice_delete_by_id @q_id INT, @c_id INT 
AS 
BEGIN
	IF @q_id IN (SELECT q_id FROM Question) AND @c_id IN (SELECT choices Question_choices)
		BEGIN
			DELETE FROM Question_choices WHERE q_id=@q_id AND choices=@c_id
		END
	ELSE
		BEGIN
			PRINT('The Id inserted isn't exist')
		END
END 

<<<<<<< HEAD:delete_SP.sql
choice_delete_by_id 10,50
=======
choice_delete_by_id 10,50 


---------------------------Student-------------------------------
CREATE PROC student_delete_sp @st_id INT
AS
BEGIN
	IF @st_id IN (SELECT s.st_id FROM Student s)
		DELETE FROM Student WHERE st_id = @st_id
	ELSE
		PRINT 'Student id that you enter is not exist'

END

student_delete_sp 12

----------------------------Department--------------------------
CREATE PROC department_delete_sp  @dept_id INT
AS
BEGIN
	IF @dept_id IN (SELECT d.dept_id FROM Department d)
		DELETE FROM Department WHERE dept_id = @dept_id
	ELSE
		PRINT 'Department id that you enter is not exist'
END

department_delete_sp 9

>>>>>>> 2aae800c6a062ec8f60bff445117ffefd4aaa8c3:Stored Procedures/Stored Procedure For Tables/delete_SP.sql
