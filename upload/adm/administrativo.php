<?php
session_start();
include_once("seguranca.php");
include_once("conexao.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Página Administrativa">
    <meta name="author" content="Cesar">
    <link rel="icon" href="imagens/favicon.ico">

    <title>Administrativo</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <script src="js/ie-emulation-modes-warning.js"></script>
  </head>

  <body role="document">
	<?php
		include_once("menu_admin.php");
		
		$link = $_GET["link"];
		
		$pag[1] = "bem_vindo.php";
		$pag[2] = "listar_usuario.php";
		$pag[3] = "cad_usuario.php";
		$pag[4] = "editar_usuario.php";		
		$pag[5] = "visual_usuario.php";
		$pag[6] = "cad_categoria.php";
		$pag[7] = "listar_categoria.php";
		$pag[8] = "visual_categoria.php";
		$pag[9] = "editar_categoria.php";
		$pag[10] = "listar_documento.php";
		$pag[11] = "cad_documento.php";
		$pag[12] = "visual_documento.php";
		$pag[13] = "editar_documento.php";
		$pag[14] = "listar_situacao.php";
		$pag[15] = "cad_situacao.php";
		$pag[16] = "visual_situacao.php";
		$pag[17] = "editar_situacao.php";
		$pag[18] = "listar_nivel_acesso.php";
		$pag[19] = "cad_nivel_acesso.php";
		$pag[20] = "visual_nivel_acesso.php";
		$pag[21] = "editar_nivel_acesso.php";
		$pag[22] = "";
		$pag[23] = "";
		$pag[24] = "";
		$pag[25] = "listar_carousel.php";
		$pag[26] = "listar_mensagem_contato.php";
		
		if(!empty($link)){
			if(file_exists($pag[$link])){
				include $pag[$link];
			}else{
				include "bem_vindo.php";
			}
		}else{
			include "bem_vindo.php";
		}
		
	?>
    
	


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
	<script src="js/ckeditor/ckeditor.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
