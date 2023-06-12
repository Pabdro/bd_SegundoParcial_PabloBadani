USE baseDatosSegParcial;

CREATE TABLE Usuarios (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);
CREATE TABLE Pedidos (
  id INT PRIMARY KEY,
  usuario_id INT,
  cantidad INT,
  fecha_pedido DATE,
  precio_total DECIMAL,
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
CREATE TABLE Direccion (
  id INT PRIMARY KEY,
  pais VARCHAR(50),
  departamento VARCHAR(50)
);
CREATE TABLE Proveedores (
  id INT PRIMARY KEY,
  nombre_empresa VARCHAR(50),
  direccion_id INT,
  numero_contacto VARCHAR(20),
  usuario_id INT,
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
  FOREIGN KEY (direccion_id) REFERENCES Direccion(id)
);
CREATE TABLE Marca (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  modelo VARCHAR(50)
);
CREATE TABLE Vehiculos (
  id INT PRIMARY KEY,
  numero_placa VARCHAR(20),
  anio INT,
  tipo_combustible VARCHAR(50),
  tipo_vehiculo VARCHAR(50),
  usuario_id INT,
  marca_id INT,
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
  FOREIGN KEY (marca_id) REFERENCES Marca(id)
);
CREATE TABLE Filtros (
  id INT PRIMARY KEY,
  capacidad_filtrado INT,
  tipo_filtro VARCHAR(50),
  precio_unitario DECIMAL(10, 2),
  pedido_id INT,
  FOREIGN KEY (pedido_id) REFERENCES Pedidos(id)
);
CREATE TABLE Adquisiciones (
  id INT PRIMARY KEY,
  fecha_adquisicion DATE,
  cantidad_adquirida INT,
  filtros_id INT,
  FOREIGN KEY (filtros_id) REFERENCES Filtros(id)
);
CREATE TABLE Detalles_Adquisiciones (
  id INT PRIMARY KEY,
  estado_adquisicion VARCHAR(50),
  adquisicion_id INT,
  proveedor_id INT,
  FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id),
  FOREIGN KEY (adquisicion_id) REFERENCES Adquisiciones(id)
);
CREATE TABLE Entregas (
  id INT PRIMARY KEY,
  pedido_id INT,
  fecha_entrega DATE,
  estado VARCHAR(50),
  observaciones TEXT,
  FOREIGN KEY (pedido_id) REFERENCES Pedidos(id)
);

INSERT INTO Usuarios (id, nombre, apellido) VALUES (1, 'Camila', 'Grandy');
INSERT INTO Usuarios (id, nombre, apellido) VALUES (2, 'Miguel', 'Molina');
INSERT INTO Usuarios (id, nombre, apellido) VALUES (3, 'Gabriel', 'Neme');
INSERT INTO Usuarios (id, nombre, apellido) VALUES (4, 'Richard', 'Rojas');
INSERT INTO Usuarios (id, nombre, apellido) VALUES (5, 'Lionel', 'Messi');

INSERT INTO Pedidos (id, usuario_id, cantidad, fecha_pedido, precio_total) VALUES (1, 1, 5, '2023-06-09', 100.00);
INSERT INTO Pedidos (id, usuario_id, cantidad, fecha_pedido, precio_total) VALUES (2, 2, 1, '2023-06-09', 12.50);
INSERT INTO Pedidos (id, usuario_id, cantidad, fecha_pedido, precio_total) VALUES (3, 3, 5, '2023-06-08', 78.65);
INSERT INTO Pedidos (id, usuario_id, cantidad, fecha_pedido, precio_total) VALUES (4, 4, 2, '2023-06-07', 29.99);
INSERT INTO Pedidos (id, usuario_id, cantidad, fecha_pedido, precio_total) VALUES (5, 5, 4, '2023-06-06', 56.75);

INSERT INTO Direccion (id, pais, departamento) VALUES (1, 'Bolivia', 'Santa Cruz');
INSERT INTO Direccion (id, pais, departamento) VALUES (2, 'Bolivia', 'La Paz');
INSERT INTO Direccion (id, pais, departamento) VALUES (3, 'Bolivia', 'Santa Cruz');
INSERT INTO Direccion (id, pais, departamento) VALUES (4, 'Argentina', 'Buenos Aires');
INSERT INTO Direccion (id, pais, departamento) VALUES (5, 'Bolivia', 'Cochabamba');

INSERT INTO Proveedores (id, nombre_empresa, direccion_id, numero_contacto, usuario_id) VALUES (1, 'EmpresaProveedor', 1, '123456789', 1);
INSERT INTO Proveedores (id, nombre_empresa, direccion_id, numero_contacto, usuario_id) VALUES (2, 'PTX Ltd', 2, '512345678', 2);
INSERT INTO Proveedores (id, nombre_empresa, direccion_id, numero_contacto, usuario_id) VALUES (3, 'Lorax Inc', 3, '123459876', 3);
INSERT INTO Proveedores (id, nombre_empresa, direccion_id, numero_contacto, usuario_id) VALUES (4, 'Ostiaso Co', 4, '324564321', 4);
INSERT INTO Proveedores (id, nombre_empresa, direccion_id, numero_contacto, usuario_id) VALUES (5, 'Simon Ltd', 5, '87436789', 5);

INSERT INTO Marca (id, nombre, modelo) VALUES (1, 'Toyota', 'Corolla');
INSERT INTO Marca (id, nombre, modelo) VALUES (2, 'Toyota', 'Rush');
INSERT INTO Marca (id, nombre, modelo) VALUES (3, 'Ford', 'Mustang');
INSERT INTO Marca (id, nombre, modelo) VALUES (4, 'Chevrolet', 'Camaro');
INSERT INTO Marca (id, nombre, modelo) VALUES (5, 'Chevrolet', 'Onix');

INSERT INTO Vehiculos (id, numero_placa, anio, tipo_combustible, tipo_vehiculo, usuario_id, marca_id) VALUES (1, 'ABC123', 2022, 'Gasolina', 'Moto', 1, 1);
INSERT INTO Vehiculos (id, numero_placa, anio, tipo_combustible, tipo_vehiculo, usuario_id, marca_id) VALUES (2, 'XYZ789', 2023, 'Diésel', 'Camioneta', 2, 2);
INSERT INTO Vehiculos (id, numero_placa, anio, tipo_combustible, tipo_vehiculo, usuario_id, marca_id) VALUES (3, 'DEF456', 2021, 'Gasolina', 'Vagoneta', 3, 3);
INSERT INTO Vehiculos (id, numero_placa, anio, tipo_combustible, tipo_vehiculo, usuario_id, marca_id) VALUES (4, 'GHI789', 2022, 'Gas', 'Furgoneta', 4, 4);
INSERT INTO Vehiculos (id, numero_placa, anio, tipo_combustible, tipo_vehiculo, usuario_id, marca_id) VALUES (5, 'JKL321', 2023, 'Diesel', 'Cuadratrack', 5, 5);

INSERT INTO Filtros (id, capacidad_filtrado, tipo_filtro, precio_unitario, pedido_id) VALUES (1, 10, 'Aceite', 50.00, 1);
INSERT INTO Filtros (id, capacidad_filtrado, tipo_filtro, precio_unitario, pedido_id) VALUES (2, 50, 'Combustible', 8.50, 2);
INSERT INTO Filtros (id, capacidad_filtrado, tipo_filtro, precio_unitario, pedido_id) VALUES (3, 200, 'Aceite', 19.99, 3);
INSERT INTO Filtros (id, capacidad_filtrado, tipo_filtro, precio_unitario, pedido_id) VALUES (4, 75, 'Aire', 15.75, 4);
INSERT INTO Filtros (id, capacidad_filtrado, tipo_filtro, precio_unitario, pedido_id) VALUES (5, 120, 'Combustible', 10.50, 5);

INSERT INTO Adquisiciones (id, fecha_adquisicion, cantidad_adquirida, filtros_id) VALUES (1, '2023-06-09', 10, 1);
INSERT INTO Adquisiciones (id, fecha_adquisicion, cantidad_adquirida, filtros_id) VALUES (2, '2023-06-10', 5, 2);
INSERT INTO Adquisiciones (id, fecha_adquisicion, cantidad_adquirida, filtros_id) VALUES (3, '2023-06-08', 8, 3);
INSERT INTO Adquisiciones (id, fecha_adquisicion, cantidad_adquirida, filtros_id) VALUES (4, '2023-06-07', 3, 4);
INSERT INTO Adquisiciones (id, fecha_adquisicion, cantidad_adquirida, filtros_id) VALUES (5, '2023-06-06', 6, 5);

INSERT INTO Detalles_Adquisiciones (id, estado_adquisicion, adquisicion_id, proveedor_id) VALUES (1, 'Pendiente', 1, 1);
INSERT INTO Detalles_Adquisiciones (id, estado_adquisicion, adquisicion_id, proveedor_id) VALUES (2, 'Completada', 2, 2);
INSERT INTO Detalles_Adquisiciones (id, estado_adquisicion, adquisicion_id, proveedor_id) VALUES (3, 'En proceso', 3, 3);
INSERT INTO Detalles_Adquisiciones (id, estado_adquisicion, adquisicion_id, proveedor_id) VALUES (4, 'Pendiente', 4, 4);
INSERT INTO Detalles_Adquisiciones (id, estado_adquisicion, adquisicion_id, proveedor_id) VALUES (5, 'Completada', 5, 5);

INSERT INTO Entregas (id, pedido_id, fecha_entrega, estado, observaciones) VALUES (1, 1, '2023-06-10', 'Entregado', 'Observaciones');
INSERT INTO Entregas (id, pedido_id, fecha_entrega, estado, observaciones) VALUES (2, 2, '2023-06-09', 'Entregado', 'Todo en buen estado');
INSERT INTO Entregas (id, pedido_id, fecha_entrega, estado, observaciones) VALUES (3, 3, '2023-06-08', 'Pendiente', 'Bien todo');
INSERT INTO Entregas (id, pedido_id, fecha_entrega, estado, observaciones) VALUES (4, 4, '2023-06-07', 'Entregado', 'Empaque dañado');
INSERT INTO Entregas (id, pedido_id, fecha_entrega, estado, observaciones) VALUES (5, 5, '2023-06-06', 'Entregado', 'Faltante de un artículo');

CREATE TABLE Auditoria_Usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  accion VARCHAR(50),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Auditoria_Filtros (
  id INT PRIMARY KEY AUTO_INCREMENT,
  accion VARCHAR(50),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Auditoria_Pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  accion VARCHAR(50),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Auditoria_Proveedores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  accion VARCHAR(50),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Auditoria_Vehiculos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  accion VARCHAR(50),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_direccion_pais_departamento ON Direccion (pais, departamento);

CREATE INDEX idx_vehiculos_usuario_id ON Vehiculos (usuario_id);

CREATE INDEX idx_pedidos_usuario_id_fecha_pedido ON Pedidos (usuario_id, fecha_pedido);

CREATE INDEX idx_pedidos_usuario_id ON Pedidos (usuario_id);
CREATE INDEX idx_adquisiciones_filtros_id ON Adquisiciones (filtros_id);
CREATE INDEX idx_detalles_adquisiciones_proveedor_id ON Detalles_Adquisiciones (proveedor_id);
CREATE INDEX idx_proveedores_direccion_id ON Proveedores (direccion_id);
CREATE INDEX idx_usuarios_id ON Usuarios (id);

CREATE INDEX idx_entregas_pedido_id ON Entregas (pedido_id);