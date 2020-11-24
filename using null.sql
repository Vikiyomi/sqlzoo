--1.NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN. List the teachers who have NULL for their department.
select name
from teacher
where dept is null


--2.Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id)

--3.Use a different JOIN so that all teachers are listed.
select teacher.name, dept.name
from teacher left join dept
on teacher.dept=dept.id


--4.Use a different JOIN so that all departments are listed.
select teacher.name, dept.name
from teacher right join dept
on teacher.dept=dept.id

--5.Using the COALESCE function. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
select teacher.name,coalesce(teacher.mobile,'07986 444 2266')
from teacher 


--6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
select teacher.name, coalesce(dept.name,'None')
from teacher left join dept
on teacher.dept=dept.id

--7.Use COUNT to show the number of teachers and the number of mobile phones.
select count(teacher.name),count(teacher.mobile)
from teacher


--8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
select dept.name, count(teacher.name)
from teacher
right join dept on teacher.dept=dept.id
group by dept.name
