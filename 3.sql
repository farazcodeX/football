use db_doc;
SELECT p.name AS player_name, t.name AS team_name
FROM players p
JOIN teams t ON p.team_id = t.id
WHERE t.year_founded < 1975;
