---- instructor --
create procedure instructor_insert_sp  @ins_fname nvarchar(50),@ins_lname nvarchar(50),@dept_id int
as 
begin
	if @dept_id in (select  dept_id from Department)
		 begin
		
				insert into Instructor (fname,lname,dept_id)
				values(@ins_fname,@ins_lname,@dept_id)
		end
	else 
		begin
		print 'department_id you try to enter is not exist'
	end
end;

GO
instructor_insert_sp 'Aya','Ebrahim',2

GO
--------------------------------------------------------------------
-- Instructor Courses -- 
create procedure instructor_course_insert_sp @instructor_id INT, @course_id int
as 
begin
	if @course_id in (select courses_id from Course ) AND @instructor_id IN (SELECT insrt_id  FROM Instructor )
		 begin
				insert into Instructor_courses (instr_id,course_id)
				values(@instructor_id , @course_id)
		end
	else 
		begin
		print 'Instructor_Id or course_Id you try to enter is not exist'
	end
end;

GO
instructor_course_insert_sp 2,3

GO
---------------------------------------
--Courses
CREATE PROC insert_courese_sp   @courses_name VARCHAR(50), @courser_durtion INT ,@topic_id INT
AS
BEGIN
IF @topic_id IN (SELECT t.topic_id FROM Topic t)
  BEGIN
          INSERT INTO Course
          VALUES  (@courses_name,@courser_durtion,@topic_id)
	 END
ELSE 
	BEGIN
	 print ' course you try to enter is not exist'
	 END
END

insert_courese_sp 'IOS',40,3

---------------------------------
---Student Courese
CREATE PROC st_insert_pro @courese_id INT , @st_id INT ,@grade INT
AS
BEGIN
IF @courese_id IN (SELECT c.courses_id FROM Course c) AND @st_id IN (SELECT s.st_id FROM Student s)
  BEGIN
    INSERT INTO Student_course
	VALUES(@courese_id,@st_id,@grade)
  END
ELSE
   BEGIN
   PRINT ' Student Coures you try to enter is not exist'
   END
END

st_insert_pro 3,3,50

---------- Mayar -----------
CREATE PROCEDURE insert_question @question VARCHAR(50), @q_type VARCHAR(10), @grade INT, @answer VARCHAR(3), @c_id INT 
AS 
BEGIN
	IF @c_id IN (SELECT courses_id FROM Course)
		BEGIN
			INSERT INTO Question (question,q_type,q_grade,q_answer,courses_id)
			VALUES (@question,@q_type,@grade,@answer,@c_id)
		END
	ELSE 
		BEGIN 
			PRINT 'course_id you tried to enter is not exist'
		END
END
insert_question 'Identify the scope resolution operator.','choice',2,'b',2

CREATE PROCEDURE insert_choices @q_id INT, @choice VARCHAR(30) 
AS 
BEGIN
	IF @q_id IN (SELECT q_id FROM Question)
		BEGIN
			INSERT INTO Question_choices (q_id,choices)
			VALUES (@q_id, @choice)
		END
	ELSE 
		BEGIN 
			PRINT 'Question_id you tried to enter is not exist'
		END
END
insert_choices 7, ':'
insert_choices 7, '::'
insert_choices 7, '?:'
insert_choices 7, 'None'


<<<<<<< HEAD:insert_SP.sql
=======
GO


---------------------------Student--------------------------
CREATE PROC student_insert_sp @fname VARCHAR(50) , @lname VARCHAR(50) ,@st_gender VARCHAR(3), @st_phone VARCHAR(11),
@st_birthdate DATE , @st_joindate DATE ,@dept_id INT, @city VARCHAR(50),@street VARCHAR(50)
AS 
BEGIN
	IF @dept_id  IN (SELECT dept_id FROM Department d)
		BEGIN
			INSERT INTO Student
			VALUES (@fname,@lname,@st_gender,@st_phone,@st_birthdate,@st_joindate,@dept_id,@city,@street)
		END
	ELSE
		BEGIN
			PRINT 'department_id you try to enter is not exist'
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
			INSERT INTO Department
			VALUES (@dept_manager , @dept_name)
		END
	ELSE
		BEGIN
			PRINT 'Department_manager id that you try to enter is not exist '
		END
END
GO
department_insert_sp 'test',2

>>>>>>> 2aae800c6a062ec8f60bff445117ffefd4aaa8c3:Stored Procedures/Stored Procedure For Tables/insert_SP.sql
