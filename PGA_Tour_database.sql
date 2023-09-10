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
  `Importanza` varchar(255),
  `Major` varchar(255)
);

CREATE TABLE `Edizione_Torneo` (
  `Torneo` varchar(255),
  `Anno` integer,
  PRIMARY KEY (`Torneo`, `Anno`)
);

CREATE TABLE `Partecipazione` (
  `Giocatore` integer,
  `Edizione_Torneo` integer,
  `Punteggio` integer,
  `Premio` varchar(255),
  PRIMARY KEY (`Giocatore`, `Edizione_Torneo`)
);

CREATE TABLE `Sponsor` (
  `Nome` varchar(255) PRIMARY KEY,
  `Sito_web` varchar(255)
);

CREATE TABLE `Finanziamento` (
  `Sponsor` varchar(255),
  `Edizione_Torneo` integer,
  PRIMARY KEY (`Sponsor`, `Edizione_Torneo`)
);

CREATE TABLE `Professionista` (
  `Giocatore` integer PRIMARY KEY,
  `Attivo` boolean,
  `Guadagni` integer
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

ALTER TABLE `Partecipazione` ADD FOREIGN KEY (`Edizione_Torneo`) REFERENCES `Edizione_Torneo` (`Anno`);

ALTER TABLE `Finanziamento` ADD FOREIGN KEY (`Sponsor`) REFERENCES `Sponsor` (`Nome`);

ALTER TABLE `Finanziamento` ADD FOREIGN KEY (`Edizione_Torneo`) REFERENCES `Edizione_Torneo` (`Anno`);

ALTER TABLE `Professionista` ADD FOREIGN KEY (`Giocatore`) REFERENCES `Giocatore` (`Codice_atleta`);

ALTER TABLE `Sponsorizzazione` ADD FOREIGN KEY (`Sponsor`) REFERENCES `Sponsor` (`Nome`);

ALTER TABLE `Sponsorizzazione` ADD FOREIGN KEY (`Professionista`) REFERENCES `Professionista` (`Giocatore`);

ALTER TABLE `Appartenenza` ADD FOREIGN KEY (`Professionista`) REFERENCES `Professionista` (`Giocatore`);

ALTER TABLE `Appartenenza` ADD FOREIGN KEY (`Ranking_Mondiale`) REFERENCES `Ranking_Mondiale` (`Anno`);
