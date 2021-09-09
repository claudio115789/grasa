
<?php
	
	$resultado=mysql_query("SELECT c.*, t. `nome` AS categorias FROM `documentos` AS c
		INNER JOIN `categorias` AS t ON c.`categoria_id` = t.`id`
		ORDER BY c.`nome` ASC");
	$linhas=@mysql_num_rows($resultado);
?>	
<div class="container theme-showcase" role="main">      
  <div class="page-header">
     <meta charset="utf-8">
	<h1>Lista de Documentos</h1>
  </div>
  <div class="row espaco">
		<div class="pull-right">
			<a href="administrativo.php?link=11"><button type='button' class='btn btn-sm btn-success'>Cadastrar</button></a>
		</div>
	</div>
	
  <div class="row">
	<div class="col-md-12">
	 		<table id="tabela" 	 class="table table-striped table_ong" cellspacing="0" width="100%" data-dynamic-table data-column-sort="0" data-order-sort="DESC" >
 

		<thead>
		  <tr>
			<th>Nome</th>
			<th>Categoria</th>
			<th>Validade</th>
			 <th>Ações</th>
			
		  </tr>
		  <tr>
		  <th><input type="text" id ="txtColuna1" /></th>  	
		  <th><input type="text" id ="txtColuna2" /></th>
		   <th><input type="text" id ="txtColuna3" size="10" maxlength="10" /></th>

		  </tr>
		</thead>
		<tbody>
		
			<?php 
			
				while($linhas = @mysql_fetch_array($resultado)){
					
					echo "<tr>";
						
						echo "<td>".$linhas['nome']."</td>";
						echo "<td>".$linhas['categorias']."</td>";
						echo "<td>".$linhas['validade']."</td>";
						
						
		
						?>
						<td> 					
						
						<a href='administrativo.php?link=13&id=<?php echo $linhas['id']; ?>'><button type='button' class='btn btn-sm btn-warning'>Editar</button></a>
						
						<a href='processa/proc_apagar_documento.php?id=<?php echo $linhas['id']; ?>'><button type='button' class='btn btn-sm btn-danger'>Apagar</button></a>
						
						<?php
					echo "</tr>";
				}
			?>
		</tbody>
	  </table>
	 <!-- <link rel="stylesheet" type="text/css" href="js/estilo.css"/>-->
	<script type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript" src="js/script.js"></script> 	


	</div>
	</div>
</div> <!-- /container -->

