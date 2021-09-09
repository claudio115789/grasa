<?php
	$id = $_GET['id'];
	//Executa consulta
	$result = mysql_query("SELECT * FROM documentos WHERE id = '$id' LIMIT 1");
	$resultado =@mysql_fetch_assoc($result);
	$id_produto = $resultado['id'];
?>
<div class="container theme-showcase" role="main">      
  <div class="page-header">
	<h1>Editar Documento</h1>
  </div>
  <div class="row espaco">
		<div class="pull-right">
			<a href='administrativo.php?link=10&id=<?php echo $resultado['id']; ?>'><button type='button' class='btn btn-sm btn-info'>Listar</button></a>
			
			<a href='processa/proc_apagar_documento.php?id=<?php echo $resultado['id']; ?>'><button type='button' class='btn btn-sm btn-danger'>Apagar</button></a>
		</div>
	</div>
  <div class="row">
	<div class="col-md-12">
	  <form class="form-horizontal" method="POST" action="processa/proc_edit_documento.php" enctype="multipart/form-data">
	  
		  <div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Nome</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" name="nome" placeholder="Nome Produto" value="<?php echo $resultado['nome']; ?>">
			</div>
		  </div>
		  

<?php $categoria_id = $resultado['categoria_id'];  ?>
		  <div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">Categorias</label>
			<div class="col-sm-10">
			  <select class="form-control" name="categoria_id">
				  <option>Selecione</option>
				  <?php 
						$result_cat =mysql_query("SELECT * FROM categorias");
						while($dados = mysql_fetch_assoc($result_cat)){
							$id_categoria = $dados['id'];
							?>
								<option value="<?php echo $dados["id"]; ?>"<?php if($id_categoria == $categoria_id){ echo 'selected'; } ?>
								><?php echo $dados["nome"];?></option>
							<?php
						}
					?>
				</select>
			</div>
		  </div>

		  
		  <div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">validade</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" name="validade" placeholder="Validade" value="<?php echo $resultado['validade']; ?>">
			</div>
		  </div>
		  
		  
		  
		  <div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Foto do Produto (500x500)</label>
				<div class="col-sm-10">
					<input name="arquivo" type="file"/>	
				</div>
		  </div>
		  

		  <input type="hidden" name="id" value="<?php echo $id_produto;?>">
		  <div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			  <button type="submit" class="btn btn-success">Editar</button>
			</div>
		  </div>
		</form>
	</div>
	</div>
</div> <!-- /container -->

