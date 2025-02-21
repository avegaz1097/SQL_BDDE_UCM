-- Ejemplo GROUP BY. Muestra cuantos empleados trabajan en cada departamento 
select idDepartamento, count(idEmpleado) from empleado group by idDepartamento;

-- Ejemplo de resultados totales de una consulta. Total de una factura a partir de las líneas de detalle de la misma.
SELECT IDFACTURA, SUM(PRECIOUNITARIO * CANTIDAD) AS TOTAL FROM DETALLE_FACTURA GROUP BY IDFACTURA;

-- Ejemplo Subqueries. Devuleve las filas de la tabla factura, de los clientes cuya ciudad es quebec
SELECT * FROM FACTURA WHERE IDCLIENTE IN (SELECT IDCLIENTE FROM CLIENTE WHERE ciudad = 'Quebec');

-- Triggers. Insertar datos en una tabla de respaldo para facturas y líneas de factura. Se deben crear las tablas de backup antes. 
-- Creacion de tablas de backup
USE COMPRAS;
DROP TABLE IF EXISTS `factura_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_backup` (
  `idFactura` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `detalle_factura_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura_backup` (
  `idDetalle` int(11) NOT NULL,
  `idFactura` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Creación de triggers 
DELIMITER $$
CREATE TRIGGER facturas_backup_trigger AFTER INSERT ON factura
FOR EACH ROW
BEGIN
  INSERT INTO factura_backup (idFactura, fecha, idCliente, idEmpleado)
  VALUES (NEW.idFactura, NEW.fecha, NEW.idCliente, NEW.idEmpleado);
END;
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER detalle_factura_backup_trigger AFTER INSERT ON detalle_factura
FOR EACH ROW
BEGIN
  INSERT INTO detalle_factura_backup (idDetalle, idFactura, idProducto, precioUnitario, cantidad)
  VALUES (NEW.idDetalle, NEW.idFactura, NEW.idProducto, NEW.precioUnitario, NEW.cantidad);
END;
$$
DELIMITER ;
-- Test triggers
INSERT INTO factura (fecha, idCliente, idEmpleado) VALUES (NOW(), 1, 1);
select * from factura_backup;

INSERT INTO detalle_factura (idFactura, idProducto, precioUnitario, cantidad) VALUES (LAST_INSERT_ID(), 1, 10.00, 2);
select * from detalle_factura_backup;

-- VIEW de precio medio por categoria

CREATE VIEW precio_medio_categoria AS
SELECT
    c.nombre AS categoria,
    AVG(p.precioUnitario) AS precio_medio
FROM
    producto p
INNER JOIN categoria c ON p.idCategoria = c.idCategoria
GROUP BY
    c.nombre;
    
-- PROCEDURE 

DELIMITER $$

CREATE PROCEDURE productos_por_venta(IN id_factura INT)
BEGIN
  DECLARE cantidad_productos INT;

  SELECT SUM(cantidad) INTO cantidad_productos
  FROM detalle_factura
  WHERE idFactura = id_factura;

  IF cantidad_productos = 3 THEN
    SELECT 'Se vendieron exactamente 3 productos';
  ELSEIF cantidad_productos > 3 THEN
    SELECT 'Se vendieron más de 3 productos';
  ELSE
    SELECT 'Se vendieron menos de 3 productos';
  END IF;
END $$
DELIMITER ;

-- Prueba. La factura 1 son más de 3. La factura 10 son 3. La factura 17 son menos de 3.
call productos_por_venta(1);
call productos_por_venta(10);
call productos_por_venta(17);
