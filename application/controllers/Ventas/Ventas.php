<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ventas extends CI_Controller {

	function __construct(){
		parent::__construct();				
		$this->_is_logued_in();
		$this->load->helper('configuraciones_helper');
		$this->load->model('ingresos_model');
		$this->load->model('materiales_model');
		$this->load->model('ventas_model');
		
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
		$this->load->view('ventas/formVentas'); //cuerpo
		$this->load->view('inicio/pie');
	}


	function cargartablasVentas()
	{
		$draw = intval($this->input->get("draw"));

		$estado = "PEN";
		$fecha = getFechaActual();		
		$filas = $this->ventas_model->getDatosVentas($fecha,$estado);
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = "";
		    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Seleccionar'>
						<button class='btn btn-success btn-circle' onclick='verdetalleVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Imprimir'>
						<button class='btn btn-success btn-circle' onclick='imprimirVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Consolidar'>
						<button class='btn btn-success btn-circle' onclick='entregarVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>";
		    $data[] = array(
	                $boton,
	                $num++,
	                $fila->correlativo_dia,
	                $fila->nombres,
	                $fila->precio_total,
	                $fila->estado
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

