var base_url;
var alertaValidacion = '';
var fechaActual = '';
function baseurl(enlace,fecha)
{
    base_url = enlace;
    fechaActual = fecha;
    
}
function cargarfunciones()
{
    $('#fechaVentas').val(fechaActual);
    
    //limpiarFormularioIngreso();
    //cargarProveedores();    
    //cargarTablaIngresos();
    cargarDatosTabla();    
}

function cargarTablaReporteVentas()
{
    var fecha  = $('#fechaVentas').val();
    var estado = $('#estadoVentas').val();    
    
}



function cargarDatosTabla()
{
    //var enlace = base_url + "Reportes/Reportes/prubeas";
    var fecha  = $('#fechaVentas').val();
    var estado = $('#estadoVentas').val();
    calcularTotal();  
    var enlace = base_url + "Reportes/Reportes/cargartablasReportesVentas";
    $('#idTablaVentas').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 10,
         "ajax": {
            type: "POST",
            url: enlace,
            data: {fec:fecha, est:estado},
        },
    });
}
function calcularTotal()
{
    var fecha  = $('#fechaVentas').val();
    var estado = $('#estadoVentas').val();    
    var enlace = base_url + "Reportes/Reportes/calculoTotal";    
    $.ajax({
        type: "POST",
        url: enlace,
       data: {fec:fecha, est:estado},
        success: function(data)
        {
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {
                $('#costoTotal').text('TOTAL: '+datos.mensaje+' Bs.');
            });
        }
    });
}
