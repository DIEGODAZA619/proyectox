<?php

class Ingresos_model extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
		  $this->db_ventas = $this->load->database('db_ventas', TRUE);    

	}
	
	
	// INSERT
	function guardarRegistroIngreso($data)
	{
		$this->db_ventas->insert('ve_ingresos',$data);
		return $this->db_ventas->insert_id();
	}
	function guardarIngresoMaterial($data)
	{
		$this->db_ventas->insert('ve_ingresos_detalle',$data);
		return $this->db_ventas->insert_id();
	}
	
	function registrarIngresosInvetarios($data)
	{
		$this->db_ventas->insert('ve_inventarios',$data);
		return $this->db_ventas->insert_id();
	}


	function insertarInventarioResumen($data)
	{
		$this->db_ventas->insert('ve_inventarios_resumen',$data);
		return $this->db_ventas->insert_id();	
	}

	//UPDATES
	function updateInvetarios($id_registro,$data)
	{
		$this->db_ventas->where('id',$id_registro);
        return $this->db_ventas->update('inventario.inventarios',$data);
	}

	function editarIngresoMaterialDetalles($id_ingreso,$data)
	{		
		$this->db_ventas->where('id',$id_ingreso);
        return $this->db_ventas->update('ve_ingresos_detalle',$data);
	}

	function updateIngreso($id_registro,$data)
	{
		$this->db_ventas->where('id',$id_registro);
        return $this->db_ventas->update('ve_ingresos',$data);
	}

	function updateInventarioResumen($id_registro,$data)
	{
		$this->db_ventas->where('id',$id_registro);
        return $this->db_ventas->update('ve_inventarios_resumen',$data);

	}


	//GET 
	function getInventarioResumenId($id_producto)
	{
		$query = $this->db_ventas->query("select *
											 from ve_inventarios_resumen 
											where idve_producto  = ".$id_producto."
											  and estado = 'AC'");
        return $query->result();   
	}
	function getProveedores()
	{
		$query = $this->db_ventas->query("select *
											 from material.proveedores i
											where estado = 'AC'
											order by nombre_proveedor asc"

											 );
        return $query->result();   
	}
	function getIngresos($id_entidad,$estado)
	{
		$query = $this->db_ventas->query("select *
											 from ve_ingresos i
											where i.id_entidad =".$id_entidad."
											  and estado = '".$estado."'"
											 );
        return $query->result();   	
	}

	function getIngresosDetallesId($estado)
	{
		$query = $this->db_ventas->query("select i.*, m.valor1, i.id as id_inventario
											 from ve_ingresos_detalle i, ve_productos m
											where i.idve_producto = m.id											  
											  and i.estado = '".$estado."'"
											 );
        return $query->result();   	
	}
	function getIngresoDetId($id_ingreso)
	{
		$query = $this->db_ventas->query("select *
											 from ve_ingresos_detalle i
											where i.id =".$id_ingreso);
        return $query->result();   	
	}
	function checkMaterialesIngreso($id_material)
	{
		$query = $this->db_ventas->query("select 1
											 from ve_ingresos_detalle i
											where i.idve_producto = ".$id_material."											  
											  and i.estado = 'ELB'"
											 );
        return $query->result();
	}

	function checkIngresoMaterialInventario($idIngreso,$ingresoDetalle,$producto)
	{
		$query = $this->db_ventas->query("select 1
											 from ve_inventarios i
											where i.id_ingreso = ".$idIngreso."
											  and i.id_ingreso_detalle =".$ingresoDetalle."
											  and i.idve_producto = ".$producto
											 );
        return $query->result();
	}

	function cantidadInventarioProducto($idve_producto)
	{
		$query = $this->db_ventas->query("select case when max(id_inventario_inicial_ingreso) is null
												  then 0
												  else max(id_inventario_inicial_ingreso)
										          end AS correlativo
											 from ve_inventarios 
											where tipo_proceso = ('INGP')
											  and idve_producto = ". $idve_producto);
        return $query->result();   
	}
	
}
?>