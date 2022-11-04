update ve_inventarios_resumen set cantidad_entrada = 0,cantidad_salida = 0,saldo = 0,cantidad_solicitada = 0,cantidad_disponible = 0,precio_venta_unitario = 0;


TRUNCATE table ve_clientes;
TRUNCATE table ve_ingresos;
TRUNCATE table ve_ingresos_detalle;
TRUNCATE table ve_inventarios;
TRUNCATE table ve_ventas;
TRUNCATE table ve_venta_detalles;




--DAVIDDURAN.ADM
--6660131
--LETICIADAZA.ADM
--6651949



--ejemplo de como insertar en la tabla ve_inventarios_resumen, solo hay q cambiar el idve_producto
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,6);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,7);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,8);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,9);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,10);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,11);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,12);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,13);
INSERT INTO ve_inventarios_resumen (id_empresa,gestion,idve_producto)VALUES(1,2022,14);