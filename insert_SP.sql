---- instructor 
create procedure instructor_insert_sp  @ins_fname nvarchar(50),@ins_lname nvarchar(50),@dept_id int
as 
begin
	if @dept_id in (select  dept_id from Department)
		 begin
		
				insert into Instructor (insrt_id,fname,dept_id)
				values((select max(insrt_id)+1 from Instructor),@ins_fname,@ins_lname,@dept_id)
		end
			
	 
	else 
		begin
		print 'department_id you try to enter is not exist'
	end
end;