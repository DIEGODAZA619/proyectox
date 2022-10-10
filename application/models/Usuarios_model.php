<?php
/*
*/

class Usuarios_model extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();	
		$this->db_ventas = $this->load->database('db_ventas', TRUE);			
	}

	function loguear($username, $password)
	{
		$query = $this->db_ventas->query("select *
									 from ad_usuarios 
									where login = '".$username."' 
									  and clave = '".$password."'");	
        return $query->result();   
	}

	function guardarIngreso($data)
    {       
        $this->db_ventas->insert('ad_control_acceso',$data); 
        return $this->db_ventas->insert_id();
    }

	function check_usuraio($nro_documento, $username)
	{
		$query = $this->db_ventas->query("select *
									         from ad_usuarios 
									        where nro_documento = ".$nro_documento."
									          and login = '".$username."'");	
        return $query->result();   
	}
	function guardarUsuario($data)
    {       
        $this->db_ventas->insert('ad_usuarios',$data); 
        return $this->db_ventas->insert_id();
    }


    function updateUsuario($id, $data)
    {       
        $this->db_ventas->where('id',$id);
        return $this->db_ventas->update('ad_usuarios',$data);
    }

    function getUsuario()
    {       
        $query = $this->db_ventas->query("select *
									         from ad_usuarios
									        order by id asc");	
        return $query->result();
    }
    function datosEmpresa($id_empresa)
    {
    	$query = $this->db_ventas->query("select *
									         from ad_empresas
									        where codigo = ".$id_empresa."
									        order by 1 asc");	
        return $query->result();	
    }
}
?>