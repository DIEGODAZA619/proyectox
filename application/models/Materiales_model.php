<?php

class Materiales_model extends CI_Model
{

	function __construct()
	{
		parent::__construct();
		  $this->db_ventas = $this->load->database('db_ventas', TRUE);

	}

	function getMateriales()
	{
		$query = $this->db_ventas->query("select *
										    from  ve_productos p, ve_inventarios_resumen i, ve_cataegorias c
										   where p.id = i.idve_producto
 										     and p.categoria = c.id
 										   order by c.descripcion_categoria desc");
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










	function getCategoria()
	{
		$query = $this->db_ventas->query("select *
											from clasificacion.categorias c
										  where c.nivel = '1'");
        return $query->result();
	}
	function getSubCategoria($id_padre)
	{
		$query = $this->db_ventas->query("select *
											from clasificacion.categorias c
										  where c.nivel = '2'
										  and c.padre ='".$id_padre."'");
        return $query->result();
	}
	function getMaterial($id_padre)
	{
		$query = $this->db_ventas->query("select *
											from clasificacion.categorias c
										  where c.nivel = '3'
										  and c.padre ='".$id_padre."'");
        return $query->result();
	}
	function getUnidad()
	{
		$query = $this->db_ventas->query("select *
											from clasificacion.unidades_medida um");
        return $query->result();
	}
	function guardarMaterial($data)
    {
        $this->db_ventas->insert('materiales',$data);
        return $this->db_ventas->insert_id();
    }
	function editarMaterial($id_registro,$data)
    {
        $this->db_ventas->where('id',$id_registro);
        return $this->db_ventas->update('materiales',$data);
    }
	function getMaterialId($id_registro)
	{
		$query = $this->db_ventas->query("select m.*, c2.id as subcategoria, c3.id as categoria
											from materiales m
										   left join clasificacion.categorias c on m.id_categoria = c.id
										   left join clasificacion.categorias c2 on c2.id =c.padre
										   left join clasificacion.categorias c3 on c3.id =c2.padre
										   where m.id =".$id_registro);
        return $query->result();
	}
}
?>