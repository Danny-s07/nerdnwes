<?php 
require_once('conexao/conecta.php');
//saida de dados com exibição ou nao da noticia se tiver um id
if (isset($_GET['id_noticia'])&& $_GET['id_noticia'] != '') {
  $id_noticia = $_GET['id_noticia'];
  $sql = "SELECT * FROM noticias_tb WHERE id_noticia=$id_noticia";
  $resultado = mysqli_query($con,$sql);
  $linha = mysqli_fetch_assoc($resultado);
  $quantidade = mysqli_num_rows($resultado); //contagem pra trazer as noticias


  $sqlcomentario = "SELECT * FROM comentarios_tb WHERE id_not=$id_noticia AND status='ap' ORDER BY id_comentario DESC";
  $resultadocomentario = mysqli_query($con,$sqlcomentario);
  $linhacomentario = mysqli_fetch_assoc($resultadocomentario);
  $quantidadecomentario = mysqli_num_rows($resultadocomentario);

}else{
  $quantidade = 0;
}
 
?>

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>:: Nerd News ::</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/estilo.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

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
    <link href="css/starter-template.css" rel="stylesheet">
  </head>
  <body>
    
<div class="col-lg-8 mx-auto p-3 py-md-5">
  <header class="mb-5">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top corespecifica">
      <div class="container">
      <a class="navbar-brand" href="index.php"> <img  class="logotipo"  src="imagens/testelog.png" alt="" >  </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav me-auto ms-auto mb-2 mb-md-0">
              <li class="nav-item">
                <a class="nav-link" href="index.php">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="noticias.php">Notícias</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="admin">Administrador</a>
              </li>
            </ul>
            <form class="d-flex" action="busca.php" method="GET">
            <input class="form-control me-2" type="search" name="busca" placeholder="Busca" aria-label="Search">
            <button class="btn btn-secondary" type="submit">Buscar</button>
          </form>
        </div>
      </div>
    </nav>
  </header>

  <h1 class="h3">Nerd News,</h1>
    <p class="fs-5 col-md-12">o seu portal de notícias!</p>
    <hr class="col-12 mb-5">
    <!-- início quantidade maior que zero -->
    <?php if($quantidade > 0){?>
    <div class="row g-5">
      <div class="col-md-12">
       <h2 class="h4"> <?php echo $linha['titulo']?></h2>
       <h3 class="h5 mb-5">
       <?php 
       $data = date_create($linha['data']);
       echo date_format($data, 'd/m/Y');
       ?>
       </h3>
       <?php if($linha['imagem'] != ''){?>  <!-- if para evitar que apareça o icone de imagem quebrada -->
          <img src="imagens/<?php echo $linha['imagem']?>" alt="<?php echo $linha['imagem']?>" class="img-fluid">
        <?php }?>
       <p><?php echo $linha['texto']?></p>
        <a href="javascript:history.back();" class="btn btn-dark">Voltar</a>
      </div>
    </div>
    <?php }?>
    <!-- final quantidade maior que zero -->


  
    <!-- início quantidade menor que zero -->
    <?php if($quantidade <= 0){?>
    <div class="row g-5">
      <div class="col-md-12">
       <h2 class="h4">Não existe nenhuma notícia selecionada para ser exibida!</h2>
      </div>
    </div>
    <?php }?>
    <!-- final quantidade menor que zero -->

    <!-- inicio insere comentarios -->
    <div class="row g-5 mt-5">
    <h2 class="h4">Deixe seu Comentario:</h2>
      <div class="container">
       <iframe src="insere.php?id_noticia=<?php echo $_GET['id_noticia']?>" class="container-fluid" height="350px"></iframe>
      </div>
    </div>
    <!-- fim insere comentarios -->


    <!-- inicio exibe comentarios -->
    <?php if($linhacomentario > 0) {?>
      <div class="row g-5">
      <h2 class="h4">Comentarios Enviados:</h2>
      <?php do{?>
      <div class="container">
        <p>
        <a href="malito:"> <?php echo $linhacomentario['email']?> - 
        <?php echo $linhacomentario['nome']?>
        </a>
        disse em :
        <?php $datacomentario = date_create($linhacomentario['data']);  echo date_format($datacomentario,'d/m/Y'); ?>
        </p>
        <p><?php echo $linhacomentario['comentario'] ?></p>
     
      </div>
      <?php } while($linhacomentario = mysqli_fetch_assoc($resultadocomentario))?>
    </div>
    <?php } else{?>
      <div class="row g-5">
      <h2 class="h4">Comentarios Enviados:</h2>
      <div class="container">
       <p>Nenhum comentario nessa noticia.....</p>
       <p>Seja o primeiro a comentar !!!!!</p>
      </div>
    </div>
    <?php }?>



    <!-- fim exibe comentarios -->

  <footer class="pt-5 my-5 text-muted border-top">
  &copy; Copyrigth -Nerd News- 2022
  </footer>
</div>
    <script src="js/bootstrap.bundle.min.js"></script>
  </body>
</html>
