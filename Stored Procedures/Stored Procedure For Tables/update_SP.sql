--------------------------Instructor ---------------------------
create proc instructor_update_sp @ins_id int, @ins_fname nvarchar(50), @ins_lname nvarchar(50), @dept_id int
as 
	begin  
		if @dept_id in (select dept_id from Department)
			begin
					if @ins_id not  in (select insrt_id from Instructor)
					insert into Instructor(fname,lname,dept_id)
					values (@ins_fname, @ins_lname, @dept_id)
					else
					update Instructor
					set fname=@ins_fname, lname=@ins_lname, dept_id=@dept_id
					where insrt_id=@ins_id
		end
		else
			print 'Department does not exist'
	END
GO
instructor_update_sp 5, 'Ayaaa', 'Elhelw',3
Go
------------------------------Instructor Courese--------------------------
create proc instructor_course_update_sp @instructor_id int, @course_id int
as 
	begin  
		if @course_id in (select courses_id from Course) AND @instructor_id IN (SELECT insrt_id FROM Instructor )
			begin
					update Instructor_courses
					set instr_id=@instructor_id, course_id=@course_id
					where instr_id=@instructor_id 
		end
		else
			print 'this Instructor or this course does not exist'
	END
GO
instructor_course_update_sp 1,4
GO
----------------------------------- Courses--------------------------------------------
create  proc course_update_sp @crs_id int, @crs_name nvarchar(50), @crs_duration int 
as
begin
	if @crs_id not in (select courses_id from Course)
		begin
			if @crs_name not in (select course_name from Course)
			insert into course 
			values (@crs_id,@crs_name,@crs_duration)
			else
			print 'Course name already exists'
		end
    else
	begin
		if @crs_name not in (select course_name from Course)
			update Course
			set course_name = @crs_name , duration=@crs_duration
			where courses_id=@crs_id
		else
			update Course
			set duration=@crs_duration
			where courses_id=@crs_id and course_name = @crs_name
		END
END
 GO
 course_update_sp 5,'CSS',40
----------------------------------------Student Courese-------------------
CREATE PROC student_course_update_sp @std_id INT, @crs_id INT, @grade INT
AS
BEGIN
		if @std_id in (select st_id from Student)
			begin
				  if @crs_id in (select courses_id from Course)
					  begin
						  if @std_id not in (select st_id from student_course where course_id = @crs_id) and @crs_id not in (select course_id from student_course where st_id = @std_id)
							  begin
							  insert into student_course
							  values (@std_id,@crs_id,@grade)
							  end
                         else
						 update student_course
						 set grade = @grade
						 where st_id=@std_id and course_id= @crs_id
					  end
				else
				print 'Course does not exist' 
			end
		else
		print 'Student does not exist'
END

GO
student_course_update_sp 8,4,50
-------------------------------- EXAM ---------------------------
CREATE PROCEDURE exam_update @exam_id INT , @exam_date DATE
AS 
BEGIN
	IF @exam_id IN (SELECT @exam_id FROM Exam e )
		BEGIN
			UPDATE Exam
			SET @exam_date =@exam_date
			WHERE exam_id = @exam_id
		END
	ELSE
		BEGIN
			PRINT 'this exam is not exist'
		END
END

GO
exam_update 1,'2022-03-10'
-------------------------------student_exams_Questions-----------------------
CREATE PROCEDURE st_ex_qs_update @st_id INT , @ex_id INT ,@qs_id INT, @grade INT,@answer VARCHAR(10),@is_corrected INT 
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
					UPDATE  student_exams_Questions
					SET grade =@grade , answer = @answer , is_corrected = @is_corrected
					WHERE st_id =@st_id AND exam_id = @ex_id AND qs_id = @qs_id
				END
			ELSE
			BEGIN
				PRINT 'dublicated student_id , exam_id and qs_id'
			END
		END
	ELSE 
		BEGIN
			PRINT 'this student_Exam_question not exist'
		END
END
GO
st_ex_qs_update 5,1,5,50,c,0
-----------------------topic---------------------------
CREATE PROCEDURE topic_update @topic_id INT , @topic_name VARCHAR(50)
AS 
BEGIN
	IF @topic_id IN (SELECT topic_id FROM Topic )
		BEGIN
			UPDATE Topic
			SET topic_name =@topic_name
			WHERE topic_id = @topic_id
		END
	ELSE
		BEGIN
			PRINT 'this topic is not exist'
		END

END

GO
topic_update 5,'HTML'
------------------------------------Questions-----------
CREATE PROCEDURE quetion_update @q_id INT, @question VARCHAR(50), @q_type VARCHAR(10), @grade INT, @answer VARCHAR(3), @c_id INT
AS 
BEGIN
	IF @q_id IN (SELECT q_id FROM Question) AND @c_id IN (SELECT courses_id FROM Course)
		BEGIN
			UPDATE Question 
			SET question = @question, q_type = @q_type, q_grade = @grade, q_answer = @answer 
			WHERE q_id = @q_id AND courses_id = @c_id 
		END
	ELSE
		BEGIN
			PRINT('Selected id not exist, check question id and course id')
		END
END

GO
quetion_update 4,'Identify the scope resolution operator.','choice',2,'b',2
GO
--------------------------- Question_Choices ----------------
CREATE PROCEDURE choice_update @q_id INT, @old_choice VARCHAR(30), @new_choice VARCHAR(30)
AS 
BEGIN
	IF @q_id IN (SELECT q_id FROM Question_choices) AND @old_choice IN (SELECT choices FROM Question_choices)
		BEGIN
			UPDATE Question_choices
			SET choices = @new_choice 
			WHERE choices = @old_choice AND q_id = @q_id 
		END 
	ELSE
		BEGIN
			PRINT('Selected id not exist, check question id and old choice value')
		END
END

GO
choice_update 3, 'object-based', '...'
GO

-------------------------Student---------------------------

CREATE PROC student_update_sp  @st_id INT, @fname VARCHAR(50) , @lname VARCHAR(50) ,@st_gender VARCHAR(3), @st_phone VARCHAR(11),
@st_birthdate DATE , @st_joindate DATE ,@dept_id INT, @city VARCHAR(50),@street VARCHAR(50)
AS
BEGIN
	IF @dept_id IN (SELECT d.dept_id FROM Department d)
		BEGIN
			IF @st_id NOT IN (SELECT s.st_id FROM Student s)
				BEGIN
					INSERT INTO Student
					VALUES (@fname,@lname,@st_gender,@st_phone,@st_birthdate,@st_joindate,@dept_id,@city,@street) 
				END
			ELSE
				BEGIN
					UPDATE Student
					SET fname = @fname, lname=@lname, st_gender=@st_gender, st_phone=@st_phone,st_birthdate=@st_birthdate,
						st_joindate= @st_joindate, dept_id = @dept_id, city=@city, street=@street
					WHERE st_id = @st_id
				END
		END
	ELSE
		BEGIN
			PRINT 'Department id that you enter is not exist'
		END

END

student_update_sp 12,'Zyad','Ali','m','01027219252','1999-03-15','2022-4-10',6,'cairo','giza'

--------------------------------Department---------------------
CREATE PROC department_update_sp  @dept_id INT , @dept_name VARCHAR(50), @dept_manager INT
AS
BEGIN
	IF @dept_id IN (SELECT dept_id FROM Department d)
		BEGIN
			UPDATE Department
			SET dept_manager = @dept_manager,
				dept_name = @dept_name
			WHERE dept_id=@dept_id
		END
	ELSE
		BEGIN
			PRINT 'This Department id is not exist'
		END
END

department_update_sp  5,'test2',3

