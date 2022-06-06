<?php
require_once('../conexao/conecta.php');
include_once('comum.php');

if (isset($_POST['inserir'])&& $_POST['inserir'] === 'insere_noticia') {
  #gravando o nome do arquivo do upload
  $nome = basename($_FILES['imagem']['name']);
  #gravando um caminho temporario para a pasta tmp
  $temp = $_FILES['imagem']['tmp_name'];
  #declarando o caminho e o nome final do arquivo, "../imagens/$nome" 
  $final = "../imagens/" .$nome;
  #movendo o arquivo da pasta tmp para pasta imagens
  move_uploaded_file($temp,$final); 
  $data = $_POST['data'];
  $tipo = $_POST['tipo'];
  $titulo = mysqli_real_escape_string($con,$_POST['titulo']);
  $resumo = mysqli_real_escape_string($con,$_POST['resumo']);
  $texto = mysqli_real_escape_string($con,$_POST['texto']);
  // $imagem = mysqli_real_escape_string($con,$_POST['imagem']);
  $destaque =  $_POST['destaque'];
  $descricao= mysqli_real_escape_string($con,$_POST['alt']);

$sql = "INSERT INTO noticias_tb (data,tipo,titulo,resumo,texto,imagem,destaque,alt) VALUES ('$data', '$tipo', '$titulo','$resumo','$texto','$nome','$destaque', '$descricao') ";
if (mysqli_query($con,$sql)) {
 header('Location:noticias.php');
}else{
   die("Erro:" . $sql . "<br>" . mysqli_error($con)); // se fosse no normal seria apenas o erro sem as concatenacoes na frente
}

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

    <h2>Notícias Insere</h2>
    <div class="col-md-12 col-lg-8">
        <h4 class="mb-3">Dados da notícia</h4>
        <form class="needs-validation" method="POST"  enctype="multipart/form-data" novalidate autocomplete="off">
          <div class="row g-3">

            <div class="col-sm-6">
              <label for="data" class="form-label">Data</label>
              <input type="date" class="form-control" id="data" name="data" required>
              <div class="invalid-feedback">
                Selecione a data.
              </div>
            </div>

            <div class="col-sm-6">
              <label for="tipo" class="form-label">Tipo</label>
              <select class="form-select" id="tipo" name="tipo" required>
                <option value="">- Selecione -</option>
                <?php do{?>
                <option value="<?php echo $linhatipo['value']?>"><?php echo $linhatipo['label']?></option>
                <?php }while($linhatipo = mysqli_fetch_assoc($resultadotipo))?>
              </select>
              <div class="invalid-feedback">
                Selecione o tipo.
              </div>
            </div>

            <div class="col-12">
              <label for="titulo" class="form-label">Título</label>
              <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título da notícia" required>
              <div class="invalid-feedback">
                Informe o título da notícia.
              </div>
            </div>

            <div class="col-12">
              <label for="resumo" class="form-label">Resumo</label>
              <textarea class="form-control" id="resumo" name="resumo" rows="2" required></textarea>
              <div class="invalid-feedback">
                Informe o resumo da notícia.
              </div>
            </div>

            <div class="col-12">
              <label for="texto" class="form-label">Texto</label>
              <textarea class="form-control" id="texto" name="texto" rows="3" required></textarea>
              <div class="invalid-feedback">
                Informe o texto da notícia.
              </div>
            </div>

            <!-- <div class="col-12">
              Inserindo imagem mmanualmente , escrevendo o nome da imagem e a extensão 
              <label for="imagem" class="form-label">Imagem</label>
              <input type="text" class="form-control" id="imagem" name="imagem" placeholder="Imagem da notícia">
              <div class="invalid-feedback">
                Informe a imagem da notícia.
              </div>
            </div> -->
            <div class="col-12">
              <label for="imagem" class="form-label">Imagem</label>
              <input type="file" class="form-control" id="imagem" name="imagem">
            </div>

            <div class="col-12">
              <label for="alt" class="form-label">Alt- Descricao de Imagem</label>
              <textarea class="form-control" id="alt" name="alt" rows="3" ></textarea>
              <div class="invalid-feedback">
                Informe o texto da notícia.
              </div>
            </div>


           <div class="my-3">
           <label for="destaque" class="form-label">Destaque</label>
            <div class="form-check">
              <input id="dsim" name="destaque" value="sim" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="dsim">Sim</label>
            </div>
            <div class="form-check">
              <input id="dnao" name="destaque" value="nao" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="dnao">Não</label>
            </div>
          </div>

          <hr class="my-4">
          <input type="hidden" name="inserir" value="insere_noticia">
          <button class="w-100 btn btn-dark btn-lg mb-5" type="submit">Inserir Notícia</button>
        </form>
      </div>
    </main>
  </div>
</div>

 <!-- script summer note -->
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
          ['para', ['paragraph']],
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
