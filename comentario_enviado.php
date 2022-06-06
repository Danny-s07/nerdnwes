<?php
require_once('conexao/conecta.php');
if (isset($_POST['inserir'])&& $_POST['inserir'] == 'insere_comentario') {
    $nome = mysqli_real_escape_string($con,$_POST['nome']);
    $email = mysqli_real_escape_string($con,$_POST['email']);
    $comentario = mysqli_real_escape_string($con,$_POST['comentario']);
    $status = 'in';
    $id_noticia = $_POST['id_noticia'] ;
    date_default_timezone_set('America/Sao_Paulo');
    $data = date('Y-m-d');

    $sql = "INSERT INTO comentarios_tb (nome,email,data,comentario,status,id_not) VALUES ('$nome', '$email','$data', '$comentario', '$status', '$id_noticia')";

    if (mysqli_query($con,$sql)) {
        header("refresh:5; url=insere.php?id_noticia=$id_noticia");
    }
    else{
        die("Erro:" .$sql . "<br>" . mysqli_error($con));
    }

}

?>






<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <p>Olá, seu comentario foi enviado com sucesso...</p>
    <p> Por favor, aguarde pela aprovação de um de nossos moderadores...</p>
</body>
</html>