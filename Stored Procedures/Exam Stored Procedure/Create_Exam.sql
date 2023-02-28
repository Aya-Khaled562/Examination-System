CREATE PROC create_Exam  @crs_name VARCHAR(50) ,@t_f INT , @mcq INT 
AS 
BEGIN
	IF EXISTS (SELECT * FROM Course  WHERE course_name = @crs_name  )
		BEGIN
			IF (@t_f > 0) AND (@t_f <= (
				SELECT COUNT(q_id) q_id 
				FROM Question q , Course c 
				WHERE q.q_type = 'tf' AND q.courses_id = c.courses_id AND c.course_name = @crs_name ))
				BEGIN 
					IF (@mcq > 0) AND (@mcq <= (
						SELECT COUNT(q_id) q_id 
						FROM Question q , Course c 
						WHERE q.q_type = 'choice' AND q.courses_id = c.courses_id AND c.course_name = @crs_name))

						BEGIN 
							DECLARE  @exam_table TABLE (ex_id  INT)

							INSERT  INTO @exam_table
							SELECT * FROM
							(SELECT TOP(@t_f) q.q_id
							FROM Question q JOIN Course c
							ON c.courses_id = q.courses_id AND c.course_name =@crs_name AND q.q_type = 't_f'
							order by NEWID()
							UNION
							SELECT  TOP(@mcq) q_id
							FROM Question q JOIN Course c
							ON c.courses_id = q.courses_id AND c.course_name =@crs_name AND q.q_type = 'choice'
							ORDER BY NEWID()) exam_table
							
							SELECT *
							FROM (
								SELECT  q.question, qc.choices, ROW_NUMBER() OVER (PARTITION BY qc.q_id ORDER BY qc.q_id ) AS choice_num
								FROM Question_choices qc
								JOIN Question q ON q.q_id = qc.q_id AND q.q_id IN (SELECT * FROM @exam_table)
								) AS exam_table2
								PIVOT (
									MAX(exam_table2.choices) FOR exam_table2.choice_num IN ([1], [2], [3], [4])
								) AS pivot_table;			
						
						END
					ELSE
						PRINT 'please enter a valid mcq number'
				END
			ELSE
				PRINT 'please enter a valid t_f number'
		END
	ELSE
		PRINT 'This course is not Exist'

END

create_Exam 'C++',1,6
