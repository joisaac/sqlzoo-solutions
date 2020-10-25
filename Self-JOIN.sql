--Self JOIN
--1
SELECT COUNT(DISTINCT stop) AS stops FROM route
--2
SELECT id FROM stops
WHERE name = 'Craiglockhart';
--3
SELECT id, name FROM stops
JOIN route ON stop=id
WHERE company = 'LRT' AND num = '4';
--4
SELECT company, num, COUNT(*) AS stops
FROM route
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;
--5
SELECT a.company, a.num, a.stop, b.stop FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 53 AND b.stop = 149;
--6
SELECT a.company, a.num, stopa.name, stopb.name FROM route a
JOIN route b ON (a.company=b.company  AND a.num=b.num)
JOIN stops stopa ON a.stop=stopa.id
JOIN stops stopb ON b.stop=stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';
--7
SELECT DISTINCT a.company, a.num FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 115 AND b.stop = 137;
--8
SELECT a.company, a.num FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON a.stop=stopa.id
JOIN stops stopb ON b.stop=stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';
--9
SELECT stopb.name, a.company, a.num FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON a.stop=stopa.id
JOIN stops stopb ON b.stop=stopb.id
WHERE stopa.name = 'Craiglockhart';
--10
SELECT ra.num, ra.company, sb.name, rb2.num, rb2.company FROM stops sa
JOIN route ra ON sa.id = ra.stop
JOIN route rb1 ON (ra.company=rb1.company AND ra.num=rb1.num)
JOIN route rb2 ON rb1.stop = rb2.stop
JOIN stops sb ON sb.id=rb2.stop
JOIN route rc ON (rb2.company=rc.company AND ra.num=rb1.num)
JOIN stops sc ON sc.id=rc.stop
WHERE sa.name = ' Craiglockhart' AND sc.name = 'Lochend'
GROUP BY ra.num, ra.company, sb.name, rb2.num, rb2.company;
