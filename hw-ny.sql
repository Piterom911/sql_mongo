-- 1. Вывести имена студентов (name) и идентификаторы курсов (course_id), которые они посещают.
SELECT name, course_id
FROM students as st
JOIN students2courses as s2c
ON st.id = s2c.student_id;

-- 2. Вывести имена студентов и идентификаторы курсов:
--     Если студент проходит курс, указать соответствующий course_id.
--     Если студент не проходит ни одного курса, вывести NULL в качестве значения course_id.
SELECT name, course_id
FROM students as st
LEFT JOIN students2courses as s2c
ON st.id = s2c.student_id;

-- 3. Вывести имена студентов, которые не записаны ни на один курс.
SELECT name
FROM students as st
LEFT JOIN students2courses as s2c
ON st.id = s2c.student_id
WHERE s2c.course_id is null;

-- 4. Найти курсы, которые не посещает ни один студент.
SELECT title
FROM courses as c
LEFT JOIN students2courses as s2c
ON c.id = s2c.course_id
WHERE s2c.student_id is null;

-- 5. Найти компетенции, которые не принадлежат ни одному преподавателю.
SELECT title
FROM competencies as com
LEFT JOIN teachers2competencies as t2com
ON com.id = t2com.competencies_id
WHERE t2com.teacher_id is null;

-- 6. Вывести название курса и имя преподавателя, который является заведующим кафедрой для данного курса.
SELECT title, name
FROM courses as c
JOIN teachers as t
ON c.headman_id = t.id;

-- 7. Вывести имя студента и имена преподавателей, которые являются заведующими кафедрой для курсов, на которые записан студент.
SELECT s.name, t.name
FROM students as s
JOIN students2courses as s2c
ON s.id = s2c.student_id
JOIN courses as c
ON c.id = s2c.course_id
JOIN teachers as t
ON t.id = c.headman_id;



select * from students;
select * from students2courses;
select * from courses;
select * from teachers;

