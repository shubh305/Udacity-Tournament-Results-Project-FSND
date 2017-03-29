-- Table definitions for the tournament project.

-- Drop database if already exists.
DROP DATABASE IF EXISTS tournament;

-- Create the database and tables
CREATE DATABASE tournament;
\connect tournament;

CREATE TABLE players(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE matches(
  winner INTEGER references players(id),
  loser INTEGER references players(id),
  PRIMARY KEY (winner, loser)
);

-- View for total number of matches per player

CREATE VIEW tally AS
SELECT players.id, COUNT(matches.*) AS games
FROM players LEFT JOIN matches
ON players.id = matches.winner OR players.id = matches.loser
GROUP BY players.id;

-- View for player standings

CREATE VIEW standings AS
SELECT id, name, COUNT(matches.winner) AS wins,
(SELECT tally.games FROM tally WHERE tally.id = players.id)
FROM players LEFT JOIN matches
ON players.id = matches.winner
GROUP BY players.id, players.name
ORDER BY wins DESC;