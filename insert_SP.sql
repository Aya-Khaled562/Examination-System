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