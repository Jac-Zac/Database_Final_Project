CREATE TABLE `Golf_club` (
  `Nome` varchar(255) PRIMARY KEY,
  `Città` varchar(255),
  `Via` varchar(255),
  `CAP` varchar(255),
  `Par_del_campo` integer,
  `Mail` varchar(255),
  `Sito_web` varchar(255)
);

CREATE TABLE `Giocatore` (
  `Codice_atleta` integer PRIMARY KEY,
  `Mail` varchar(255),
  `Data_di_nascita` date,
  `Nome` varchar(255),
  `Cognome` varchar(255),
  `Tipo` varchar(255),
  `Nazionalità` varchar(255),
  `Golf_club` varchar(255)
);

CREATE TABLE `Torneo` (
  `Nome` varchar(255) PRIMARY KEY,
  `Luogo` varchar(255),
  `Importanza` integer,
  `Major` boolean
);

CREATE TABLE `Edizione_Torneo` (
  `Torneo` varchar(255),
  `Anno` integer,
  PRIMARY KEY (`Torneo`, `Anno`)
);

CREATE TABLE `Partecipazione` (
  `Giocatore` integer,
  `Torneo` varchar(255),
  `Anno` integer,
  `Punteggio` integer,
  `Premio` decimal,
  PRIMARY KEY (`Giocatore`, `Torneo`, `Anno`)
);

CREATE TABLE `Sponsor` (
  `Nome` varchar(255) PRIMARY KEY,
  `Sito_web` varchar(255)
);

CREATE TABLE `Finanziamento` (
  `Sponsor` varchar(255),
  `Torneo` varchar(255),
  `Anno` integer,
  PRIMARY KEY (`Sponsor`, `Torneo`, `Anno`)
);

CREATE TABLE `Professionista` (
  `Giocatore` integer PRIMARY KEY,
  `Attivo` boolean,
  `Guadagni` decimal
);

CREATE TABLE `Sponsorizzazione` (
  `Sponsor` varchar(255),
  `Professionista` integer,
  PRIMARY KEY (`Sponsor`, `Professionista`)
);

CREATE TABLE `Ranking_Mondiale` (
  `Anno` integer PRIMARY KEY
);

CREATE TABLE `Appartenenza` (
  `Professionista` integer,
  `Ranking_Mondiale` integer,
  `Punteggio` integer,
  PRIMARY KEY (`Professionista`, `Ranking_Mondiale`)
);

ALTER TABLE `Giocatore` ADD FOREIGN KEY (`Golf_club`) REFERENCES `Golf_club` (`Nome`);

ALTER TABLE `Edizione_Torneo` ADD FOREIGN KEY (`Torneo`) REFERENCES `Torneo` (`Nome`);

ALTER TABLE `Partecipazione` ADD FOREIGN KEY (`Giocatore`) REFERENCES `Giocatore` (`Codice_atleta`);

ALTER TABLE `Partecipazione` ADD FOREIGN KEY (`Torneo`) REFERENCES `Edizione_Torneo` (`Torneo`);

ALTER TABLE `Partecipazione` ADD FOREIGN KEY (`Anno`) REFERENCES `Edizione_Torneo` (`Anno`);

ALTER TABLE `Finanziamento` ADD FOREIGN KEY (`Sponsor`) REFERENCES `Sponsor` (`Nome`);

ALTER TABLE `Finanziamento` ADD FOREIGN KEY (`Torneo`) REFERENCES `Edizione_Torneo` (`Torneo`);

ALTER TABLE `Finanziamento` ADD FOREIGN KEY (`Anno`) REFERENCES `Edizione_Torneo` (`Anno`);

ALTER TABLE `Professionista` ADD FOREIGN KEY (`Giocatore`) REFERENCES `Giocatore` (`Codice_atleta`);

ALTER TABLE `Sponsorizzazione` ADD FOREIGN KEY (`Sponsor`) REFERENCES `Sponsor` (`Nome`);

ALTER TABLE `Sponsorizzazione` ADD FOREIGN KEY (`Professionista`) REFERENCES `Professionista` (`Giocatore`);

ALTER TABLE `Appartenenza` ADD FOREIGN KEY (`Professionista`) REFERENCES `Professionista` (`Giocatore`);

ALTER TABLE `Appartenenza` ADD FOREIGN KEY (`Ranking_Mondiale`) REFERENCES `Ranking_Mondiale` (`Anno`);

INSERT INTO Golf_club (Nome, Città, Via, CAP, Par_del_campo, Mail, Sito_web)
VALUES 
('Green Valley', 'Milano', 'Via Roma 1', '20100', 72, 'contact@greenvalley.com', 'www.greenvalley.com'),
('Blue Lake', 'Roma', 'Via Milano 2', '00100', 70, 'info@bluelake.com', 'www.bluelake.com');

INSERT INTO Giocatore (Codice_atleta, Mail, Data_di_nascita, Nome, Cognome, Tipo, Nazionalità, Golf_club)
VALUES 
(1, 'marco.bianchi@example.com', '1990-05-20', 'Marco', 'Bianchi', 'Amateur', 'Italian', 'Green Valley'),
(2, 'laura.rossi@example.com', '1985-03-15', 'Laura', 'Rossi', 'Professional', 'Italian', 'Blue Lake');

INSERT INTO Torneo (Nome, Luogo, Importanza, Major)
VALUES 
('Italian Open', 'Roma', 3, true),
('European Championship', 'Milano', 5, false);

INSERT INTO Edizione_Torneo (Torneo, Anno)
VALUES 
('Italian Open', 2024),
('European Championship', 2024);

INSERT INTO Partecipazione (Giocatore, Torneo, Anno, Punteggio, Premio)
VALUES 
(1, 'Italian Open', 2024, 68, 10000.00),
(2, 'European Championship', 2024, 72, 5000.00);

INSERT INTO Sponsor (Nome, Sito_web)
VALUES 
('Golf World', 'www.golfworld.com'),
('Sports Gear', 'www.sportsgear.com');

INSERT INTO Finanziamento (Sponsor, Torneo, Anno)
VALUES 
('Golf World', 'Italian Open', 2024),
('Sports Gear', 'European Championship', 2024);

INSERT INTO Professionista (Giocatore, Attivo, Guadagni)
VALUES 
(2, true, 150000.00);

INSERT INTO Sponsorizzazione (Sponsor, Professionista)
VALUES 
('Golf World', 2),
('Sports Gear', 2);

INSERT INTO Ranking_Mondiale (Anno)
VALUES 
(2024);

INSERT INTO Appartenenza (Professionista, Ranking_Mondiale, Punteggio)
VALUES 
(2, 2024, 1200);
