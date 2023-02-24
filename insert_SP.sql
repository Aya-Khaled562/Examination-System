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