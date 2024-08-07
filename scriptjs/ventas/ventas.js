var base_url;
var alertaValidacion = '';
function baseurl(enlace)
{
    base_url = enlace;
}
function cargarfunciones()
{
    //limpiarFormularioIngreso();
    //cargarProveedores();    
    //cargarTablaIngresos();
    cargarTablaVentas();
    cargarTablaProductosInventarios();
    cargarTablaProductosSeleccionados();
}

function cargarTablaVentas()
{
    var enlace = base_url + "Ventas/Ventas/cargartablasVentas";
    $('#idTablaVentas').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 10,
         "ajax": {
            type: "GET",
            url: enlace,
        },
    });
}

function cargarTablaProductosInventarios()
{

    var enlace = base_url + "Ventas/Ventas/getProductosInvetario";

    $('#idTablaProductosVentas').DataTable({
        destroy: true,
        "aLengthMenu": [[5, 15, 20, -1], [5, 15, 20, "Todos"]],
        "iDisplayLength": 5,
         "ajax": {
            type: "GET",
            url: enlace,
        },
    });
}
function cargarTablaProductosSeleccionados()
{
    var enlace = base_url + "Ventas/Ventas/getProductosSeleccionados";
    $('#tablaProductosSeleccionados').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 3,
         "ajax": {
            type: "GET",
            url: enlace,
        },
    });
}




function nuevaVenta()
{
    costoVenta();
    $('#txtCliente').val('');
    cargarTablaProductosInventarios();
    $('#ventaFormularioModal').modal({backdrop: 'static', keyboard: false})
    $('#ventaFormularioModal').modal('show');   
}

function formularioVenta(id_producto)
{
    var enlace = base_url + "Ventas/Ventas/verificarPedidoProducto";        
    $.ajax({
        type: "POST",
        url: enlace,
        data: {pro:id_producto},
        success: function(data)
        {
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {
                if(datos.resultado == 1)
                {                    
                    $('#guardarIngresoCantidad').text('Guardar');
                    descripcionMaterial(id_producto);
                    $('#accion').val('nuevo');
                    $('#txtCantidad').val('');
                    $('#id_producto').val(id_producto);    
                    $('#formularioVentaModal').modal({backdrop: 'static', keyboard: false})
                    $('#formularioVentaModal').modal('show');                 
                }
                else
                {
                    alert(datos.mensaje);
                }
            });
        }
    });
}


function registrarVenta()
{
    var cantidad =  $('#txtCantidad').val();
    if(cantidad.length > 0)
    {
        var enlace = base_url + "Ventas/Ventas/guardarCantidad";
        var datos = $('#formularioIngresoMaterial').serialize();
        //alert(datos);
        $.ajax({
            type: "POST",
            url: enlace,
            data: datos,
            success: function(data)
            {
                var result = JSON.parse(data);
                $.each(result, function(i, datos)
                {
                    if(datos.resultado == 1)
                    {                    
                        $('#formularioVentaModal').modal('hide');
                        costoVenta(); 
                        cargarTablaProductosSeleccionados();
                        cargarTablaProductosInventarios();                 
                    }
                    else
                    {
                        alert(datos.mensaje);
                    }
                });
            }
        });
    }
    else
    {
        alert('INGRESE LA CANTIDAD '+cantidad.length);
    }
    
}

function costoVenta()
{
    var enlace = base_url + "Ventas/Ventas/costoVentaTotal";
    var datos = $('#formularioIngresoMaterial').serialize();
    //alert(datos);
    $.ajax({
        type: "POST",
        url: enlace,
        data: datos,
        success: function(data)
        {
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {
                $('#costoTotal').text('COSTO TOTAL: '+datos.mensaje+' Bs.');
            });
        }
    });
    
}


function consolidarVenta()
{
    var enlace = base_url + "Ventas/Ventas/consolidarVenta";
    var cliente = $('#txtCliente').val();
    if(cliente.length>0)
    {
        if(confirm('¿Estas seguro registrar la venta?'))
        {
            $.ajax({
            type: "POST",
            url: enlace,
            data: {cli:cliente},
            success: function(data)
            {
                var result = JSON.parse(data);
                $.each(result, function(i, datos)
                {
                    if(datos.resultado == 1)
                    {                    
                        
                        swal({title: "REGISTRO VENTA",text: 'VENTA REGISTRADA CORRECTAMENTE...!!!',icon: "success",button: "OK",}); 
                        
                        $('#ventaFormularioModal').modal('hide');
                        imprimirVenta(datos.id_venta);
                        cargarTablaProductosSeleccionados(); 
                        costoVenta();
                        cargarTablaVentas();                  
                    }
                    else
                    {
                        alert(datos.mensaje);
                    }
                });
            }
            });
        }
        else
        {
            return false;
        }
    }
    else
    {
        alert('INGRESE EL NOMBRE DEL CLIENTE');
    }
}

function entregarVenta(id_venta)
{
    if(confirm('¿Estas seguro realizar la entrega?'))
    {
        var enlace = base_url + "Ventas/Ventas/entregarVenta";
        $.ajax({
            type: "POST",
            url: enlace,
            data: {id_ven: id_venta},
            success: function(data)
            {
                swal({title: "REGISTRO VENTA",text: 'SE REGISTRO LA ENTREGA CORRECTAMENTE...!!!',icon: "success",button: "OK",});  
                cargarTablaVentas();                        
            }
        });
    }
    else
    {
        return false;
    }
}



function editarCantidadVenta(idPedido)
{    
    var enlace = base_url + "Ventas/Ventas/editarCantidadVenta";
    var cliente = $('#txtCliente').val();    
    $.ajax({
        type: "POST",
        url: enlace,
        data: {pedido:idPedido},
        success: function(data)
        {
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {
                if(datos.resultado == 1)
                {   
                    $('#guardarIngresoCantidad').text('Editar Cantidad');
                    descripcionMaterial(datos.producto);
                    $('#accion').val('editar');
                    $('#txtCantidad').val(datos.cantidad);
                    $('#id_producto').val(datos.producto);    
                    $('#id_registro').val(idPedido); 
                    $('#formularioVentaModal').modal({backdrop: 'static', keyboard: false})
                    $('#formularioVentaModal').modal('show');                   
                }
                else
                {
                    alert(datos.mensaje);
                }
            });
        }
    });    
}
function eliminarVenta(id_venta)
{
    if(confirm('¿Esta seguro eliminar el registro?'))
    {
        var enlace = base_url + "Ventas/Ventas/eliminarPedido";          
        $.ajax({
            type: "POST",
            url: enlace,
            data: {pedido:id_venta},
            success: function(data)
            {
                var result = JSON.parse(data);
                $.each(result, function(i, datos)
                {
                    if(datos.resultado == 1)
                    {   
                        $('#formularioVentaModal').modal('hide');
                        costoVenta(); 
                        cargarTablaProductosSeleccionados();
                        cargarTablaProductosInventarios();                         
                    }
                    else
                    {
                        alert(datos.mensaje);
                    }
                });
            }
        });    
    }
    else
    {
        return false;
    }
}

function cancelarVenta(id_venta)
{
    if(confirm('¿Esta seguro anular el registro de venta?'))
    {
        var enlace = base_url + "Ventas/Ventas/anularVenta";          
        $.ajax({
            type: "POST",
            url: enlace,
            data: {pedido:id_venta},
            success: function(data)
            {
                var result = JSON.parse(data);
                $.each(result, function(i, datos)
                {
                    if(datos.resultado == 1)
                    {   
                       swal({title: "REGISTRO VENTA",text: 'SE REGISTRO LA ANULADA CORRECTAMENTE...!!!',icon: "success",button: "OK",});  
                       cargarTablaVentas();                         
                    }
                    else
                    {
                        alert(datos.mensaje);
                    }
                });
            }
        });    
    }
    else
    {
        return false;
    }
}
function imprimirVenta(id_venta)
{
    var enlace = base_url + "Reportes/Reportes_ticket/imprimirTicketVenta";
    $.ajax({
        type: "POST",
        url: enlace,
        data: {id_ven: id_venta},
        success: function(data)
        {
            swal({title: "REGISTRO VENTA",text: 'RECOJA EL TICKET DE PEDIDO...!!!',icon: "success",button: "OK",});                            
        }
    });
}


function reimprimirVenta(id_venta)
{
    if(confirm('¿Esta seguro reimprimir la orden de pedido?'))
    {
        var enlace = base_url + "Reportes/Reportes_ticket/imprimirTicketVenta";
        $.ajax({
            type: "POST",
            url: enlace,
            data: {id_ven: id_venta},
            success: function(data)
            {
                swal({title: "REGISTRO VENTA",text: 'RECOJA EL TICKET DE PEDIDO...!!!',icon: "success",button: "OK",});                            
            }
        });
    }
    else
    {
        return false;
    }
}






function descripcionMaterial(id_material)
{
    var enlace = base_url + "Ingresos/Ingresos/getMaterialesId";
    $.ajax({
        type: "POST",
        url: enlace,
        data: {id_mat: id_material},
        success: function(data)
        {
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {
                if(datos.resultado == 1)
                {
                    $('#nombre_producto').text('Producto seleccionado: '+datos.descripcion);
                }
                else
                {
                    alert(datos.mensaje);
                }
            });
        }
    });
}


function init_contadorTa(idtextarea, idcontador, max) {

    $("#" + idtextarea).keyup(function() {
        ContadorTa(idtextarea, idcontador, max);
    });
    $("#" + idtextarea).change(function() {
        ContadorTa(idtextarea, idcontador, max);
    });

}