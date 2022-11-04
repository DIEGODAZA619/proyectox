<!DOCTYPE html>
<html lang="en">
<head>
  <title>LULUZ</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<?php echo base_url();?>resources/node_modules/mdi/css/materialdesignicons.css">
    <link rel="stylesheet" href="<?php echo base_url();?>resources/node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>resources/node_modules/datatables.net-bs4/css/dataTables.bootstrap4.css" />
    <link rel="stylesheet" href="<?php echo base_url();?>resources/node_modules/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<?php echo base_url();?>resources/css/style.css">
    <!-- endinject -->
    <link rel="stylesheet" rel="shortcut icon" href="<?php echo base_url();?>resources/images/faces/face.jpg" />
    <script src="<?php echo  base_url() ?>scriptjs/inicio.js"></script>
    <script src="<?php echo  base_url() ?>resources/js/sweetalert.min.js"></script>
</head>
<body class="navbar-primary">

    <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
        <nav class="navbar col-lg-12 col-12 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper">
                    <!--img src="<?php echo base_url();?>resources/images/logos/senape.png"/-->
                <a class="navbar-brand brand-logo">
                    <img width="80" height="80" src="<?php echo base_url();?>resources/images/logos/<?= $logo_empresa?>"/>
                </a>
                <a class="navbar-brand brand-logo-mini" href="#"><i class="mdi mdi-home"></i></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center">
                    <button class="navbar-toggler navbar-toggler align-self-center mr-2" type="button" data-toggle="minimize">
                        <span class="mdi mdi-menu"></span>
                    </button>
                    <div class=" nav-profile col-6">
                        <span><?= $nombre_empresa?></span>
                    </div>
                    <div  class="nav-profile col-3">
                        <span class=" float-right" > USUARIO:  <?= $nombre_usuario?></span>
                    </div>
                    
                    <div class=" float-left nav-profile col-1" style="margin:0; padding:0;">
                        <ul class="navbar-nav" >
                        <li class="nav-item dropdown">
                        <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-toggle="dropdown">
                            <i class="mdi mdi-arrow-down-drop-circle-outline"></i>
                        </a>
                        <div class="dropdown-menu navbar-dropdown notification-drop-down" aria-labelledby="notificationDropdown">
                            <a class="dropdown-item" href="<?php echo base_url()?>Login/salir">
                                <i class="mdi mdi-close text-danger"></i>
                                <span class="notification-text">Cerrar Sesión</span>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </nav>