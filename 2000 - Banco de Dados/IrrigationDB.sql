-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/04/2024 às 00:24
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `irrigationdb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alocacaofuncionarios`
--

CREATE TABLE `alocacaofuncionarios` (
  `ID` int(11) NOT NULL,
  `ID_Jardim` int(11) DEFAULT NULL,
  `ID_Funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id` int(11) NOT NULL,
  `nome_dispositivo` varchar(255) DEFAULT NULL,
  `modelo_dispositivo` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `pino_arduino` varchar(4) DEFAULT NULL,
  `id_tipo_dispositivo` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `dispositivos`
--

INSERT INTO `dispositivos` (`id`, `nome_dispositivo`, `modelo_dispositivo`, `descricao`, `pino_arduino`, `id_tipo_dispositivo`, `id_zona`) VALUES
(4, 'Regador', 'valvula', NULL, NULL, NULL, NULL),
(5, 'nome', '1', 'bkjasbdkjabs', NULL, NULL, NULL),
(6, 'nome', '1', 'bkjasbdkjabs', NULL, NULL, NULL),
(7, '', '', NULL, '3', 1, NULL),
(8, '', '', NULL, '3', 1, NULL),
(9, '', '', NULL, '3', 1, NULL),
(10, '', '', NULL, '3', 1, NULL),
(11, '', '', NULL, '3', 1, NULL),
(12, '', '', NULL, '3', 1, NULL),
(13, '', '', NULL, '3', 1, NULL),
(14, '', '', NULL, '3', 1, NULL),
(15, '', '', NULL, '3', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `ID` int(11) NOT NULL,
  `NomeFuncionario` varchar(255) DEFAULT NULL,
  `EmailFuncionario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jardins`
--

CREATE TABLE `jardins` (
  `id` int(11) NOT NULL,
  `nome_jardim` varchar(255) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` int(4) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` int(255) NOT NULL,
  `estado` int(2) NOT NULL,
  `tamanho` decimal(10,0) DEFAULT NULL,
  `descricao_jardim` text DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `jardins`
--

INSERT INTO `jardins` (`id`, `nome_jardim`, `cep`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `tamanho`, `descricao_jardim`, `id_funcionario`) VALUES
(1, 'Parque Linear', '13972000', 'Avenida dos Italianos', 1658, '', 0, 0, 1000, 'Um parque', 1),
(2, 'Parque Juca Mulato', '13972-370', 'Vitor Meirelles', 107, 'Cubatão', 0, 0, 1000, 'Irrigação 1', NULL),
(3, 'Italianos', '13970-000', 'Avenida dos Italianos', 1256, 'Centro', 0, 0, 985, 'Irrigação 1', NULL),
(4, 'nome', '13970-000', 'Vitor Meirelles', 100, 'Cubatão', 0, 0, 500, 'dagsdka', NULL),
(5, 'nome', '13972-370', 'José Bonifacio', 107, 'Cubatão', 0, 0, 256, 'nome', NULL),
(6, 'jose', '13972-370', 'José Bonifacio', 103, 'Cubatão', 0, 0, 356, 'dfakbdka', NULL),
(7, 'nome', '13972-370', 'José Bonifacio', 1, 'Cubatão', 0, 0, 675, 'yurtutyery', NULL),
(8, 'fsafasd', '13972-370', 'José Bonifacio', 3, 'Cubatão', 0, 0, 356, 'fdasdfasdfas', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `parametrosirrigacoes`
--

CREATE TABLE `parametrosirrigacoes` (
  `ID` int(11) NOT NULL,
  `HorarioInicio` time DEFAULT NULL,
  `Duracao` time DEFAULT NULL,
  `DiasSemana` varchar(50) DEFAULT NULL,
  `SetpointUmidade` decimal(10,0) DEFAULT NULL,
  `LimiteSuperiorUmidade` decimal(10,0) DEFAULT NULL,
  `LimiteInferiorUmidade` decimal(10,0) DEFAULT NULL,
  `LimiteSuperiorTemperatura` decimal(10,0) DEFAULT NULL,
  `LimiteInferiorTemperatura` decimal(10,0) DEFAULT NULL,
  `ID_TipoPlanta` int(11) DEFAULT NULL,
  `ID_TipoIrrigacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefones`
--

CREATE TABLE `telefones` (
  `ID` int(11) NOT NULL,
  `Numero` varchar(255) DEFAULT NULL,
  `ID_Funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tiposdispositivos`
--

CREATE TABLE `tiposdispositivos` (
  `id` int(11) NOT NULL,
  `nome_tipo_dispositivo` varchar(255) DEFAULT NULL,
  `descricao_tipo_dispositivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tiposdispositivos`
--

INSERT INTO `tiposdispositivos` (`id`, `nome_tipo_dispositivo`, `descricao_tipo_dispositivo`) VALUES
(1, 'Sensor de Temperatura', 'Detecta e mede a temperatura ambiente ou a temperatura do solo, permitindo monitorar as condições térmicas no jardim.'),
(2, 'Sensor de Umidade', 'Mede o teor de umidade do solo, indicando quando é necessário irrigar as plantas para garantir um nível adequado de umidade.'),
(3, 'Medidor de Vazão', 'Mede a quantidade de água que está sendo fornecida ao jardim, auxiliando no controle preciso da irrigação e no uso eficiente da água.'),
(4, 'Motor', 'Converte energia elétrica em energia mecânica, sendo utilizado para acionar sistemas de irrigação, rotação de equipamentos, entre outros.'),
(5, 'Válvula', 'Controla o fluxo de água em um sistema de irrigação, permitindo abrir ou fechar o fornecimento de água para as diferentes áreas do jardim.'),
(6, 'Sensor de Luz', 'Detecta a quantidade de luz disponível no ambiente, auxiliando no controle da iluminação artificial em estufas ou ambientes fechados.'),
(7, 'Sensor de pH', 'Mede o nível de acidez ou alcalinidade do solo, fornecendo informações sobre o pH do substrato para o cultivo de plantas.'),
(8, 'Sensor de Condutividade Elétrica (EC)', 'Mede a condutividade elétrica do solo, fornecendo informações sobre a quantidade de sais presentes no substrato.'),
(9, 'Sensor de Pressão', 'Mede a pressão da água em sistemas de irrigação, permitindo monitorar e controlar a pressão em diferentes pontos da rede.'),
(10, 'Câmera de Monitoramento', 'Captura imagens do jardim, permitindo visualizar remotamente as condições das plantas, identificar pragas ou monitorar o crescimento das culturas.'),
(11, 'Sensor de Movimento', 'Detecta movimentos no ambiente, sendo útil para acionar sistemas de segurança ou monitorar a presença de animais indesejados no jardim.'),
(12, 'Sensor de Chuva', 'Detecta a presença de chuva, permitindo interromper temporariamente a irrigação para evitar o desperdício de água durante períodos chuvosos.'),
(13, 'Anemômetro (Sensor de Velocidade do Vento)', 'Mede a velocidade e a direção do vento, fornecendo informações sobre as condições climáticas que podem afetar o jardim.'),
(14, 'Higrômetro (Sensor de Umidade Relativa do Ar)', 'Mede a umidade relativa do ar no ambiente, fornecendo informações sobre as condições de umidade que afetam as plantas.'),
(15, 'Sistema de Fertirrigação', 'Sistema que combina a irrigação com a aplicação de fertilizantes, fornecendo nutrientes diretamente às raízes das plantas durante a rega.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tiposirrigacoes`
--

CREATE TABLE `tiposirrigacoes` (
  `id` int(11) NOT NULL,
  `nome_tipo_irrigacao` varchar(255) DEFAULT NULL,
  `descricao_tipo_irrigacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tiposirrigacoes`
--

INSERT INTO `tiposirrigacoes` (`id`, `nome_tipo_irrigacao`, `descricao_tipo_irrigacao`) VALUES
(1, 'Irrigação por Gotejamento', 'A água é aplicada diretamente na raiz das plantas por meio de tubos ou mangueiras perfuradas, permitindo uma irrigação precisa e eficiente, economizando água.'),
(2, 'Irrigação por Aspersão', 'A água é pulverizada sobre a superfície do solo por meio de bicos ou aspersores, simulando a chuva. Pode ser usada em diversos tipos de cultivos e terrenos.'),
(3, 'Irrigação Superficial', 'A água é distribuída sobre a superfície do solo por meio de canais, sulcos ou sistemas de inundação, sendo absorvida pelo solo à medida que se move através dele. É comumente usada em cultivos de arroz.'),
(4, 'Irrigação Subterrânea (Subirrigação)', 'Neste método, a água é aplicada abaixo da superfície do solo, geralmente por meio de tubos ou canais de drenagem subterrâneos. É comumente usada em solos que retêm bem a água.'),
(5, 'Irrigação por Microaspersão', 'Similar à irrigação por aspersão, mas com um menor volume de água aplicado em forma de gotas maiores, o que reduz a evaporação e aumenta a eficiência da irrigação.'),
(6, 'Irrigação por Pivot Central', 'Utilizada principalmente em grandes áreas agrícolas, consiste em uma estrutura móvel montada em pivô central que gira em torno de um ponto central, aplicando água de maneira uniforme em círculos concêntricos.'),
(7, 'Irrigação por Sulcos', 'Neste método, a água é aplicada diretamente nos sulcos entre as fileiras de plantas, permitindo uma distribuição controlada da água para as raízes das plantas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tiposplantas`
--

CREATE TABLE `tiposplantas` (
  `id` int(11) NOT NULL,
  `nome_tipo_planta` varchar(255) DEFAULT NULL,
  `descricao_tipo_planta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tiposplantas`
--

INSERT INTO `tiposplantas` (`id`, `nome_tipo_planta`, `descricao_tipo_planta`) VALUES
(1, 'Grama', 'grama');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `senha`) VALUES
(1, 'admin', '$2y$10$M7voOimbuLZhDvoHDnByJ.1fYxGJX1yH7ctNmmtGhWMXug/sQaOYe');

-- --------------------------------------------------------

--
-- Estrutura para tabela `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `nome_zona` varchar(255) DEFAULT NULL,
  `descricao_zona` text DEFAULT NULL,
  `id_tipo_planta` int(11) DEFAULT NULL,
  `id_tipo_irrigacao` int(11) DEFAULT NULL,
  `id_jardim` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `zonas`
--

INSERT INTO `zonas` (`id`, `nome_zona`, `descricao_zona`, `id_tipo_planta`, `id_tipo_irrigacao`, `id_jardim`) VALUES
(16, 'a1', 'Irrigação 1', 1, 1, 5),
(17, 'a2', 'Irrigação 2', 1, 3, 5),
(19, 'c1', NULL, 1, 1, 6),
(20, 'c2', NULL, 1, 3, 6),
(21, 'c3', NULL, 1, 7, 6),
(23, 'a6', 'gsfgrea', 1, 2, 7),
(24, 'a2', 'cadfadfa', 1, 1, 8);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alocacaofuncionarios`
--
ALTER TABLE `alocacaofuncionarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Jardim` (`ID_Jardim`),
  ADD KEY `ID_Funcionario` (`ID_Funcionario`);

--
-- Índices de tabela `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Zona` (`id_zona`),
  ADD KEY `ID_TipoDispositivo` (`id_tipo_dispositivo`) USING BTREE;

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `jardins`
--
ALTER TABLE `jardins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Funcionario` (`id_funcionario`) USING BTREE;

--
-- Índices de tabela `parametrosirrigacoes`
--
ALTER TABLE `parametrosirrigacoes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TipoPlanta` (`ID_TipoPlanta`),
  ADD KEY `ID_TipoIrrigacao` (`ID_TipoIrrigacao`);

--
-- Índices de tabela `telefones`
--
ALTER TABLE `telefones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Funcionario` (`ID_Funcionario`);

--
-- Índices de tabela `tiposdispositivos`
--
ALTER TABLE `tiposdispositivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tiposirrigacoes`
--
ALTER TABLE `tiposirrigacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tiposplantas`
--
ALTER TABLE `tiposplantas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Índices de tabela `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_Jardim` (`id_jardim`),
  ADD KEY `ID_Planta` (`id_tipo_planta`),
  ADD KEY `ID_Irrigacao` (`id_tipo_irrigacao`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alocacaofuncionarios`
--
ALTER TABLE `alocacaofuncionarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jardins`
--
ALTER TABLE `jardins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `parametrosirrigacoes`
--
ALTER TABLE `parametrosirrigacoes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tiposdispositivos`
--
ALTER TABLE `tiposdispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tiposirrigacoes`
--
ALTER TABLE `tiposirrigacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alocacaofuncionarios`
--
ALTER TABLE `alocacaofuncionarios`
  ADD CONSTRAINT `AlocacaoFuncionarios_ibfk_1` FOREIGN KEY (`ID_Jardim`) REFERENCES `jardins` (`id`),
  ADD CONSTRAINT `AlocacaoFuncionarios_ibfk_2` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionarios` (`ID`);

--
-- Restrições para tabelas `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD CONSTRAINT `Dispositivos_ibfk_1` FOREIGN KEY (`ID_Zona`) REFERENCES `zonas` (`id`),
  ADD CONSTRAINT `Dispositivos_ibfk_2` FOREIGN KEY (`id_tipo_dispositivo`) REFERENCES `tiposdispositivos` (`id`);

--
-- Restrições para tabelas `parametrosirrigacoes`
--
ALTER TABLE `parametrosirrigacoes`
  ADD CONSTRAINT `ParametrosIrrigacoes_ibfk_1` FOREIGN KEY (`ID_TipoPlanta`) REFERENCES `tiposplantas` (`id`),
  ADD CONSTRAINT `ParametrosIrrigacoes_ibfk_2` FOREIGN KEY (`ID_TipoIrrigacao`) REFERENCES `tiposirrigacoes` (`id`);

--
-- Restrições para tabelas `telefones`
--
ALTER TABLE `telefones`
  ADD CONSTRAINT `Telefones_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `funcionarios` (`ID`);

--
-- Restrições para tabelas `zonas`
--
ALTER TABLE `zonas`
  ADD CONSTRAINT `Zonas_ibfk_1` FOREIGN KEY (`ID_Jardim`) REFERENCES `jardins` (`id`),
  ADD CONSTRAINT `Zonas_ibfk_2` FOREIGN KEY (`id_tipo_planta`) REFERENCES `tiposplantas` (`id`),
  ADD CONSTRAINT `Zonas_ibfk_3` FOREIGN KEY (`id_tipo_irrigacao`) REFERENCES `tiposirrigacoes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
