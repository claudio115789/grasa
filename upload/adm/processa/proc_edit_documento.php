<?php
session_start();
include_once("../seguranca.php");
include_once("../conexao.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
	</head>
	
	<?php
$id 				= $_POST["id"];
$nome 				= $_POST["nome"];
$categoria_id 		= $_POST["categoria_id"];
$validade           = $_POST["validade"];
$arquivo	 		= $_FILES['arquivo']['name'];




if($arquivo == ""){
	$query = mysql_query("UPDATE documentos SET
		nome			='$nome',
		categoria_id 	='$categoria_id',		
		validade		='$validade',	
		modified = NOW() WHERE id='$id'");
	
		if (mysql_affected_rows() != 0 ){	
			echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://grasasorocaba.com.br/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"Produto editado com Sucesso.\");
				</script>
			";		   
		}
		 else{ 	
				echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://grasasorocaba.com.br/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"Produto não foi editado com Sucesso.\");
				</script>
			";		   

		}
	
}else{
	//Pasta onde o arquivo vai ser salvo
	$_UP['pasta'] = '../documento/';

	//Tamanho máximo do arquivo em Bytes
	$_UP['tamanho'] = 1024*1024*100; //5mb

	//Array com as extensoes permitidas
	$_UP['extensoes'] = array('png','jpg', 'jpeg', 'gif', 'pdf');

	//Renomeia o arquivo? (se true, o arquivo será salvo como .jpg e em nome único)
	$_UP['renomeia'] = false;

	//Array com os tipos de erros de upload do PHP
	$_UP['erros'][0] = 'Não houve erro';
	$_UP['erros'][1] = 'O arquivo no upload é maior que o limite do PHP';
	$_UP['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especificado no HTML';
	$_UP['erros'][3] = 'O upload do arquivo foi feito parcialmente';
	$_UP['erros'][4] = 'Não foi feito o upload do arquivo';
	
	//Verifica se houve algum erro com o upload. Sem sim, exibe a mensagem do erro
	if($_FILES['arquivo']['error'] != 0){
		die("Não foi possivel fazer o upload, erro: <br />". $_UP['erros'][$_FILES['arquivo']['error']]);
		exit; //Para a execução do script
	}
	
	//Faz a verificação da extensao do arquivo
	@$extensao = strtolower(end(explode('.', $_FILES['arquivo']['name'])));
	if(array_search($extensao, $_UP['extensoes'])=== false){
		$query = mysql_query("UPDATE documentos SET
		nome			='$nome',
		categoria_id 	='$categoria_id',		
		validade		='$validade',
		
		modified = NOW() WHERE id='$id'");
	
		if (mysql_affected_rows() != 0 ){	
			echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://localhost/public_html/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"A imagem não foi alterada for favor, envie arquivos com as seguintes extensões: png, jpg, jpeg e gif. As informações do produto foram alteradas.\");
				</script>
			";		   
		}
		 else{ 	
				echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://localhost/public_html/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"Produto não foi editado com Sucesso.\");
				</script>
			";		   

		}
			
	}
	//Faz a verificação do tamanho do arquivo
	else if ($_UP['tamanho'] < $_FILES['arquivo']['size']){
		$query = mysql_query("UPDATE documentos SET
		nome			='$nome',
		categoria_id 	='$categoria_id',
		validade        ='$validade'		
		modified = NOW() WHERE id='$id'");
		
		if (mysql_affected_rows() != 0 ){	
			echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://localhost/public_html/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
				alert(\"O arquivo enviado é muito grande, envie arquivos de até 2mb. As informações do produto foram alteradas com sucesso.\");
			</script>
			";		   
		}
		 else{ 	
				echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://localhost/public_html/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"Produto não foi editado com Sucesso.\");
				</script>
			";		   

		}		
	}
	//O arquivo passou em todas as verificações, hora de tentar move-lo para a pasta foto

	else{
		//Primeiro verifica se deve trocar o nome do arquivo
		if(@$UP['renomeia'] == true){
			//Cria um nome baseado no UNIX TIMESTAMP atual e com extensão .jpg
			$nome_final = time().'.pdf';
		}else{
			//mantem o nome original do arquivo
			$nome_final = $_FILES['arquivo']['name'];
		}
		//Verificar se é possivel mover o arquivo para a pasta escolhida
		if(move_uploaded_file($_FILES['arquivo']['tmp_name'], @$_UP['pasta']. $nome_final)){
			//Upload efetuado com sucesso, exibe a mensagem
			$query = mysql_query("UPDATE documentos SET
			nome			='$nome',
			categoria_id 	='$categoria_id',
			validade		='$validade',
			imagem 			='$nome_final'		
			
			modified = NOW() WHERE id='$id'");
			
			echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://localhost/public_html/upload/adm/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"Produto alterado com sucesso com Sucesso.\");
				</script>
			";	
		}else{
			//Upload não efetuado com sucesso, exibe a mensagem
			echo "
				<META HTTP-EQUIV=REFRESH CONTENT = '0;URL=http://localhost/public_html/upload/administrativo.php?link=10'>
				<script type=\"text/javascript\">
					alert(\"Produto não foi alterado com Sucesso.\");
				</script>
			";
		}
	}
}
		?>
	</body>
</html>