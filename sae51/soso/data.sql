CREATE DATABASE gestion_parc_informatique;

USE gestion_parc_informatique;

CREATE TABLE Techniciens (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255)
);

CREATE TABLE Utilisateurs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255),
    Droit VARCHAR(255)
);

CREATE TABLE Maintenances (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TechnicienID INT,
    DateDebut DATE,
    DateFin DATE,
    Actions VARCHAR(255),
    FOREIGN KEY (TechnicienID) REFERENCES Techniciens(ID)
);

CREATE TABLE Machines (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DateAchat DATE,
    Marque VARCHAR(255),
    UtilisateurID INT,
    MaintenanceID  INT,
    FOREIGN KEY (UtilisateurID) REFERENCES Utilisateurs(ID),
    FOREIGN KEY (MaintenanceID) REFERENCES Maintenances(ID)
);

CREATE TABLE Logiciels (
    MachineID INT,
    Version VARCHAR(255),
    Licence VARCHAR(255),
    FOREIGN KEY (MachineID) REFERENCES Machines(ID)
);

CREATE TABLE Configuration (
    MachineID INT,
    OS VARCHAR(255),
    Ram VARCHAR(255),
    FOREIGN KEY (MachineID) REFERENCES Machines(ID)
);
