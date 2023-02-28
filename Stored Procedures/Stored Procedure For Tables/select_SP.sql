
--instructor--
CREATE PROC instructor_select_sp
AS
	BEGIN
	SELECT *FROM Instructor 
END

instructor_select_sp

GO

CREATE PROC instructor_select_by_id_sp  @id int
AS
	BEGIN
	SELECT *FROM Instructor 
	WHERE insrt_id = @id
END
instructor_select_by_id_sp 1

GO
----------------------------------------------------------------------------------------------------
--instructor Course --

CREATE PROC instructor_course_select_sp
AS
	BEGIN
	SELECT *FROM Instructor_courses  
END

instructor_course_select_sp

GO

CREATE PROC instructor_select_by_course_id_sp  @course_id int
AS
	BEGIN
	SELECT *FROM Instructor_courses  
	WHERE course_id = @course_id
END

instructor_select_by_course_id_sp 3

GO

CREATE PROC instructor_select_by_instructor_id_sp  @instructor_id int
AS
	BEGIN
	SELECT *FROM Instructor_courses  
	WHERE instr_id = @instructor_id
END

instructor_select_by_instructor_id_sp 1

----------------------------------------------------------------------------------------------------
-- Course --
CREATE PROC coures_select_sp
AS
BEGIN
   SELECT * FROM Course c
   END

coures_select_sp

GO
CREATE PROC coures_select_by_id @id int
AS
	BEGIN
	   SELECT * FROM Course c
	   WHERE c.courses_id = @id
END

coures_select_by_id 2

-----------------------------------------------------------------------------------------------
-- Student Courses --
CREATE PROC std_cs_select_sp
AS
	BEGIN
	SELECT* FROM
	Student_course sc
END
std_cs_select_sp

GO

CREATE PROC std_cs_select_by_id @id int
AS
	BEGIN
	SELECT* FROM
	Student_course sc
	WHERE sc.st_id = @id
END

std_cs_select_by_id 3

GO
----------------------- Exam --------------------
CREATE PROCEDURE exam_select_all
AS
 BEGIN 
	SELECT * FROM Exam ex
END 

GO
EXEC exam_select_all

GO

CREATE PROCEDURE exam_select_by_id @exam_id INT
AS
 BEGIN 
	SELECT * 
	FROM Exam
	WHERE exam_id =@exam_id
 END 

EXECUTE exam_select_by_id 1
GO

-------------student_exams_Questions -----------------
CREATE PROCEDURE st_ex_qs_select_all 
AS
 BEGIN 
	SELECT * 
	FROM student_exams_Questions
 END 

EXECUTE st_ex_qs_select_all

GO

CREATE PROCEDURE st_ex_qs_select_by_ids @st_id INT, @exam_id INT , @qs_id INT 
AS
 BEGIN 
	SELECT * 
	FROM student_exams_Questions 
	WHERE st_id = @st_id AND exam_id = @exam_id AND qs_id = @qs_id
 END 

 GO
 st_ex_qs_select_by_ids 2,1,1
--------------Topic  -------------------
CREATE PROCEDURE topic_select_all 
AS 
BEGIN 
	SELECT * 
	FROM Topic 
END

GO

CREATE PROCEDURE topic_select_by_id @topic_id INT
AS 
BEGIN 
	SELECT * 
	FROM Topic 
	WHERE topic_id = @topic_id
END

EXECUTE topic_select_by_id 2
GO
-------- Questions-------------
CREATE PROCEDURE question_select 
AS 
BEGIN
	SELECT * FROM Question
END

GO

CREATE PROCEDURE question_select_by_id @q_id INT 
AS 
BEGIN
	SELECT * FROM Question WHERE q_id=@q_id
END

GO
question_select_by_id 2

GO
------------------------Question Choices--------------
CREATE PROCEDURE qChoice_select_by_id @q_id INT
AS 
BEGIN
	SELECT * FROM Question_choices WHERE q_id = @q_id 
END

GO

qChoice_select_by_id 3

GO
----------------------------Student----------------------------
CREATE PROC student_select_sp
AS
BEGIN
	SELECT * FROM Student s
END

GO
student_select_sp

GO
CREATE PROC student_select_by_id_sp  @st_id INT
AS
BEGIN
	SELECT * FROM Student s WHERE s.st_id = @st_id
END

GO
student_select_by_id_sp 5
GO

----------------------------Department---------------------------
CREATE PROC department_select_sp
AS
BEGIN
	SELECT * FROM Department d
END

GO
department_select_sp
GO

CREATE PROC department_select_by_id_sp @dept_id INT
AS
BEGIN
	SELECT * FROM Department d WHERE d.dept_id = @dept_id
END

GO
department_select_by_id_sp 3