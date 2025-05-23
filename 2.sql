use db_doc;
SELECT teams.name, SUM(CASE
    WHEN matches.home_team_id = teams.id THEN matches.home_score
    WHEN matches.away_team_id = teams.id THEN matches.away_score
    ELSE 0
    END
    ) AS total_goals
FROM teams, matches
WHERE teams.id = matches.home_team_id OR teams.id = matches.away_team_id
GROUP BY teams.name
HAVING total_goals > 2;


