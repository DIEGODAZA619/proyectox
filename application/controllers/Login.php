<?php
class Login extends CI_Controller
{
	function __construct(){
		parent::__construct();
			
			/*$this->load->helper('funcionarios_helper');
			
			$this->load->model('puestos_model');  */
			$this->load->helper('configuraciones_helper');
			$this->load->model('roles_model');
			$this->load->model('usuarios_model');
    		$this->load->helper(array('form', 'url'));
			$this->load->library('form_validation');
	}
	function index($mensaje = "")
	{
		$dato['error'] =$mensaje;
		$this->load->view("Login/logued",$dato);

		/*$this->load->view('autentificacion/estilos');
		$this->load->view('autentificacion/registro'); //cuerpo  */
	}

	function logued()
	{
		$IDAPLICACION = $this->config->item('IDAPLICACION');		
		$username = ($this->input->post('username'));
		$password =  md5("aldidacom".($this->input->post('pass')));
		$ip = $this->obtenerIp();
		//echo $username." - ".$password;
		$login = $this->usuarios_model->loguear($username, $password);
		if($login)
		{
			//echo $login[0]->estado;
			$dataingreso = array (
					'id_usuario' => $login[0]->id,	
					'aplicacion' => $IDAPLICACION,
					'ip' => $ip
				);
			$ingresoUsers = $this->usuarios_model->guardarIngreso($dataingreso);
			if( $login[0]->estado == 'AC' )
			{
				$id_usuario = $login[0]->id;				
				$id_empresa = $login[0]->codad_empresa;
				$rolescero = $this->roles_model->obtener_roles_cero($id_usuario,$IDAPLICACION);
				$roles     = $this->roles_model->obtener_roles($id_usuario,$IDAPLICACION);	
				$datosEmpresa = $this->usuarios_model->datosEmpresa($id_empresa);
				$data = array(
					'is_logued_in'  => TRUE,
					'id_usuario' => $id_usuario,					
					'rolescero' => $rolescero,					
					'roles' => $roles,
					'gestion' => gestion_vigente(),
					'nombre_completo' => $login[0]->nombres." ".$login[0]->primer_apellido." ".$login[0]->segundo_apellido,					
					'id_empresa' => $login[0]->codad_empresa,
					'nombre_empresa' => $datosEmpresa[0]->denominacion,
					'logo' => $datosEmpresa[0]->logo,
					'id_apliacion' => $IDAPLICACION,
				);

				if(verificarActivacion($id_empresa))
				{
					$this->session->set_userdata($data);
					redirect("inicio");	
				}
				else
				{
					$mensaje ="Favor concectese con SOPORTE TÉCNICO para activación del producto";
					$this->index($mensaje);
				}
			}
			else
			{
				$mensaje ="El usuario no se encuentra habilitado contactece con el administrador";
				$this->index($mensaje);
			}
		}
		else
		{
			$this->index('EL NOMBRE O CONTRASEÑA INCORRECTO');
		}
	}
	/*//redirect("inicio");
		/*$fecha = date('Y-m-j H:i:s');
		$nuevafecha = strtotime ( '-4 hour' , strtotime ( $fecha ) ) ;
		$fecha = date ( 'Y-m-j' , $nuevafecha );
		$username = $this->input->post('username');
		$password = md5($this->input->post('pass'));
		$login = $this->usuarios_model->loguear($username, $password);
		*/

	function obtenerIp()
	{
		 $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ipaddress = getenv('HTTP_CLIENT_IP');
        else if(getenv('HTTP_X_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        else if(getenv('HTTP_X_FORWARDED'))
            $ipaddress = getenv('HTTP_X_FORWARDED');
        else if(getenv('HTTP_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        else if(getenv('HTTP_FORWARDED'))
           $ipaddress = getenv('HTTP_FORWARDED');
        else if(getenv('REMOTE_ADDR'))
            $ipaddress = getenv('REMOTE_ADDR');
        else
            $ipaddress = 'UNKNOWN';
        return $ipaddress;

	}

	function salir()
	{
		$this->session->sess_destroy();
		redirect('Login');
	}
}

?>