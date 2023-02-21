INSERT INTO Student 
       VALUES('Ahmed','elemam','m','01027219250','1999-02-13','2020-02-23','cairo','giza'),
	         ('Ali','ali','m','01023219250','1990-04-19','2022-06-1','alex','khaledibnwalid'),
			 ('Amged','mohamed','m','01027212250','1980-02-12','2015-05-30','Tanta','elnahas'),
			 ('Ayman','belal','m','01027219250','2000-03-15','2017-08-02','cairo','giza'),
			 ('Samir','Zakaria','m','01027213250','1993-04-14','2020-04-20','cairo','giza'),
			 ('Mohamed','Hany','m','01027219253','1992-08-09','2020-04-21','cairo','giza'),
			 ('Fares','Mohamed','m','01027219252','1995-02-05','2022-4-20','cairo','giza')

INSERT INTO Department 
		VALUES 
		('SD',1,'2020-03-03'),
		('PD',2,'2010-12-23'),
		('OS',3,'2015-10-13'),
		('JAVA',1,'2021-09-17'),
		('AI',1,'2005-11-30')

INSERT INTO Course
			VALUES ('C++',2,1),
					('C#',20,1),
					('HTML',15,2),
					('CSS',10,2),
					('Nodejs',12,3),
					('ASP.Net',3,3)

INSERT INTO Instructor(ins_fname,ins_lname,Ins_phone,ins_city,ins_street,Dept_id)
			VALUES ('Maha','Elgendy','01025689','Tanta','Ebn Elfared',1),
					('Aya','Khaled','01265687','Kafr Elsheikh','Abass Elakaad',2),
					('Mayar','Ahmed','01025689','Zefta','Moheb',3),
					('Nahla','Adly','01025689','Kafr Elzayat','saeed',4),
					('Abdelrahman','Emam','01025689','Tanta','Elnahas',5),
					('Mai','Mohamed','01025689','Elmahala','Ebn Elfared',NULL)

INSERT INTO Topic
             VALUES('Programming'),
			       ('FrontEnd'),
				   ('BackEnd'),
				   ('MobileNative'),
				   ('Java')

INSERT INTO Student_course
			VALUES (1,1,100),
			(2,1,50),
			(1,2,90),
			(2,3,80),
			(3,4,60)

INSERT INTO  instructor_courses
             VALUES(1,3),
			       (2,1),
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