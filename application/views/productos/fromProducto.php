<script src="<?php echo  base_url() ?>scriptjs/jquery.js"></script>
<script src="<?php echo  base_url() ?>scriptjs/productos/productos.js"></script>

<style>

.btn-circle {
    width: 30px;
    height: 30px;
    padding: 6px 0px;
    border-radius: 15px;
    text-align: center;
    font-size: 12px;
    line-height: 1.42857;
}

</style>

<h1 class="page-title">CONTROL DE PRODUCTOS</h1>
<div class="card">
    <div class="card-body">
        <div class="col-12">
            <div class="col-2 col-lg-2 ml-lg-auto">
                <button type="button" name='btnRegistroMaterial' class="btn btn-success" onclick='adicionarProducto()'><i class="mdi mdi-check"></i>Adicionar Producto</button>
            </div>
            <hr>
            <table id="idTablaProductos" class="table table-striped table-responsive" cellspacing="0" width="100%">
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
</div>
<div class="modal " id="registroProductoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1000px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel"><b>Nuevo Material</b></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formProducto">
                    <div class="col-12 row">
                        <input type="text" class="form-control" id="texto" name="texto" hidden>
                        <input type="text" class="form-control" id="id_material" name="id_material" hidden>
                        <div class="col-4 form-group">
                            <label class="form-control-label">Proveedor:</label>
                            <select class="form-control" id="cbproveedor" name="cbproveedor">
                            </select>
                            <div id="cbproveedor_error" style="display: none;"><small><label class="error text-danger">El Codigo es requerido.</label></small></div>
                        </div>
                        <div class="col-4 form-group">
                            <label class="form-control-label">Industria:</label>
                            <select class="form-control" id="cbcategoria" name="cbcategoria"  >
                            </select>
                            <div id="txtcbcategoria_error" style="display: none;"><small><label class="error text-danger">El Codigo es requerido.</label></small></div>
                        </div>
                        <div class="col-4 form-group">
                            <label class="form-control-label">Categoria:</label>
                            <select class="form-control" id="cbcategoria" name="cbcategoria">
                            </select>
                            <div id="cbcategoria_error" style="display: none;"><small><label class="error text-danger">La Categoria es requerida.</label></small></div>
                        </div>
                        <div class="col-4 form-group">
                            <label class="form-control-label">Descripción:</label>
                            <input type="text" class="form-control" id="txtdescripcion" name="txtdescripcion">
                            <div id="txtdescripcion_error" style="display: none;"><small><label class="error text-danger">El Descripcion es requerido.</label></small></div>
                        </div>
                        
                        <div class="col-4 form-group">
                            <label class="form-control-label">Unidad Venta:</label>
                            <input type="text" class="form-control" id="txtunidad" name="txtunidad">
                            <div id="unidad_error" style="display: none;"><small><label class="error text-danger">La Sub Categoria es requerida.</label></small></div>
                        </div>
                        
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success" onclick=guardar()>Guardar</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var enlace = "<?php echo  base_url() ?>";
        baseurl(enlace);
        cargarfunciones();
        cargarCombos();
    });
</script>