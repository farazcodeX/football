use db_doc;

SELECT t.name AS team_name, COUNT(p.id) AS player_count
FROM teams t
LEFT JOIN players p ON t.id = p.team_id
GROUP BY t.id, t.name;


