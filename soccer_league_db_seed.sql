DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referee_first_name TEXT NOT NULL,
    referee_last_name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    season_name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    game_date DATE NOT NULL,
    season_id INTEGER REFERENCES seasons (id) ON DELETE CASCADE
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_first_name TEXT NOT NULL,
    player_last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams (id) ON DELETE CASCADE
);

CREATE TABLE referee_game (
  id SERIAL PRIMARY KEY,
  referee_id INTEGER REFERENCES referees (id) ON DELETE CASCADE,
  game_id INTEGER REFERENCES games (id) ON DELETE CASCADE
);

CREATE TABLE team_game (
  id SERIAL PRIMARY KEY,
  won_lost_tied TEXT NOT NULL,
  team_id INTEGER REFERENCES teams (id) ON DELETE CASCADE,
  game_id INTEGER REFERENCES games (id) ON DELETE CASCADE
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  goal INTEGER DEFAULT 0,
  team_game_id INTEGER REFERENCES team_game (id) ON DELETE CASCADE,
  player_id INTEGER REFERENCES players (id) ON DELETE CASCADE
);

INSERT INTO seasons (season_name, start_date, end_date) 
VALUES 
('Spring21', '2021-03-01', '2021-05-31'),
('Summer21', '2021-06-01', '2021-08-31'),
('Fall21', '2021-09-01', '2021-11-30'),
('Spring22', '2022-03-01', '2022-05-31');

INSERT INTO games (game_date, season_id) 
VALUES 
('2021-03-01', '1'),
('2021-03-10', '1'),
('2021-03-20', '1'),
('2021-04-01', '1'),
('2021-04-10', '1'),
('2021-04-20', '1'),
('2021-05-01', '1'),
('2021-05-10', '1'),
('2021-05-20', '1'),
('2021-06-01', '2'),
('2021-06-10', '2'),
('2021-06-20', '2'),
('2021-07-01', '2'),
('2021-07-10', '2'),
('2021-07-20', '2'),
('2021-08-01', '2'),
('2021-08-10', '2'),
('2021-08-20', '2'),
('2021-09-01', '3'),
('2021-09-10', '3'),
('2021-09-20', '3'),
('2021-10-01', '3'),
('2021-10-10', '3'),
('2021-10-20', '3'),
('2021-11-01', '3'),
('2021-11-10', '3'),
('2021-11-20', '3'),
('2022-03-01', '4'),
('2022-03-10', '4'),
('2022-03-20', '4'),
('2022-04-01', '4'),
('2022-04-10', '4'),
('2022-04-20', '4'),
('2022-05-01', '4'),
('2022-05-10', '4'),
('2022-05-20', '4');

INSERT INTO referees (referee_first_name, referee_last_name)
VALUES 
('Erik', 'Higgins'),
('Antonio', 'Flowers'),
('Clifford', 'Krueger'),
('Joel', 'Holden'),
('Javier', 'Larsen'),
('Rafael', 'Orr');

INSERT INTO referee_game (referee_id,game_id)
VALUES 
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('1', '7'),
('2', '8'),
('3', '9'),
('4', '10'),
('5', '11'),
('6', '12'),
('1', '13'),
('2', '14'),
('3', '15'),
('4', '16'),
('5', '17'),
('6', '18'),
('1', '19'),
('2', '20'),
('3', '21'),
('4', '22'),
('5', '23'),
('6', '24'),
('1', '25'),
('2', '26'),
('3', '27'),
('4', '28'),
('5', '29'),
('6', '30'),
('1', '31'),
('2', '32'),
('3', '33'),
('4', '34'),
('5', '35'),
('6', '36'),
('2', '1'),
('3', '2'),
('4', '3'),
('5', '4'),
('6', '5'),
('1', '6'),
('2', '7'),
('3', '8'),
('4', '9'),
('5', '10'),
('6', '11'),
('1', '12'),
('2', '13'),
('3', '14'),
('4', '15'),
('5', '16'),
('6', '17'),
('1', '18'),
('2', '19'),
('3', '20'),
('4', '21'),
('5', '22'),
('6', '23'),
('1', '24'),
('2', '25'),
('3', '26'),
('4', '27'),
('5', '28'),
('6', '29'),
('1', '30'),
('2', '31'),
('3', '32'),
('4', '33'),
('5', '34'),
('6', '35'),
('1', '36'),
('3', '1'),
('4', '2'),
('5', '3'),
('6', '4'),
('1', '5'),
('2', '6'),
('3', '7'),
('4', '8'),
('5', '9'),
('6', '10'),
('1', '11'),
('2', '12'),
('3', '13'),
('4', '14'),
('5', '15'),
('6', '16'),
('1', '17'),
('2', '18'),
('3', '19'),
('4', '20'),
('5', '21'),
('6', '22'),
('1', '23'),
('2', '24'),
('3', '25'),
('4', '26'),
('5', '27'),
('6', '28'),
('1', '29'),
('2', '30'),
('3', '31'),
('4', '32'),
('5', '33'),
('6', '34'),
('1', '35'),
('2', '36'),
('4', '1'),
('5', '2'),
('6', '3'),
('1', '4'),
('2', '5'),
('3', '6'),
('4', '7'),
('5', '8'),
('6', '9'),
('1', '10'),
('2', '11'),
('3', '12'),
('4', '13'),
('5', '14'),
('6', '15'),
('1', '16'),
('2', '17'),
('3', '18'),
('4', '19'),
('5', '20'),
('6', '21'),
('1', '22'),
('2', '23'),
('3', '24'),
('4', '25'),
('5', '26'),
('6', '27'),
('1', '28'),
('2', '29'),
('3', '30'),
('4', '31'),
('5', '32'),
('6', '33'),
('1', '34'),
('2', '35'),
('3', '36');

INSERT INTO teams (team_name)
VALUES 
('Hooligans'),
('Avengers'),
('Terminators'),
('Daredevils');

INSERT INTO team_game (won_lost_tied, team_id, game_id)
VALUES 
('W', '1', '1'),
('L', '2', '2'),
('W', '1', '3'),
('L', '2', '4'),
('T', '1', '5'),
('L', '3', '6'),
('W', '1', '7'),
('L', '3', '8'),
('W', '1', '9'),
('T', '1', '10'),
('W', '2', '11'),
('L', '1', '12'),
('W', '2', '13'),
('L', '1', '14'),
('T', '3', '15'),
('L', '1', '16'),
('W', '3', '17'),
('L', '1', '18'),
('W', '1', '19'),
('L', '2', '20'),
('W', '1', '21'),
('L', '2', '22'),
('T', '1', '23'),
('L', '3', '24'),
('W', '1', '25'),
('L', '3', '26'),
('W', '1', '27'),
('T', '1', '28'),
('W', '2', '29'),
('L', '1', '30'),
('W', '2', '31'),
('L', '1', '32'),
('T', '3', '33'),
('L', '1', '34'),
('W', '3', '35'),
('L', '1', '36'),
('L', '3', '1'),
('W', '4', '2'),
('L', '4', '3'),
('W', '3', '4'),
('T', '2', '5'),
('W', '4', '6'),
('L', '2', '7'),
('W', '4', '8'),
('L', '2', '9'),
('T', '3', '10'),
('L', '4', '11'),
('W', '4', '12'),
('L', '3', '13'),
('W', '2', '14'),
('T', '4', '15'),
('W', '2', '16'),
('L', '4', '17'),
('W', '2', '18'),
('L', '3', '19'),
('W', '4', '20'),
('L', '4', '21'),
('W', '3', '22'),
('T', '2', '23'),
('W', '4', '24'),
('L', '2', '25'),
('W', '4', '26'),
('L', '2', '27'),
('T', '3', '28'),
('L', '4', '29'),
('W', '4', '30'),
('L', '3', '31'),
('W', '2', '32'),
('T', '4', '33'),
('W', '2', '34'),
('L', '4', '35'),
('W', '2', '36');

INSERT INTO players (player_first_name, player_last_name, team_id)
VALUES 
('Antonio', 'Oneal', 1),
('Seth', 'Dodson', 2),
('Leslie', 'Fletcher', 3),
('Edward', 'Huber', 4),
('Calvin', 'Ryan', 1),
('Don', 'Hooper', 2),
('Dennis', 'Munoz', 3),
('Herbert', 'Hicks', 4),
('Troy', 'Pierce', 1),
('Ken', 'Hurley', 2),
('Kelly', 'Greer', 3),
('Ray', 'Stone', 4),
('Troy', 'Forbes', 1),
('Stanley', 'Tucker', 2),
('Tom', 'Holmes', 3),
('Todd', 'Patton', 4),
('Keith', 'Davis', 1),
('Willard', 'Mendoza', 2),
('Rick', 'Hartman', 3),
('Paul', 'Perkins', 4),
('Tommy', 'Harrison', 1),
('Rodney', 'Nash', 2),
('Aaron', 'Bennett', 3),
('Jacob', 'Maddox', 4),
('Melvin', 'Clarke', 1),
('Ronald', 'Benton', 2),
('Eduardo', 'Townsend', 3),
('Seth', 'Summers', 4),
('Ian', 'House', 1),
('Robert', 'King', 2),
('Shawn', 'Johnson', 3),
('Erik', 'Cantrell', 4),
('Clifford', 'Salazar', 1),
('Neil', 'Cobb', 2),
('Glenn', 'Oneill', 3),
('Morris', 'Hester', 4),
('Nathaniel', 'Harvey', 1),
('Johnny', 'Foster', 2),
('Adam', 'Mcneil', 3),
('Kyle', 'Giles', 4),
('Floyd', 'Mccullough', 1),
('Howard', 'Atkins', 2),
('Fred', 'Salazar', 3),
('Gordon', 'Nunez', 4);

INSERT INTO goals (goal, team_game_id, player_id)
VALUES 
('1', '1', '1'),
('1', '2', '2'),
('1', '3', '3'),
('1', '4', '4'),
('1', '6', '6'),
('1', '7', '7'),
('1', '8', '8'),
('1', '9', '9'),
('1', '11', '11'),
('1', '12', '12'),
('1', '13', '13'),
('1', '14', '14'),
('1', '16', '16'),
('1', '17', '17'),
('1', '18', '18'),
('1', '19', '19'),
('1', '20', '20'),
('1', '21', '21'),
('1', '22', '22'),
('1', '24', '24'),
('1', '25', '25'),
('1', '26', '26'),
('1', '27', '27'),
('1', '29', '29'),
('1', '30', '30'),
('1', '31', '31'),
('1', '32', '32'),
('1', '34', '34'),
('1', '35', '35'),
('1', '36', '36'),
('1', '37', '37'),
('1', '38', '38'),
('1', '39', '39'),
('1', '40', '40'),
('1', '42', '42'),
('1', '43', '43'),
('1', '44', '44'),
('1', '45', '1'),
('1', '47', '3'),
('1', '48', '4'),
('1', '49', '5'),
('1', '50', '6'),
('1', '52', '8'),
('1', '53', '9'),
('1', '54', '10'),
('1', '55', '11'),
('1', '56', '12'),
('1', '57', '13'),
('1', '58', '14'),
('1', '60', '16'),
('1', '61', '17'),
('1', '62', '18'),
('1', '63', '19'),
('1', '65', '21'),
('1', '66', '22'),
('1', '67', '23'),
('1', '68', '24'),
('1', '70', '25'),
('1', '71', '26'),
('1', '72', '27'),
('1', '1', '28'),
('1', '2', '29'),
('1', '3', '30'),
('1', '4', '31'),
('1', '6', '32'),
('1', '7', '33'),
('1', '8', '34'),
('1', '9', '35'),
('1', '11', '36'),
('1', '12', '37'),
('1', '13', '38'),
('1', '14', '39'),
('1', '16', '40'),
('1', '17', '41'),
('1', '18', '42'),
('1', '19', '43'),
('1', '20', '44');


-- SELECT * FROM players;
-- SELECT * FROM team_game;
-- SELECT * FROM teams;
-- SELECT * FROM referees;
-- SELECT * FROM seasons;
-- SELECT * FROM games;

-- SELECT s.season_name, g.game_date, g.id FROM seasons s
-- JOIN games g
-- ON g.season_id = s.id;

-- SELECT s.season_name, g.game_date, r.referee_first_name, r.referee_last_name FROM seasons s
-- JOIN games g
-- ON g.season_id = s.id
-- JOIN referee_game o
-- ON o.game_id = g.id
-- JOIN referees r
-- ON o.referee_id = r.id;

-- SELECT s.season_name, g.game_date, t.team_name, m.won_lost_tied FROM seasons s
-- JOIN games g
-- ON g.season_id = s.id
-- JOIN team_game m
-- ON m.game_id = g.id
-- JOIN teams t
-- ON m.team_id = t.id;

-- SELECT t.team_name, p.player_first_name, p.player_last_name FROM teams t
-- JOIN players p
-- ON p.team_id = t.id
-- ORDER BY t.team_name, p.player_last_name;


-- SELECT DISTINCT s.season_name, g.game_date, t.team_name, m.won_lost_tied, p.player_first_name, p.player_last_name, l.goal FROM seasons s
-- JOIN games g
-- ON g.season_id = s.id
-- JOIN team_game m
-- ON m.game_id = g.id
-- JOIN teams t
-- ON m.team_id = t.id
-- JOIN players p
-- ON p.team_id = t.id
-- JOIN goals l
-- ON l.team_game_id = m.id
-- ORDER BY g.game_date, t.team_name, p.player_last_name;


-- Standings Report

-- SELECT s.id AS season, s.season_name, t.team_name, COUNT(*) AS wins FROM seasons s
-- JOIN games g
-- ON g.season_id = s.id
-- JOIN team_game m
-- ON m.game_id = g.id
-- JOIN teams t
-- ON m.team_id = t.id
-- WHERE m.won_lost_tied = 'W'
-- GROUP BY s.id, s.season_name, t.team_name
-- ORDER BY s.id, wins DESC;
