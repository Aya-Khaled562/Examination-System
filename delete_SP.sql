CREATE PROCEDURE instructor_delete_sp @Ins_ID varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE insrt_id = @Ins_ID
END