
CREATE PROCEDURE student_answers @ex_id INT, @q_id INT, @s_id INT, @answer VARCHAR(10)
AS 
BEGIN 
	IF @s_id IN (SELECT st_id FROM Student) 
		AND @ex_id IN (SELECT exam_id FROM Exam) 
		AND @q_id IN (SELECT q_id FROM Question q)
		BEGIN 
			INSERT INTO Student_exams_questions (st_id,exam_id,qs_id,answer)
			VALUES (@s_id, @ex_id, @q_id, @answer)
		END
	ELSE
		BEGIN
			PRINT('ERROR, please check the inserted ids')
		END
END

student_answers 1,6,2,'a'
student_answers 1,17,2,'b'
student_answers 1,15,2,'c'
student_answers 1,9,2,'a'
student_answers 1,4,2,'d'
student_answers 1,5,2,'a'
student_answers 1,8,2,'c'
student_answers 1,10,2,'b'