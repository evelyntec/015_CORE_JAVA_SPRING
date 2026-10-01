DROP DATABASE IF EXISTS `canciones_db`;
CREATE DATABASE `canciones_db`;
USE `canciones_db`;

CREATE TABLE `artistas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `biografia` varchar(255) DEFAULT NULL,
  `fecha_de_creacion` datetime DEFAULT NULL,
  `fecha_de_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `canciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  `fecha_de_creacion` datetime DEFAULT NULL,
  `fecha_de_actualizacion` datetime DEFAULT NULL,
  `artista_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cancion_artista` (`artista_id`),
  CONSTRAINT `fk_cancion_artista` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO artistas (nombre, apellido, biografia, fecha_de_creacion, fecha_de_actualizacion)
VALUES ('Gustavo', 'Cerati', 'Cantante y compositor argentino, lider de Soda Stereo.', NOW(), NOW());

INSERT INTO artistas (nombre, apellido, biografia, fecha_de_creacion, fecha_de_actualizacion)
VALUES ('Freddie', 'Mercury', 'Cantante britanico, vocalista de la banda Queen.', NOW(), NOW());

INSERT INTO artistas (nombre, apellido, biografia, fecha_de_creacion, fecha_de_actualizacion)
VALUES ('Juan', 'Aristizabal', 'Cantautor colombiano conocido como Juanes.', NOW(), NOW());

INSERT INTO canciones (titulo, album, genero, idioma, fecha_de_creacion, fecha_de_actualizacion, artista_id)
VALUES ('De Musica Ligera', 'Cancion Animal', 'Rock', 'Espanol', NOW(), NOW(), 1);

INSERT INTO canciones (titulo, album, genero, idioma, fecha_de_creacion, fecha_de_actualizacion, artista_id)
VALUES ('Bohemian Rhapsody', 'A Night at the Opera', 'Rock', 'Ingles', NOW(), NOW(), 2);

INSERT INTO canciones (titulo, album, genero, idioma, fecha_de_creacion, fecha_de_actualizacion, artista_id)
VALUES ('La Camisa Negra', 'Mi Sangre', 'Pop', 'Espanol', NOW(), NOW(), 3);