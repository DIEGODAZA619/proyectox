<?php
require APPPATH . 'libraries/ticket/autoload.php'; 
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
function getFechaHoraActual2()
{
  $hoy = date("Y-m-d h:m:s"); //fecha de hoy
  return $hoy;
}
function imprimirVenta($id_venta)
{
	
		$fila =& get_instance();
		$fila->load->model('ventas_model');
		$datosVenta = $fila->ventas_model->getDatosVentasId($id_venta);
		$datosVentaDetalle = $fila->ventas_model->getDatosVentasDetalleId($id_venta);
		$nombre_impresora = "DIDISOFT";
		$fecha_hora = getFechaHoraActual();
		$connector = new WindowsPrintConnector($nombre_impresora);
		$printer = new Printer($connector);
		$printer->setJustification(Printer::JUSTIFY_CENTER);
		//$logo = EscposImage::load("madi.jpg", false);
		//$printer->bitImage($logo);
		

		$printer->text("LULUZ - COMIDA CON AMOR"."\n");		
		$printer->text("NRO. PEDIDO: ".$datosVenta[0]->correlativo_dia . "\n");	
		//$printer->text("NRO. PEDIDO: ".$datosVenta[0]->correlativo_dia." (COCINA)" . "\n");				
		$printer->text("FECHA Y HORA: ".$fecha_hora. "\n");
		$printer->text("CLIENTE:".$datosVenta[0]->nombres ."\n");
		#La fecha también		
		//$printer->text(""  . "\n");
		$printer->text("-----------------------------" . "\n");
		$printer->setJustification(Printer::JUSTIFY_LEFT);
		$printer->text("DESCRIPCION                CANT   P.U  SUB TOTAL\n");
		$printer->text("------------------------------------------------"."\n");
		$printer->setJustification(Printer::JUSTIFY_RIGHT);
		$sumaTotal = 0;
		foreach($datosVentaDetalle as $fila)
		{	
			$producto = $fila->valor1."                                      ";
			
			$producto = substr($producto,0,27);
			
			$cantidad = $fila->cantidad_solicitada;
			
			$precio_unitario = number_format($fila->precio_unitario,2);			
			if(strlen($precio_unitario)==3)
			{
				$precio_unitario = "  ".$precio_unitario;
			}
			if(strlen($precio_unitario)==4)
			{
				$precio_unitario = " ".$precio_unitario;
			}

			
			$subtotal = number_format($fila->precio_total,2);
			if(strlen($subtotal)==3)
			{
				$subtotal = "  ".$subtotal;
			}
			if(strlen($subtotal)==4)
			{
				$subtotal = " ".$subtotal;
			}
			$sumaTotal = $sumaTotal + $subtotal;
			$printer->text($producto."   ".$cantidad."   ".$precio_unitario."    ".$subtotal."\n");
		}	

		$printer->text("-----------------------------------------------"."\n");
		$printer->setJustification(Printer::JUSTIFY_RIGHT);		
		$printer->text("TOTAL: ".number_format($sumaTotal,2)."Bs.\n");
		$printer->setJustification(Printer::JUSTIFY_CENTER);
		$printer->text("Muchas gracias por su compra\n");
		$printer->feed(1);
		$printer->cut();
		//copia

		$printer->text("LULUZ - COMIDA CON AMOR"."\n");				
		$printer->text("NRO. PEDIDO: ".$datosVenta[0]->correlativo_dia." (COPIA COCINA)" . "\n");				
		$printer->text("FECHA Y HORA: ".$fecha_hora. "\n");
		$printer->text("CLIENTE:".$datosVenta[0]->nombres ."\n");
		#La fecha también		
		//$printer->text(""  . "\n");
		$printer->text("-----------------------------" . "\n");
		$printer->setJustification(Printer::JUSTIFY_LEFT);
		$printer->text("DESCRIPCION                CANT   P.U  SUB TOTAL\n");
		$printer->text("------------------------------------------------"."\n");
		$printer->setJustification(Printer::JUSTIFY_RIGHT);
		$sumaTotal = 0;
		foreach($datosVentaDetalle as $fila)
		{	
			$producto = $fila->valor1."                                      ";
			
			$producto = substr($producto,0,27);
			
			$cantidad = $fila->cantidad_solicitada;
			
			$precio_unitario = number_format($fila->precio_unitario,2);			
			if(strlen($precio_unitario)==3)
			{
				$precio_unitario = "  ".$precio_unitario;
			}
			if(strlen($precio_unitario)==4)
			{
				$precio_unitario = " ".$precio_unitario;
			}

			
			$subtotal = number_format($fila->precio_total,2);
			if(strlen($subtotal)==3)
			{
				$subtotal = "  ".$subtotal;
			}
			if(strlen($subtotal)==4)
			{
				$subtotal = " ".$subtotal;
			}
			$sumaTotal = $sumaTotal + $subtotal;
			$printer->text($producto."   ".$cantidad."   ".$precio_unitario."    ".$subtotal."\n");
		}		
		$printer->text("-----------------------------------------------"."\n");
		$printer->setJustification(Printer::JUSTIFY_RIGHT);		
		$printer->text("TOTAL: ".number_format($sumaTotal,2)."Bs.\n");
		$printer->setJustification(Printer::JUSTIFY_CENTER);
		$printer->text("Muchas gracias por su compra\n");
		$printer->feed(1);
		$printer->cut();

		$printer->pulse();
		$printer->close();
}

?>