<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reportes extends CI_Controller {

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
		$dato['logo_empresa']    = $this->session->userdata('logo');
		$dato['fecha']           = getFechaActual();
		$id_empresa = $this->session->userdata('id_empresa');		
		$this->load->view('inicio/cabecera',$dato);
		$this->load->view('inicio/menu',$dato);
		$this->load->view('reportes/reporteVentas'); //cuerpo
		$this->load->view('inicio/pie');
	}


	function cargartablasReportesVentas()
	{
		$draw = intval($this->input->get("draw"));
		$fecha = $this->input->post('fec');
		$estado = $this->input->post('est');
		//$estado = "AC";
		//$fecha = getFechaActual();
		$filas = $this->ventas_model->getDatosVentas($fecha,$estado);
		$data = array();
		$num = 1;
		$estadoDescripcion = '';
	    foreach ($filas as $fila)
	    {
		    if($fila->estado_detalle == 'AC'){ $estadoDescripcion = 'ENTREGADO';}
		    if($fila->estado_detalle == 'PEN'){ $estadoDescripcion = 'PENDIENTE';}
		    if($fila->estado_detalle == 'AN'){ $estadoDescripcion = 'ANULADO';}

		    $data[] = array(
	                $num++,
	                $fila->fecha_venta,
	                $fila->correlativo_dia,
	                $fila->nombres,
	                $fila->valor1,
	                $fila->cantidad_solicitada,
	                $fila->precio_unitario,
	                $fila->precio_total_detalle,	                              
	                $estadoDescripcion,
	                
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
	function calculoTotal()
	{
		$fecha  = $this->input->post('fec');
		$estado = $this->input->post('est');
		$suma   = 0;
		$filas = $this->ventas_model->getDatosVentas($fecha,$estado);
		foreach ($filas as $fila)
	    {
	    	$suma = $suma + $fila->precio_total_detalle;
	    }
	    $suma = number_format($suma,2);		
	    $resul = 1;
		$mensaje = $suma;		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
}
