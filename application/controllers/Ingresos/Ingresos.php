<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ingresos extends CI_Controller {

	function __construct(){
		parent::__construct();				
		$this->_is_logued_in();
		$this->load->helper('configuraciones_helper');
		$this->load->model('ingresos_model');
		$this->load->model('materiales_model');
		
		
		
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
		$this->load->view('ingreso/formIngreso'); //cuerpo
		$this->load->view('inicio/pie');
	}
	function cargartablasMateriales()
	{
		$draw = intval($this->input->get("draw"));
		$filas = $this->materiales_model->getMateriales();
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = "";
		    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Seleccionar'>
						<button class='btn btn-success btn-circle' onclick='agregarIngreso(".$fila->idve_producto.")'><i class='mdi mdi-check'></i></button>
					</span>";
		    $data[] = array(
	                $num++,
	                $fila->descripcion_categoria,
	                $fila->valor1,
	                $fila->unidad,
	                $fila->cantidad_disponible,	                	                	
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

	function verificarMaterialSeleccionado()
	{		
		$id_material = $this->input->post('id_mat');
		$ingreso = $this->ingresos_model->checkMaterialesIngreso($id_material);
		if(!$ingreso)
		{
			$resul = 1;
			$mensaje = "OK";
		}
		else
		{
			$resul = 0;
			$mensaje = "El material seleccioando ya está registrado";
		}
		$resultado ='[{
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function getMaterialesId()
	{
		$id_material = $this->input->post('id_mat');
		$material = $this->materiales_model->getMaterialesId($id_material);
		$descripcion = "";
		$resul = 0;
		$mensaje = "No se identificó ningún registro";
		if($material)
		{
			$descripcion = $material[0]->valor1;
			$resul = 1;
			$mensaje = "OK";
		}
		$resultado ='[{
						"descripcion":"'.$descripcion.'",
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function guardarIngresoMateriales()
	{
		$accion      = $this->input->post('accion');
		$id_ingreso  = $this->input->post('id_ingreso');
		$id_material = $this->input->post('id_material');
		$cantidad    = $this->input->post('txtCantidad');
		$precio      = $this->input->post('txtPrecio');
		$precioVenta = $this->input->post('txtPrecioVenta');
		$id_registro      = $this->input->post('id_registro');
		$fechaActual =    getFechaHoraActual();
		$id_usuario = $this->session->userdata('id_usuario');
		$id_empresa = $this->session->userdata('id_empresa');
		$total = $cantidad * $precio;

		if($accion == 'nuevo')
		{
			$data = array(
				'id_ingreso' => $id_ingreso,
				'codad_empresa' => $id_empresa,					
				'idve_producto' => $id_material,
				'cantidad_ingreso' => $cantidad,
				'precio_unitario' => $precio,
				'precio_venta' => $precioVenta,
				'precio_total' => $total,
				'id_usuario_registro	'=> $id_usuario
			);
			
			$ingreso = $this->ingresos_model->checkMaterialesIngreso($id_material);
			if(!$ingreso)
			{
				if($this->ingresos_model->guardarIngresoMaterial($data))
				{
					$resul = 1;
					$mensaje = "OK";
				}
				else
				{
					$resul = 0;
					$mensaje = "Ocurrio un error al guardar la información";
				}
			}
			else
			{
				$resul = 0;
				$mensaje = "El producto ya fue registrado!!!";
			}
		}
		else
		{
			$data = array(
				'cantidad_ingreso' => $cantidad,
				'precio_unitario' => $precio,
				'precio_venta' => $precioVenta,
				'precio_total' => $total,
				'id_usuario_update' => $id_usuario,
				'fecha_modificacion' => $fechaActual,
			);
			$actualizar = $this->ingresos_model->editarIngresoMaterialDetalles($id_registro,$data);
			if($actualizar)
			{
				$resul = 1;
				$mensaje = "OK";
			}
			else
			{
				$resul = 0;
				$mensaje = "Ocurrio un error al actualizar";
			}
		}
		$resultado ='[{
							"resultado":"'.$resul.'",
							"mensaje":"'.$mensaje.'"
						 }]';
		echo $resultado;
	}


	function cargartablasMaterialesAcumulados()
	{
		$draw = intval($this->input->get("draw"));		
		$estado = 'ELB';
		$filas = $this->ingresos_model->getIngresosDetallesId($estado);
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = "";
		    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Editar'>
						<button class='btn btn-warning btn-circle' onclick='editarIngresoDetalles(".$fila->id_inventario.")'><i class='mdi mdi-pencil'></i></button>
					 </span>
					 <span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Eliminar'>
						<button class='btn btn-danger btn-circle' onclick='eliminarIngresoDetalles(".$fila->id_inventario.")'><i class='mdi mdi-delete'></i></button>
					</span>
					";
		    $data[] = array(
	                $num++,
	                $fila->valor1,
	                $fila->cantidad_ingreso,
	                $fila->precio_unitario,
	                $fila->precio_venta,
	                $fila->precio_total,
	                formato_fecha_hora($fila->fecha_registro),
	                //descripcion_estados($fila->estado),
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







	/*APROBAR INGRESOS*/
	function guardarRegistroIngreso()
	{
		$accion     	= 'nuevo';		
		$orden 		 	= '';
		$nota    		= '';
		$nroFactura     = '';
		$fechaFactura   = '';
		$proveedor      = '';
		$descripcion    = '';
		$fechaActual    = getFechaActual();		
		$gestion = gestion_vigente();
		$id_usuario = $this->session->userdata('id_usuario');
		$id_empresa = $this->session->userdata('id_empresa');
		$id_ingreso = 0;
		$resul = 1;
		$mensaje = "OK";
		if($accion == 'nuevo')
		{
			$data = array(
				'codad_empresa' 			=> $id_empresa,
				'gestion' 					=> $gestion,
				'order_compra' 				=> $orden,				
				'nro_factura' 				=> $nroFactura,
				'fecha_factura' 			=> $fechaFactura,
				'monto_total_factura'		=> 0,
				'id_provedor' 				=> $proveedor,
				'descripcion_ingreso'		=> $descripcion,
				'fecha_ingreso'				=> $fechaActual,
				'id_usuario_registro' 	    => $id_usuario
			);
			$id_ingreso = $this->ingresos_model->guardarRegistroIngreso($data);
			if($id_ingreso)
			{
				$resul = 1;
				$mensaje = "OK";
			}
			else
			{
				$resul = 0;
				$mensaje = "Ocurrio un error al guardar la información";
			}
		}
		$resultado ='[{
						"id_ingreso":"'.$id_ingreso.'",
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		return $resultado;
	}

	function aprobarIngresoMateriales()
	{
		$valorIngreso    = json_decode($this->guardarRegistroIngreso());
		$resultado       = $valorIngreso[0]->resultado;
		$id_ingreso      = $valorIngreso[0]->id_ingreso;
		$mensajeIngreso  = $valorIngreso[0]->mensaje;
		$id_usuario = $this->session->userdata('id_usuario');
		$id_empresa = $this->session->userdata('id_empresa');
		$id_usuario = $this->session->userdata('id_usuario');
		if($resultado == 1)
		{
			$estado = 'ELB';
			$tipoProceso = 'INGP';
			$id_funcionario = $this->session->userdata('id_funcionario');		
			$entidad = $this->session->userdata('id_entidad');
			$gestion = gestion_vigente();
			$filas = $this->ingresos_model->getIngresosDetallesId($estado);	
			$dataUpdate = array(	    		
					'estado' => 'AC',
	    	);	
			$tabla = "inventario.inventarios";
		    foreach ($filas as $fila)
		    {	
		    	$data = array(	    		  				  				
	  				'codad_empresa' => $id_empresa,
	  				'gestion' => $gestion,
	  				'id_ingreso' => $id_ingreso,
	  				'id_ingreso_detalle' => $fila->id,  				
	  				'idve_producto' => $fila->idve_producto,
	  				'tipo_proceso' => $tipoProceso,
	  				'cantidad_entrada' => $fila->cantidad_ingreso,
	  				'cantidad_salida' => 0,
	  				'saldo' => $fila->cantidad_ingreso,
	  				'precio_unitario' => $fila->precio_unitario,
	  				'precio_venta' => $fila->precio_venta,
	  				'precio_total' => $fila->precio_total,  				
	  				'id_usuario' => $id_usuario,
		    	);
		    	if(!$this->ingresos_model->checkIngresoMaterialInventario($id_ingreso,$fila->id,$fila->idve_producto))
		    	{
		    		$idIngreso = $this->ingresos_model->registrarIngresosInvetarios($data);
			    	if($idIngreso)
			    	{	    		
				    	$idIngresoUpdate = $this->ingresos_model->editarIngresoMaterialDetalles($fila->id,$dataUpdate);
				    	$actualizacionInventario = actualizarInventarioResumen($fila->idve_producto,$fila->cantidad_ingreso,'INGRESO',$fila->precio_venta);
			    	}	
		    	}
		    }
		    $idUpdateIngreso = $this->ingresos_model->updateIngreso($id_ingreso,$dataUpdate);

			$resul = 1;
			$mensaje = "OK";
		}
		else
		{
			$resul = 0;
			$mensaje = $mensajeIngreso;
		}
				
		$resultado ='[{
							"resultado":"'.$resul.'",
							"mensaje":"'.$mensaje.'"
					 }]';		
		echo $resultado;
	}

	function eliminarIngresoDetalles()
	{
		$id_ingreso = $this->input->post('id_ing');
		$fechaActual = getFechaHoraActual();
		$id_usuario = $this->session->userdata('id_usuario');
		$data = array(
			'id_usuario_update' => $id_usuario,
			'fecha_modificacion' => $fechaActual,
			'estado' => 'AN'
		);
		$actualizar = $this->ingresos_model->editarIngresoMaterialDetalles($id_ingreso,$data);
		$resul = 1;
		$mensaje = "Se eliminó correctamente el registro";
		$resultado ='[{
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function getIngresoDetalleEditarId()
	{
		$id_ingreso = $this->input->post('id_ing');
		$ingreso = $this->ingresos_model->getIngresoDetId($id_ingreso);
		$descripcion = "";
		$resul = 0;
		$mensaje = "No se identificó ningún registro";
		$idve_producto = 0;
		$cantidad = 0;	   
		$precio = 0;	   
		$precio_venta = 0; 
		if($ingreso)
		{
			$idve_producto = $ingreso[0]->idve_producto;
			$cantidad 	   = $ingreso[0]->cantidad_ingreso;
			$precio 	   = $ingreso[0]->precio_unitario;
			$precio_venta  = $ingreso[0]->precio_venta;
			$resul = 1;
			$mensaje = "OK";
		}
		$resultado ='[{
						"idve_producto":"'.$idve_producto.'",
						"cantidad":"'.$cantidad.'",
						"precio":"'.$precio.'",
						"precio_venta":"'.$precio_venta.'",
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	

}
