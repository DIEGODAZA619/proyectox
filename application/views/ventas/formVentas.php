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
            <h1 class="page-title">VENTAS</h1>        
        </div> 
        <div class="row">
            <div class="col-2">
                <label>FECHA VENTAS</label>
                <input type="date" class="form-control" id="txtCantidad" name="txtCantidad" required="required">
            </div>
            <div class="col-2">
                <label>ESTADO VENTA</label>
                <select class="form-control" id="txtCantidad" name="txtCantidad">
                    <option value="PEN" selected>PENDIENTE</option>
                    <option value="AC">ENTREGADO</option>
                    <option value="AN">CANCELADO</option>
                </select>
                
            </div>
            <div class="col-3"><BR>
                <button type="button" id="btnrango" class="btn btn-primary " onclick='ventasModal()' ><i class="mdi mdi-pencil"></i> VER REPORTE</button>
                
            </div>
        </div> 
        <div class="card-body">                    
            <div class="col-12">
                <button type="button" id="btnrango" class="btn btn-warning float-right" onclick='ventasModal()' ><i class="mdi mdi-pencil"></i> Nueva Venta</button>
            </div>
        </div>
        <br>
        <div class="col-12">
            <table id="idTablaVentas" class="table table-striped table-responsive" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-dark text-white">
                            <th>OPCIONES</th>
                            <th>NRO</th>
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