<?php

class Ventas_model extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
		 $this->db_ventas = $this->load->database('db_ventas', TRUE);    

	}
	
	function getDatosVentas($fecha,$estado)
	{
		$fecha  = "'".$fecha."'";
		$estado = "'".$estado."'";
		$query = $this->db_ventas->query("select v.*, c.nombres
			                                from ve_ventas v, ve_clientes c
											where 1 = 1
											and DATE_FORMAT(v.fecha_registro,'%Y-%m-%d') = ".$fecha."
											and v.estado = ".$estado."
										    order by v.correlativo_dia asc");
        return $query->result(); 
	}

	function getDatosVentasId($id_venta)
	{
		$query = $this->db_ventas->query("select v.*, c.nombres
			                                from ve_ventas v, ve_clientes c
											where v.id_cliente_solicitante = c.id 
											  and v.id = ".$id_venta);
        return $query->result(); 
	}
	function getDatosVentasDetalleId($id_venta)
	{
		$query = $this->db_ventas->query("select v.*, p.valor1
			                                from  ve_venta_detalles v,
			                                      ve_productos p
											where v.idve_producto = p.id
											  and idve_ventas = ".$id_venta);
        return $query->result(); 
	}
	function getDatosClienteId($id_cliente)
	{
		$query = $this->db_ventas->query("select *
			                                from ve_clientes
										   where id = ".$id_cliente);
        return $query->result(); 
	}	

	function getMaterialesId($id_material)
	{
		$query = $this->db_ventas->query("select *
											 from ve_productos p
											where p.id =".$id_material
											 );
        return $query->result();
	}
	

}
?>