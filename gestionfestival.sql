-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 09 Décembre 2020 à 17:52
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionfestival`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `ID_art` int(11) NOT NULL,
  `nom_artiste` varchar(50) NOT NULL,
  `type_artiste` varchar(50) NOT NULL,
  `genre_artiste` varchar(50) NOT NULL,
  `date_prestation` date NOT NULL,
  `salaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `artiste`
--

INSERT INTO `artiste` (`ID_art`, `nom_artiste`, `type_artiste`, `genre_artiste`, `date_prestation`, `salaire`) VALUES
(1, 'Maitre gims', 'solo', 'Rap', '2020-12-08', 3500),
(2, 'celine Dion', 'solo', 'classique', '2020-12-22', 5000),
(3, 'chorale USA', 'groupe', 'Gospel', '2020-12-01', 2000),
(4, 'JAni', 'instrumentiste', '', '2020-12-02', 1000),
(5, 'groupe cœur de reims', 'groupe', 'gospel', '2020-12-02', 3000);

-- --------------------------------------------------------

--
-- Structure de la table `assister`
--

CREATE TABLE `assister` (
  `ID_spec` int(11) NOT NULL,
  `ID_prest` int(11) NOT NULL,
  `jour_du_festival` date NOT NULL,
  `heure` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `assister`
--

INSERT INTO `assister` (`ID_spec`, `ID_prest`, `jour_du_festival`, `heure`) VALUES
(1, 6, '2020-12-02', 15),
(3, 8, '2020-12-03', 16),
(4, 9, '2020-12-04', 15),
(2, 9, '2020-12-01', 14),
(5, 10, '2020-12-02', 16);

-- --------------------------------------------------------

--
-- Structure de la table `donner`
--

CREATE TABLE `donner` (
  `ID_prest` int(11) NOT NULL,
  `ID_art` int(11) NOT NULL,
  `salle_spectacle` int(11) NOT NULL,
  `date_prestation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `donner`
--

INSERT INTO `donner` (`ID_prest`, `ID_art`, `salle_spectacle`, `date_prestation`) VALUES
(6, 1, 3, '2020-12-02'),
(7, 2, 7, '2020-12-03'),
(8, 3, 4, '2020-12-04'),
(8, 5, 8, '2020-12-05'),
(8, 3, 6, '2020-12-03');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `ID_emp` int(11) NOT NULL,
  `nom_emp` varchar(50) NOT NULL,
  `prenom_emp` varchar(50) NOT NULL,
  `statut` varchar(50) NOT NULL COMMENT 'statut: SALARIE ou BENEVOLE',
  `fonction` varchar(50) NOT NULL COMMENT 'fonction: Agent de logistique, agent de sécurité ....',
  `salle` int(11) NOT NULL COMMENT 'N° de salle de spectacle',
  `salle_stand` int(11) NOT NULL COMMENT 'N° de salle de stand'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`ID_emp`, `nom_emp`, `prenom_emp`, `statut`, `fonction`, `salle`, `salle_stand`) VALUES
(6, 'yann', 'gys', 'benevole', '', 3, 0),
(7, 'steph', 'gys', 'salarie', 'agent de securite', 7, 0),
(8, 'rebecca', 'quentin', 'benevole', '', 0, 5),
(9, 'julie', 'france-court', 'benevole', '', 8, 0),
(10, 'pierre', 'kilo', 'salarie', 'agent de logistique', 6, 9);

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

CREATE TABLE `instrument` (
  `ID_inst` int(11) NOT NULL,
  `intitule` varchar(50) NOT NULL COMMENT 'intitulé: Piano, guitare, violon, batterie, flûte,'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `instrument`
--

INSERT INTO `instrument` (`ID_inst`, `intitule`) VALUES
(1, 'piano'),
(2, 'guitare'),
(3, 'violon'),
(4, 'batterie'),
(5, 'flûte ');

-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE `intervenir` (
  `ID_emp` int(11) NOT NULL,
  `ID_scene` int(11) NOT NULL,
  `salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `intervenir`
--

INSERT INTO `intervenir` (`ID_emp`, `ID_scene`, `salle`) VALUES
(6, 12, 3),
(7, 11, 7),
(9, 14, 2),
(9, 15, 8),
(8, 13, 6);

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

CREATE TABLE `jouer` (
  `ID_art` int(11) NOT NULL,
  `ID_inst` int(11) NOT NULL,
  `intitule` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jouer`
--

INSERT INTO `jouer` (`ID_art`, `ID_inst`, `intitule`) VALUES
(1, 3, 'piano'),
(3, 4, 'guitare'),
(1, 2, 'piano'),
(2, 3, 'guitare'),
(4, 3, 'violon'),
(4, 5, 'batterie'),
(4, 3, 'flûte ');

-- --------------------------------------------------------

--
-- Structure de la table `orienter`
--

CREATE TABLE `orienter` (
  `ID_emp` int(11) NOT NULL,
  `ID_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `orienter`
--

INSERT INTO `orienter` (`ID_emp`, `ID_spec`) VALUES
(8, 2),
(9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE `prestation` (
  `ID_prest` int(11) NOT NULL,
  `nombre_artiste` int(11) NOT NULL,
  `date_prestation` date NOT NULL,
  `ID_scene` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `prestation`
--

INSERT INTO `prestation` (`ID_prest`, `nombre_artiste`, `date_prestation`, `ID_scene`) VALUES
(6, 5, '2020-12-02', 11),
(7, 8, '2020-12-03', 12),
(8, 6, '2020-12-01', 13),
(9, 4, '2020-12-05', 14),
(10, 2, '2020-12-04', 15);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `ID_reser` int(11) NOT NULL,
  `numero_pass` int(11) NOT NULL,
  `ID_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`ID_reser`, `numero_pass`, `ID_spec`) VALUES
(1, 71, 2),
(2, 72, 3),
(3, 73, 5),
(4, 74, 1),
(5, 75, 4);

-- --------------------------------------------------------

--
-- Structure de la table `scene`
--

CREATE TABLE `scene` (
  `ID_scene` int(11) NOT NULL,
  `salle` int(11) NOT NULL,
  `date_service` date NOT NULL,
  `ID_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `scene`
--

INSERT INTO `scene` (`ID_scene`, `salle`, `date_service`, `ID_emp`) VALUES
(11, 3, '2020-12-02', 7),
(12, 7, '2020-12-03', 8),
(13, 4, '2020-12-02', 6),
(14, 8, '2020-12-04', 9),
(15, 6, '2020-12-01', 6);

-- --------------------------------------------------------

--
-- Structure de la table `spectateur`
--

CREATE TABLE `spectateur` (
  `ID_spec` int(11) NOT NULL,
  `nom_spec` varchar(50) NOT NULL,
  `prenom_spec` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `spectateur`
--

INSERT INTO `spectateur` (`ID_spec`, `nom_spec`, `prenom_spec`) VALUES
(1, 'hermann', 'gon'),
(2, 'luc', 'cochon'),
(3, 'poil', 'severin'),
(4, 'long', 'fabrice'),
(5, 'porche', 'ali');

-- --------------------------------------------------------

--
-- Structure de la table `stand`
--

CREATE TABLE `stand` (
  `ID_stand` int(11) NOT NULL,
  `salle_stand` int(11) NOT NULL COMMENT 'N° salle de stand',
  `ID_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stand`
--

INSERT INTO `stand` (`ID_stand`, `salle_stand`, `ID_emp`) VALUES
(11, 4, 8),
(12, 6, 9),
(13, 5, 9),
(14, 1, 7),
(15, 5, 10);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`ID_art`);

--
-- Index pour la table `assister`
--
ALTER TABLE `assister`
  ADD KEY `ID_spec` (`ID_spec`),
  ADD KEY `ID_prest` (`ID_prest`);

--
-- Index pour la table `donner`
--
ALTER TABLE `donner`
  ADD KEY `ID_prest` (`ID_prest`),
  ADD KEY `ID_art` (`ID_art`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`ID_emp`);

--
-- Index pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD PRIMARY KEY (`ID_inst`);

--
-- Index pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD KEY `ID_emp` (`ID_emp`),
  ADD KEY `ID_scene` (`ID_scene`);

--
-- Index pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD KEY `ID_art` (`ID_art`),
  ADD KEY `ID_inst` (`ID_inst`);

--
-- Index pour la table `orienter`
--
ALTER TABLE `orienter`
  ADD KEY `ID_emp` (`ID_emp`),
  ADD KEY `ID_spec` (`ID_spec`);

--
-- Index pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`ID_prest`),
  ADD KEY `ID_scene` (`ID_scene`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID_reser`),
  ADD KEY `ID_spec` (`ID_spec`);

--
-- Index pour la table `scene`
--
ALTER TABLE `scene`
  ADD PRIMARY KEY (`ID_scene`),
  ADD KEY `ID_emp` (`ID_emp`);

--
-- Index pour la table `spectateur`
--
ALTER TABLE `spectateur`
  ADD PRIMARY KEY (`ID_spec`);

--
-- Index pour la table `stand`
--
ALTER TABLE `stand`
  ADD PRIMARY KEY (`ID_stand`),
  ADD KEY `ID_emp` (`ID_emp`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `ID_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `ID_emp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `instrument`
--
ALTER TABLE `instrument`
  MODIFY `ID_inst` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `ID_prest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID_reser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `scene`
--
ALTER TABLE `scene`
  MODIFY `ID_scene` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `spectateur`
--
ALTER TABLE `spectateur`
  MODIFY `ID_spec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `stand`
--
ALTER TABLE `stand`
  MODIFY `ID_stand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `assister`
--
ALTER TABLE `assister`
  ADD CONSTRAINT `assister_ibfk_1` FOREIGN KEY (`ID_spec`) REFERENCES `spectateur` (`ID_spec`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assister_ibfk_2` FOREIGN KEY (`ID_prest`) REFERENCES `prestation` (`ID_prest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `donner`
--
ALTER TABLE `donner`
  ADD CONSTRAINT `donner_ibfk_1` FOREIGN KEY (`ID_prest`) REFERENCES `prestation` (`ID_prest`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donner_ibfk_2` FOREIGN KEY (`ID_art`) REFERENCES `artiste` (`ID_art`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`ID_emp`) REFERENCES `employe` (`ID_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`ID_scene`) REFERENCES `scene` (`ID_scene`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`ID_art`) REFERENCES `artiste` (`ID_art`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`ID_inst`) REFERENCES `instrument` (`ID_inst`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `orienter`
--
ALTER TABLE `orienter`
  ADD CONSTRAINT `orienter_ibfk_1` FOREIGN KEY (`ID_emp`) REFERENCES `employe` (`ID_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orienter_ibfk_2` FOREIGN KEY (`ID_spec`) REFERENCES `spectateur` (`ID_spec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD CONSTRAINT `prestation_ibfk_1` FOREIGN KEY (`ID_scene`) REFERENCES `scene` (`ID_scene`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`ID_spec`) REFERENCES `spectateur` (`ID_spec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `scene`
--
ALTER TABLE `scene`
  ADD CONSTRAINT `scene_ibfk_1` FOREIGN KEY (`ID_emp`) REFERENCES `employe` (`ID_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stand`
--
ALTER TABLE `stand`
  ADD CONSTRAINT `stand_ibfk_1` FOREIGN KEY (`ID_emp`) REFERENCES `employe` (`ID_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
