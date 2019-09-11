-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema seguridad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seguridad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seguridad` DEFAULT CHARACTER SET utf8 ;
USE `seguridad` ;

-- -----------------------------------------------------
-- Table `seguridad`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_usuario` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `nombre_usuario` VARCHAR(45) NULL,
  `apellido_usuarios` VARCHAR(45) NULL,
  `password_usuario` VARCHAR(45) NULL,
  `cambio_contrasena` TINYINT NULL,
  `estado_usuario` TINYINT NULL,
  PRIMARY KEY (`PK_id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_modulo` (
  `PK_id_Modulo` INT NOT NULL,
  `nombre_modulo` VARCHAR(45) NULL,
  `descripcion_modulo` VARCHAR(200) NULL,
  `estado_modulo` TINYINT NULL,
  PRIMARY KEY (`PK_id_Modulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_aplicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_aplicacion` (
  `PK_id_aplicacion` INT NOT NULL,
  `PK_id_modulo` INT NOT NULL,
  `nombre_aplicacion` VARCHAR(45) NULL,
  `descripcion_aplicacion` VARCHAR(200) NULL,
  `estado_aplicacion` TINYINT NULL,
  PRIMARY KEY (`PK_id_aplicacion`, `PK_id_modulo`),
  CONSTRAINT `fk_Aplicacion_Modulo`
    FOREIGN KEY (`PK_id_modulo`)
    REFERENCES `seguridad`.`tbl_modulo` (`PK_id_Modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_perfil_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_perfil_encabezado` (
  `PK_id_perfil` INT NOT NULL,
  `nombre_perfil` VARCHAR(45) NULL,
  `descripcion_perfil` VARCHAR(200) NULL,
  `estado_perfil` TINYINT NULL,
  PRIMARY KEY (`PK_id_perfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_perfil_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_perfil_detalle` (
  `PK_id_perfil` INT NOT NULL,
  `PK_id_aplicacion` INT NOT NULL,
  `ingresar` TINYINT NULL,
  `consultar` TINYINT NULL,
  `modificar` TINYINT NULL,
  `eliminar` TINYINT NULL,
  `imprimir` TINYINT NULL,
  PRIMARY KEY (`PK_id_perfil`, `PK_id_aplicacion`),
  CONSTRAINT `fk_Perfil_detalle_Perfil1`
    FOREIGN KEY (`PK_id_perfil`)
    REFERENCES `seguridad`.`tbl_perfil_encabezado` (`PK_id_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_detalle_Aplicacion1`
    FOREIGN KEY (`PK_id_aplicacion`)
    REFERENCES `seguridad`.`tbl_aplicacion` (`PK_id_aplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_bitacora` (
  `PK_id_bitacora` INT NOT NULL AUTO_INCREMENT,
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `fecha` DATE NULL,
  `hora` TIME NULL,
  `host` VARCHAR(45) NULL,
  `ip` VARCHAR(25) NULL,
  `accion` VARCHAR(50) NULL,
  `tabla` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_id_bitacora`, `PK_id_usuario`),
  CONSTRAINT `fk_Bitacora_Usuario1`
    FOREIGN KEY (`PK_id_usuario`)
    REFERENCES `seguridad`.`tbl_usuario` (`PK_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_usuario_perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_usuario_perfil` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `PK_id_perfil` INT NOT NULL,
  PRIMARY KEY (`PK_id_usuario`, `PK_id_perfil`),
  CONSTRAINT `fk_Usuario_perfil_Usuario1`
    FOREIGN KEY (`PK_id_usuario`)
    REFERENCES `seguridad`.`tbl_usuario` (`PK_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_perfil_Perfil1`
    FOREIGN KEY (`PK_id_perfil`)
    REFERENCES `seguridad`.`tbl_perfil_encabezado` (`PK_id_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguridad`.`tbl_usuario_aplicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguridad`.`tbl_usuario_aplicacion` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `PK_id_aplicacion` INT NOT NULL,
  `ingresar` TINYINT NULL,
  `consulta` TINYINT NULL,
  `modificar` TINYINT NULL,
  `eliminar` TINYINT NULL,
  `imprimir` TINYINT NULL,
  PRIMARY KEY (`PK_id_usuario`, `PK_id_aplicacion`),
  CONSTRAINT `fk_Usuario_aplicacion_Usuario1`
    FOREIGN KEY (`PK_id_usuario`)
    REFERENCES `seguridad`.`tbl_usuario` (`PK_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usuario_aplicacion_tbl_aplicacion1`
    FOREIGN KEY (`PK_id_aplicacion`)
    REFERENCES `seguridad`.`tbl_aplicacion` (`PK_id_aplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DELIMITER $$
CREATE TRIGGER `actualizarClave` BEFORE UPDATE ON `tbl_usuario` FOR EACH ROW BEGIN
SET NEW.password_usuario = MD5(NEW.password_usuario);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertarClave` BEFORE INSERT ON `tbl_usuario` FOR EACH ROW BEGIN
SET NEW.password_usuario = MD5(NEW.password_usuario);
END
$$
DELIMITER ;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedimientoLogin` (IN `usuario` VARCHAR(25), IN `clave` VARCHAR(25))  NO SQL
Select tbl_usuario.PK_id_Usuario FROM tbl_usuario where tbl_usuario.PK_id_Usuario = usuario and tbl_usuario.password_usuario = MD5(clave) AND tbl_usuario.estado_usuario=1$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;