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
		//$fecha = getFechaActual();		
		$filas = $this->ventas_model->getDatosVentasEstado($estado);
		$data = array();
		$num = 1;
	    foreach ($filas as $fila)
	    {
		    $boton = "";
		    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Ver detalle Venta'>
						<button class='btn btn-success btn-circle' onclick='verdetalleVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Re imprimir Orden de pedido'>
						<button class='btn btn-warning btn-circle' onclick='reimprimirVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Entregar Pedido'>
						<button class='btn btn-secondary btn-circle' onclick='entregarVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>
					<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Cancelar Pedido'>
						<button class='btn btn-danger btn-circle' onclick='cancelarVenta(".$fila->id.")'><i class='mdi mdi-check'></i></button>
					</span>";
		    $data[] = array(
	                $boton,
	                $num++,
	                $fila->fecha_venta,
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
		    if($fila->cantidad_disponible > 0)
		    {
			    $boton ="<span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Seleccionar'>
						<button class='btn btn-success btn-circle' onclick='formularioVenta(".$fila->idve_producto.")'><i class='mdi mdi-check'></i></button>
					</span>	";
			}
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
						<button class='btn btn-success btn-circle' onclick='editarCantidadVenta(".$fila->id_solicitud.")'><i class='mdi mdi-check'></i></button>
					 </span>
					 <span class='d-inline-block' tabindex='0' data-toggle='tooltip' title='Eliminar'>
                     <button type='button' class='btn btn-danger btn-circle' onclick='eliminarVenta(".$fila->id_solicitud.")'><i class='mdi mdi-arrow-down'></i></button>
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
		$cantidad_disponible = $inventario[0]->cantidad_disponible;
		if($accion == 'nuevo')
		{
			if($txtCantidad <= $cantidad_disponible)
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
		}
		else
		{
			$filas  = $this->ventas_model->getSolicitudId($id_registro);			
			$cantidadSolicitada = $filas[0]->cantidad_solicitada;
			$producto           = $filas[0]->idve_producto;
	    	if($txtCantidad <= $cantidadSolicitada)
			{
				$dataVD = array(
	    			'cantidad_solicitada' 	=> $txtCantidad,
		    	);
		    	$actualizar = $this->ventas_model->updatesVentaDetalle($id_registro, $dataVD);
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
			elseif($txtCantidad<= ($cantidad_disponible + $cantidadSolicitada))
			{
				$dataVD = array(
	    			'cantidad_solicitada' 	=> $txtCantidad,
		    	);
		    	$actualizar = $this->ventas_model->updatesVentaDetalle($id_registro, $dataVD);
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
			else
			{
				$resul = 0;
				$mensaje = "La cantidad solicitada es mayor a la cantidad DISPONIBLE en almacen";
			}
			$actualización = actualizarCantidadInventario($producto);	
			//$resul = 0;
			//$mensaje = "La cantidad solicitada es mayor a la cantidad DISPONIBLE en almacen ". $txtCantidad ." - ". $cantidadSolicitada;
		}
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function eliminarPedido()
	{
		$id_registro = $this->input->post('pedido');
		$filas  = $this->ventas_model->getSolicitudId($id_registro);					
		$producto  = $filas[0]->idve_producto;
		$dataVD = array(
	    			'estado' => 'AN',
		    	);
		$actualizar = $this->ventas_model->updatesVentaDetalle($id_registro, $dataVD);
		$actualización = actualizarCantidadInventario($producto);		
		$resul = 1;
		$mensaje = "OK";
		$resultado ='[{						
						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}

	function editarCantidadVenta()
	{
		$pedido = $this->input->post('pedido');	
		$producto = 0;
		$cantidad = 0;	
		$filas  = $this->ventas_model->getSolicitudId($pedido);
		
		if($filas)
		{
			$producto = $filas[0]->idve_producto;
			$cantidad = $filas[0]->cantidad_solicitada;
			$resul = 1;
			$mensaje = "OK";
		}
		else
		{
			$resul = 0;
			$mensaje = "No se identifico el registro";
		}		
		$resultado ='[{						
						"producto":"'.$producto.'",
						"cantidad":"'.$cantidad.'",
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
		$id_venta = 0;
		$filas = $this->ventas_model->getProductosSeleccionados($id_usuario);
		if($filas)
		{
			$dataClient = array(
				'nombres' => strtoupper($nombreCliente)
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
		}
		else
		{
			$resul = 0;
			$mensaje = "NO SE TIENE PRODUCTOS SELECCIONADOS..!!";
		}
	    				
		$resultado ='[{						
						"id_venta":"'.$id_venta.'",
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function anularVenta()
	{
		$id_venta = $this->input->post('pedido');
		$id_usuario = $this->session->userdata('id_usuario');
		$fechaActual = getFechaActual();
		$data = array(	    				
	    				'fecha_modificacion' => $fechaActual,
	    				'estado' => 'AN'
		    		 );		 			
		$filas = $this->ventas_model->getVentasDetalles($id_venta);		
		foreach ($filas as $fila)
	    {	 		    	
	    	$id_venta_detalle = $fila->id;
	    	$producto	      = $fila->idve_producto;
	    	$update 	= $this->ventas_model->updatesVentaDetalle($id_venta_detalle,$data);
	    	$actualización = actualizarCantidadInventario($producto);
	    }
	    $update = $this->ventas_model->updatesVenta($id_venta,$data);
		$resul = 1;
		$mensaje = "OK";		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}
	function entregarVenta()
	{
		$id_venta = $this->input->post('id_ven');
		$id_usuario = $this->session->userdata('id_usuario');
		$fechaActual = getFechaActual();
		$data = array(	    				
	    				'fecha_entrega' => $fechaActual,
	    				'estado' => 'AC'
		    		 );
		 $dataVD = array(	    				
	    				'fecha_modificacion' => $fechaActual,
	    				'estado' => 'AC'
		    		 );	
		$datosVenta = $this->ventas_model->getVentasDetallesId($id_venta);
		$cliente = $datosVenta[0]->id_cliente_solicitante;
		$filas = $this->ventas_model->getVentasDetalles($id_venta);		
		foreach ($filas as $fila)
	    {	 		    	
	    	$id_venta_detalle	    = $fila->id;	    	
	    	$idve_producto 		    = $fila->idve_producto;
	    	$cantidad_solicitada	= $fila->cantidad_solicitada;
	    	$precio_venta_oficial	= $fila->precio_unitario;

	    	$registroInvetario  = $this->registroMaterialInventario($id_venta,$id_venta_detalle,$idve_producto,$cantidad_solicitada,$cliente,$precio_venta_oficial);	 
	    	$update 			= $this->ventas_model->updatesVentaDetalle($id_venta_detalle,$dataVD);
	    }
	    $update = $this->ventas_model->updatesVenta($id_venta,$data);


		$resul = 1;
		$mensaje = "OK";		
		$resultado ='[{						
						"resultado":"'.$resul.'",
						"mensaje":"'.$mensaje.'"
					 }]';
		echo $resultado;
	}

	function registroMaterialInventario($id_venta,$id_venta_detalle,$idve_producto,$cantidad,$cliente,$precio_venta_oficial)
	//function registroMaterialInventario()
	{
		$inventario = $this->ventas_model->getMaterialInventarioPeps($idve_producto);
		foreach($inventario as $fila)
		{
			$idInventario = $fila->id;
			
			$saldo = $fila->saldo;
			echo $cantidad."---";
			if($cantidad > 0)
			{	
				if($saldo <= $cantidad)
				{
					$cantidad = $cantidad - $saldo;
					$guardar = $this->guardarMaterialesInventarioActualizado($id_venta,$id_venta_detalle,$idInventario,$saldo,$cliente,$precio_venta_oficial);				
					$saldo    = 0;
					echo "***saldo mayor";

				}
				else
				{					
					echo "***saldo menor";					
					$guardar = $this->guardarMaterialesInventarioActualizado($id_venta,$id_venta_detalle,$idInventario, $cantidad,$cliente,$precio_venta_oficial);										
					$cantidad = 0;
				}
			}
			else
			{
				break;
			}
			echo "<br>";		
		}
		return true;
	}


	function guardarMaterialesInventarioActualizado($id_venta,$id_venta_detalle,$idInventario, $cantidad,$cliente,$precio_venta_oficial)
	{
		$datosInventario = $this->ventas_model->getIdMaterialInventario($idInventario);
		$id_usuario = $this->session->userdata('id_usuario');
		$codad_empresa 					= $datosInventario[0]->codad_empresa;
		$gestion 						= $datosInventario[0]->gestion;
		$id_ingreso 					= $datosInventario[0]->id_ingreso;
		$id_ingreso_detalle 			= $datosInventario[0]->id_ingreso_detalle;
		$id_salida 						= $datosInventario[0]->id_salida;
		$id_salida_detalle 				= $datosInventario[0]->id_salida_detalle;
		$idve_producto 					= $datosInventario[0]->idve_producto;
		$tipo_proceso 					= $datosInventario[0]->tipo_proceso;
		$tipo_ingreso_egreso 			= $datosInventario[0]->tipo_ingreso_egreso;
		$cantidad_entrada 				= $datosInventario[0]->cantidad_entrada;
		$cantidad_salida 				= $datosInventario[0]->cantidad_salida;
		$saldo 							= $datosInventario[0]->saldo;
		$precio_unitario				= $datosInventario[0]->precio_unitario;
		$precio_venta 					= $datosInventario[0]->precio_venta;
		$precio_total 					= $datosInventario[0]->precio_total;
		$precio_venta_total 			= $datosInventario[0]->precio_venta_total;

		$fecha 							= $datosInventario[0]->fecha;
		$id_inventario 					= $datosInventario[0]->id_inventario;
		$id_inventario_inicial_ingreso  = $datosInventario[0]->id_inventario_inicial_ingreso;
		$id_cliente_solicitante    	    = $datosInventario[0]->id_cliente_solicitante;
		$id_usuario                 	= $datosInventario[0]->id_usuario;
		$fecha_registro 				= $datosInventario[0]->fecha_registro;
		$fecha_modificacion 			= $datosInventario[0]->fecha_modificacion;
		$estado 						= $datosInventario[0]->estado;
		
		$tabla = "ve_inventarios";
    	$cantidad_salida = $cantidad_salida + $cantidad;
    	$saldo = $cantidad_entrada - $cantidad_salida;    	
		$precio_total = $precio_unitario * $saldo;
		$tipo_proceso = 'INGS';

		$id_inventario = idMaximoTabla($tabla);
    	$dataIngreso = array(	    		
				
				'codad_empresa' => $codad_empresa,
				'gestion'    => $gestion,
				'id_ingreso' => $id_ingreso,
				'id_ingreso_detalle' => $id_ingreso_detalle,				
				'idve_producto' => $idve_producto,
				'tipo_proceso' => $tipo_proceso,
				'tipo_ingreso_egreso' => $tipo_ingreso_egreso,
				'cantidad_entrada' => $cantidad_entrada,
				'cantidad_salida' => $cantidad_salida,
				'saldo' => $saldo,
				'precio_unitario' => $precio_unitario,
				'precio_total' => $precio_total,
				'precio_venta' => $precio_venta,
				'precio_venta_total' => $precio_venta_total,				
				'fecha' => $fecha,
				'id_inventario' => $idInventario,
				'id_cliente_solicitante' => $id_cliente_solicitante,
				'id_usuario' => $id_usuario,				
				'id_inventario_inicial_ingreso' => $id_inventario_inicial_ingreso,
				'estado' => 'AC',				
    	);
    	
    	$cantidad_salida = $cantidad;
    	$precio_total = $precio_unitario * $cantidad;
    	$precio_venta_total_oficial = $precio_venta_oficial * $cantidad;
    	$tipo_ingreso_egreso = 'SOLM';
    	$id_inventario = idMaximoTabla($tabla);

    	$dataSalida = array(	    		
				
				'codad_empresa' => $codad_empresa,
				'gestion'    => $gestion,				
				'id_salida' => $id_venta,
				'id_salida_detalle' => $id_venta_detalle,
				'idve_producto' => $idve_producto,				
				'tipo_ingreso_egreso' => $tipo_ingreso_egreso,				
				'cantidad_salida' => $cantidad_salida,				
				'precio_unitario' => $precio_unitario,
				'precio_total' => $precio_total,
				'precio_venta' => $precio_venta_oficial,
				'precio_venta_total' => $precio_venta_total_oficial,				
				'id_inventario' => $idInventario,
				'id_cliente_solicitante' => $cliente,
				'id_usuario' => $id_usuario,				
				'id_inventario_inicial_ingreso' => $id_inventario_inicial_ingreso,
				'estado' => 'AC',				
    	);
    	
    	$dataUpdate = array(	    						
				'estado' => 'HI',	
    	);
		
		$idIngreso = $this->ingresos_model->registrarIngresosInvetarios($dataIngreso);
    	$idEgreso  = $this->ingresos_model->registrarIngresosInvetarios($dataSalida);
		$update    = $this->ventas_model->editarInventarioProducto($idInventario,$dataUpdate);
		$tipoProceso = "SALIDA";
		$actualizarInvetario = actualizarInventarioResumen($idve_producto,$cantidad,$tipoProceso);
		
		return true;

	}
	function pruebahora()
	{
		echo getFechaHoraActual();
	}
}

