-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cine_pedia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cine_pedia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cine_pedia` DEFAULT CHARACTER SET utf8 ;
USE `cine_pedia` ;

-- -----------------------------------------------------
-- Table `cine_pedia`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine_pedia`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(455) NULL,
  `apellido` VARCHAR(455) NULL,
  `email` VARCHAR(455) NULL,
  `password` VARCHAR(455) NULL,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine_pedia`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine_pedia`.`peliculas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(455) NULL,
  `director` VARCHAR(455) NULL,
  `fecha` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine_pedia`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine_pedia`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pelicula_id` INT NOT NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`, `usuario_id`, `pelicula_id`),
  INDEX `fk_usuarios_has_peliculas_peliculas1_idx` (`pelicula_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_peliculas_usuarios_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_peliculas_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `cine_pedia`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_peliculas_peliculas1`
    FOREIGN KEY (`pelicula_id`)
    REFERENCES `cine_pedia`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
