USE baseDatosSegParcial;

DELIMITER //
CREATE PROCEDURE BuscarProveedoresMismoDepartamento (
  IN departamento VARCHAR(50)
)
BEGIN
  SELECT p.id, p.nombre_empresa, d.departamento
  FROM Proveedores p
  INNER JOIN Direccion d ON p.direccion_id = d.id
  WHERE d.departamento = departamento;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE BuscarVehiculosPorMarca (
  IN marca VARCHAR(50)
)
BEGIN
  SELECT v.id, v.numero_placa, v.anio, v.tipo_combustible, v.tipo_vehiculo
  FROM Vehiculos v
  INNER JOIN Marca m ON v.marca_id = m.id
  WHERE m.nombre = marca;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE BuscarInfoAdquisicionPorTipoFiltro (
  IN tipo_filtro VARCHAR(50)
)
BEGIN
  SELECT a.id AS id_adquisicion, f.tipo_filtro, a.fecha_adquisicion, a.cantidad_adquirida
  FROM Adquisiciones a
  INNER JOIN Filtros f ON a.filtros_id = f.id
  WHERE f.tipo_filtro = tipo_filtro;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GenerarReportePedidosDetallesAdquisicion ()
BEGIN
  SELECT p.id AS id_pedido, p.fecha_pedido, p.precio_total, d.estado_adquisicion, d.proveedor_id
  FROM Pedidos p
  INNER JOIN Detalles_Adquisiciones d ON p.id = d.adquisicion_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GenerarReporteUsuariosEntregas ()
BEGIN
  SELECT u.id AS id_usuario, u.nombre, u.apellido, e.id AS id_entrega, e.fecha_entrega, e.estado, e.observaciones
  FROM Usuarios u
  INNER JOIN Pedidos p ON u.id = p.usuario_id
  INNER JOIN Entregas e ON p.id = e.pedido_id;
END //
DELIMITER ;