--Using NULL
--1
SELECT name FROM teacher
WHERE dept IS NULL;
--2
SELECT x.name, y.name FROM teacher x
INNER JOIN dept y
ON x.dept = y.id;
--3
SELECT x.name, y.name FROM teacher x
LEFT JOIN dept y ON x.dept = y.id;
--4
SELECT x.name, y.name FROM teacher x
RIGHT JOIN dept y ON x.dept = y.id;
--5
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;
--6
SELECT x.name, COALESCE(y.name, 'None') FROM teacher x
LEFT JOIN dept y ON x.dept = y.id;
--7
SELECT COUNT(DISTINCT id) AS teachers,
COUNT(mobile) AS mobiles
FROM teacher;
--8
SELECT y.name, COUNT(disctint x.id) AS staff_number
FROM teacher x
RIGHT JOIN dept y ON x.dept = y.id
GROUP BY y.name;
--9
SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci'
ELSE 'Art' END AS department FROM teacher;
--10
SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci'
WHEN dept = 3 THEN 'Art' ELSE 'None' END AS deparment
FROM teacher;
