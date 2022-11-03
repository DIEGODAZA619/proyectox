<?php

function actualizarInventarioResumen($id_material,$cantidad,$tipoProceso,$precioVenta = 0)
{
  $fila =& get_instance();
  $fila->load->model('ingresos_model');
  $fechaHora = getFechaHoraActual();
  $resumen = $fila->ingresos_model->getInventarioResumenId($id_material);
  $id_registro       = $resumen[0]->id;
  $cantidad_entrada    = $resumen[0]->cantidad_entrada;
  $cantidad_salida   = $resumen[0]->cantidad_salida;
  $saldo         = $resumen[0]->saldo;
  $cantidad_solicitada = $resumen[0]->cantidad_solicitada;
  $cantidad_disponible = $resumen[0]->cantidad_disponible;
  switch ($tipoProceso)
  {
    case "INGRESO":
      $cantidad_entrada     = $cantidad_entrada + $cantidad;
      $saldo          = $cantidad_entrada - $cantidad_salida;
      $cantidad_disponible   = $saldo - $cantidad_solicitada;
      $precio_venta_unitario = $precioVenta;
      break;

    case "SALIDA":
      $cantidad_salida    = $cantidad_salida + $cantidad;
      $saldo          = $cantidad_entrada - $cantidad_salida;
      $cantidad_solicitada  = $cantidad_solicitada - $cantidad;
      $cantidad_disponible  = $saldo - $cantidad_solicitada;
      break;

    case "SOLICITUD":       
      $cantidad_solicitada  = $cantidad_solicitada + $cantidad;
      $cantidad_disponible  = $saldo - $cantidad_solicitada;
      break;
  }
  if ($tipoProceso == "INGRESO")
  {
    $dataUpdate = array(     
      'cantidad_entrada'  => $cantidad_entrada,
      'cantidad_salida'   => $cantidad_salida,
      'saldo'                 => $saldo,
      'precio_venta_unitario' => $precioVenta,
      'cantidad_solicitada' => $cantidad_solicitada,
      'cantidad_disponible' => $cantidad_disponible
      );
  }
  else
  {
    $dataUpdate = array(     
      'cantidad_entrada'  => $cantidad_entrada,
      'cantidad_salida'   => $cantidad_salida,
      'saldo'       => $saldo,
      'cantidad_solicitada' => $cantidad_solicitada,
      'cantidad_disponible' => $cantidad_disponible
      );
  }
  
  $idUpdateIngreso = $fila->ingresos_model->updateInventarioResumen($id_registro,$dataUpdate);

  return $idUpdateIngreso;


}




function nombreCliente($id_producto)
{
  $fila =& get_instance();
  $fila->load->model('ventas_model');    
  $filas = $fila->ventas_model->getDatosClienteId($id_producto);
  if($filas)
  {
    return $filas[0]->nombres;
  }
  else
  {
    return "";
  }  
}


function verificarActivacion($idEmpresa)
{
  return true;
}


function getFechaHoraActual()
{
  /*$hoy = date("Y-m-d h:m:s"); //fecha de hoy
  $hoy = strtotime ( '-5 hour' , strtotime ($hoy) ); 
  //$hoy = strtotime ( '+1 minute' , strtotime ($hoy) ); 
  $hoy = date ( 'Y-m-d H:i:s' , $hoy); 
  return $hoy;*/
  $mifecha= date('Y-m-d H:i:s'); 
  $NuevaFecha = strtotime ( '-5 hour' , strtotime ($mifecha) ) ; 
  $NuevaFecha = strtotime ( '-0 minute' , $NuevaFecha ) ; 
  //$NuevaFecha = strtotime ( '+30 second' , $NuevaFecha ) ; 
  $NuevaFecha = date ( 'Y-m-d H:i:s' , $NuevaFecha); 
  return $NuevaFecha;
}
function formato_fecha_hora($fecha)
{
    if($fecha)
    {
      $timestamp = strtotime($fecha);
      return date('d-m-Y H:i:s', $timestamp);
    }
    else
    {
      return "";
    }
}
function getFechaActual()
{
  $mifecha= date('Y-m-d H:i:s'); 
  $NuevaFecha = strtotime ( '-5 hour' , strtotime ($mifecha) ); 
  $NuevaFecha = strtotime ( '-0 minute' , $NuevaFecha );

  $hoy = date("Y-m-d", $NuevaFecha); //fecha de hoy
  return $hoy;
}
function gestion_vigente()
{
  $gestion = date("Y"); //fecha de hoy
  return $gestion;
}
?>