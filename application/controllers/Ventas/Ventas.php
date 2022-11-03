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
						<button class='btn btn-warning btn-circle' onclick='imprimirVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span><br>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Consolidar'>
						<button class='btn btn-secondary btn-circle' onclick='entregarVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Consolidar'>
						<button class='btn btn-danger btn-circle' onclick='entregarVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
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



	function getProductosInvetario()
	{
		$draw = intval($this->input->get("draw"));
		$estado = "PEN";
		$fecha = getFechaActual();		
		$filas = $this->ventas_model->getProductosInvetario();
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = "";
		    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Seleccionar'>
						<button class='btn btn-success btn-circle' onclick='formularioVenta(".$fila->idve_producto.")'><i class='mdi mdi-check'></i></button>
					</span>	";
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

	function getProductosSeleccionados()
	{
		$draw = intval($this->input->get("draw"));
		$id_usuario = $this->session->userdata('id_usuario');
		$filas = $this->ventas_model->getProductosSeleccionados($id_usuario);
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = "";
		    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Editar'>
						<button class='btn btn-success btn-circle' onclick='formularioVenta(".$fila->id_solicitud.")'><i class='mdi mdi-check'></i></button>
					 </span>
					 <span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Eliminar'>
                     <button type='button' class='btn btn-danger btn-circle' onclick='disponerBien(".$fila->id_solicitud.")'><i class='mdi mdi-arrow-down'></i></button>
                    </span>";
		    $data[] = array(	                
	                $num++,					
					$fila->descripcion_categoria,
					$fila->valor1,
					$fila->unidad, 
					$fila->precio_unitario,
					$fila->cantidad_solicitada,					 
					$fila->precio_total,	               
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

	function guardarCantidad()
	{
		$accion = $this->input->post('accion');
		$id_registro = $this->input->post('id_registro');
		$id_producto = $this->input->post('id_producto');
		$txtCantidad = $this->input->post('txtCantidad');
		$inventario = $this->ventas_model->getProductosInvetarioId($id_producto);
		
		if($txtCantidad <= $inventario[0]->cantidad_disponible)
		{
			$id_usuario 	= $this->session->userdata('id_usuario');
			$id_empresa 	= $this->session->userdata('id_empresa');
			$gestion    	= gestion_vigente();
			$precio_unitario= $inventario[0]->precio_venta_unitario;
			$total 			= $precio_unitario * $txtCantidad;
			$data = array(
				'id_empresa' 			=> $id_empresa,
				'gestion' 				=> $gestion,					
				'idve_producto' 		=> $id_producto,
				'cantidad_solicitada' 	=> $txtCantidad,
				'precio_unitario' 		=> $precio_unitario,
				'precio_total' 			=> $total,				
				'id_usuario	'			=> $id_usuario,
				'tipo_solicitud'		=> 'NOR'
			);
			$insert = $this->ventas_model->guardarVentaDetalle($data);
			$tipoProceso = "SOLICITUD";
			$actualizarInventario = actualizarInventarioResumen($id_producto,$txtCantidad,$tipoProceso);
			$resul = 1;
			$mensaje = "OK";
		}
		else
		{
			$resul = 0;
			$mensaje = "CANTIDAD INSUFICIENTE EN INVENTARIO";
		}		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function costoVentaTotal()
	{
		$id_usuario 	= $this->session->userdata('id_usuario');
		$inventario = $this->ventas_model->getSumaVentaTotal($id_usuario);
		$resul = 1;
		$mensaje = $inventario[0]->costo_total;
		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function verificarPedidoProducto()
	{
		$id_producto =$this->input->post('pro');
		$id_usuario = $this->session->userdata('id_usuario');
		$inventario = $this->ventas_model->getVerificarPedido($id_producto,$id_usuario);
		if($inventario)
		{
			$resul = 0;
			$mensaje = "EL PRODUCTO YA FUE SELECCIONADO";
		}
		else
		{
			$resul = 1;
			$mensaje = "OK";
		}		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}

	function consolidarVenta()
	{
		$fecha      = getFechaActual();
		$id_usuario = $this->session->userdata('id_usuario');
		$nombreCliente =$this->input->post('cli');
		$filaCorrelativo = $this->ventas_model->getCorrelativoVenta($fecha);
		$correlativo = $filaCorrelativo[0]->correlativo + 1;
		$id_empresa 	= $this->session->userdata('id_empresa');
		$gestion    	= gestion_vigente();
		$inventario = $this->ventas_model->getSumaVentaTotal($id_usuario);		
		$costo_total = $inventario[0]->costo_total;
		$dataClient = array(
			'nombres' => $nombreCliente,
		);
		$id_cliente = $this->ventas_model->guardarCliente($dataClient);

		$data = array(
				'codad_empresa' 			=> $id_empresa,
				'gestion' 					=> $gestion,					
				'correlativo_dia' 			=> $correlativo,
				'precio_total' 				=> $costo_total,
				'tipo_venta' 				=> 'NOR',
				'id_usuario_solicitante' 	=> $id_usuario,				
				'id_cliente_solicitante	'	=> $id_cliente,				
			);
		$id_venta = $this->ventas_model->guardarVenta($data);
		$filas = $this->ventas_model->getProductosSeleccionados($id_usuario);		
	    foreach ($filas as $fila)
	    {
	    	$dataVD = array(
	    		'idve_ventas' => $id_venta,
	    		'estado'      => 'PEN',
	    	);
	    	$idUpdate = $this->ventas_model->updatesVentaDetalle($fila->id_solicitud, $dataVD);	
	    }
	    $resul = 1;
		$mensaje = "OK";		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function pruebahora()
	{
		echo getFechaHoraActual();
	}
}

