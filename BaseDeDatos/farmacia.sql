-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: farmacia
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_categoria` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria única que identifica cada categoria para de los medicamentos registrados en la farmacia',
  `Nombre_categoria` varchar(50) NOT NULL COMMENT 'El nombre de la categoría de medicamentos depende de los síntomas que trata el medicamento',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Una breve descripcion (opcional) del tipo de medicamentos que puede encontrar en esta categoria',
  PRIMARY KEY (`ID_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla destinada a contener las categorias de los medicamentos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Antibioticos','Para infecciones'),(2,'anagelsicos','usados para aliviar dolor físico'),(3,'Mucoliticos','Cuando la mucosidad dificulte la respiración'),(4,'Laxantes','Facilita la excreción de heces'),(5,'Antipiréticos','Reducen la fiebre'),(6,'antiinflamatorios','reducen la inflamacion');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `ID_Compra` int NOT NULL AUTO_INCREMENT,
  `Fecha_compra` date NOT NULL,
  `ID_proveedor` int NOT NULL,
  `ID_empleado` int NOT NULL,
  `total_compra` float NOT NULL,
  PRIMARY KEY (`ID_Compra`),
  UNIQUE KEY `ID_proveedor_UNIQUE` (`ID_proveedor`),
  UNIQUE KEY `ID_empleado_UNIQUE` (`ID_empleado`),
  CONSTRAINT `FK_comp1` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedores` (`ID_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comp2` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_compra`
--

DROP TABLE IF EXISTS `detalles_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_compra` (
  `ID_DetalleCompra` int NOT NULL AUTO_INCREMENT,
  `ID_Medicamento` int NOT NULL,
  `ID_Compra` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` float NOT NULL,
  PRIMARY KEY (`ID_DetalleCompra`),
  UNIQUE KEY `ID_Medicamento_UNIQUE` (`ID_Medicamento`),
  UNIQUE KEY `ID_Compra_UNIQUE` (`ID_Compra`),
  CONSTRAINT `FK_detalleCompra1` FOREIGN KEY (`ID_Medicamento`) REFERENCES `medicamentos` (`ID_medicamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detalleCompra2` FOREIGN KEY (`ID_Compra`) REFERENCES `compras` (`ID_Compra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_compra`
--

LOCK TABLES `detalles_compra` WRITE;
/*!40000 ALTER TABLE `detalles_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_factura`
--

DROP TABLE IF EXISTS `detalles_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_factura` (
  `ID_detalle_factura` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int NOT NULL,
  `precio_unitario` float NOT NULL,
  `ID_Medicamento` int NOT NULL,
  `ID_Factura` int NOT NULL,
  PRIMARY KEY (`ID_detalle_factura`),
  UNIQUE KEY `ID_Medicamento_UNIQUE` (`ID_Medicamento`),
  UNIQUE KEY `ID_Factura_UNIQUE` (`ID_Factura`),
  CONSTRAINT `FK_detalleFactura1` FOREIGN KEY (`ID_Medicamento`) REFERENCES `medicamentos` (`ID_medicamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detalleFactura2` FOREIGN KEY (`ID_Factura`) REFERENCES `facturas` (`ID_Factura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_factura`
--

LOCK TABLES `detalles_factura` WRITE;
/*!40000 ALTER TABLE `detalles_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `ID_Empleado` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico para cada empleado',
  `Nombre_Empleado` varchar(50) NOT NULL COMMENT 'Nombre del empleado',
  `Apellido_Empleado` varchar(50) NOT NULL COMMENT 'Apellido del empleado',
  `telefono` varchar(10) NOT NULL COMMENT 'número de telefono del empleado',
  `Rol` int NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  UNIQUE KEY `Rol_UNIQUE` (`Rol`),
  KEY `FK_Empleados1_idx` (`Rol`),
  CONSTRAINT `FK_Empleados1` FOREIGN KEY (`Rol`) REFERENCES `rol` (`ID_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `ID_Factura` int NOT NULL AUTO_INCREMENT,
  `Fecha_Factura` date NOT NULL,
  `total` float NOT NULL,
  `ID_Empleado` int NOT NULL,
  PRIMARY KEY (`ID_Factura`),
  UNIQUE KEY `ID_empleado_UNIQUE` (`ID_Empleado`),
  CONSTRAINT `FK_facturas1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `ID_Inventario` int NOT NULL AUTO_INCREMENT,
  `ID_medicamento` int NOT NULL,
  `Stock_Actual` int NOT NULL,
  `Fecha_actualizacion` date NOT NULL,
  `ID_Proveedor` int NOT NULL,
  `ubicacion` int NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `precio_unidad` float NOT NULL,
  `mg` int NOT NULL,
  PRIMARY KEY (`ID_Inventario`),
  UNIQUE KEY `ID_medicamento_UNIQUE` (`ID_medicamento`),
  UNIQUE KEY `ID_Proveedor_UNIQUE` (`ID_Proveedor`),
  UNIQUE KEY `ubicacion_UNIQUE` (`ubicacion`),
  CONSTRAINT `FK_inv1` FOREIGN KEY (`ID_medicamento`) REFERENCES `medicamentos` (`ID_medicamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv2` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv3` FOREIGN KEY (`ubicacion`) REFERENCES `ubicaciones` (`ID_ubicacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `ID_medicamento` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `ID_categoria` int NOT NULL,
  PRIMARY KEY (`ID_medicamento`),
  UNIQUE KEY `ID_categoria_UNIQUE` (`ID_categoria`),
  CONSTRAINT `FK_med1` FOREIGN KEY (`ID_categoria`) REFERENCES `categoria` (`ID_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Acetaminofen','para dolores de cabeza',2);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwords` (
  `AccesPassword` varchar(10) NOT NULL,
  PRIMARY KEY (`AccesPassword`),
  UNIQUE KEY `AccesPassword_UNIQUE` (`AccesPassword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES ('entrar');
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria única para cada proveedor',
  `Nombre_proveedor` varchar(50) NOT NULL COMMENT 'Nombre del laboratorio que suministra los medicamentos',
  `direccion` varchar(100) NOT NULL COMMENT 'La ubicacion fisica del laboratorio proveedor ',
  `telefono` varchar(10) DEFAULT NULL COMMENT 'El numero telefonico del laboratorio proveedor (opcional)',
  `email` varchar(20) DEFAULT NULL COMMENT 'direccion de correo electronico del proveedor (opcional)',
  PRIMARY KEY (`ID_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que contiene a los proveedores de la farmacia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Vijosa','Carretera Los Chorros, pasaje la cúrcuma.','7451-9636','vijosa@gmail.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `ID_rol` int NOT NULL AUTO_INCREMENT COMMENT 'Clave única para cada rol de empleado',
  `nombre` varchar(20) NOT NULL COMMENT 'el nombre del rol',
  `descripcion` varchar(50) DEFAULT NULL COMMENT 'Una breve descripción de las tareas que debe realizar el empleado, según el rol',
  PRIMARY KEY (`ID_rol`),
  UNIQUE KEY `ID_rol_UNIQUE` (`ID_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='La tabla que contiene los roles de los trabajadores en la farmacia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Cajero','se encarga de generar las facturas a los clientes'),(2,'Gerente','supervisa las actividades'),(3,'Bodegero','Gestiona los productos en bodega');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `ID_ubicacion` int NOT NULL AUTO_INCREMENT COMMENT 'La clave primaria que identifica la ubicación de manera única',
  `descripcion_ubicacion` varchar(50) NOT NULL COMMENT 'El lugar en el que se encuentra el medicamento en bodega',
  PRIMARY KEY (`ID_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='La tabla que contiene las ubicaciones físicas en las que se almacenan los medicamentos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,'Estante 4, junto a la puerta');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15 21:14:20
