<script src="<?php echo  base_url() ?>scriptjs/jquery.js"></script>
<script src="<?php echo  base_url() ?>scriptjs/reportes/reportes.js"></script>
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
            <h1 class="page-title">REPORTE DE VENTAS</h1>        
        </div> 
        <div class="row">
            <div class="col-2">
                <label>FECHA VENTAS</label>
                <input type="date" class="form-control" id="fechaVentas" name="fechaVentas" required="required">
            </div>
            <div class="col-2">
                <label>ESTADO VENTA</label>
                <select class="form-control" id="estadoVentas" name="estadoVentas">
                    <option value="AC" selected>ENTREGADO</option>
                    <option value="PEN">PENDIENTE</option>                    
                    <option value="AN">ANULADO</option>
                </select>
                
            </div>
            <div class="col-3"><BR>
                <button type="button" id="btnrango" class="btn btn-primary " onclick='cargarDatosTabla()' ><i class="mdi mdi-pencil"></i> VER REPORTE</button>
            </div>
            <div class="col-3"><br>
                <h1 class="modal-title" id="exampleModalLabel"><b id="costoTotal"></b></h1>
            </div>
        </div>

        <br>
        <div class="col-12">
            <table id="idTablaVentas" class="table table-striped table-responsive" cellspacing="0" width="100%">
                <thead>
                    <tr class="bg-dark text-white">                            
                            <th>NRO</th>
                            <th>FECHA</th>
                            <th>NUM PEDIDO</th>
                            <th>CLIENTE</th>
                            <th>PRODUCTO</th>
                            <th>CANTIDAD</th>
                            <th>PRECIO UNITARIO</th>
                            <th>SUB TOTAL</th>
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
        var fecha = "<?php echo  $fecha ?>";
        baseurl(enlace,fecha);
        cargarfunciones();    
    });
</script>