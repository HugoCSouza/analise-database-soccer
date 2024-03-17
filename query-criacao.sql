CREATE SCHEMA trabalho;

CREATE TABLE trabalho.players (
    playerID SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(100)
);
COPY trabalho.players FROM 'D:\Cursos\Ada Tech - Data Science\Banco de dados I\Trabalho Final\src\database\tables\players.csv' WITH (FORMAT csv, DELIMITER ',', ENCODING 'LATIN1', HEADER true);

CREATE TABLE trabalho.leagues (
    leagueID SERIAL PRIMARY KEY,
    name VARCHAR,
    understatNotation VARCHAR(20),
    UNIQUE (leagueID, name, understatNotation)
);
COPY trabalho.leagues FROM 'D:\Cursos\Ada Tech - Data Science\Banco de dados I\Trabalho Final\src\database\tables\leagues.csv' WITH (FORMAT csv, DELIMITER ',', ENCODING 'LATIN1', HEADER true);
SELECT * FROM trabalho.leagues

CREATE TABLE trabalho.teams (
    teamID SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(50)
);
COPY trabalho.teams FROM 'D:\Cursos\Ada Tech - Data Science\Banco de dados I\Trabalho Final\src\database\tables\teams.csv' WITH (FORMAT csv, DELIMITER ',', ENCODING 'LATIN1', HEADER true);
SELECT * FROM trabalho.teams

CREATE TABLE trabalho.games (
    gameID SERIAL PRIMARY KEY UNIQUE,
    leagueID INTEGER,
	season SMALLINT,
    date DATE,
    homeTeamID INTEGER,
    awayTeamID INTEGER,
    homeGoals SMALLINT,
    awayGoals SMALLINT,
    homeProbability FLOAT,
    drawProbability FLOAT,
    awayProbability FLOAT,
    homeGoalsHalfTime SMALLINT,
    awayGoalsHalfTime SMALLINT,
    B365H VARCHAR(10),
    B365D VARCHAR(10),
    B365A VARCHAR(10),
    BWH VARCHAR(10),
    BWD VARCHAR(10),
    BWA VARCHAR(10),
    IWH VARCHAR(10),
    IWD VARCHAR(10),
    IWA VARCHAR(10),
    PSH VARCHAR(10),
    PSD VARCHAR(10),
    PSA VARCHAR(10),
    WHH VARCHAR(10),
    WHD VARCHAR(10),
    WHA VARCHAR(10),
    VCH VARCHAR(10),
    VCD VARCHAR(10),
    VCA VARCHAR(10),
    PSCH VARCHAR(10),
    PSCD VARCHAR(10),
    PSCA VARCHAR(10),
	FOREIGN KEY (leagueID) REFERENCES trabalho.leagues (leagueID),
	FOREIGN KEY (homeTeamID) REFERENCES trabalho.teams (teamID),
	FOREIGN KEY (awayTeamID) REFERENCES trabalho.teams (teamID)
);
COPY trabalho.games FROM 'D:\Cursos\Ada Tech - Data Science\Banco de dados I\Trabalho Final\src\database\tables\games.csv' WITH (FORMAT csv, DELIMITER ',', ENCODING 'LATIN1', HEADER true);
SELECT * FROM trabalho.games

CREATE TABLE trabalho.appearances (
    gameID INTEGER,
    playerID INTEGER,
    leagueID INTEGER,
    goals SMALLINT,
    ownGoals SMALLINT,
    shots VARCHAR(20),
    xGoals FLOAT,
    xGoalsChain FLOAT,
    xGoalsBuildup FLOAT,
    keyPasses SMALLINT,
    assists VARCHAR(20),
    xAssists VARCHAR(10),
    position VARCHAR,
    positionOrder SMALLINT,
    yellowCard SMALLINT,
    redCard SMALLINT,
    time INTEGER,
    substituteIn INTEGER,
    substituteOut INTEGER,
	FOREIGN KEY (gameID) REFERENCES trabalho.games (gameID),
	FOREIGN KEY (playerID) REFERENCES trabalho.players (playerID),
	FOREIGN KEY (leagueID) REFERENCES trabalho.leagues (leagueID)
);
COPY trabalho.appearances FROM 'D:\Cursos\Ada Tech - Data Science\Banco de dados I\Trabalho Final\src\database\tables\appearances.csv' WITH (FORMAT csv, DELIMITER ',', ENCODING 'LATIN1', HEADER true);
SELECT * FROM trabalho.appearances

CREATE TABLE trabalho.shots (
    gameID INTEGER,
    shooterID INTEGER,
    assisterID INTEGER,
    minute SMALLINT,
    situation VARCHAR,
    lastAction VARCHAR,
    shotType VARCHAR,
    shotResult VARCHAR,
    xGoal FLOAT,
    positionX FLOAT,
    positionY FLOAT,
	FOREIGN KEY (gameID) REFERENCES trabalho.games (gameID),
	FOREIGN KEY (shooterID) REFERENCES trabalho.players (playerID),
	FOREIGN KEY (assisterID) REFERENCES trabalho.players (playerID)
);

CREATE TABLE trabalho.teamstats (
    gameID INTEGER,
    teamID INTEGER,
    season SMALLINT,
    date DATE,
    location CHAR,
    goals SMALLINT,
    xGoals FLOAT,
    shots SMALLINT,
    shotsOnTarget SMALLINT,
    deep SMALLINT,
    ppda FLOAT,
    fouls SMALLINT,
    corners SMALLINT,
    yellowCards SMALLINT,
    redCards SMALLINT,
    result CHAR,
	FOREIGN KEY (gameID) REFERENCES trabalho.games (gameID),
	FOREIGN KEY (teamID) REFERENCES trabalho.teams (teamID)
);




