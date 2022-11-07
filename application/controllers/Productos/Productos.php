<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos extends CI_Controller {

	function __construct(){
		parent::__construct();				
		$this->_is_logued_in();
		$this->load->model('productos_model');
		$this->load->helper('configuraciones_helper');
		
	}
	function _is_logued_in()
	{
		//colocar esta confirguracion en el archivo config.php,  $config['IDAPLICACION'] = 3;		

		$is_logued_in = $this->session->userdata('is_logued_in');
		$id_apliacion = $this->session->userdata('id_apliacion');
		if($is_logued_in != TRUE)
		{
			$this->session->sess_destroy();
			redirect('Login');
		}		
	}
	public function index()
	{

		$id_usuario = $this->session->userdata('id_usuario');
		$dato['rolescero'] = $this->session->userdata('rolescero');
		$dato['roles']  = $this->session->userdata('roles');
		$dato['nombre_usuario']  = $this->session->userdata('nombre_completo');
		$dato['nombre_empresa']  = $this->session->userdata('nombre_empresa');
		$dato['logo_empresa']  = $this->session->userdata('logo');
		$id_empresa = $this->session->userdata('id_empresa');		
		$this->load->view('inicio/cabecera',$dato);
		$this->load->view('inicio/menu',$dato);
		$this->load->view('productos/fromProducto'); //cuerpo
		$this->load->view('inicio/pie');
	}

	
	function cargartablasProductos()
	{
		$draw = intval($this->input->get("draw"));
		$filas = $this->productos_model->getProductos();
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = " <span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Editar'>
							<button class='btn btn-warning btn-circle' onclick='editarProducto(".$fila->idve_producto.")'><i class='mdi mdi-pencil'></i></button>
						</span>";
		    $data[] = array(
	                $num++,
	                $fila->descripcion_categoria, 
	                $fila->valor1,
	                $fila->unidad,
	                $fila->cantidad_disponible,
	                $fila->precio_venta_unitario,
	                $boton
	           );
		    
	    }
        $output = array(
            "draw" => $draw,
            "recordsTotal" => count($filas),
            "recordsFiltered" => count($filas),
            "data" => $data
        );
	    echo json_encode($output);
	    exit();
	}
}
