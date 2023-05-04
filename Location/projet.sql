-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 04 mai 2023 à 19:50
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `username`, `firstname`, `lastname`, `email`, `password`) VALUES
(0, 'test', 'test', 'test', 'test@test.com', 'test12'),
(8, 'rida', 'rida', 'lagnaoui', 'lagnaoui.rida.iir@gmail.com', 'rida123'),
(9, 'zakaria', 'zakaria', 'soualah', 'zakaria.soualah.iir@gmail.com', 'zakaria123'),
(10, 'meryem', 'meryem', 'boujja', 'meryem.boujja.iir@gmail.com', 'meryem123');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `cin` varchar(255) NOT NULL,
  `motdepasse` varchar(255) NOT NULL,
  `permis` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `datenaissance` date NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`cin`, `motdepasse`, `permis`, `prenom`, `nom`, `datenaissance`, `telephone`, `adresse`) VALUES
('M1234', 'meryem123', '12345678', 'meryem', 'BOUJJA', '2001-02-02', '0712345678', 'Rabat'),
('R1234', 'rida123', '123456', 'rida', 'LAGNAOUI', '2000-12-22', '0712345678', 'Beni Melal'),
('Z1234', 'zakaria123', '1234567', 'zakaria', 'SOUALEH', '1999-04-28', '0712345678', 'Kenitra');

-- --------------------------------------------------------

--
-- Structure de la table `locations_courantes`
--

CREATE TABLE `locations_courantes` (
  `idreservation` int(11) NOT NULL,
  `matricule` varchar(255) NOT NULL,
  `payee` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `locations_courantes`
--

INSERT INTO `locations_courantes` (`idreservation`, `matricule`, `payee`) VALUES
(0, 'A555', 1),
(2, 'A1234', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `idreservation` int(11) NOT NULL,
  `cin` varchar(255) NOT NULL,
  `idtype` int(11) NOT NULL,
  `datedepart` datetime NOT NULL,
  `dateretour` datetime NOT NULL,
  `duree` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `acceptee` tinyint(1) NOT NULL,
  `vue` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`idreservation`, `cin`, `idtype`, `datedepart`, `dateretour`, `duree`, `total`, `acceptee`, `vue`) VALUES
(4, 'R1234', 4, '2023-07-11 12:00:00', '2023-08-30 12:00:00', 19, 5700, 0, 0),
(5, 'M1234', 5, '2023-09-10 12:00:00', '2023-09-20 12:00:00', 10, 2500, 0, 0),
(6, 'Z1234', 0, '2023-04-04 20:00:00', '2023-05-04 20:00:00', 30, 18000, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `types_vehicules`
--

CREATE TABLE `types_vehicules` (
  `idtype` int(11) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `modele` varchar(255) NOT NULL,
  `carburant` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `climatisation` tinyint(1) NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `types_vehicules`
--

INSERT INTO `types_vehicules` (`idtype`, `marque`, `modele`, `carburant`, `couleur`, `climatisation`, `prix`) VALUES
(0, 'AUDI', 'A1', 'diesel', 'gris', 1, 600),
(4, 'FORD', 'Fiesta', 'essence', 'bleu', 1, 300),
(5, 'RENAULT', '2022', 'Diesel', 'black', 0, 250);

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `matricule` varchar(255) NOT NULL,
  `idtype` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`matricule`, `idtype`, `disponible`) VALUES
('A0013', 0, 1),
('A1234', 0, 0),
('A300', 1, 1),
('A555', 0, 0),
('B1234', 1, 1),
('B144', 2, 1),
('B1503', 1, 1),
('B666', 1, 1),
('CC45', 7, 1),
('CC56', 7, 1),
('D1234', 4, 1),
('D123M', 4, 1),
('F4565', 2, 1),
('K4520', 7, 1),
('SSS12', 6, 1),
('X123M', 3, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`cin`),
  ADD UNIQUE KEY `permis` (`permis`);

--
-- Index pour la table `locations_courantes`
--
ALTER TABLE `locations_courantes`
  ADD PRIMARY KEY (`idreservation`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`idreservation`);

--
-- Index pour la table `types_vehicules`
--
ALTER TABLE `types_vehicules`
  ADD PRIMARY KEY (`idtype`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`matricule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
