<script src="<?php echo  base_url() ?>scriptjs/jquery.js"></script>
<script src="<?php echo  base_url() ?>scriptjs/ventas/ventas.js"></script>
<style>
.btn-circle {
    width: 30px;
    height: 30px;
    padding: 6px 0px;
    border-radius: 15px;
    text-align: center;
    font-size: 16px;
    line-height: 1.22857; margin-left: 3px;
}
</style>

<div class="card" id="materialSeleccionado" >    
    <div class="card-body">
        <div class="col-12">
            <h1 class="page-title">REGISTRO DE VENTAS</h1>        
        </div> 
        <!--<div class="row">
            <div class="col-2">
                <label>FECHA VENTAS</label>
                <input type="date" class="form-control" id="fechaVentas" name="fechaVentas" required="required">
            </div>
            <div class="col-2">
                <label>ESTADO VENTA</label>
                <select class="form-control" id="estadoVentas" name="estadoVentas">
                    <option value="PEN" selected>PENDIENTE</option>
                    <option value="AC">ENTREGADO</option>
                    <option value="AN">CANCELADO</option>
                </select>
                
            </div>
            <div class="col-3"><BR>
                <button type="button" id="btnrango" class="btn btn-primary " onclick='ventasModal()' ><i class="mdi mdi-pencil"></i> VER REPORTE</button>
                
            </div>
        </div>-->

        <div class="card-body">                    
            <div class="col-12">
                <button type="button" id="btnrango" class="btn btn-warning float-right" onclick='nuevaVenta()' ><i class="mdi mdi-pencil"></i> Nueva Venta</button>
            </div>
        </div>
        <br>
        <div class="col-12">
            <table id="idTablaVentas" class="table table-striped table-responsive" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-dark text-white">
                            <th>OPCIONES</th>
                            <th>NRO</th>
                            <th>FECHA</th>
                            <th>NUM PEDIDO</th>
                            <th>CLIENTE</th>
                            <th>COSTO TOTAL</th>
                            <th>ESTADO</th>                            
                        </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>


<div class="modal " id="ventaFormularioModal" tabindex="-1"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1200px; max-height: 800px; overflow-y: scroll;" role="document">        
        <div class="modal-content" >
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel"><b>Formulario de Ingreso</b></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
                <div class="col-12">
                    <h2 class="modal-title" id="exampleModalLabel"><b>PRODUCTOS DE INVENTARIO</b></h2>
                    <table id="idTablaProductosVentas" class="table table-striped table-responsive" cellspacing="0" width="100%">
                        <thead>
                            <tr class="bg-dark text-white">                                    
                                    <th>NRO</th>
                                    <th>CATEGORIA</th>
                                    <th>DESCRIPCION PRODUCTO</th>
                                    <th>UNIDAD</th>
                                    <th>CANTIDAD EN ALMACEN</th>
                                    <th>PRECIO UNITARIO</th>
                                    <th>OPCIONES</th>
                                </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>            
            <div class="col-lg-12">
                <table border="0" width="100%">
                    <tr>
                        <td><label><strong>NOMBRE CLIENTE</strong></label>
                            <input type="text" class="form-control" id="txtCliente" name="txtCliente" required="required">
                        </td>
                        <td></td>
                        <td style="text-align: center;"><BR><h1 class="modal-title" id="exampleModalLabel"><b id="costoTotal"></b></h1></td>
                        <td></td>
                        <td><br><button id="guardarIngreso" type="button" class="btn btn-success" onclick="consolidarVenta()"><span class="glyphicon glyphicon-floppy-disk"></span>GUARDAR VENTA</button> </td>
                    </tr>
                </table> 
            </div>
            <div class="modal-body ">
                <div class="col-12">
                    <h2 class="modal-title" id="exampleModalLabel"><b>PRODUCTOS SELECCIONADOS</b></h2>
                    <table id="tablaProductosSeleccionados" class="table table-striped table-responsive" cellspacing="0" width="100%">
                        <thead>
                            <tr class="bg-dark text-white">
                                    <th>NRO</th>
                                    <th>CATEGORIA</th>
                                    <th>DESCRIPCION PRODUCTO</th>
                                    <th>UNIDAD</th>
                                    <th>PRECIO UNITARIO</th>
                                    <th>CANTIDAD</th>
                                    <th>SUB TOTAL</th>
                                    <th>OPCIONES</th>                            
                                </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" >Cerrar</button>
                             
            </div>
        </div>
        
    </div>
</div>

<div class="modal fade" id="ventaFormularioModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<div class="modal " id="formularioVentaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 600px;" role="document" >
        
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel"><b>Registro Cantidad de Productos</b></h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body " style="background: #C9EDE4; " >

                    <form id="formularioIngresoMaterial">
                        <div  class=" col-lg-12 alert alert-danger"  id="validacionIngreso" style="display: none;"></div>

                        <div class="row">
                            <input type="hidden" class="form-control" id="accion" name="accion" required="required">
                            <input type="hidden" class="form-control" id="id_registro" name="id_registro" required="required">
                            <input type="hidden" class="form-control" id="id_producto" name="id_producto" required="required">

                            <div class="col-lg-12">
                                <strong><div id="nombre_producto">COMIDA</div></strong><br>
                                <label><strong>CANTIDAD DE VENTA</strong></label>
                                <input type="number" class="form-control" id="txtCantidad" name="txtCantidad" required="required">
                            </div>
                            
                        </div>
                    </form>
                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" >Cerrar</button>
                    <button id="guardarIngresoCantidad" type="button" class="btn btn-success" onclick='registrarVenta()'><span class="glyphicon glyphicon-floppy-disk"></span>Agregar</button>
                </div>
            </div>
        
    </div>
</div>





<script type="text/javascript">
    $(document).ready(function(){
        var enlace = "<?php echo  base_url() ?>";
        baseurl(enlace);
        cargarfunciones();
        init_contadorTa("txtmotivo","contadorTaComentario", 250);
         $('#txtNumeroFactura').on('input', function () {
            this.value = this.value.replace(/[^0-9,]/g, '').replace(/,/g, '.');
            }); 
    });
</script>