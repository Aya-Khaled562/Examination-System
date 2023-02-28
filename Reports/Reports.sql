---report-1
CREATE  PROC display_st_report_deprt  @id int
AS
BEGIN
IF @id IN (SELECT d.dept_id FROM Department d)
   BEGIN
    SELECT s.st_id,s.fname,s.lname,s.st_gender,s.st_phone,s.st_birthdate,s.st_joindate,s.street , d.dept_name
            FROM Student s INNER JOIN Department d
			ON s.dept_id = d.dept_id
			WHERE d.dept_id = @id
  END
  ELSE
    BEGIN
	PRINT 'Deprtment Id is not Exist'
	END
END

display_st_report_deprt 3

------------------
---report -2
CREATE  PROC report_st_crs @id INT
AS
BEGIN
IF @id IN (SELECT s.st_id FROM Student s)
   BEGIN
   SELECT s.fname+' '+s.lname AS FullName ,sc.grade,c.course_name
   FROM Student s INNER JOIN Student_course sc
   ON s.st_id = sc.st_id INNER JOIN Course c ON sc.course_id = c.courses_id
   WHERE s.st_id = @id
   END
ELSE
  BEGIN
  PRINT 'Student Id is Exist'
  END
END

report_st_crs 3

----------
----report-3
CREATE PROC instr_id @id INT
AS
BEGIN
IF @id IN (SELECT i.insrt_id FROM Instructor i)
    BEGIN
      SELECT COUNT(sc.st_id) AS Student_Number, i.fname+' '+i.lname AS
       FullName , c.course_name
        FROM Instructor i INNER JOIN Instructor_courses ic
        ON i.insrt_id = ic.instr_id INNER JOIN Course c 
        ON ic.course_id = c.courses_id INNER JOIN Student_course sc
        ON c.courses_id = sc.course_id
		WHERE i.insrt_id = @id
       GROUP BY i.fname,i.lname  , c.course_name
	   
   END
ELSE
   BEGIN
   PRINT 'instructure id is exist'
   END
END

instr_id 4
--Report 4
CREATE PROC get_topic_name_sp @course_id INT
AS 
BEGIN
	IF @course_id IN (SELECT c.courses_id FROM Course c)
		BEGIN
			SELECT c.course_name,t.topic_name
			FROM Course c, Topic t
			WHERE c.topic_id = t.topic_id AND c.courses_id = @course_id
		END
	ELSE
		PRINT 'Course id is not exist'
	
END

get_topic_name_sp 3

--Report 5
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

--Report 6
CREATE PROC get_Question_with_Student_answer  @exam_id INT, @st_id INT
AS
BEGIN
	IF @exam_id IN (SELECT exam_id FROM Exam)
		BEGIN
			IF @st_id IN (SELECT s.st_id FROM Student s)
				BEGIN
					SELECT q.question, seq.answer AS [Student answer] ,q.q_answer AS[Question answer]
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


------------------------------
