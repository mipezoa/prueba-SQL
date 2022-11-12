DROP TABLE minimarket_jose.detalle_ordendecompra_id;
DROP TABLE minimarket_jose.detalle_venta_id;
CREATE SCHEMA IF NOT EXISTS minimarket_jose;
##creación de tabla 1 => venta
CREATE TABLE `minimarket_jose`.`venta`(
`venta_id` INT NOT NULL AUTO_INCREMENT,
`fecha`  DATE NOT NULL,
`tipo_comprobante`  VARCHAR(20) NOT NULL,
`num_comprobante`  INT NOT NULL,
`total_venta` INT NOT NULL,
PRIMARY KEY (`venta_id`));

##creación de tabla 2 => detalle venta
CREATE TABLE `minimarket_jose`.`detalle_venta`(
`detalle_venta_id` INT NOT NULL AUTO_INCREMENT,
`cantidad_prod`  INT NOT NULL,
`total` INT NOT NULL,
PRIMARY KEY (`detalle_venta_id`));

##creación de tabla 3 => producto
CREATE TABLE `minimarket_jose`.`producto`(
`producto_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NOT NULL,
`unidad` VARCHAR(10) NOT NULL,
`precio_venta` INT NOT NULL,
PRIMARY KEY (`producto_id`));

##creación de tabla 4 => categoria
CREATE TABLE `minimarket_jose`.`categoria`(
`categoria_id` INT NOT NULL AUTO_INCREMENT,
`tipo_producto` VARCHAR(20) NOT NULL,
`detalles` VARCHAR(30) NOT NULL,
PRIMARY KEY (`categoria_id`));

##creación de tabla 5 => cliente
CREATE TABLE `minimarket_jose`.`cliente`(
`cliente_id` INT NOT NULL AUTO_INCREMENT,
`rut` VARCHAR(12) NOT NULL,
`medio_pago` VARCHAR(10) NOT NULL,
PRIMARY KEY (`cliente_id`));

##creación de tabla 6 => proveedor
CREATE TABLE `minimarket_jose`.`proveedor`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`razon_social` VARCHAR(25) NOT NULL,
`direccion` VARCHAR(30) NOT NULL,
`telefono` VARCHAR(10) NOT NULL,
PRIMARY KEY (`proveedor_id`));

##creación de tabla 7 => orden de compra
CREATE TABLE `minimarket_jose`.`orden_de_compra`(
`orden_de_compra_id` INT NOT NULL AUTO_INCREMENT,
`fecha` DATE NOT NULL,
`tipo_comprobante` VARCHAR(30) NOT NULL,
`num_comprobante` VARCHAR(10) NOT NULL,
`total_compra` INT NOT NULL,
PRIMARY KEY (`orden_de_compra_id`));

##creación de tabla 8 => detalle_ordendecompra
CREATE TABLE `minimarket_jose`.`detalle_ordendecompra`(
`detalle_ordendecompra_id` INT NOT NULL AUTO_INCREMENT,
`cantidad_prod` INT NOT NULL,
`total` INT NOT NULL,
PRIMARY KEY (`detalle_ordendecompra_id`));

##FK para detalle ordencompra-producto
ALTER TABLE minimarket_jose.detalle_ordendecompra ADD producto_id INT NOT NULL;
ALTER TABLE minimarket_jose.detalle_ordendecompra ADD CONSTRAINT detalleOrdecompraProducto FOREIGN KEY (producto_id) REFERENCES minimarket_jose.producto(producto_id);
##FK para detalle ordencompra-ordendecompra
ALTER TABLE minimarket_jose.detalle_ordendecompra ADD orden_de_compra_id INT NOT NULL;
ALTER TABLE minimarket_jose.detalle_ordendecompra ADD CONSTRAINT detalleOrdecompraOrdendecompra FOREIGN KEY (orden_de_compra_id) REFERENCES minimarket_jose.orden_de_compra(orden_de_compra_id);
##FK para detalle venta-producto
ALTER TABLE minimarket_jose.detalle_venta ADD producto_id INT NOT NULL;
ALTER TABLE minimarket_jose.detalle_venta ADD CONSTRAINT detalleventaProducto FOREIGN KEY (producto_id) REFERENCES minimarket_jose.producto(producto_id);
##FK para detalle venta-venta
ALTER TABLE minimarket_jose.detalle_venta ADD venta_id INT NOT NULL;
ALTER TABLE minimarket_jose.detalle_venta ADD CONSTRAINT detalleventaVenta FOREIGN KEY (venta_id) REFERENCES minimarket_jose.venta(venta_id);
##FK para detalle venta-cliente
ALTER TABLE minimarket_jose.detalle_venta ADD cliente_id INT NOT NULL;
ALTER TABLE minimarket_jose.detalle_venta ADD CONSTRAINT detalleventaCliente FOREIGN KEY (cliente_id) REFERENCES minimarket_jose.cliente(cliente_id);

##FK para producto-categoria
ALTER TABLE minimarket_jose.producto ADD categoria_id INT NOT NULL;
ALTER TABLE minimarket_jose.producto ADD CONSTRAINT productoCategoria FOREIGN KEY (categoria_id) REFERENCES minimarket_jose.categoria(categoria_id);
##FK para ordencompra-proveedor
ALTER TABLE minimarket_jose.orden_de_compra ADD proveedor_id INT NOT NULL;
ALTER TABLE minimarket_jose.orden_de_compra ADD CONSTRAINT ordencompraProveedor FOREIGN KEY (proveedor_id) REFERENCES minimarket_jose.proveedor(proveedor_id);

##Ingreso de 4 datos de categorias o tipos de productos
INSERT INTO minimarket_jose.categoria (categoria_id,tipo_producto,detalles) VALUES (1,'limpieza','vence en 5 años');
INSERT INTO minimarket_jose.categoria (categoria_id,tipo_producto,detalles) VALUES (2,'verduleria','vence antes de 30 días');
INSERT INTO minimarket_jose.categoria (categoria_id,tipo_producto,detalles) VALUES (3,'panaderia','vence antes de 7 días');
INSERT INTO minimarket_jose.categoria (categoria_id,tipo_producto,detalles) VALUES (4,'bebidas','vence en 5 años');
##Ingreso de 5 datos de productos
INSERT INTO minimarket_jose.producto (producto_id,nombre,unidad,precio_venta,categoria_id) VALUES (1,'quix','250ml',2400,1);
INSERT INTO minimarket_jose.producto (producto_id,nombre,unidad,precio_venta,categoria_id) VALUES (2,'hallulla','1kg',1500,3);
INSERT INTO minimarket_jose.producto (producto_id,nombre,unidad,precio_venta,categoria_id) VALUES (3,'marraqueta','1kg',1200,3);
INSERT INTO minimarket_jose.producto (producto_id,nombre,unidad,precio_venta,categoria_id) VALUES (4,'tomate','1kg',1800,2);
INSERT INTO minimarket_jose.producto (producto_id,nombre,unidad,precio_venta,categoria_id) VALUES (5,'cocacola','1L',2400,4);


select minimarket_jose.producto_id, minimarket_jose.categoria_id
from producto
inner join categoria on producto.categoria_id = categoria.categoria_id;


select *
from minimarket_jose.producto
