-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Jun-2022 às 14:15
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nerdnews_db`
--
CREATE DATABASE IF NOT EXISTS `nerdnews_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `nerdnews_db`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios_tb`
--

CREATE TABLE `comentarios_tb` (
  `id_comentario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `comentario` tinytext NOT NULL,
  `status` enum('in','ap','rp') NOT NULL,
  `id_not` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comentarios_tb`
--

INSERT INTO `comentarios_tb` (`id_comentario`, `nome`, `email`, `data`, `comentario`, `status`, `id_not`) VALUES
(1, 'nome teste', 'aemail@email', '2022-04-14', 'comentario testes', 'ap', 1),
(2, 'Amanda', 'amanda@gmail.com', '2022-04-14', 'amei que olivia rodrigo ganhou varios premios!', 'ap', 1),
(3, 'Rosa', 'rosa@gmail.com', '2022-04-14', 'Adorei a reportagem , historia incrivel >3 !!!', 'rp', 4),
(4, 'Gabi', 'aleatoria@gmail.com', '2022-04-14', '........................ serio .................................', 'rp', 13),
(5, 'teste', 'teste@email', '2022-04-14', 'teste de comentario ', 'rp', 14),
(6, 'teste', 'teste@teste', '2022-04-14', 'comentario teste', 'ap', 21),
(7, 'teste', 'teste@teste', '2022-04-28', 'fbsdgsdgsfdgd', 'in', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias_tb`
--

CREATE TABLE `noticias_tb` (
  `id_noticia` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipo` char(3) NOT NULL,
  `titulo` tinytext NOT NULL,
  `resumo` text NOT NULL,
  `texto` mediumtext NOT NULL,
  `imagem` varchar(48) DEFAULT NULL,
  `alt` varchar(100) DEFAULT NULL,
  `destaque` enum('sim','nao') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `noticias_tb`
--

INSERT INTO `noticias_tb` (`id_noticia`, `data`, `tipo`, `titulo`, `resumo`, `texto`, `imagem`, `alt`, `destaque`) VALUES
(1, '2022-04-03', 'mus', 'Vencedores de Premios 2022', 'O premio ocorreu neste final de semana confira a lista dos vencedores de cada categoria .', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n\r\n', 'grammy.jpg', '', 'sim'),
(2, '2022-04-05', 'mus', 'Top dez da lista das musicas mais tocadas na lista mais famosa ', 'Lista das músicas mais ranqueadas internacionalmente que estão numa lista chamada as 100 mais hankeadas', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', 'bilboard.jpg', '', 'nao'),
(3, '2022-04-04', 'esp', 'Skate: Atletas mais antigos ficam fora da seleção brasileira ', 'Medalhistas olímpicos, atletas mais novos puxam lista de 25 convocados pela CBSK para início do ciclo rumo às Olimpíadas de Paris 2024', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n', 'skatebuff.jpg', '', 'nao'),
(4, '2022-03-08', 'esp', 'Grupo indígena de skatistas utiliza vestimentas culturais como símbolo de resistência', 'Bolivianas criam projeto para juntar meninas que andam de skate', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', 'indigenaskate.jpg', '', 'sim'),
(5, '2011-04-25', 'esp', 'Brasileira se torna 1ª mulher a \"surfar\" pororoca em um caiaque', 'A atleta, funcionária do UOL, conseguiu o feito entre os dias 15 e 23 de abril, durante uma viagem pela região amazônica.', 'Roberta Borsari se tornou a primeira mulher do mundo a surfar de caiaque na pororoca. A atleta, funcionária do UOL, conseguiu o feito entre os dias 15 e 23 de abril, durante uma viagem pela região amazônica.\r\n\r\nA pororoca é um fenômeno que forma ondas gigantes resultantes do encontro das águas de um grande rio com as do oceano. Roberta disse que, durante a viagem, as ondas chegaram a dois metros de altura.\r\n\r\n“A expedição foi um sucesso! Vivi uma das experiências mais marcantes, emocionantes e diferentes de tudo que já fiz no surfe”, afirmou a atleta, que conseguiu o feito no rio Araguari.\r\n\r\nRoberta contou com a ajuda de surfistas experientes para orientá-la. “A logística de posicionamento de entrada na onda e de resgate com o caiaque foi uma novidade tanto para mim como para a equipe e apoio. Durante a viagem fizemos vários testes até chegar à técnica ideal, parecia uma estratégia militar”, comentou.\r\n\r\nA atleta relembrou a dificuldade enfrentada para conseguir chegar ao local. “Foram oito dias embarcada na selva amazônica para conseguir o feito. Desembarquei em Macapá e de lá foram 18 horas rio adentro”, completou.', 'roberta.jpg', '', 'nao'),
(6, '2011-06-05', 'esp', 'Ginasta conquista mais um ouro e é confirmada na seleção', 'Durante a premiação, ela foi confirmada na seleção brasileira junto com as companheiras de equipe', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', '', '', 'nao'),
(7, '2011-06-26', 'esp', 'Ginasta ganha primeiro ouro após volta à seleção', 'Com direito a duplo twist carpado, Ginasta ficou em primeiro lugar no solo e levou a medalha de ouro.', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', 'daiane.jpg', '', 'nao'),
(8, '2022-03-03', 'esp', 'Do asfalto para o gelo:  atleta vai tentar vaga olímpica', 'Ex-Indy, suíça de 33 anos investe em preparação para o monobob, que estreou em Pequim-2022', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', 'invernoesqui.png', '', 'nao'),
(9, '2022-04-02', 'esp', 'Lutadora de mma', 'Lutadora   avisa: \"Quero o meu tri\"', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', 'ufcju.jpg', '', 'nao'),
(10, '2022-03-26', 'esp', 'Lutadora ucraniana relata jornada para fugir do país: ', 'Lutadora Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>', 'ufcucrania.jpg', '', 'nao'),
(11, '2022-04-01', 'mus', 'Banda de Rock lança novo álbum ', 'O álbum unlimited conta com 17 faixas ', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>', 'redhot.jpg', '', 'nao'),
(12, '2022-03-26', 'mus', 'Cantora anuncia seu novo álbum no em festival de musica em  2022', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>', 'miley.jpg', '', 'nao'),
(13, '2022-04-04', 'cie', ' Telescópio fotografa formação de planeta ', 'Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n', 'telescopio.png', '', 'sim'),
(14, '2022-03-30', 'cie', 'Recordistas no Espaço', 'Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>\r\n\r\n', 'astronautasgeral.jpg', '', 'sim'),
(15, '2022-03-18', 'cie', 'Robô Fazendo Pesquisa em Marte ', 'Neque porro quisquam teste', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>\r\n', '', '', 'nao'),
(16, '2022-03-27', 'fil', 'Neque porro quisquam', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>', 'oscar.jpg', 'imagem com um fundo preto e a escrita em branco premiacao cinema', 'sim'),
(17, '2022-03-31', 'ser', 'What is Lorem Ipsum', ' is simply dummy text of the printing and typesetting industry', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta massa massa, ut porta libero bibendum eget. Sed rhoncus metus dictum libero molestie commodo a ac dolor. Aenean cursus fringilla felis nec sagittis. Suspendisse sit amet nisl consectetur, ultrices erat et, venenatis ipsum. Maecenas venenatis lacus at eleifend dignissim. Aenean orci mi, dignissim id dignissim sed, dignissim euismod orci. Morbi ultricies dictum ipsum, at venenatis elit egestas eget. Aliquam eget consequat ante. Ut nec volutpat eros. Vivamus quis diam ac erat finibus pretium. Etiam scelerisque vulputate leo, ac commodo ex facilisis id. Aliquam pretium, tellus id congue iaculis, odio enim pretium mi, ac lobortis lorem lacus eu magna. Vivamus rhoncus nisi risus, nec varius odio euismod at.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Maecenas lectus massa, iaculis ac pretium a, lobortis non enim. Curabitur suscipit faucibus mauris, eu ultricies ipsum tempus vitae. Integer sollicitudin risus sit amet risus semper, vel elementum nunc euismod. Proin tincidunt faucibus imperdiet. Vestibulum efficitur tortor sapien, vel posuere metus blandit sed. Cras auctor sem eu tortor fringilla, at congue arcu bibendum. Phasellus dignissim commodo sapien, a lacinia enim posuere non. Nullam convallis porta magna, eget fermentum urna luctus id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam vitae sem justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vel libero sed risus lacinia condimentum sed quis libero. Suspendisse ornare suscipit est, vel facilisis felis imperdiet a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur dignissim sem elit. Suspendisse euismod enim sit amet felis volutpat maximus. Curabitur consectetur nisi eget elit dapibus consequat. Suspendisse in erat enim. Ut arcu odio, tincidunt at porta eget, congue in leo. Morbi sit amet venenatis magna. Aliquam vel auctor est. Integer tristique turpis tellus, eget convallis tortor malesuada id. Proin in luctus ligula, sit amet pretium nibh.</p>\r\n', '', '', 'nao'),
(21, '2022-04-13', 'fil', 'Testando Sequencia', 'Testando Sequencia', 'Testando Sequencia ds\\gdgsdgsdgdgdfggfdgfdgfgfgf', '', 'nzdbkjdbkjxgjkxgkjfhnjhkfn', 'nao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `senhas_tb`
--

CREATE TABLE `senhas_tb` (
  `id_senha` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `senha` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `senhas_tb`
--

INSERT INTO `senhas_tb` (`id_senha`, `id_usuario`, `senha`) VALUES
(5, 10, '4563'),
(6, 11, '12345');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_tb`
--

CREATE TABLE `tipos_tb` (
  `id_tipo` int(11) NOT NULL,
  `value` char(3) NOT NULL,
  `label` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipos_tb`
--

INSERT INTO `tipos_tb` (`id_tipo`, `value`, `label`) VALUES
(1, 'mus', 'Música'),
(2, 'cie', 'Ciência'),
(3, 'esp', 'Esporte'),
(4, 'fil', 'Filme'),
(5, 'ser', 'Serie');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_tb`
--

CREATE TABLE `usuarios_tb` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(24) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `senha_md5` varchar(32) NOT NULL,
  `nome` tinytext NOT NULL,
  `tipo` enum('sup','com') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios_tb`
--

INSERT INTO `usuarios_tb` (`id_usuario`, `usuario`, `senha`, `senha_md5`, `nome`, `tipo`) VALUES
(1, 'amanda', '4321', 'd93591bdf7860e1e4ee2fca799911215', 'Amanda  Lopes', 'sup'),
(2, 'lucia', '1234', '81dc9bdb52d04dc20036dbd8313ed055', 'Lucia Rodrigues de Souza', 'com'),
(3, 'bruna', '23456', 'adcaec3805aa912c0d0b14a81bedb6ff', 'Bruna Rodrigues Oliveira', 'com'),
(10, 'lucas', '4563', 'd74a214501c1c40b2c77e995082f3587', 'lucas oliveira', 'sup'),
(11, 'aparecida', '12345', '827ccb0eea8a706c4c34a16891f84e7b', 'aparecida rodrigues', 'com');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comentarios_tb`
--
ALTER TABLE `comentarios_tb`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_not` (`id_not`);

--
-- Índices para tabela `noticias_tb`
--
ALTER TABLE `noticias_tb`
  ADD PRIMARY KEY (`id_noticia`);

--
-- Índices para tabela `senhas_tb`
--
ALTER TABLE `senhas_tb`
  ADD PRIMARY KEY (`id_senha`);

--
-- Índices para tabela `tipos_tb`
--
ALTER TABLE `tipos_tb`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices para tabela `usuarios_tb`
--
ALTER TABLE `usuarios_tb`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentarios_tb`
--
ALTER TABLE `comentarios_tb`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `noticias_tb`
--
ALTER TABLE `noticias_tb`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `senhas_tb`
--
ALTER TABLE `senhas_tb`
  MODIFY `id_senha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tipos_tb`
--
ALTER TABLE `tipos_tb`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios_tb`
--
ALTER TABLE `usuarios_tb`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentarios_tb`
--
ALTER TABLE `comentarios_tb`
  ADD CONSTRAINT `comentarios_tb_ibfk_1` FOREIGN KEY (`id_not`) REFERENCES `noticias_tb` (`id_noticia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
