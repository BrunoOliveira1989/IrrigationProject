-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2024 at 05:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `IrrigationDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `AlocacaoFuncionarios`
--

CREATE TABLE `AlocacaoFuncionarios` (
  `ID` int(11) NOT NULL,
  `ID_Jardim` int(11) DEFAULT NULL,
  `ID_Funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Dispositivos`
--

CREATE TABLE `Dispositivos` (
  `ID` int(11) NOT NULL,
  `NomeDispositivo` varchar(255) DEFAULT NULL,
  `ModeloDispositivo` varchar(255) DEFAULT NULL,
  `Descricao` text DEFAULT NULL,
  `PinoArduino` varchar(4) DEFAULT NULL,
  `ID_TipoDispositivo` int(11) DEFAULT NULL,
  `ID_Zona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Funcionarios`
--

CREATE TABLE `Funcionarios` (
  `ID` int(11) NOT NULL,
  `NomeFuncionario` varchar(255) DEFAULT NULL,
  `EmailFuncionario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Jardins`
--

CREATE TABLE `Jardins` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL,
  `Tamanho` decimal(10,0) DEFAULT NULL,
  `Descricao` text DEFAULT NULL,
  `ID_Funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ParametrosIrrigacoes`
--

CREATE TABLE `ParametrosIrrigacoes` (
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
-- Table structure for table `Telefones`
--

CREATE TABLE `Telefones` (
  `ID` int(11) NOT NULL,
  `Numero` varchar(255) DEFAULT NULL,
  `ID_Funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TiposDispositivos`
--

CREATE TABLE `TiposDispositivos` (
  `ID` int(11) NOT NULL,
  `NomeTipoDispositivo` varchar(255) DEFAULT NULL,
  `DescricaoTipoDispositivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `TiposDispositivos`
--

INSERT INTO `TiposDispositivos` (`ID`, `NomeTipoDispositivo`, `DescricaoTipoDispositivo`) VALUES
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
-- Table structure for table `TiposIrrigacoes`
--

CREATE TABLE `TiposIrrigacoes` (
  `ID` int(11) NOT NULL,
  `NomeTipoIrrigacao` varchar(255) DEFAULT NULL,
  `DescricaoTipoIrrigacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `TiposIrrigacoes`
--

INSERT INTO `TiposIrrigacoes` (`ID`, `NomeTipoIrrigacao`, `DescricaoTipoIrrigacao`) VALUES
(1, 'Irrigação por Gotejamento', 'A água é aplicada diretamente na raiz das plantas por meio de tubos ou mangueiras perfuradas, permitindo uma irrigação precisa e eficiente, economizando água.'),
(2, 'Irrigação por Aspersão', 'A água é pulverizada sobre a superfície do solo por meio de bicos ou aspersores, simulando a chuva. Pode ser usada em diversos tipos de cultivos e terrenos.'),
(3, 'Irrigação Superficial', 'A água é distribuída sobre a superfície do solo por meio de canais, sulcos ou sistemas de inundação, sendo absorvida pelo solo à medida que se move através dele. É comumente usada em cultivos de arroz.'),
(4, 'Irrigação Subterrânea (Subirrigação)', 'Neste método, a água é aplicada abaixo da superfície do solo, geralmente por meio de tubos ou canais de drenagem subterrâneos. É comumente usada em solos que retêm bem a água.'),
(5, 'Irrigação por Microaspersão', 'Similar à irrigação por aspersão, mas com um menor volume de água aplicado em forma de gotas maiores, o que reduz a evaporação e aumenta a eficiência da irrigação.'),
(6, 'Irrigação por Pivot Central', 'Utilizada principalmente em grandes áreas agrícolas, consiste em uma estrutura móvel montada em pivô central que gira em torno de um ponto central, aplicando água de maneira uniforme em círculos concêntricos.'),
(7, 'Irrigação por Sulcos', 'Neste método, a água é aplicada diretamente nos sulcos entre as fileiras de plantas, permitindo uma distribuição controlada da água para as raízes das plantas');

-- --------------------------------------------------------

--
-- Table structure for table `TiposPlantas`
--

CREATE TABLE `TiposPlantas` (
  `ID` int(11) NOT NULL,
  `NomeTipoPlanta` varchar(255) DEFAULT NULL,
  `DescricaoTipoPlanta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID` int(11) NOT NULL,
  `NomeUsuario` varchar(255) DEFAULT NULL,
  `EmailUsuario` varchar(255) DEFAULT NULL,
  `Senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Zonas`
--

CREATE TABLE `Zonas` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Descricao` text DEFAULT NULL,
  `ID_TipoPlanta` int(11) DEFAULT NULL,
  `ID_TipoIrrigacao` int(11) DEFAULT NULL,
  `ID_Jardim` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AlocacaoFuncionarios`
--
ALTER TABLE `AlocacaoFuncionarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Jardim` (`ID_Jardim`),
  ADD KEY `ID_Funcionario` (`ID_Funcionario`);

--
-- Indexes for table `Dispositivos`
--
ALTER TABLE `Dispositivos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Zona` (`ID_Zona`),
  ADD KEY `ID_TipoDispositivo` (`ID_TipoDispositivo`) USING BTREE;

--
-- Indexes for table `Funcionarios`
--
ALTER TABLE `Funcionarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Jardins`
--
ALTER TABLE `Jardins`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Funcionario` (`ID_Funcionario`) USING BTREE;

--
-- Indexes for table `ParametrosIrrigacoes`
--
ALTER TABLE `ParametrosIrrigacoes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TipoPlanta` (`ID_TipoPlanta`),
  ADD KEY `ID_TipoIrrigacao` (`ID_TipoIrrigacao`);

--
-- Indexes for table `Telefones`
--
ALTER TABLE `Telefones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Funcionario` (`ID_Funcionario`);

--
-- Indexes for table `TiposDispositivos`
--
ALTER TABLE `TiposDispositivos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TiposIrrigacoes`
--
ALTER TABLE `TiposIrrigacoes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TiposPlantas`
--
ALTER TABLE `TiposPlantas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Zonas`
--
ALTER TABLE `Zonas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Irrigacao` (`ID_TipoIrrigacao`),
  ADD KEY `ID_Jardim` (`ID_Jardim`),
  ADD KEY `ID_Planta` (`ID_TipoPlanta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AlocacaoFuncionarios`
--
ALTER TABLE `AlocacaoFuncionarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Dispositivos`
--
ALTER TABLE `Dispositivos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Funcionarios`
--
ALTER TABLE `Funcionarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Jardins`
--
ALTER TABLE `Jardins`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ParametrosIrrigacoes`
--
ALTER TABLE `ParametrosIrrigacoes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TiposDispositivos`
--
ALTER TABLE `TiposDispositivos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `TiposIrrigacoes`
--
ALTER TABLE `TiposIrrigacoes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Zonas`
--
ALTER TABLE `Zonas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AlocacaoFuncionarios`
--
ALTER TABLE `AlocacaoFuncionarios`
  ADD CONSTRAINT `AlocacaoFuncionarios_ibfk_1` FOREIGN KEY (`ID_Jardim`) REFERENCES `Jardins` (`ID`),
  ADD CONSTRAINT `AlocacaoFuncionarios_ibfk_2` FOREIGN KEY (`ID_Funcionario`) REFERENCES `Funcionarios` (`ID`);

--
-- Constraints for table `Dispositivos`
--
ALTER TABLE `Dispositivos`
  ADD CONSTRAINT `Dispositivos_ibfk_1` FOREIGN KEY (`ID_Zona`) REFERENCES `Zonas` (`ID`),
  ADD CONSTRAINT `Dispositivos_ibfk_2` FOREIGN KEY (`ID_TipoDispositivo`) REFERENCES `TiposDispositivos` (`ID`);

--
-- Constraints for table `ParametrosIrrigacoes`
--
ALTER TABLE `ParametrosIrrigacoes`
  ADD CONSTRAINT `ParametrosIrrigacoes_ibfk_1` FOREIGN KEY (`ID_TipoPlanta`) REFERENCES `TiposPlantas` (`ID`),
  ADD CONSTRAINT `ParametrosIrrigacoes_ibfk_2` FOREIGN KEY (`ID_TipoIrrigacao`) REFERENCES `TiposIrrigacoes` (`ID`);

--
-- Constraints for table `Telefones`
--
ALTER TABLE `Telefones`
  ADD CONSTRAINT `Telefones_ibfk_1` FOREIGN KEY (`ID_Funcionario`) REFERENCES `Funcionarios` (`ID`);

--
-- Constraints for table `Zonas`
--
ALTER TABLE `Zonas`
  ADD CONSTRAINT `Zonas_ibfk_1` FOREIGN KEY (`ID_Jardim`) REFERENCES `Jardins` (`ID`),
  ADD CONSTRAINT `Zonas_ibfk_2` FOREIGN KEY (`ID_TipoPlanta`) REFERENCES `TiposPlantas` (`ID`),
  ADD CONSTRAINT `Zonas_ibfk_3` FOREIGN KEY (`ID_TipoIrrigacao`) REFERENCES `TiposIrrigacoes` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
