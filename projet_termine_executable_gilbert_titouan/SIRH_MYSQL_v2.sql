--
-- Base de données: SIRH
--
CREATE DATABASE SIRH DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE SIRH;
CREATE USER 'sirh_util'@'localhost' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON SIRH.* to 'sirh_util'@'localhost';

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE IF NOT EXISTS `Categorie` (
  `Code` varchar(2) NOT NULL,
  `Libelle` varchar(50)  DEFAULT '',
  `salaireMini` double DEFAULT 0,
  `CaisseDeRetraite` varchar(20) DEFAULT '',
  `PrimeResultat` int(1) DEFAULT 0,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Categorie`
--

INSERT INTO `Categorie` (`Code`, `Libelle`, `salaireMini`, `CaisseDeRetraite`, `PrimeResultat`) VALUES 
('C1', 'Cadre moyen', 2500, 'AGIRC', 1),
('C2', 'Cadre supérieur', 3500, 'AGIRC', 1),
('E1', 'Employé niveau 1', 1600, 'ARRCO', 0),
('E2', 'Employé niveau 2', 2100, 'ARRCO', 0);

-- --------------------------------------------------------

--
-- Structure de la table `Formation`
--

CREATE TABLE IF NOT EXISTS `Formation` (
  `Code` varchar(3) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `DateDebut` date DEFAULT NULL,
  `Nbrejours` int(1) DEFAULT 0,
  `CoutJourForm` double DEFAULT 0,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Formation`
--

INSERT INTO `Formation` (`Code`, `Nom`, `DateDebut`, `Nbrejours`, `CoutJourForm`) VALUES
('F01', 'Java débutant', '2026-02-05', 4, 1200),
('F02', 'Java initié', '2026-05-20', 5, 1200),
('F03', 'Administration d''un réseau local sous Linux', '2026-09-14', 6, 1300),
('F04', 'Symfony', '2026-05-10', 4, 1200),
('F05', 'La conduite d''un projet informatique', '2026-05-17', 3, 1900),
('F06', 'SQL Server', '2026-02-25', 4, 1500),
('F07', 'SAGE', '2026-03-14', 3, 1100),
('F08', 'Anglais débutant', '2026-02-25', 8, 1000),
('F09', 'Anglais avancé', '2026-04-05', 3, 1300),
('F10', 'Relations clientèle', '2026-05-08', 3, 1500),
('F11', 'La fiscalité des PME', '2026-10-17', 2, 1500),
('F12', 'Fixer des objectifs à votre force de vente', '2026-10-20', 1, 1250),
('F13', 'Optimiser son portefeuille clients', '2026-01-02', 3, 1000),
('F14', 'Utiliser un logiciel de gestion de clientèle', '2026-02-09', 5, 1300);

-- --------------------------------------------------------

--
-- Structure de la table `Salarie`
--

CREATE TABLE IF NOT EXISTS `Salarie` (
  `Code` varchar(3) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) DEFAULT '',
  `DateNaiss` date DEFAULT NULL,
  `DateEmbauche` date DEFAULT NULL,
  `Fonction` varchar(50) DEFAULT '',
  `TauxHoraire` double DEFAULT 0,
  `situationFamiliale` varchar(50) DEFAULT '',
  `NbrEnfants` int(1) DEFAULT 0,
  `NumCat` varchar(2) DEFAULT NULL,
  `CodeServ` int(3) DEFAULT NULL,
  PRIMARY KEY (`Code`),
  KEY `CodeServ` (`CodeServ`),
  KEY `NumCat` (`NumCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Salarie`
--

INSERT INTO `Salarie` (`Code`, `Nom`, `Prenom`, `DateNaiss`, `DateEmbauche`, `Fonction`, `TauxHoraire`, `situationFamiliale`, `NbrEnfants`, `NumCat`, `CodeServ`) VALUES
('S01', 'RETAIS', 'Claude', '1967-03-31', '2020-09-01', 'Chef de projet', 32.5, 'Marié.e', 3, 'C2', 1),
('S02', 'BERNARD', 'Céline', '1977-08-14', '2020-09-01', 'Directrice commerciale', 32.5, 'Marié.e', 2, 'C2', 3),
('S03', 'RETAIS', 'Jérôme', '1983-09-14', '2020-09-01', 'Ingénieur informatique', 28, 'Divorcé.e', 4, 'C1', 1),
('S04', 'DOMARD', 'Marie', '1965-06-14', '2020-09-01', 'Directrice générale', 40.5, 'Marié.e', 3, 'C2', 2),
('S05', 'LALOIS', 'Régis', '1987-07-25', '2020-09-01', 'Chef comptable', 30.3, 'Célibataire', 0, 'C2', 2),
('S06', 'DUPONT', 'Henri', '1993-11-15', '2020-09-01', 'Développeur', 21.6, 'Marié.e', 2, 'E2', 1),
('S07', 'AJAVAR', 'Karima', '2001-11-25', '2021-08-01', 'Standardiste', 10.2, 'Célibataire', 1, 'E1', 2),
('S08', 'FALERT', 'Maud', '1990-08-25', '2022-01-01', 'Développeuse', 20.3, 'Marié.e', 2, 'E2', 1),
('S09', 'MALE', 'Emilie', '2000-01-14', '2022-02-01', 'Assistante comptable', 15.7, 'Divorcé.e', 2, 'E1', 2),
('S10', 'MOUDA', 'Mustapha', '1978-01-14', '2022-05-01', 'Ingénieur commercial', 25.6, 'Marié.e', 3, 'C1', 3),
('S11', 'AJAVAR', 'Médhi', '1993-02-14', '2022-06-01', 'Développeur', 20, 'Marié.e', 4, 'E2', 1),
('S12', 'WANG', 'Vinthan', '2000-07-22', '2023-06-01', 'Développeur', 18, 'Marié.e', 1, 'E2', 1),
('S13', 'SAVOY', 'Marilyne', '1990-07-16', '2023-01-01', 'Secrétaire commerciale', 15.7, 'Marié.e', 3, 'E1', 3),
('S14', 'ESTOUDE', 'Sophie', '1996-08-17', '2023-01-01', 'Assistante de direction', 20, 'Divorcé.e', 2, 'E2', 2),
('S15', 'PETIT', 'Sylvie', '1984-05-28', '2023-01-01', 'Technico-commerciale', 20, 'Marié.e', 0, 'E2', 3),
('S16', 'GIRARDO', 'Elisa', '1995-08-14', '2023-05-01', 'Administratrice réseau', 20.1, 'Célibataire', 1, 'E1', 1),
('S17', 'ZOARD', 'Farid', '2003-07-23', '2025-10-01', 'Développeur stagiaire', 10, 'Célibataire', 0, 'E1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Service`
--

CREATE TABLE IF NOT EXISTS `Service` (
  `Code` int(1) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT '',
  `Tel` char(12) DEFAULT '',
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Service`
--

INSERT INTO `Service` (`Code`, `Designation`, `Email`, `Tel`) VALUES
(1, 'Informatique', 'informatique@infoware.com', '0169983212'),
(2, 'Adminstration', 'administration@infoware.com', '0169983210'),
(3, 'Commercial', 'commercial@infoware.com', '0169983215'),
(4, 'Comptable', 'comptable@infoware.com', '0169983218');

-- --------------------------------------------------------

--
-- Structure de la table `Suivre`
--

CREATE TABLE IF NOT EXISTS `Suivre` (
  `CodeSal` varchar(3) NOT NULL,
  `CodeForm` varchar(3) NOT NULL,
  PRIMARY KEY (`CodeSal`,`CodeForm`),
  KEY `CodeSal` (`CodeSal`),
  KEY `CodeForm` (`CodeForm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Suivre`
--

INSERT INTO `Suivre` (`CodeSal`, `CodeForm`) VALUES
('S01', 'F04'),
('S02', 'F10'),
('S02', 'F12'),
('S03', 'F05'),
('S05', 'F11'),
('S06', 'F01'),
('S06', 'F02'),
('S07', 'F08'),
('S09', 'F07'),
('S10', 'F08'),
('S11', 'F04'),
('S13', 'F14'),
('S14', 'F09'),
('S15', 'F13'),
('S16', 'F03'),
('S17', 'F06');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Salarie`
--
ALTER TABLE `Salarie`
  ADD CONSTRAINT `Salarie_ibfk_1` FOREIGN KEY (`NumCat`) REFERENCES `Categorie` (`Code`),
  ADD CONSTRAINT `Salarie_ibfk_2` FOREIGN KEY (`CodeServ`) REFERENCES `Service` (`Code`);

--
-- Contraintes pour la table `Suivre`
--
ALTER TABLE `Suivre`
  ADD CONSTRAINT `Suivre_ibfk_2` FOREIGN KEY (`CodeForm`) REFERENCES `Formation` (`Code`),
  ADD CONSTRAINT `Suivre_ibfk_1` FOREIGN KEY (`CodeSal`) REFERENCES `Salarie` (`Code`);
