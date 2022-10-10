<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ventas extends CI_Controller {

	function __construct(){
		parent::__construct();				
		$this->_is_logued_in();
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
		//$this->load->view('inicio/cuerpo'); //cuerpo
		$this->load->view('inicio/pie');
	}
}
