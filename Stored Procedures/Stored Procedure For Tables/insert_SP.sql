-------------------------- instructor --------------------
CREATE PROCEDURE instructor_insert_sp  @ins_fname NVARCHAR(50),@ins_lname NVARCHAR(50),@dept_id INT
AS 
BEGIN
	BEGIN TRY
		INSERT INTO Instructor (fname,lname,dept_id)
		VALUES(@ins_fname,@ins_lname,@dept_id)
	END TRY
	BEGIN CATCH 
		PRINT 'department_id you try to enter is not exist'
	END CATCH
END

GO
instructor_insert_sp 'Aya','Ebrahim',2

GO
--------------------------------------------------------------------
-- Instructor Courses -- 
create procedure instructor_course_insert_sp @instructor_id INT, @course_id int
as 
begin
		BEGIN TRY
			insert into Instructor_courses (instr_id,course_id)
			values(@instructor_id , @course_id)
		END TRY
		BEGIN CATCH 
			print 'Instructor_Id or course_Id you try to enter is not exist'
		END CATCH
end

GO
instructor_course_insert_sp 2,3

GO
---------------------------------------
--Courses
CREATE PROC insert_courese_sp  @courses_name VARCHAR(50), @courser_durtion INT ,@topic_id INT
AS
BEGIN
		BEGIN TRY
          INSERT INTO Course
          VALUES  (@courses_name,@courser_durtion,@topic_id)
		END TRY
		BEGIN CATCH 
			PRINT ' topic you try to enter is not exist'
		END CATCH
END

GO
insert_courese_sp 'IOS',40,3
Go
---------------------------------
---Student Courese
CREATE PROC student_Course_insert_sp @course_id INT , @st_id INT ,@grade INT
AS
BEGIN
	BEGIN TRY
		INSERT INTO Student_course
		VALUES(@course_id,@st_id,@grade)
	END TRY
		BEGIN CATCH 
			   PRINT 'course or student you try to enter is not exist'
		END CATCH
END

GO
student_Course_insert_sp 3,2,50
GO

-----------------exam-------------

CREATE PROCEDURE exam_insert @ex_date DATE
AS 
BEGIN
	BEGIN TRY
		INSERT INTO Exam(ex_date) 
		VALUES (@ex_date)
	END TRY
	BEGIN CATCH 
			PRINT 'Please check your data'
	END CATCH
END

GO
EXECUTE exam_insert '2023-2-11'
GO

-------------student_exams_Questions -----------------
CREATE PROCEDURE st_ex_qs_insert @st_id INT , @ex_id INT ,@qs_id INT, @grade INT,@answer VARCHAR(10),@is_corrected INT 
AS
BEGIN
	IF 
		(@st_id IN (SELECT st_id FROM Student)) 
		AND 
		(@ex_id IN (SELECT exam_id FROM Exam ))
		AND 
		(@qs_id IN (SELECT q_id FROM Question ))
		BEGIN
			IF @st_id IN (SELECT st_id FROM  Student_exams_questions 
			WHERE st_id =@st_id AND exam_id = @ex_id AND qs_id = @qs_id )
			BEGIN
				PRINT 'dublicatec student_id , exam_id and qs_id'
			END
		ELSE
		BEGIN
			BEGIN TRY
				INSERT INTO student_exams_Questions(st_id,exam_id,qs_id,grade,answer,is_corrected)
				VALUES (@st_id,@ex_id,@qs_id,@grade,@answer,@is_corrected)
			END TRY
			BEGIN CATCH 
					PRINT 'Please check your data'
			END CATCH
		END
		END
	ELSE 
		BEGIN
			PRINT 'this student_Exam_question not exist'
		END
END

GO
EXECUTE st_ex_qs_insert 3 ,1 ,7 ,2, 'text',1

GO
--------------Topic  -------------------

CREATE PROCEDURE topic_insert @topic_name VARCHAR(50)
AS
BEGIN
	INSERT INTO topic (topic_name)
	VALUES(@topic_name)
END

EXECUTE topic_insert 'frontend'

GO
-------------------------------- Questions --------------------
CREATE PROCEDURE insert_question @question VARCHAR(50), @q_type VARCHAR(10), @grade INT, @answer VARCHAR(3), @c_id INT 
AS 
BEGIN
	IF @c_id IN (SELECT courses_id FROM Course)
		BEGIN
			BEGIN TRY
				INSERT INTO Question (question,q_type,q_grade,q_answer,courses_id)
				VALUES (@question,@q_type,@grade,@answer,@c_id)
			END TRY
			BEGIN CATCH 
					PRINT 'Please check your data'
			END CATCH
		END
	ELSE 
		BEGIN 
			PRINT 'course  you tried to enter is not exist'
		END
END
GO
insert_question 'Identify the scope resolution operator.','choice',2,'b',2
GO

---------------------------Question Choices---------------
CREATE PROCEDURE insert_choices @q_id INT, @choice VARCHAR(30) ,@choiceNum NVARCHAR(10)
AS 
BEGIN
	IF @q_id IN (SELECT q_id FROM Question)
		BEGIN
			BEGIN TRY
				INSERT INTO Question_choices (q_id,choices,choice_num)
				VALUES (@q_id, @choice, @choiceNum)
			END TRY
			BEGIN CATCH 
					PRINT 'Please check your data'
			END CATCH
		END
	ELSE 
		BEGIN 
			PRINT 'Question_id you tried to enter is not exist'
		END
END
insert_choices 2,'test', d
GO
---------------------------Student--------------------------
CREATE PROC student_insert_sp @fname VARCHAR(50) , @lname VARCHAR(50) ,@st_gender VARCHAR(3), @st_phone VARCHAR(11),
@st_birthdate DATE , @st_joindate DATE ,@dept_id INT, @city VARCHAR(50),@street VARCHAR(50)
AS 
BEGIN
	IF @dept_id  IN (SELECT dept_id FROM Department d)
		BEGIN
			BEGIN TRY
				INSERT INTO Student
				VALUES (@fname,@lname,@st_gender,@st_phone,@st_birthdate,@st_joindate,@dept_id,@city,@street)
			END TRY
			BEGIN CATCH 
					PRINT 'Please check your data'
			END CATCH
			
		END
	ELSE
		BEGIN
			PRINT 'department you try to enter is not exist'
		END
END

GO
student_insert_sp  'Zyad','Ali','m','01027219252','1999-03-10','2022-4-10',4,'cairo','giza'

----------------------------Department-------------------------
CREATE PROC department_insert_sp @dept_name VARCHAR(50),@dept_manager INT
AS
BEGIN
	IF @dept_manager IN (SELECT insrt_id FROM Instructor i)
		BEGIN
			BEGIN TRY
				INSERT INTO Department
				VALUES (@dept_manager , @dept_name)
			END TRY
			BEGIN CATCH 
					PRINT 'Please check your data'
			END CATCH
		END
	ELSE
		BEGIN
			PRINT 'Department Manager id that you try to enter is not exist '
		END
END
GO
department_insert_sp 'test',2

