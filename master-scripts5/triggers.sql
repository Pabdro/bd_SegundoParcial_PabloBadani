USE baseDatosSegParcial;

DELIMITER //
CREATE TRIGGER no_numeros_usuarios
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
  IF NEW.nombre REGEXP '[0-9]' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permiten numeros en el nombre';
  END IF;
  
  IF NEW.apellido REGEXP '[0-9]' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permiten numeros en el apellido';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER no_anio_menor_2020_vehiculos
BEFORE INSERT ON Vehiculos
FOR EACH ROW
BEGIN
  IF NEW.anio < 2020 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El anio debe ser igual o mayor a 2020';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER actualizar_estado_entrega
BEFORE INSERT ON Entregas
FOR EACH ROW
BEGIN
  DECLARE estado VARCHAR(50);
  
  IF NEW.fecha_entrega < CURDATE() THEN
    SET estado = 'Entregado';
  ELSE
    SET estado = 'Pendiente';
  END IF;
  
  SET NEW.estado = estado;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER evitar_eliminacion_proveedor
BEFORE DELETE ON Proveedores
FOR EACH ROW
BEGIN
  DECLARE total INT;
  SET total = (
    SELECT COUNT(*) FROM Detalles_Adquisiciones WHERE proveedor_id = OLD.id
  );
  IF total > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No se puede eliminar el proveedor debido a que tiene adquisiciones asociadas.';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER verificar_usuario_duplicado
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
  DECLARE user_count INT;
  
  SELECT COUNT(*) INTO user_count
  FROM Usuarios
  WHERE nombre = NEW.nombre AND apellido = NEW.apellido;
  
  IF user_count > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Ya existe un usuario con el mismo nombre y apellido.';
  END IF;
END //
DELIMITER ;

CREATE TRIGGER audit_insert_usuario
AFTER INSERT ON Usuarios
FOR EACH ROW
INSERT INTO Auditoria_Usuarios (accion, fecha) VALUES ('Insercion de usuario', NOW());

CREATE TRIGGER audit_insert_filtros
AFTER INSERT ON Filtros
FOR EACH ROW
INSERT INTO Auditoria_Filtros (accion, fecha) VALUES ('Insercion de usuario', NOW());

CREATE TRIGGER audit_insert_pedidos
AFTER INSERT ON Pedidos
FOR EACH ROW
INSERT INTO Auditoria_Pedidos (accion, fecha) VALUES ('Insercion de usuario', NOW());

CREATE TRIGGER audit_insert_proveedores
AFTER INSERT ON Proveedores
FOR EACH ROW
INSERT INTO Auditoria_Proveedores (accion, fecha) VALUES ('Insercion de usuario', NOW());

CREATE TRIGGER audit_insert_vehiculos
AFTER INSERT ON Vehiculos
FOR EACH ROW
INSERT INTO Auditoria_Vehiculos (accion, fecha) VALUES ('Inserción de usuario', NOW());