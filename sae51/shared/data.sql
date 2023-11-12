CREATE DATABASE gestion_parc_informatique;

USE gestion_parc_informatique;

CREATE TABLE `Techniciens` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Nom` varchar(255)
);

CREATE TABLE `Utilisateurs` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Nom` varchar(255),
  `Droit` varchar(255)
);

CREATE TABLE `Maintenances` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `TechnicienID` int,
  `DateDebut` date,
  `DateFin` date,
  `Actions` varchar(255)
);

CREATE TABLE `Machines` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `DateAchat` date,
  `TailleDisque` varchar(255),
  `RAM` varchar(255),
  `UtilisateurID` int,
  `MaintenanceID` int,
  `MarqueID` int
);

CREATE TABLE `Logiciels` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `MachineID` int,
  `Nom` varchar(255),
  `Version` varchar(255),
  `Licence` varchar(255)
);

CREATE TABLE `Marque` (
  `ID` int UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `Marque` varchar(255)
);

ALTER TABLE `Maintenances` ADD FOREIGN KEY (`TechnicienID`) REFERENCES `Techniciens` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`UtilisateurID`) REFERENCES `Utilisateurs` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`MaintenanceID`) REFERENCES `Maintenances` (`ID`);

ALTER TABLE `Machines` ADD FOREIGN KEY (`MarqueID`) REFERENCES `Marque` (`ID`);

ALTER TABLE `Logiciels` ADD FOREIGN KEY (`MachineID`) REFERENCES `Machines` (`ID`);

