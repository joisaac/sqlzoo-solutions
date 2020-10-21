--1
SELECT matchid, plauyer FROM goal
WHERE teamid = 'GER';
--2
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;
--3
SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON id=matchid
WHERE teamid = 'GER';
--4
SELECT team1, team2, player FROM game x
JOIN goal y ON x.id = y.matchid
WHERE player LIKE 'Mario%';
--5
SELECT player, teamid, coach, gtime FROM goal x
JOIN eteam y ON x.teamid = y.id
WHERE gtime <= 10;
--6
SELECT mdate, teamname FROM game x
JOIN eteam y ON team1 = y.id
WHERE coach = 'Fernando Santos';
--7
SELECT player FROM goal x
JOIN game y ON x.id=y.mathcid
WHERE stadium = 'National Stadium, Warsaw';
--8
SELECT DISTINCT x.player FROM goal x
JOIN game y ON (matchid=id)
WHERE teamid != 'GER' AND (team1='GER' OR team2='GER');
--9
SELECT teamname, COUNT(*) goals FROM eteam
JOIN goal ON id=teamid
GROUP BY teamname;
--10
SELECT stadium, COUNT(*) goals FROM game
JOIN goal ON id=matchid
GROUP BY stadium;
--11
SELECT id, mdate, COUNT(*) goals
FROM game JOIN ON matchid=id
WHERE (team1='POL' OR team2 = 'POL')
GROUP BY id, mdate
ORDER BY id;
--12
SELECT id, mdate, COUNT(*) goals FROM game
JOIN goal ON id=matchid
WHERE teamid='Ger'
GROUP BY id, mdate;
--13
SELECT x.mdate, x.team1,
SUM(CASE WHEN y.teamid = x.team1 THEN 1 ELSE 0 END) AS score1,
x.team2,
SUM(CASE WHEN y.teamid = x.team2 THEN 1 ELSE 0 END) AS score2
FROM game x LEFT JOIN goal y ON x.id = y.matchid
GROUP BY x.mdate, x.team1, x.team2
ORDER BY x.mdate, y.matchid, x.team1, x.team2;
