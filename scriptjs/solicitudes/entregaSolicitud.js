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
    /*limpiarFormularioIngreso();    
    cargarMaterialesAcumulados(); 
    habilitarTablasBotones();*/
    $('#btnAutorizar').hide();


}

function cargarTablaConfirmacionsolicitudes()
{
    var enlace = base_url + "Solicitudes/Entrega_solicitud/cargartablaSolicitadesConfirmadas";
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



function cargarTablasolicitudesIdConfirmacion(idConfirmacion)
{    
    $('#txtIdSolicitudDireccion').val(idConfirmacion);

    $('#btnAutorizar').show();
    var enlace = base_url + "Solicitudes/Entrega_solicitud/cargarTablasolicitudesIdConfirmacion";
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


function autorizarPedidoDireccion()
{
    var idConfirmacion = $('#txtIdSolicitudDireccion').val();
    if(idConfirmacion > 0)
    {
        var enlace = base_url + "Solicitudes/Entrega_solicitud/autorizarPedidoDireccion";    
        $.ajax({
            type: "POST",
            url: enlace,   
            data: {id_conf: idConfirmacion},            
            success: function(data)
            {            
                var result = JSON.parse(data);
                $.each(result, function(i, datos)
                {                
                    if(datos.resultado == 1)
                    {                      

                      cargarTablaConfirmacionsolicitudes();
                      cargarTablasolicitudesIdConfirmacion(0); 
                      alert('SOLICITUD AUTORIZADA CORRECTAMENTE');
                      $('#btnAutorizar').hide();
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
        alert ('Seleccione una solicitud por favor');
    }    
}
function editarCantidadSolicitud(idSolicitud)
{   
    var enlace = base_url + "Solicitudes/Solicitudes/getSolicitudMaterialesId";        
    $.ajax({
        type: "POST",
        url: enlace,
        data: {id_sol: idSolicitud},
        success: function(data) 
        {
            var result = JSON.parse(data);
            $.each(result, function(i, datos)
            {
                if(datos.resultado == 0)
                {
                    alert(datos.mensaje);
                }
                else
                {
                    $('#accion').val('editar');
                    $('#id_material').val(datos.id_material);
                    $('#txtidRegistroSolicitud').val(idSolicitud);
                    $('#txtCantidad').val(datos.cantidad_solicitada);
                    $('#txtCantidadAutorizada').val(datos.cantidad_autorizada);                       
                    $('#editarCantidadSolicitada').modal({backdrop: 'static', keyboard: false})
                    $('#editarCantidadSolicitada').modal('show');                                        
                    descripcionMaterial(datos.id_material);                        
                }
            });
        }
    });   
}
function descripcionMaterial(id_material)
{    
    var enlace = base_url + "Ingreso/ingreso/getMaterialesId";    
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

function editarCantidadAutorizadaSolicitud()
{
    var idConfirmacion = $('#txtIdSolicitudDireccion').val();
    if(validardatos())
    {
        if(confirm('¿Estas seguro de editar la cantidad de material?'))
        {            
            $('#validacionpermiso').hide();
            var enlace = base_url + "Solicitudes/Entrega_solicitud/editarSolicitudMateriales";
            var datos = $('#formularioSolicitud').serialize();
            $.ajax({
                type: "POST",
                url: enlace,
                data: datos,
                success: function(data) 
                {
                    var result = JSON.parse(data);
                    $.each(result, function(i, datos)
                    {   
                        if(datos.resultado == 0)
                        {
                            $('#idvalidacion').text("VERIFICAR: " + datos.mensaje);
                            $('#idvalidacion').show();
                        }
                        else
                        {
                            alert('EL MATERIAL FUE REGISTRADO CORRECTAMENTE...!!!');
                            cargarTablasolicitudesIdConfirmacion(idConfirmacion);                                                      
                            $('#editarCantidadSolicitada').modal('hide'); 

                        }
                    });
                }
            });
        }
        else
        {
            $('#idvalidacion').hide();
            return false;
        }        
    } 
    else 
    {

        $('#validacionIngreso').text("Ingresar: " + alertaValidacion);
        $('#validacionIngreso').show();

        // alert("Falta llenar o seleccionar los campos: \n"+alertaValidacion+"\n deberán ser llenados o seleccionados");
        alertaValidacion = "";
    }
}

function validardatos()
{
    var todook = true;
    if ($('#txtCantidadAutorizada').val() == '') {
        todook = false;
        $('#txtCantidadAutorizada').closest(".form-group").addClass("has-error");
        alertaValidacion += " Cantidad de autorizada -  \n";
    }    
    return todook;
}






