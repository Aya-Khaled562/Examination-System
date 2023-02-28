CREATE PROCEDURE get_student_answers @st_id INT, @exam_id INT
AS
BEGIN
	  SELECT q.q_id, seq.answer
	  FROM dbo.Student_exams_questions seq
	  JOIN dbo.Question q ON seq.qs_id = q.q_id
	  WHERE seq.st_id = @st_id AND seq.exam_id = @exam_id;
END

GO

create proc ExamCorrection_calc_std_garde_sp @std_id int,@exam_id int
as 
begin
	declare  @crs_id int 
	declare @grade int 

	set @crs_id=(select top(1)courses_id
	from Question q,Student_exams_questions e
	WHERE q.q_id=e.qs_id and e.st_id=@std_id and e.exam_id=@exam_id)

	set @grade = ( select sum([grade]) from Student_exams_questions  where st_id=@std_id and exam_id=@exam_id)
	update student_course
	set grade=grade+@grade
	where [st_id]=@std_id and [course_id]=@crs_id

END

GO
CREATE PROCEDURE correct_exam @st_id INT, @exam_id INT
AS
BEGIN
  
	IF (select top(1) is_corrected from Student_exams_questions where exam_id=@exam_id and st_id=@st_id)=0
	BEGIN
		  EXEC get_student_answers @st_id,@exam_id;
  
		  UPDATE dbo.Student_exams_questions 
		  SET Student_exams_questions.grade =CASE WHEN seq.answer = q.q_answer THEN q.q_grade ELSE 0 END
		  FROM dbo.Student_exams_questions seq
		  JOIN question q ON seq.qs_id = q.q_id
		  WHERE seq.st_id = @st_id AND seq.exam_id =@exam_id;

		  update dbo.Student_exams_questions
		  SET is_corrected=1
		  WHERE exam_id=@exam_id and st_id=@st_id
		
		
		  exec ExamCorrection_calc_std_garde_sp @st_id,@exam_id
		  PRINT 'exam for this student is corrected'
	END
	ELSE
		PRINT 'exam for this student is already corrected'
END

correct_exam 5,1
