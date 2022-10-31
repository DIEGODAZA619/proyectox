var base_url;
var alertaValidacion = '';
function baseurl(enlace)
{
    base_url = enlace;
}
function cargarfunciones(tipoSolicitud)
{
    $('#tipo_solicitud').val(tipoSolicitud);
    cargarTablaConfirmacionsolicitudes();
    cargarTablasolicitudes();
    /*limpiarFormularioIngreso();    
    cargarMaterialesAcumulados(); 
    habilitarTablasBotones();*/


}

function cargarTablaConfirmacionsolicitudes()
{
    var enlace = base_url + "Solicitudes/Confirmar_direccion/cargartablaSolicitadesConfirmadas";
    $('#idTablaMaterialesConfirmados').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 3,
         "ajax": {
            type: "POST",
            url: enlace,            
        },
    });
}

function cargarTablasolicitudes()
{
    var enlace = base_url + "Solicitudes/Confirmar_direccion/cargartablasMaterialesSolicitados";
    $('#idTablaMateriales').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 3,
         "ajax": {
            type: "POST",
            url: enlace,            
        },
    });
}


function cargarTablasolicitudesIdConfirmacion(idConfirmacion)
{
    var enlace = base_url + "Solicitudes/Confirmar_direccion/cargarTablasolicitudesIdConfirmacion";
    $('#idTablaMateriales').DataTable({
        destroy: true,
        "aLengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
        "iDisplayLength": 3,
         "ajax": {
            type: "POST",
            url: enlace,
            data: {id_conf: idConfirmacion},           
        },
    });
}


function confirmarPedidoDireccion()
{
    var enlace = base_url + "Solicitudes/Confirmar_direccion/confirmarPedidoDireccion";    
    $.ajax({
        type: "POST",
        url: enlace,               
        success: function(data)
        {            
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {                
                if(datos.resultado == 1)
                {
                  alert('SOLICITUDES CONFIRMADAS POR SU DIRECCION EXITOSAMENTE');
                  cargarTablaConfirmacionsolicitudes();
                  cargarTablasolicitudes();
                }
                else
                { 
                  alert(datos.mensaje);
                }
            });
        }
    });
}

// reportes 
function reporteMaterialConfirmado(fil)
{
    window.open(base_url+"Solicitudes/Confirmar_direccion/reporteMaterialConfirmado/"+fil);
}









