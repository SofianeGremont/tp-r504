USE gestion_parc_informatique;

LOAD DATA LOCAL INFILE '/home/user/sae51/donnees.csv'
INTO TABLE Machines
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
