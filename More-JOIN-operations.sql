--1
SELECT id, title FROM movie
WHERE yr=1962;
--2
SELECT yr FROM movie
WHERE title = 'Citizen Kane';
--3
SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;
--4
SELECT id FROM actor
WHERE name='Glenn Close';
--5
SELECT id FROM movie
WHERE title = 'Casablanca';
--6
SELECT x.name FROM actor x
JOIN casting ON actorid = id
WHERE movieid = 11768;
--7
SELECT x.name FROM actor x
JOIN casting y ON x.id = actorid
JOIN movie z ON y.movieid = z.id
WHERE title = 'Alien';
--8
SELECT x.title FROM movie x
JOIN casting y ON x.id = movieid
JOIN actor z ON actorid = z.id
WHERE z.name = 'Harrison Ford';
--9
SELECT x.title FROM movie x
JOIN casting y ON x,id = movieid
JOIN actor z ON actorid = z.id
WHERE z.name = 'Harrison Ford'
AND y.ord != 1;
--10
SELECT x.title, z.name FROM movie x
JOIN casting y ON x.id = movieid
JOIN actor z ON actorid = z.id
WHERE x.yr = 1962
AND y.ord = 1;
--11
SELECT yr, COUNT(title) AS number FROM movie x
JOIN casting y ON x.id = movieid
JOIN actor z ON actorid = z.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
--12
SELECT x.title, z.name FROM movie x
JOIN casting y ON x.id = y.movieid
JOIN actor z ON y.actorid = z.id
WHERE ord = 1 AND movied IN(SELECT movieid FROM casting y
JOIN actor ON y.actorid = z.id
WHERE z.name = 'Julie Andrews');
--13
SELECT DISTINCT name FROM actor x
JOIN casting y ON x.id = y.actorid
WHERE (SELECT COUNT(ord) FROM castig y
WHERE x.id = y.actorid AND ord = 1) >= 15
ORDER BY name;
--14
SELECT title, COUNT(actorid) AS CAST FROM movie x
JOIN casting y ON y.movieid = x.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;
--15
SELECT DISTINCT name FROM actor x
JOIN casting y ON x.id = y.actorid
WHERE y.movieid IN(SELECT movieid FROM casting y
JOIN actor x ON actorid = id
WHERE name = 'Art Garfunkel') AND x.name != 'Art Garfunkel';
