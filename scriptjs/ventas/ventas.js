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
    cargarTablaProductos();
}

function cargarTablaVentas()
{

    var enlace = base_url + "Ventas/Ventas/cargartablasVentas";

    $('#idTablaVentas').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 3,
         "ajax": {
            type: "GET",
            url: enlace,
        },
    });
}


function cargarTablaProductos()
{

    var enlace = base_url + "Ingresos/Ingresos/cargartablasMateriales";

    $('#idTablaMateriales').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 3,
         "ajax": {
            type: "GET",
            url: enlace,
        },
    });
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

function init_contadorTa(idtextarea, idcontador, max) {

    $("#" + idtextarea).keyup(function() {
        ContadorTa(idtextarea, idcontador, max);
    });
    $("#" + idtextarea).change(function() {
        ContadorTa(idtextarea, idcontador, max);
    });

}