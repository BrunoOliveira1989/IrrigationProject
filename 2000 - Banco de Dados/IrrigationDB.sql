-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2024 at 09:35 PM
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

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `enviar_notificacao` (`mensagem` VARCHAR(255)) RETURNS INT(11)  BEGIN
    DECLARE return_val INT;
    SET return_val = sys_exec(CONCAT('/opt/lampp/htdocs/hydroflow/script/script-externo.php "', mensagem, '"'));
    RETURN return_val;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `alocacao_funcionarios`
--

CREATE TABLE `alocacao_funcionarios` (
  `id` int(11) NOT NULL,
  `id_jardim` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispositivos`
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

-- --------------------------------------------------------

--
-- Table structure for table `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome_funcionario` varchar(255) DEFAULT NULL,
  `email_funcionario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jardins`
--

CREATE TABLE `jardins` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `tamanho` decimal(10,0) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parametros_irrigacoes`
--

CREATE TABLE `parametros_irrigacoes` (
  `id` int(11) NOT NULL,
  `horario_inicio` time DEFAULT NULL,
  `duracao` time DEFAULT NULL,
  `dias_semana` varchar(50) DEFAULT NULL,
  `setpoint_umidade` decimal(10,0) DEFAULT NULL,
  `limite_superior_umidade` decimal(10,0) DEFAULT NULL,
  `limite_inferior_umidade` decimal(10,0) DEFAULT NULL,
  `limite_superior_temperatura` decimal(10,0) DEFAULT NULL,
  `limite_inferior_temperatura` decimal(10,0) DEFAULT NULL,
  `id_tipo_planta` int(11) DEFAULT NULL,
  `id_tipo_irrigacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `parametros_irrigacoes`
--

INSERT INTO `parametros_irrigacoes` (`id`, `horario_inicio`, `duracao`, `dias_semana`, `setpoint_umidade`, `limite_superior_umidade`, `limite_inferior_umidade`, `limite_superior_temperatura`, `limite_inferior_temperatura`, `id_tipo_planta`, `id_tipo_irrigacao`) VALUES
(1, '00:00:01', '00:00:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '00:00:01', '00:00:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '00:00:03', '00:00:03', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, '00:00:45', '00:00:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1122, '00:00:01', '00:00:01', '1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4567, '00:00:01', '00:00:01', '1', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4778, '00:00:01', '00:00:01', '1', 1, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Triggers `parametros_irrigacoes`
--
DELIMITER $$
CREATE TRIGGER `trg_irrigacao_insert` AFTER INSERT ON `parametros_irrigacoes` FOR EACH ROW BEGIN
    DECLARE mensagem VARCHAR(255);
    SET mensagem = CONCAT('Um novo registro foi adicionado com ID ', NEW.id);
    SET @resultado := enviar_notificacao(mensagem);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_irrigacao_update` AFTER UPDATE ON `parametros_irrigacoes` FOR EACH ROW BEGIN
    DECLARE mensagem VARCHAR(255);
    SET mensagem = CONCAT('Um novo registro foi adicionado com ID ', NEW.id);
    SET @resultado := enviar_notificacao(mensagem);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `telefones`
--

CREATE TABLE `telefones` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_dispositivos`
--

CREATE TABLE `tipos_dispositivos` (
  `id` int(11) NOT NULL,
  `nome_tipo_dispositivo` varchar(255) DEFAULT NULL,
  `descricao_tipo_dispositivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tipos_dispositivos`
--

INSERT INTO `tipos_dispositivos` (`id`, `nome_tipo_dispositivo`, `descricao_tipo_dispositivo`) VALUES
(1, 'sensor_de_temperatura', 'Detecta e mede a temperatura ambiente ou a temperatura do solo, permitindo monitorar as condições térmicas no jardim.'),
(2, 'sensor_de_umidade', 'Mede o teor de umidade do solo, indicando quando é necessário irrigar as plantas para garantir um nível adequado de umidade.'),
(3, 'medidor_de_vazao', 'Mede a quantidade de água que está sendo fornecida ao jardim, auxiliando no controle preciso da irrigação e no uso eficiente da água.'),
(4, 'motor', 'Converte energia elétrica em energia mecânica, sendo utilizado para acionar sistemas de irrigação, rotação de equipamentos, entre outros.'),
(5, 'valvula', 'Controla o fluxo de água em um sistema de irrigação, permitindo abrir ou fechar o fornecimento de água para as diferentes áreas do jardim.'),
(6, 'sensor_de_luz', 'Detecta a quantidade de luz disponível no ambiente, auxiliando no controle da iluminação artificial em estufas ou ambientes fechados.'),
(7, 'sensor_de_ph', 'Mede o nível de acidez ou alcalinidade do solo, fornecendo informações sobre o pH do substrato para o cultivo de plantas.'),
(8, 'sensor_de_condutividade_eletrica_ec', 'Mede a condutividade elétrica do solo, fornecendo informações sobre a quantidade de sais presentes no substrato.'),
(9, 'sensor_de_pressao', 'Mede a pressão da água em sistemas de irrigação, permitindo monitorar e controlar a pressão em diferentes pontos da rede.'),
(10, 'camera_de_monitoramento', 'Captura imagens do jardim, permitindo visualizar remotamente as condições das plantas, identificar pragas ou monitorar o crescimento das culturas.'),
(11, 'sensor_de_movimento', 'Detecta movimentos no ambiente, sendo útil para acionar sistemas de segurança ou monitorar a presença de animais indesejados no jardim.'),
(12, 'sensor_de_chuva', 'Detecta a presença de chuva, permitindo interromper temporariamente a irrigação para evitar o desperdício de água durante períodos chuvosos.'),
(13, 'anemometro_sensor_de_velocidade_do_vento', 'Mede a velocidade e a direção do vento, fornecendo informações sobre as condições climáticas que podem afetar o jardim.'),
(14, 'higrometro_sensor_de_umidade_relativa_do_ar', 'Mede a umidade relativa do ar no ambiente, fornecendo informações sobre as condições de umidade que afetam as plantas.'),
(15, 'sistema_de_fertirrigacao', 'Sistema que combina a irrigação com a aplicação de fertilizantes, fornecendo nutrientes diretamente às raízes das plantas durante a rega.');

-- --------------------------------------------------------

--
-- Table structure for table `tipos_irrigacoes`
--

CREATE TABLE `tipos_irrigacoes` (
  `id` int(11) NOT NULL,
  `nome_tipo_irrigacao` varchar(255) DEFAULT NULL,
  `descricao_tipo_irrigacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tipos_irrigacoes`
--

INSERT INTO `tipos_irrigacoes` (`id`, `nome_tipo_irrigacao`, `descricao_tipo_irrigacao`) VALUES
(1, 'irrigacao_por_gotejamento', 'A água é aplicada diretamente na raiz das plantas por meio de tubos ou mangueiras perfuradas, permitindo uma irrigação precisa e eficiente, economizando água.'),
(2, 'irrigacao_por_aspersao', 'A água é pulverizada sobre a superfície do solo por meio de bicos ou aspersores, simulando a chuva. Pode ser usada em diversos tipos de cultivos e terrenos.'),
(3, 'irrigacao_superficial', 'A água é distribuída sobre a superfície do solo por meio de canais, sulcos ou sistemas de inundação, sendo absorvida pelo solo à medida que se move através dele. É comumente usada em cultivos de arroz.'),
(4, 'irrigacao_subterranea', 'Neste método, a água é aplicada abaixo da superfície do solo, geralmente por meio de tubos ou canais de drenagem subterrâneos. É comumente usada em solos que retêm bem a água.'),
(5, 'irrigacao_por_microaspersao', 'Similar à irrigação por aspersão, mas com um menor volume de água aplicado em forma de gotas maiores, o que reduz a evaporação e aumenta a eficiência da irrigação.'),
(6, 'irrigacao_por_pivot_central', 'Utilizada principalmente em grandes áreas agrícolas, consiste em uma estrutura móvel montada em pivô central que gira em torno de um ponto central, aplicando água de maneira uniforme em círculos concêntricos.'),
(7, 'irrigacao_por_sulcos', 'Neste método, a água é aplicada diretamente nos sulcos entre as fileiras de plantas, permitindo uma distribuição controlada da água para as raízes das plantas');

-- --------------------------------------------------------

--
-- Table structure for table `tipos_plantas`
--

CREATE TABLE `tipos_plantas` (
  `id` int(11) NOT NULL,
  `nome_tipo_planta` varchar(255) DEFAULT NULL,
  `descricao_tipo_planta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `email_usuario` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `email_usuario`, `senha`) VALUES
(1, 'admin', NULL, '$2y$10$iPAF6QQ/m4BJzRJ.hrsmt.HNvm7TYlD6IWKwoALlRRtE9qmh44ZL.');

-- --------------------------------------------------------

--
-- Table structure for table `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `id_tipo_planta` int(11) DEFAULT NULL,
  `id_tipo_irrigacao` int(11) DEFAULT NULL,
  `id_jardim` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alocacao_funcionarios`
--
ALTER TABLE `alocacao_funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jardim` (`id_jardim`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Indexes for table `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zona` (`id_zona`),
  ADD KEY `id_tipo_dispositivo` (`id_tipo_dispositivo`) USING BTREE;

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jardins`
--
ALTER TABLE `jardins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_funcionario` (`id_funcionario`) USING BTREE;

--
-- Indexes for table `parametros_irrigacoes`
--
ALTER TABLE `parametros_irrigacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_planta` (`id_tipo_planta`),
  ADD KEY `id_tipo_irrigacao` (`id_tipo_irrigacao`);

--
-- Indexes for table `telefones`
--
ALTER TABLE `telefones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Indexes for table `tipos_dispositivos`
--
ALTER TABLE `tipos_dispositivos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_irrigacoes`
--
ALTER TABLE `tipos_irrigacoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_plantas`
--
ALTER TABLE `tipos_plantas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_irrigacao` (`id_tipo_irrigacao`),
  ADD KEY `id_jardim` (`id_jardim`),
  ADD KEY `id_planta` (`id_tipo_planta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alocacao_funcionarios`
--
ALTER TABLE `alocacao_funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jardins`
--
ALTER TABLE `jardins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parametros_irrigacoes`
--
ALTER TABLE `parametros_irrigacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4779;

--
-- AUTO_INCREMENT for table `tipos_dispositivos`
--
ALTER TABLE `tipos_dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tipos_irrigacoes`
--
ALTER TABLE `tipos_irrigacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alocacao_funcionarios`
--
ALTER TABLE `alocacao_funcionarios`
  ADD CONSTRAINT `alocacao_funcionarios_ibfk_1` FOREIGN KEY (`id_jardim`) REFERENCES `jardins` (`id`),
  ADD CONSTRAINT `alocacao_funcionarios_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id`);

--
-- Constraints for table `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD CONSTRAINT `dispositivos_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id`),
  ADD CONSTRAINT `dispositivos_ibfk_2` FOREIGN KEY (`id_tipo_dispositivo`) REFERENCES `tipos_dispositivos` (`id`);

--
-- Constraints for table `parametros_irrigacoes`
--
ALTER TABLE `parametros_irrigacoes`
  ADD CONSTRAINT `parametros_irrigacoes_ibfk_1` FOREIGN KEY (`id_tipo_planta`) REFERENCES `tipos_plantas` (`id`),
  ADD CONSTRAINT `parametros_irrigacoes_ibfk_2` FOREIGN KEY (`id_tipo_irrigacao`) REFERENCES `tipos_irrigacoes` (`id`);

--
-- Constraints for table `telefones`
--
ALTER TABLE `telefones`
  ADD CONSTRAINT `telefones_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id`);

--
-- Constraints for table `zonas`
--
ALTER TABLE `zonas`
  ADD CONSTRAINT `zonas_ibfk_1` FOREIGN KEY (`id_jardim`) REFERENCES `jardins` (`id`),
  ADD CONSTRAINT `zonas_ibfk_2` FOREIGN KEY (`id_tipo_planta`) REFERENCES `tipos_plantas` (`id`),
  ADD CONSTRAINT `zonas_ibfk_3` FOREIGN KEY (`id_tipo_irrigacao`) REFERENCES `tipos_irrigacoes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
