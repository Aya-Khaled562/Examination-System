INSERT INTO Student ([fname]
      ,[lname]
      ,[st_gender]
      ,[st_phone]
      ,[st_birthdate]
      ,[st_joindate]
      ,[dept_id]
      ,[city]
      ,[street])
       VALUES('Ahmed','elemam','m','01027219250','1999-02-13','2020-02-23',2,'cairo','giza'),
	         ('Ali','ali','m','01023219250','1990-04-19','2022-06-1',3,'alex','khaledibnwalid'),
			 ('Amged','mohamed','m','01027212250','1980-02-12','2015-05-30',4,'Tanta','elnahas'),
			 ('Ayman','belal','m','01027219250','2000-03-15','2017-08-02',5,'cairo','giza'),
			 ('Samir','Zakaria','m','01027213250','1993-04-14','2020-04-20',6,'cairo','giza'),
			 ('Mohamed','Hany','m','01027219253','1992-08-09','2020-04-21',2,'cairo','giza'),
			 ('Fares','Mohamed','m','01027219252','1995-02-05','2022-4-20',3,'cairo','giza')

INSERT INTO Department(dept_name,dept_manager)
		VALUES ('SD',1),
		('PD',2),
		('OS',3),
		('JAVA',1),
		('AI',1)

INSERT INTO Course
			VALUES ('C++',2,1),
					('C#',20,1),
					('HTML',15,2),
					('CSS',10,2),
					('Nodejs',12,3),
					('ASP.Net',3,3)

--DBCC CHECKIDENT ('Instructor', RESEED, 6);

INSERT INTO Instructor([fname],[lname],[ins_phone],[dept_id],[city],[street])
			VALUES ('Maha','Elgendy','01025689',NULL,'Tanta','Ebn Elfared'),
					('Aya','Khaled','01265687',NULL,'Kafr Elsheikh','Abass Elakaad'),
					('Mayar','Ahmed','01025689',NULL,'Zefta','Moheb'),
					('Nahla','Adly','01025689',NULL,'Kafr Elzayat','saeed'),
					('Abdelrahman','Emam','01025689',NULL,'Tanta','Elnahas'),
					('Mai','Mohamed','01025689',NULL,'Elmahala','Ebn Elfared')

INSERT INTO Topic
             VALUES('Programming'),
			       ('FrontEnd'),
				   ('BackEnd'),
				   ('MobileNative'),
				   ('Java')

INSERT INTO Student_course
			VALUES (2,3,100),
			(2,4,50),
			(3,5,90),
			(4,6,80),
			(5,7,60)

INSERT INTO  instructor_courses
             VALUES(1,3),
			       (2,6),
				   (3,2),
				   (4,5),
				   (5,4)

INSERT INTO Question
			VALUES 
			('Javascript is an _______ language?', 'choice', 2, 'a', 2),
			('Which of the following keywords is used to define a variable in Javascript?', 'choice', 2, 'c', 2),
			('What is the implicit return type of constructor?', 'choice', 2, 'b', 3),
			('When is the object created with a new keyword?', 'choice', 2, 'a', 3),
			('Binary search is always faster than linear search', 'tf', 2, 'f', 4)


INSERT INTO Question_choices
		VALUES(2,'object-oriented'),
		(2,'object-based'),
		(2,'Procedual'),
		(3,'let'),
		(3,'var'),
		(3,'both a and b'),
		(4,'No return type'),
		(4,'A class object in which it'),
		(4,'void'),
		(4,'None'),
		(5,'At run time'),
		(5,'At compile time'),
		(5,'Depends on the code'),
		(5,'None'),
		(6,'t'),
		(6,'f')

INSERT INTO Exam
VALUES ('2022-1-20'),
		('2022-2-10'),
		('2022-3-15'),
		('2022-5-22'),
		('2022-6-18')


INSERT INTO Student_exams_questions
VALUES(5,1,3,2,'a',1),
		(6,4,3,2,'b',0),
		(7,5,4,2,'c',1)