use db_doc;

ALTER TABLE matches
ADD COLUMN result VARCHAR(10);


UPDATE matches
SET result = CASE
    WHEN home_score > away_score THEN 'win'
    WHEN home_score < away_score THEN 'lost'
    ELSE 'draw'
END
WHERE id IS NOT NULL;

SELECT
    m.id AS match_id,
    m.match_date,
    CASE
        WHEN m.result = 'win' THEN home.name
        WHEN m.result = 'lost' THEN away.name
        ELSE 'Draw'
    END AS winner,
    CASE
        WHEN m.result = 'win' THEN away.name
        WHEN m.result = 'lost' THEN home.name
        ELSE 'Draw'
    END AS loser
FROM matches m
JOIN teams home ON m.home_team_id = home.id
JOIN teams away ON m.away_team_id = away.id;
