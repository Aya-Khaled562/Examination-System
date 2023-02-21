CREATE TABLE Instructor(
	instr_id INT PRIMARY KEY identity,
	fname VARCHAR(20),
	lname VARCHAR(20),
	ins_phone VARCHAR(11),
	dept_id INT,
	country VARCHAR(20),
	city VARCHAR(20),
	street  VARCHAR(20),
)
CREATE TABLE Department(
	dept_id INT PRIMARY KEY IDENTITY,
	dept_manager INT ,
	dept_name NVARCHAR(20)
)
 