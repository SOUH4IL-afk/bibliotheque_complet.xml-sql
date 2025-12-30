-- 1️⃣ إنشاء قاعدة البيانات
CREATE DATABASE IF NOT EXISTS Bibliotheque;
USE Bibliotheque;

-- 2️⃣ الجداول

-- Rayon
CREATE TABLE Rayon (
    id_rayon INT AUTO_INCREMENT PRIMARY KEY,
    nom_rayon VARCHAR(100) NOT NULL UNIQUE
);

-- Auteur
CREATE TABLE Auteur (
    id_auteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100)
);

-- Ouvrage
CREATE TABLE Ouvrage (
    id_ouvrage INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    id_rayon INT NOT NULL,
    FOREIGN KEY (id_rayon) REFERENCES Rayon(id_rayon)
);

-- Ouvrage_Auteur (table N-M)
CREATE TABLE Ouvrage_Auteur (
    id_ouvrage INT NOT NULL,
    id_auteur INT NOT NULL,
    PRIMARY KEY (id_ouvrage, id_auteur),
    FOREIGN KEY (id_ouvrage) REFERENCES Ouvrage(id_ouvrage),
    FOREIGN KEY (id_auteur) REFERENCES Auteur(id_auteur)
);

-- Lecteur
CREATE TABLE Lecteur (
    id_lecteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Emprunt
CREATE TABLE Emprunt (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    id_lecteur INT NOT NULL,
    id_ouvrage INT UNIQUE NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    FOREIGN KEY (id_lecteur) REFERENCES Lecteur(id_lecteur),
    FOREIGN KEY (id_ouvrage) REFERENCES Ouvrage(id_ouvrage)
);

-- Personnel
CREATE TABLE Personnel (
    id_personnel INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    id_responsable INT,
    FOREIGN KEY (id_responsable) REFERENCES Personnel(id_personnel)
);

-- 3️⃣ بيانات أولية (INSERT)

-- Rayon
INSERT INTO Rayon (nom_rayon) VALUES 
('علوم'), ('أدب'), ('تاريخ');

-- Auteur
INSERT INTO Auteur (nom, prenom) VALUES 
('بنيس','محمد'), 
('الرحيمي','فاطمة');

-- Ouvrage
INSERT INTO Ouvrage (titre, id_rayon) VALUES 
('مقدمة في البرمجة',1), 
('تاريخ المغرب',3);

-- Ouvrage_Auteur
INSERT INTO Ouvrage_Auteur (id_ouvrage, id_auteur) VALUES 
(1,1), 
(2,2);

-- Lecteur
INSERT INTO Lecteur (nom, prenom, email) VALUES 
('علي','يوسف','ali@example.com'), 
('سلمى','أحمد','salma@example.com');

-- Emprunt
INSERT INTO Emprunt (id_lecteur, id_ouvrage, date_emprunt, date_retour_prevue) VALUES 
(1,1,'2025-12-30','2026-01-30');

-- Personnel
INSERT INTO Personnel (nom, prenom, id_responsable) VALUES 
('كريم','حسن',NULL), 
('ليلى','مريم',1);

-- انتهى إنشاء قاعدة البيانات والجداول والبيانات الأولية