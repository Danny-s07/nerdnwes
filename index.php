<?php
require_once('conexao/conecta.php');
//saida de dados de conteudo 
$sqlc = "SELECT id_noticia, titulo FROM noticias_tb WHERE destaque = 'nao' ORDER BY id_noticia DESC LIMIT 6";
$resultadoc = mysqli_query($con,$sqlc);
$linhac = mysqli_fetch_assoc($resultadoc);

//saida de dados de destaque
$sqld = "SELECT * FROM noticias_tb INNER JOIN tipos_tb ON noticias_tb.tipo = tipos_tb.value WHERE destaque = 'sim' ORDER BY id_noticia ASC LIMIT 4";
$resultadod = mysqli_query($con,$sqld);
$linhad = mysqli_fetch_assoc($resultadod);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>:: Nerd News::</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
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
        <a class="navbar-brand" href="index.php"> <img  class="logotipo"  src="imagens/testelog.png" >  </a>
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
            <button class="btn btn-dark" type="submit">Buscar</button>
          </form>
        </div>
      </div>
    </nav>
  </header>


    <h1 class="h3">Nerd News,</h1>
    <p class="fs-5 col-md-12">o seu portal de notícias!</p>


    <hr class="col-12 mb-4">

<!-- <div class="row g-5"> -->
  <div class="col-sm-12">
    <div class="d-flex flex-wrap-reverse">
    <!-- Início Notícias em destaque -->
    <?php do{?>
    <div class="col-sm-6 my-3 mb-3">
    <?php if($linhad['imagem'] != ''){?>  <!-- if para evitar que apareça o icone de imagem quebrada -->
          <img src="imagens/<?php echo $linhad['imagem']?>" alt="<?php echo $linhad['imagem']?>" class="img-fluid tamimg rounded float-start p-2">
        <?php }?>
      <h2 class="h4 mx-1"><?php echo $linhad['titulo']?> - <?php echo $linhad['label'] ?></h2>
      <p>  <?php echo $linhad['resumo'] ?></p>
      <a href="noticia.php?id_noticia=<?php echo $linhad['id_noticia']?>" class="btn btn-dark">Saiba Mais</a>
    </div>
    <?php }while($linhad = mysqli_fetch_assoc($resultadod));?>
   <!-- Final Notícias em destaque -->
    </div>
  </div>
  
  <!-- <div class="col-md-4">
    <h2>Mais Notícias</h2>
    <p>Saiba o que acontece no Brasil e no mundo!</p>
    <ul>
       regiao de repeticao -->
      <?php // do{?>
      <!-- <li><i class="fas fa-chevron-circle-right"></i><a class="menulateral" href="noticia.php?id_noticia=<?php //echo $linhac['id_noticia']?>"> <?php //echo $linhac['titulo'] ?></a></li>   carrega o id de cada noticia via get-->
      <?php //}while($linhac = mysqli_fetch_assoc($resultadoc));?> 
    <!-- </ul> -->
  <!-- </div>
</div> -->
 



    <footer class="pt-5 my-5 text-muted border-top">
    &copy; Copyrigth -Nerd News- 2022
  </footer>
</div>
    <script src="js/bootstrap.bundle.min.js"></script>


</body>
</html>