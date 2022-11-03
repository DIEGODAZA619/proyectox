<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//require APPPATH . 'libraries/ticket/autoload.php';
/*require APPPATH . 'libraries/ticket/src/Mike42/Escpos/Printer.php';
require APPPATH . 'libraries/ticket/src/Mike42/Escpos/EscposImage.php';
require APPPATH . 'libraries/ticket/src/Mike42/Escpos/PrintConnectors/WindowsPrintConnector.php';*/


class Reportes_ticket extends CI_Controller {

	function __construct(){
		parent::__construct();				
		$this->_is_logued_in();
		$this->load->helper('configuraciones_helper');
		$this->load->helper('imprimir_ticket_helper');		
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
	
	function imprimirTicketVenta()
	{
		$id_usuario = $this->session->userdata('id_usuario');
		$id_venta = $this->input->post('id_ven');		
		$ticket = imprimirVenta($id_venta);
		echo "1";
		/*$resul = 1;
		$mensaje = "OK".$id_venta;		
		$resultado ='[{		
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;*/
	}
}
