INSERT INTO Student ([fname]
      ,[lname]
      ,[st_gender]
      ,[st_phone]
      ,[st_birthdate]
      ,[st_joindate]
      ,[dept_id]
      ,[city]
      ,[street])
       VALUES('Ahmed','elemam','m','01027219250','1999-02-13','2020-02-23',1,'cairo','giza'),
	         ('Ali','ali','m','01023219250','1990-04-19','2022-06-1',2,'alex','khaledibnwalid'),
			 ('Amged','mohamed','m','01027212250','1980-02-12','2015-05-30',3,'Tanta','elnahas'),
			 ('Ayman','belal','m','01027219250','2000-03-15','2017-08-02',4,'cairo','giza'),
			 ('Samir','Zakaria','m','01027213250','1993-04-14','2020-04-20',5,'cairo','giza'),
			 ('Mohamed','Hany','m','01027219253','1992-08-09','2020-04-21',1,'cairo','giza'),
			 ('Fares','Mohamed','m','01027219252','1995-02-05','2022-4-20',2,'cairo','giza')

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
SELECT IDENT_CURRENT('Course') AS StartValue;

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
			VALUES (2,2,100),
			(2,6,50),
			(3,3,90),
			(4,4,80),
			(5,5,60)

INSERT INTO  instructor_courses
             VALUES(1,3),
			       (2,6),
				   (3,2),
				   (4,5),
				   (5,4)

INSERT INTO Question
			VALUES 
			('Javascript is an _______ language?', 'choice', 2, 'a', 1),
			('Which of the following keywords is used to define a variable in Javascript?', 'choice', 2, 'c', 1),
			('What is the implicit return type of constructor?', 'choice', 2, 'b', 2),
			('When is the object created with a new keyword?', 'choice', 2, 'a', 2),
			('Binary search is always faster than linear search', 'tf', 2, 'f', 3)


INSERT INTO Question_choices
		VALUES(1,'object-oriented'),
		(1,'object-based'),
		(1,'Procedual'),
		(2,'let'),
		(2,'var'),
		(2,'both a and b'),
		(3,'No return type'),
		(3,'A class object in which it'),
		(3,'void'),
		(3,'None'),
		(4,'At run time'),
		(4,'At compile time'),
		(4,'Depends on the code'),
		(4,'None'),
		(5,'t'),
		(5,'f')