<?php
require_once('conexao/conecta.php');
if (isset($_GET['busca'])&& $_GET['busca'] !='') {
  $busca = $_GET['busca'];
  $sql = "SELECT id_noticia FROM noticias_tb WHERE CONCAT(titulo, ' ', resumo, ' ',texto) LIKE '%$busca%'";
  $resultado = mysqli_query($con,$sql);
  $linha = mysqli_fetch_assoc($resultado);
  $quantidade = mysqli_num_rows($resultado);

#fazendo paginação, definindo um valor para construção de paginacao baseado na variavel de url de nome pagina
if (isset($_GET['pagina']) && !empty($_GET['pagina'])) {
  $paginaatual = $_GET['pagina'];
} else{
  $paginaatual = 1;
}
#construindo estrutura para concatenacao da url
$url = "?pagina=";
$buscapag = "&busca=" . $busca;
#quantidade de registros a serem exibidos em cada pagina
$paginaqtdd = 5;
#valor inicia para a clausual limit
                    #  1         *  5     =  5 -   5   = 0
 $valorinicial = ($paginaatual * $paginaqtdd) - $paginaqtdd;

#   17  total de noticas no bd /  5   = 3,4 porem ele vai arredondar e o resultado é 4
$paginafinal = ceil($quantidade/$paginaqtdd);
$paginainicial = 1; #voltar para o inicio
$paginaproxima = $paginaatual + 1; #fazendo calculo para avança para frente proxima pagina
$paginaanterior = $paginaatual - 1; #fazendo calculo para volta para proxima pagina, ou seja ,para tras
 
$sqlpag = "SELECT id_noticia, titulo, data FROM noticias_tb WHERE CONCAT(titulo, ' ', resumo, ' ',texto) LIKE '%$busca%' ORDER BY id_noticia DESC LIMIT $valorinicial, $paginaqtdd";
$resultadopag = mysqli_query($con,$sqlpag);
$linhapag = mysqli_fetch_assoc($resultadopag);
#fim da paginação
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
                <a class="nav-link " href="index.php">Home</a>
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
    <div class="row g-5">
      <div class="col-md-12">
        <p class="fs-5 col-md-12">o seu portal de notícias!</p>
      </div>
    </div>

    <hr class="col-12 mb-5">

    <h2 class="h4 mb-5">Resultado da busca para: <?php  echo $busca?></h2>
    <div class="row g-5">
      <div class="col-md-12">
          <!-- inicio quantidade maior que zero -->
          <?php if($quantidade > 0){ ?>
          <?php do{?>
          <div class="col-md-12 mb-3">
            <a href="noticia.php?id_noticia=<?php echo $linhapag['id_noticia']?>" class="text-decoration-none link-secondary">
            <p> <?php $data = date_create($linhapag['data']); echo date_format($data, 'd/m/Y');?> - <?php echo $linhapag['titulo']?></p>
            </a>
          </div>
          <?php }while($linhapag = mysqli_fetch_assoc($resultadopag))?>
          <?php } else{?>
          <!-- final quantidade maior que zero -->

          <!-- inicio quantidade menor que zero -->
       
        <div class="col-md-12 mb-3">
          <p class="text-secondary">Nenhum resultado encontrado!</p>
        </div>
        <!-- final quantidade menor que zero -->
         </div>
      <?php }?>
      <!-- paginação -->
      <nav aria-label="paginacao">
        <ul class="pagination justify-content-center">
        <?php if($paginaatual != $paginainicial){ ?>
          <li class="page-item">
            <a class="page-link" href="<?php echo $url . $paginainicial . $buscapag?>">Início</a>
          </li>
         <?php }?>

         <?php if($paginaatual >= 2){ ?>
          <li class="page-item">
            <a class="page-link" href="<?php echo $url . $paginaanterior . $buscapag?>" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
        <?php } ?>

        <?php if($paginaatual != $paginafinal){ ?>
          <li class="page-item">
            <a class="page-link" href="<?php echo $url . $paginaproxima. $buscapag?>" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
          <li class="page-item">
            <a class="page-link" href="<?php echo $url . $paginafinal . $buscapag?>">Final</a>
          </li>
          <?php } ?>
        </ul>
      </nav>

    </div>

  <footer class="pt-5 my-5 text-muted border-top">
  &copy; Copyrigth -Nerd News- 2022
  </footer>
</div>


    <script src="js/bootstrap.bundle.min.js"></script>

      
  </body>
</html>
