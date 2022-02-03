-- ---
-- Configuration globale
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Créer la base de données et la sélectionner
-- ---

CREATE DATABASE `memo_e1995593_e1939817`;
USE `memo_e1995593_e1939817`;

-- ---
-- Table 'tache'
-- 
-- ---

DROP TABLE IF EXISTS `tache`;
		
CREATE TABLE `tache`
(
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `texte` VARCHAR(200) NOT NULL COMMENT 'Texte de la tâche.',
  `accomplie` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Valeur 0 pour non-accomplie, et 1 pour accomplie.',
  `date_ajout` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date à laquelle la tâche est ajoutée',
  `utilisateur_id` INTEGER NULL DEFAULT NULL COMMENT 'Ce champ n''est pas utilisé dans le TP, ignorez-le!',
  PRIMARY KEY (`id`)
);


-- ---
-- Propriétés des tables
-- ---

ALTER TABLE `tache` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Relations (clés étrangères)
-- ---