<?php
require_once('../conexao/conecta.php');
include_once('comum.php');
if (isset($_POST['alterar']) && $_POST['alterar']==='altera_noticia') {
  $id_noticia = $_POST['id_noticia'];
  $data = $_POST['data'];
  $tipo = $_POST['tipo'];
  $titulo = mysqli_real_escape_string($con, $_POST['titulo']);
  $resumo = mysqli_real_escape_string($con, $_POST['resumo']);
  $texto = mysqli_real_escape_string($con, $_POST['texto']);
  $imagem = mysqli_real_escape_string($con, $_POST['imagem']);
  $alt = mysqli_real_escape_string($con,$_POST['alt']);
  $destaque= mysqli_real_escape_string($con, $_POST['destaque']);

  $sql = "UPDATE noticias_tb SET data='$data', tipo='$tipo', titulo='$titulo', resumo='$resumo', texto='$texto', imagem='$imagem', alt='$alt',destaque='$destaque' WHERE id_noticia=$id_noticia";
  if (mysqli_query($con,$sql)) {
    header('Location:noticias.php');
  }
  else{
    die("Erro:" . $sql . "<br>" . mysqli_error($con));
  }
}



if (isset($_GET['id_noticia'])&& $_GET['id_noticia'] !== '') {
  $id = $_GET['id_noticia'];
  $sqlnoticia = "SELECT * FROM noticias_tb WHERE id_noticia=$id";
  $resultadonoticia = mysqli_query($con,$sqlnoticia);
  $linhanoticia = mysqli_fetch_assoc($resultadonoticia);
}


$sqltipo = "SELECT * FROM tipos_tb ORDER BY label ASC";
$resultadotipo = mysqli_query($con,$sqltipo);
$linhatipo = mysqli_fetch_assoc($resultadotipo);
?>

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Dashboard Template · Bootstrap v5.1</title>

 <!-- carregando os scripst e o css do summernote -->
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

   <!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
    <link href="../css/form-validation.css" rel="stylesheet">
  </head>
  <body>
    
  <?php
    #Início TOPO
    include('topo.php');
    #Final TOPO
  ?>

<div class="container-fluid">
  <div class="row">
  <?php
    #Início MENU
    include('navegacao.php');
    #Final MENU
  ?>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Administração</h1>
      </div>

    <h2>Notícias Altera</h2>
    <div class="col-md-12 col-lg-8">
        <h4 class="mb-3">Dados da notícia</h4>
        <form class="needs-validation" method="POST" action="" novalidate>
          <div class="row g-3">

            <div class="col-sm-6">
              <label for="data" class="form-label">Data</label>
              <input type="date" class="form-control" id="data" name="data" value="<?php echo $linhanoticia['data']?>" required>
              <div class="invalid-feedback">
                Selecione a data.
              </div>
            </div>

            <div class="col-sm-6">
              <label for="tipo" class="form-label">Tipo</label>
              <select class="form-select" id="tipo" name="tipo" required>
                <option value="">- Selecione -</option>
                <?php do{?>
                <option value="<?php echo $linhatipo['value']?>" <?php if($linhanoticia['tipo'] === $linhatipo['value']) echo"selected" ?> ><?php echo $linhatipo['label']?> </option>
                <?php }while($linhatipo = mysqli_fetch_assoc($resultadotipo))?>
              </select>
              <div class="invalid-feedback">
                Selecione o tipo.
              </div>
            </div>

            <div class="col-12">
              <label for="titulo" class="form-label">Título</label>
              <input type="text" class="form-control" id="titulo" name="titulo" value="<?php echo $linhanoticia['titulo']?>" placeholder="Título da notícia" required>
              <div class="invalid-feedback">
                Informe o título da notícia.
              </div>
            </div>

            <div class="col-12">
              <label for="resumo" class="form-label">Resumo</label>
              <textarea class="form-control" id="resumo" name="resumo" rows="2" required><?php echo $linhanoticia['resumo']?></textarea>
              <div class="invalid-feedback">
                Informe o resumo da notícia.
              </div>
            </div>

            <div class="col-12">
              <label for="texto" class="form-label">Texto</label>
              <textarea class="form-control" id="texto"name="texto" rows="3" required><?php echo $linhanoticia['texto']?></textarea>
              <div class="invalid-feedback">
                Informe o texto da notícia.
              </div>
            </div>

            <div class="col-12">
            <label for="imagem" class="form-label">Imagem</label>
              <select class="form-select" id="imagem" name="imagem">
                <option value="">- Selecione -</option>
                  <?php
                  $pasta = opendir('../imagens'); //abrir a pasta
                  while(($arquivo = readdir($pasta)) !== false )//le o diretorio quando tiver arquivo dentro , se nao tiver ele nao abre
                  {
                    if ($arquivo != '.' && $arquivo != '..' && $arquivo != 'Thumbs.db') {
                      
                   
                  ?>
                  <option value="<?php echo $arquivo ?>" <?php if($linhanoticia['imagem'] === $arquivo) echo 'selected';?>><?php echo $arquivo ?></option>
                  <?php } 
                          } 
                    closedir($pasta);
                  ?>

              </select>
              <div class="invalid-feedback">
                Selecione a imagem.
              </div>
            </div>

            <div class="col-12">
              <label for="alt" class="form-label">Alt - Descrição da Imagem</label>
              <textarea class="form-control" id="alt"name="alt" rows="2"><?php echo $linhanoticia['alt']?></textarea>
              <div class="invalid-feedback">
                Informe o resumo da notícia.
              </div>
            </div>


           <div class="my-3">
           <label for="destaque" class="form-label">Destaque</label>
            <div class="form-check">
              <input id="dsim" name="destaque" value="sim" type="radio" class="form-check-input" required <?php if($linhanoticia['destaque'] === 'sim') echo "checked"?>>
              <label class="form-check-label" for="dsim">Sim</label>
            </div>
            <div class="form-check">
              <input id="dnao" name="destaque" value="nao" type="radio" class="form-check-input" required  <?php if($linhanoticia['destaque'] === 'nao') echo "checked"?>>
              <label class="form-check-label" for="dnao">Não</label>
            </div>
          </div>

          <hr class="my-4">
          <input type="hidden" name="alterar" value="altera_noticia">
          <input type="hidden" name="id_noticia" value="<?php echo $linhanoticia['id_noticia']?>">
          <button class="w-100 btn btn-dark btn-lg mb-5" type="submit">Alterar Notícia</button>
        </form>
      </div>
    </main>
  </div>
</div>


<script>
      $('#texto').summernote({
        placeholder: ' digite sua noticia',
        tabsize: 2,
        height: 120,
        // toobar se eu tirar tudo ele aparece todas as fontes
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
  <!-- script summer note -->

    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/form-validation.js"></script>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
      <script src="../js/dashboard.js"></script>

     
  </body>
</html>
