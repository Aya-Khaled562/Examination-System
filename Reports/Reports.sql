
CREATE PROC get_topic_name_sp @course_id VARCHAR(50)
AS 
BEGIN
	IF @course_id IN (SELECT c.courses_id FROM Course c)
		BEGIN
			SELECT t.topic_name
			FROM Course c, Topic t
			WHERE c.topic_id = t.topic_id AND c.courses_id = @course_id
		END
	ELSE
		PRINT 'Course id is not exist'
	
END

get_topic_name_sp 3

CREATE PROC exam_qustions_choices @exam_id INT
AS
BEGIN
	IF @exam_id IN (SELECT e.exam_id FROM Exam e)
		BEGIN
			SELECT q.question, qc.choices
			FROM (Student_exams_questions seq JOIN Question q
			ON seq.qs_id = q.q_id) JOIN Question_choices qc
			ON q.q_id = qc.q_id
			WHERE seq.exam_id = @exam_id
		END
	ELSE
		PRINT 'Exam id is not exist'
END

exam_qustions_choices 1


CREATE PROC get_Question_with_Student_answer  @exam_id INT, @st_id INT
AS
BEGIN
	IF @exam_id IN (SELECT exam_id FROM Exam)
		BEGIN
			IF @st_id IN (SELECT s.st_id FROM Student s)
				BEGIN
					SELECT q.question, seq.answer
					FROM Student_exams_questions seq JOIN Question q
					ON seq.qs_id = q.q_id
					WHERE seq.exam_id = @exam_id AND seq.st_id = @st_id
				END
			ELSE
				PRINT 'Student id is not exist'
		END
	ELSE
		PRINT 'Exam id is not exist'
END

get_Question_with_Student_answer 1,5