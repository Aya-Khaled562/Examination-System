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

choice_delete_by_id 10,50
