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
											and v.id_cliente_solicitante = c.id
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
	
	function getProductosInvetario()
	{
		$query = $this->db_ventas->query("select i.idve_producto, 
												 c.descripcion_categoria, 
												 p.valor1,p.unidad, 
												 i.cantidad_disponible, 
			                                     i.precio_venta_unitario
											from ve_productos p,
											     ve_cataegorias c,
											     ve_inventarios_resumen i
										   where p.categoria = c.id
										         and p.id  = i.idve_producto");
		return $query->result();
	}
	function getProductosSeleccionados($id_usuario)
	{
		$query = $this->db_ventas->query("select i.id as id_solicitud,
												 i.idve_producto,
												 c.descripcion_categoria,
												 p.valor1,p.unidad, 
												 i.cantidad_solicitada, 
												 i.precio_unitario, 
												 i.precio_total
											from ve_productos p,
											     ve_cataegorias c,
											     ve_venta_detalles i
											where p.categoria = c.id
											  and p.id  = i.idve_producto
											  and i.estado = 'IN'
											  and i.id_usuario =".$id_usuario);
		return $query->result();
	}
	
	function getProductosInvetarioId($id_producto)
	{
		$query = $this->db_ventas->query("select *
											from ve_inventarios_resumen i
											where i.idve_producto = ".$id_producto);
		return $query->result();
	}
	function getSumaVentaTotal($id_usuario)
	{
		$query = $this->db_ventas->query("select sum(precio_total)as costo_total
								  			from ve_venta_detalles i
								  		   where i.estado = 'IN'
								    		 and i.id_usuario = ".$id_usuario);
		return $query->result();		
	}
	function getCorrelativoVenta($fecha)
	{
		$fecha  = "'".$fecha."'";
		$query = $this->db_ventas->query("select case when max(correlativo_dia) is null
												  then 0
												  else max(correlativo_dia)
										         end AS correlativo
											from ve_ventas
										   where DATE_FORMAT(fecha_registro,'%Y-%m-%d') = ".$fecha);
		return $query->result();		
	}
	function getVerificarPedido($id_producto,$id_usuario)
	{
		$query = $this->db_ventas->query("select *
								  			from ve_venta_detalles i
								  		   where i.estado = 'IN'
								    		 and i.id_usuario = ".$id_usuario."
								    		 and i.idve_producto = ".$id_producto);
		return $query->result();
	}
	function guardarVentaDetalle($data)
	{
		$this->db_ventas->insert('ve_venta_detalles',$data);
		return $this->db_ventas->insert_id();
	}
	function guardarCliente($data)
	{
		$this->db_ventas->insert('ve_clientes',$data);
		return $this->db_ventas->insert_id();	
	}
	function guardarVenta($data)
	{
		$this->db_ventas->insert('ve_ventas',$data);
		return $this->db_ventas->insert_id();	
	}
	function updatesVentaDetalle($id, $data)
	{
		$this->db_ventas->where('id',$id);
        return $this->db_ventas->update('ve_venta_detalles',$data);
	}

}
?>