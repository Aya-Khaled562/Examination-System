-- Instructor --
CREATE PROCEDURE instructor_delete_sp @Ins_ID varchar(50)
AS
	BEGIN
		BEGIN TRY
			DELETE FROM Instructor WHERE insrt_id = @Ins_ID
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this instructor'
		END CATCH
END

instructor_delete_sp 7
GO

-----------------------------------------------------------------
--Instructor Courses -- 
CREATE PROCEDURE instructor_courses_delete_by_insId_sp @Instructor_Id varchar(50)
AS
	BEGIN
		BEGIN TRY
			DELETE FROM Instructor_courses WHERE instr_id = @Instructor_Id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this instructor course'
		END CATCH
END

GO
instructor_courses_delete_by_insId_sp 7
CREATE PROCEDURE instructor_courses_delete_by_crsId_sp @Course_Id varchar(50)
AS
	BEGIN
		BEGIN TRY
			DELETE FROM Instructor_courses WHERE @Course_Id=course_Id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this instructor course'
		END CATCH
END

GO
instructor_courses_delete_by_crsId_sp 5
-------------------------------------------------------------------
---------Courese
CREATE PROCEDURE couress_delete_by_courese @coures_id VARCHAR(50)
AS
	BEGIN
		BEGIN TRY
			DELETE FROM Course WHERE courses_id = @coures_id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this course'
		END CATCH
END

couress_delete_by_courese 3
--Student Coures-----------

CREATE PROCEDURE st_crs_delete_by_id @st_id INT
AS
	BEGIN
		BEGIN TRY
			DELETE FROM Student_course WHERE st_id =@st_id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this student course'
		END CATCH
	END

st_crs_delete_by_id 7

CREATE PROCEDURE st_crs_delete_by_cr_id @crs_id INT
AS
	BEGIN
		BEGIN TRY
			DELETE FROM Student_course WHERE course_id = @crs_id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this student course'
		END CATCH
	END

st_crs_delete_by_cr_id 2

-----------------------Exam ---------
CREATE PROCEDURE delete_exam_by_id @exam_id INT
AS 
	BEGIN 
		BEGIN TRY
			DELETE FROM Exam WHERE exam_id = @exam_id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this exam'
		END CATCH
	END
EXECUTE delete_exam_by_id 1

-------------student_exams_Questions -----------------

CREATE PROCEDURE delete_student_exams_Questions_by_id @st_id INT , @exam_id INT , @qs_id INT
AS
	BEGIN
		BEGIN TRY
			DELETE FROM student_exams_Questions WHERE st_id =@st_id AND exam_id = @exam_id AND qs_id =@qs_id 
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this student exam'
		END CATCH
	END

EXECUTE delete_student_exams_Questions_by_id 5, 1,3

--------------Topic  -------------------
CREATE PROCEDURE delete_topic_by_id @topic_id INT
AS 
	BEGIN
		BEGIN TRY
			DELETE FROM Topic WHERE topic_id = @topic_id
		END TRY
		BEGIN CATCH
			PRINT 'You cannot delete this topic'
		END CATCH
	END

EXECUTE delete_topic_by_id 1




--------------------Question -----------------

CREATE PROCEDURE question_delete_by_id @q_id INT
AS 
BEGIN 
	BEGIN TRY
			DELETE FROM Question WHERE q_id=@q_id
	END TRY
	BEGIN CATCH
		PRINT 'You cannot delete this Question'
	END CATCH
END

question_delete_by_id 5

----------------- Question Choices-----------------
CREATE PROCEDURE choice_delete_by_id @q_id INT, @c_id INT 
AS 
BEGIN
	BEGIN TRY
			DELETE FROM Question_choices WHERE q_id=@q_id AND choices=@c_id
	END TRY
	BEGIN CATCH
		PRINT 'You cannot delete this Question Choice'
	END CATCH
END

choice_delete_by_id 3,2


---------------------------Student-------------------------------
CREATE PROC student_delete_sp @st_id INT
AS
BEGIN
	BEGIN TRY
		DELETE FROM Student WHERE st_id = @st_id
	END TRY
	BEGIN CATCH
		PRINT 'You cannot delete this student'
	END CATCH

END

student_delete_sp 5

----------------------------Department--------------------------
CREATE PROC department_delete_sp  @dept_id INT
AS
BEGIN
	BEGIN TRY
		DELETE FROM Department WHERE dept_id = @dept_id
	END TRY
	BEGIN CATCH
		PRINT 'You cannot delete this Deprtment'
	END CATCH
END

department_delete_sp 3