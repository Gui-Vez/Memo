-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 04 déc. 2020 à 23:38
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `memo_e1995593_e1939817`
--
CREATE DATABASE IF NOT EXISTS `memo_e1995593_e1939817` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `memo_e1995593_e1939817`;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `id` int(11) NOT NULL,
  `texte` varchar(200) CHARACTER SET latin1 NOT NULL COMMENT 'Texte de la tâche.',
  `accomplie` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Valeur 0 pour non-accomplie, et 1 pour accomplie.',
  `date_ajout` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date à laquelle la tâche est ajoutée',
  `utilisateur_id` int(11) DEFAULT NULL COMMENT 'Ce champ n''est pas utilisé dans le TP, ignorez-le!'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `texte`, `accomplie`, `date_ajout`, `utilisateur_id`) VALUES
(1, 'Remplir le verre de lait', 0, '2020-12-04 17:30:28', NULL),
(2, 'Écrire le poème «La neige me fait mal»', 1, '2020-12-04 17:30:28', NULL),
(3, 'Tourner un film avec Bruce Willis', 0, '2020-12-04 17:32:42', NULL),
(4, 'Acheter une robe de chambre et des pantoufles', 0, '2020-12-04 17:32:42', NULL),
(5, 'Faire le sapin de Noël', 0, '2020-12-04 17:35:31', NULL),
(6, 'Acheter des biscuits au chocolat', 1, '2020-12-04 17:35:31', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
