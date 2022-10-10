CREATE TABLE IF NOT EXISTS ad_acciones (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(250) ,
  abreviatura varchar(20) ,
  nombre varchar(250) ,
  estado varchar(250) ,
  PRIMARY KEY (codigo)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;



CREATE TABLE IF NOT EXISTS ad_aplicaciones (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(250) ,
  abreviatura varchar(20) ,
  nombre varchar(250) ,
  estado varchar(250) ,
  PRIMARY KEY (codigo)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;




CREATE TABLE IF NOT EXISTS ad_logs (
  id int(11) NOT NULL AUTO_INCREMENT,
  idad_usuario int(11) DEFAULT NULL,
  codad_accion int(11) DEFAULT NULL,
  fecha datetime ,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;




CREATE TABLE IF NOT EXISTS ad_opciones_usuarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  idad_usuario int(11) DEFAULT NULL,
  codad_opcion int(11) DEFAULT NULL,
  idad_logs int(11) DEFAULT NULL,
  fecha_registro datetime default now(),
  fecha_modificacion datetime,
  estado varchar(50) ,
  PRIMARY KEY (id)
) ;


CREATE TABLE IF NOT EXISTS ad_usuarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_aplicacion int(11), 
  codad_empresa int(11),
  nombres varchar(100) ,
  primer_apellido varchar(150) ,
  segundo_apellido varchar(150) ,  
  nro_documento varchar(30) ,
  tipo_documento varchar(20) ,
  idad_logs int(11) DEFAULT NULL,
  direccion varchar(250) ,
  tel_cel varchar(50) ,
  fecha_nacimiento date DEFAULT NULL,
  correo varchar(100) ,
  cargo varchar(250) ,
  login varchar(50) ,
  clave varchar(250) ,
  tipo_user varchar(250) ,
  estado varchar(250) ,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;




CREATE TABLE IF NOT EXISTS ad_modulos (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  codad_aplicacion int(11) ,
  descripcion varchar(250) ,
  abreviatura varchar(20) ,
  nombre varchar(250) ,
  estado varchar(250) ,
  PRIMARY KEY (codigo)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;


CREATE TABLE IF NOT EXISTS ad_opciones (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  codad_modulo int(11) ,
  codad_opcion int(11) DEFAULT NULL,
  opcion varchar(20) ,
  descripcion varchar(250) ,
  link varchar(250) ,
  nivel int(11) ,
  orden int(11) ,
  estado varchar(250) ,
  PRIMARY KEY (codigo)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

CREATE TABLE IF NOT EXISTS ad_empresas (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  denominacion varchar(100) ,
  correo varchar(100) ,
  abreviatura varchar(100) ,
  propietario varchar(100) ,
  telefono varchar(100) ,
  direccion varchar(100) ,
  descripcion_entidad varchar(200) ,
  fecha datetime ,
  estado varchar(250) ,
  PRIMARY KEY (codigo)
)


CREATE TABLE IF NOT EXISTS ad_configuraciones_empresas (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  concepto varchar(100) ,
  valor1 varchar(100) ,
  valor2 varchar(100) ,
  valor3 varchar(100) ,
  valor4 varchar(100) ,
  valor5 varchar(100) ,
  fecha datetime ,
  fecha_registro datetime ,
  PRIMARY KEY (id)
)


CREATE TABLE IF NOT EXISTS ad_control_acceso (
  id int(11) NOT NULL AUTO_INCREMENT,
  id_usuario int(11) ,
  aplicacion varchar(100) ,
  ip varchar(100) ,  
  fecha_registro datetime default now(),
  PRIMARY KEY (id)
)

-------------------- tablas de contabilidad-----------------------

CREATE TABLE IF NOT EXISTS cb_cuentas (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  codcb_cuenta int(11) DEFAULT NULL,
  denominacion_cuenta varchar(100) ,
  descripcion_cuenta varchar(200) ,  
  nivel int(11) ,  
  estado varchar(250) ,
  PRIMARY KEY (codigo)
) 



CREATE TABLE IF NOT EXISTS cb_cuentas (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  codcb_cuenta int(11) DEFAULT NULL,
  denominacion_cuenta varchar(100) ,
  descripcion_cuenta varchar(200) ,  
  nivel int(11) ,  
  estado varchar(250) ,
  PRIMARY KEY (codigo)
)




CREATE TABLE IF NOT EXISTS cb_cuentas (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  codcb_cuenta int(11) DEFAULT NULL,
  denominacion_cuenta varchar(100) ,
  descripcion_cuenta varchar(200) ,  
  nivel int(11) ,  
  estado varchar(250) ,
  PRIMARY KEY (codigo)
)


----------------------VENTAS
CREATE TABLE IF NOT EXISTS ve_linea_producto (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  nombre_liena varchar(200) ,
  estado varchar(20) ,
  PRIMARY KEY (id)
) 


CREATE TABLE ve_proveedores (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  idve_linea int(11) ,
  nombre_proveedor varchar(200) ,
  telefono varchar(20) ,
  direccion varchar(100) ,
  estado varchar(20) ,
  PRIMARY KEY (id)
)

CREATE TABLE ve_clientes (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  num_documento varchar(200) ,
  nombres varchar(100) ,
  telefono varchar(20) ,
  direccion varchar(100) ,
  email varchar(100) ,
  estado varchar(20) ,
  PRIMARY KEY (id)
)


CREATE TABLE ve_productos (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  idve_proveedor int(11) ,
  idve_linea int(11) ,
  valor1 varchar(200) ,
  valor2 varchar(200) ,
  composicion varchar(200) ,
  presentacion varchar(200) ,
  unidad varchar(100) ,
  imagen varchar(100) ,
  fecha_registro datetime default now(),
  fecha_modificacion datetime,
  estado varchar(20) ,
  PRIMARY KEY (id)
);

create table ve_ingresos
(
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int,
  gestion int,
  order_compra varchar(100),  
  nro_factura varchar(20),  
  fecha_factura date,
  monto_total_factura float DEFAULT 0,
  id_provedor int,
  descripcion_ingreso text,  
  fecha_ingreso date, 
  id_usuario_registro int,
  fecha_registro datetime default now(),
  id_usuario_update int,
  fecha_modificacion datetime,
  estado varchar(3) DEFAULT 'ELB',
  activo varchar(3) DEFAULT 'SI',
  PRIMARY KEY (id)
);

--drop table inventario.ingresos_detalle;
create table ve_ingresos_detalle
(
  id int(11) NOT NULL AUTO_INCREMENT,
  id_ingreso int,
  idve_producto int, 
  cantidad_ingreso float,
  precio_unitario  float,
  precio_total     float,
  id_usuario_registro int,
  fecha_registro datetime DEFAULT now(),
  id_usuario_update int,
  fecha_modificacion datetime,
  estado varchar(3) DEFAULT 'ELB',
  activo varchar(3) DEFAULT 'SI',
  PRIMARY KEY (id)
);

create table ve_inventarios
(
  id int(11) NOT NULL AUTO_INCREMENT,
  idve_producto int,  
  gestion int,
  id_ingreso int,
  id_ingreso_detalle int,
  id_salida int,
  id_salida_detalle int,
  id_material int,
  tipo_proceso text,
  tipo_ingreso_egreso text,
  cantidad_entrada int, 
  cantidad_salida  int,
  saldo            int,
  precio_unitario  numeric(8,2),
  precio_total     numeric(8,2),
  fecha            date,
  id_inventario    int,
  id_inventario_inicial_ingreso  int,
  id_cliente_solicitante int,  
  id_usuario int,  
  fecha_registro datetime DEFAULT now(),
  fecha_modificacion datetime,
  estado varchar(3) DEFAULT 'AC',  
  PRIMARY KEY (id)
);

create table ve_inventarios_resumen
(
  id int(11) NOT NULL AUTO_INCREMENT,
  id_empresa int, 
  gestion    int,
  idve_producto int unique,
  cantidad_entrada int, 
  cantidad_salida  int,
  saldo            int,
  cantidad_solicitada int,
  cantidad_disponible int,
  precio_venta_unitario  numeric(8,2),  
  fecha_registro datetime DEFAULT now(),
  fecha_modificacion datetime,
  estado varchar(3) DEFAULT 'AC',  
  PRIMARY KEY (id)
);


create table ve_solicitudes_reserva
(
  id int(11) NOT NULL AUTO_INCREMENT,
  id_funcionario int,
  id_empresa int,
  id_confirmacion_venta int,
  gestion    int,
  idve_producto int,
  cantidad_solicitada int, 
  cantidad_autorizada int,
  precio_unitario  numeric(8,2),
  precio_total     numeric(8,2),
  tipo_solicitud      varchar(3),
  id_usuario int,
  fecha_registro      datetime DEFAULT now(),
  fecha_modificacion  datetime,
  estado varchar(3) DEFAULT 'PEN',  
  PRIMARY KEY (id)
);


create table ve_ventas
(
  id int(11) NOT NULL AUTO_INCREMENT,   
  id_empresa  int, 
  gestion     int,  
  correlativo int,
  correlativo_dia int,
  codigo_pedido text,  
  precio_total  numeric(8,2),
  tipo_venta varchar(3),-- NOR NORMAL -- EME EMERGENCIA --- SGE SERVICIOS GENERALES   COM --- COMBUSTIBLE
  id_usuario_solicitante int,
  id_cliente_solicitante int,
  fecha_registro     datetime DEFAULT now(),  
  fecha_entrega      datetime,
  fecha_autorizacion datetime,  
  fecha_modificacion datetime,
  estado varchar(3) DEFAULT 'PEN',  
  PRIMARY KEY (id)
);



CREATE TABLE ve_castigar_stock (
  id int(11) NOT NULL AUTO_INCREMENT,
  idve_almacen int(11) ,
  cantidad int(11) ,
  fecha date ,
  respaldo varchar(200) ,
  estado varchar(20) ,
  PRIMARY KEY (id)
);

CREATE TABLE ve_acumulador_almacen (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  idad_usuario int(11) ,
  idve_producto int(11) ,
  idve_proveedor int(11) ,
  idve_porcentaje int(11) ,
  entrada int(11) ,
  precio_compra float ,
  precio_venta float ,
  vencimiento int(11) ,
  fecha_vencimiento date ,
  fecha date ,
  estado varchar(20) ,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ve_acumulador_venta (
  id int(11) NOT NULL AUTO_INCREMENT,
  codad_empresa int(11) ,
  idad_usuario int(11) ,
  idve_producto int(11) ,
  porcentaje int(11) ,
  idve_porcentaje int(11) ,
  cantidad int(11) ,
  precio_compra float ,
  precio_venta float ,
  estado varchar(20) ,
  PRIMARY KEY (id)
) ;






-------------------------------------------

INSERT INTO ad_opciones (codigo,  codad_modulo,cod_aplicacion, codad_opcion, opcion, descripcion, link, nivel, orden, estado) VALUES
(1, 1, 1 , 1,   'INICIO', '', 'Inicio', 0, 1, 'AC'),
(2, 2, 1 , 2,   'PRODUCTOS', '', '', 1, 0, 'AC'),
(3, 3, 1 , 3,   'ALMACENES', '', '', 1, 1, 'AC'),
(4, 4, 1 , 4,   'VENTAS', '', '', 1, 1, 'AC'),
(5, 5, 1 , 5,   'REPORTES', '', '', 1, 1, 'AC'),
(6, 6, 1 , 6,   'USUARIOS', '', '', 1, 1, 'AC'),
(7, 7, 1 , 7,   'OTROS', '', '', 1, 1, 'AC'),
(8, 8, 1 , 8,   'OTROS', '', '', 1, 1, 'AC'),
(9, 9, 1 , 9,   'OTROS', '', '', 1, 1, 'AC'),
(10, 10, 1 , 10, 'OTROS', '', '', 1, 1, 'AC'),



INSERT INTO ad_opciones (codigo,  codad_modulo,cod_aplicacion, codad_opcion, opcion, descripcion, link, nivel, orden, estado) VALUES
(11, 2, 1 , 2, 'PRODUCTOS', '', 'Productos/Productos', 2, 1, 'AC'),
(12, 3, 1 , 3, 'INGRESO ALMACEN', '', 'Ingresos/Ingresos', 2, 1, 'AC'),
(13, 4, 1 , 4, 'REGISTRAR VENTAS', '', 'Ventas/Ventas', 2, 1, 'AC'),
(14, 5, 1 , 5, 'REPORTES', '', 'Reportes/Reportes', 2, 1, 'AC'),
(15, 6, 1 , 6, 'USUARIOS', '', 'Usuarios/Usuarios', 2, 1, 'AC'),







-------------------------------------------

INSERT INTO ad_opciones_usuarios (idad_usuario, codad_opcion) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15);







