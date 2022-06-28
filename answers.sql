/*
select all rows from the classes table
*/
SELECT * from classes;

/*
Select the name and credits from the classes table where the number of credits is greater than 3.
*/
SELECT name, credits FROM classes WHERE credits > 3;

/*
All rows from the classes table where credits is an even number.
*/
SELECT * from classes where mod(credits, 2)  = 0;


/*
All of Tianna's enrollments that she hasn't yet received a grade for.
TODO: go back and change the student_id to integer
*/
SELECT * FROM enrollments JOIN students ON CAST(enrollments.student_id as integer) = students.id WHERE students.id = 1 AND grade IS NULL;

/*
All of Tianna's enrollments that she hasn't yet received a grade for, selected by her first name, not her student.id
TODO: go back and change the student_id to integer
*/
SELECT * FROM enrollments JOIN students ON CAST(enrollments.student_id as integer) = students.id WHERE first_name = 'Tianna' AND grade IS NULL;

/*
All of Tianna's enrollments that she hasn't yet received a grade for, selected by her first name, not her student.id, with the class name included in the result set.
TODO: go back and change the enrollments.class_id to integer
*/
SELECT *, (SELECT name FROM classes WHERE classes.id = CAST(enrollments.class_id as integer)) FROM enrollments JOIN students ON CAST(enrollments.student_id as integer) = students.id WHERE students.id = 1 AND grade IS NULL;

/*
All students born before 1986 who have a 't' in their first or last name.
*/
SELECT * FROM students WHERE first_name SIMILAR TO '%(T|t)%' OR last_name SIMILAR TO '%(T|t)%' AND birthdate < '1986-01-01';

/*
Average age of all the students
*/
SELECT AVG(EXTRACT(YEAR from age(birthdate))) FROM students;

/*
Addresses that have a space in their city name.
*/
SELECT * FROM addresses WHERE city LIKE '% %';

/*
Students & their addresses that live in a city with more than one word in the city name.
*/
SELECT first_name, last_name, city FROM students JOIN addresses ON students.address_id = addresses.id WHERE addresses.city LIKE '% %';

/*
The average number of credits for classes offered at the school.
*/
SELECT AVG(classes.credits) FROM classes;

/*
The first and last name of all students who have received an 'A'.
*/
SELECT first_name, last_name, grade FROM students JOIN enrollments ON students.id = CAST(enrollments.student_id as integer) WHERE grade = 'A';

/*
Each student's first name and the total credits they've enrolled in
*/
SELECT first_name, (SELECT SUM(credits) FROM classes.id JOIN enrollments.class_id) FROM students GROUP BY first_name;


/*
.
.
.
*/

/* 
Insert a new enrollment recording that Andre Rohan took PHYS218 and got an A
TODO: look into syntax for dynamic pk value
*/
INSERT INTO enrollments VALUES(17, 5, 4, 'A');
