-- Instructor --
CREATE PROCEDURE instructor_delete_sp @Ins_ID varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE insrt_id = @Ins_ID
END

instructor_delete_sp 1
GO

-----------------------------------------------------------------
--Instructor Courses -- 
CREATE PROCEDURE instructor_courses_delete_by_insId_sp @Instructor_Id varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE insrt_id = @Instructor_Id
END

GO

CREATE PROCEDURE instructor_courses_delete_by_crsId_sp @Course_Id varchar(50)
AS
	BEGIN
	DELETE FROM Instructor WHERE @Course_Id = @Course_Id
END

GO
-------------------------------------------------------------------