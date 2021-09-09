
<div class="container theme-showcase" role="main">      
  <div class="page-header">
     <meta charset="utf-8">
	<h1>Cadastrar Documentos</h1>
  </div>
  <div class="row espaco">
		<div class="pull-right">
			<a href='administrativo.php?link=10&id= <button type='button' class='btn btn-sm btn-info'>Listar</button></a>				
		</div>
	</div>
  <div class="row">
	<div class="col-md-12">
	  <form class="form-horizontal" method="POST" action="processa/proc_cad_documento.php" enctype="multipart/form-data">
	  
		  <div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Nome </label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" name="nome" placeholder="Nome do Documento">
			</div>
		  </div>
		  
		  <div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">Categorias</label>
			<div class="col-sm-10">
			  <select class="form-control" name="categoria_id">
				  <option>Selecione</option>
				  <?php 
						$resultado =mysql_query("SELECT * FROM categorias");
						while($dados = mysql_fetch_assoc($resultado)){
							?>
								<option value="<?php echo $dados["id"]; ?>"><?php echo $dados["nome"];?></option>
							<?php
						}
					?>
				</select>
			</div>
		  </div>
		  <div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Validade</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" name="validade" placeholder="Validade">
			</div>
		  </div>
		  
		  <div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Documento PDF</label>
				<div class="col-sm-10">
					<input name="arquivo" type="file"/>	
				</div>
		  </div>  		  
		  
		  <div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			  <button type="submit" class="btn btn-success">Cadastrar</button>
			</div>
		  </div>
		</form>
	</div>
	</div>
</div> <!-- /container -->

