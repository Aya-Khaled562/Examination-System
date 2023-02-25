--Instructor --
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
instructor_update_sp 7, 'Ayaaa', 'Elhelw',1
Go
-------------------------------------------------------------------------------
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
instructor_course_update_sp 1,2
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
----------------------------------------------------- EXAM ---------------------------
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
quetion_update 7,'Identify the scope resolution operator.','choice',2,'b',2
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
choice_update 7, ':', '...'
GO
