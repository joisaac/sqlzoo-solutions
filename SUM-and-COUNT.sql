--SUM AND COUNT
--1
SELECT name FROM world
WHERE population > (SELECT population FROM world
WHERE name='Russia');
--2
SELECT name FROM world
WHERE continent = 'Europe' AND gpd/population >
(SELECT gpd/population FROM world
WHERE name='United Kingdom');
--3
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world
WHERE name='Argentina' OR name='Australia')
ORDER BY name;
--4
SELECT name FROM world
WHERE population BETWEEN (SELECT population FROM world
name='Poland') AND (SELECT population FROM world WHERE name='Canada');
--5
SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world
WHERE name = 'Germany'),0),%) AS percentage FROM world
WHERE continent = 'Europe';
--6
SELECT name FROM world
WHERE gpd > ALL(SELECT gpd FROM world
WHERE continent='Europe' AND gdp > 0);
--7
SELECT continent, name, area FROM world AS x
WHERE area >= ALL(SELECT area FROM world AS y
WHERE y.continent=x.continent AND area > 0;
--8
SELECT continent,MIN(name) AS name FROM world
GROUP BY continent
ORDER BY continent
--9
SELECT name, continent, population FROM world
WHERE continent IN(SELECT continent FROM world x
WHERE 25000000 >= (SELECT MAX(population) FROM world y
WHERE y.continent = x.continent));
--10
SELECT x.name,x.continent FROM world AS x
WHERE x.population > ALL(SELECT 3*y.population > 0
AND x.name != y.name);
