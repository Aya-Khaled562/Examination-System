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
-------------------------------------------------------------------------------
-----Courses
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

-------------------
----Student Courese
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
end