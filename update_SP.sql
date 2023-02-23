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
	end