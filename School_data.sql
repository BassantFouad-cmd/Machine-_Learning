create Database School_data;
Use School_data;
 CREATE TABLE Students
(
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  phone_number CHAR(11) NOT NULL,
  address VARCHAR(100) NOT NULL,
  level INT NOT NULL,
  student_id INT NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE Teachers
(
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  years_of_exp INT NOT NULL,
  salary INT NOT NULL,
  PRIMARY KEY (email)
);

CREATE TABLE Courses
(
  course_name VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  start_date DATE NOT NULL,
  description VARCHAR(200) NOT NULL,
  course_code CHAR(7) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (course_code),
  FOREIGN KEY (email) REFERENCES Teachers(email)
);

CREATE TABLE takes
(
  grade FLOAT NOT NULL,
  student_id INT NOT NULL,
  course_code CHAR(7) NOT NULL,
  PRIMARY KEY (student_id, course_code),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_code) REFERENCES Courses(course_code)
);
insert into Students (name, age , Phone_number , address , level,student_id) values 
("Ahmed Ali" , 20 , 01536434341 , "dokki" , 1 , 123-001),
("Mohamed ibrahim" , 20 , 01536254341 , "El haram" , 1 , 123-002),
("Mohamed saleh" , 21 , 01536434341 , "Tahrir" , 2 , 123-003),
("Ahmed Ahmed" , 22 , 01536664341 , "El obour" , 1 , 123-004),
("Sayed Ali" , 20 , 01588834341 , "Giza" , 1 , 123-005),
("Tarek Ali" , 22, 01536434441 , "dokki" , 1 , 123-006),
("Salem  Ali" , 20 , 01536496341 , "Fifth settelment" , 2 , 123-007),
("Ahmed Ibrahim" , 21 , 01536436666 , "Tahrir" , 1 , 123-008),
("sami Ali" , 20 , 01532624341 , "New Cairo" , 1 , 123-009),
("Hady Ali" , 21 , 01533334341 , "Madinaty" , 3 , 123-010);

select * from Students;