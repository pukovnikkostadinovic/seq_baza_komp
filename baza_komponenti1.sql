-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: baza_komponenti1
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorije`
--

DROP TABLE IF EXISTS `kategorije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorije` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime_kategorije` varchar(255) COLLATE cp1250_croatian_ci NOT NULL,
  `kratak_opis` varchar(400) COLLATE cp1250_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=cp1250 COLLATE=cp1250_croatian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorije`
--

LOCK TABLES `kategorije` WRITE;
/*!40000 ALTER TABLE `kategorije` DISABLE KEYS */;
INSERT INTO `kategorije` VALUES (1,'Nema kategoriju','Komponente za koje još nisam odlučio šta ću.'),(2,'Izvori/regulatori napajanja','Baterije, akumulatori, AC-DC step-up i step-down konverteri i svakojaka napajanja'),(3,'Kabeli','Svakojaki kablovi'),(4,'Konektori','Konektorti muški, ženski, za 220V ili 12V'),(5,'Mikrokontroleri','Arduino Uno, pro mini, nodemcu'),(6,'Otpornici','Svakakve verzije otpornika'),(7,'Kondenzatori','Bipolarni i svakakvi kondenzatori'),(8,'Senzori','ćelije za mjerenje, vlage, težine, voltaže i svega drugog'),(10,'Inox komponente','Inox djelovi za HERMS sustav'),(11,'Dom i vrt','Svašta nešto'),(12,'Ekrani','LCD ili Led paneli ili nešto drugo'),(13,'Releji i tranzistori','Sve što ima funkciju neke sklopke/prekidača ili elektroventila.'),(14,'Pumpe','Svakakve, zračne, vodene ili neke druge'),(15,'DC AC Step Motori','AC, DC, Servo, driveri i dr.'),(16,'Diode','LED, zener i dr.'),(17,'Prijamnici/predajnici','Bluetooth, RF, Wireless i dr'),(18,'Hladnjiaci','Različiti aluminijski, bakreni i drugi elementi za hlađenje'),(19,'Tiskane pločice','Jednoslojne, dvoslojne, foto i druge'),(20,'Čitači/Pisači','Razni moduli za čitanje i pisanje kao sd čitač, rfid pisač'),(21,'Potenciometri i joystici','Razni uređaji za kontrolu servo motora i ostalih komponenti'),(22,'Oscilatori','quartzni oscilatori'),(23,'Pojačala','Svakojaka pojačala');
/*!40000 ALTER TABLE `kategorije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komp_lok_kol`
--

DROP TABLE IF EXISTS `komp_lok_kol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komp_lok_kol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kolicina` int(11) DEFAULT '0',
  `komp_id` int(11) DEFAULT NULL,
  `lok_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `komp_id` (`komp_id`),
  KEY `lok_id` (`lok_id`),
  CONSTRAINT `komp_lok_kol_ibfk_1` FOREIGN KEY (`komp_id`) REFERENCES `komponente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `komp_lok_kol_ibfk_2` FOREIGN KEY (`lok_id`) REFERENCES `lokacije` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komp_lok_kol`
--

LOCK TABLES `komp_lok_kol` WRITE;
/*!40000 ALTER TABLE `komp_lok_kol` DISABLE KEYS */;
INSERT INTO `komp_lok_kol` VALUES (1,7,1,2),(2,7,1,3),(3,3,2,5),(4,13,3,4),(5,2,4,5),(6,4,5,6),(7,1,6,4),(8,2,7,7),(9,1,8,8),(10,1,9,9),(11,10,10,10),(12,5,11,11),(13,5,11,3),(14,4,12,12),(15,1,13,12),(16,1,14,13),(17,1,15,13),(18,1,4,12),(19,1,9,12),(20,1,16,14),(21,30,17,15),(22,32,18,16),(23,2,19,17),(24,4,20,17),(25,1,21,17),(26,1,22,13),(27,1,23,14),(28,20,24,18),(29,1,25,17),(30,20,26,17),(31,1,4,8),(32,2,27,15),(33,20,28,19),(34,2,29,17),(35,1,30,21),(36,1,31,21),(37,2,14,20),(38,1,32,20),(39,1,33,21),(40,1,34,21),(41,1,35,22),(42,1,36,22),(43,1,37,20),(44,1,38,23),(45,7,39,16),(46,70,40,22),(47,1,41,23),(48,1,42,23),(49,13,43,24),(50,7,44,4),(51,17,45,25),(52,2,14,26),(53,6,9,27),(54,1,31,23),(55,10,46,24),(56,1,47,24),(57,1,48,20),(58,1,13,22),(59,2,49,22),(60,10,50,24),(61,1,34,9),(62,1,51,24),(64,4,53,21),(65,1,4,21),(66,2,54,29),(67,1,55,9),(68,10,56,9),(69,2,57,9),(70,1,58,9),(72,1,60,26),(73,3,61,26),(74,5,62,26),(75,5,63,26),(76,4,64,28),(77,10,56,28),(78,50,65,28),(79,20,66,29),(80,2,67,30),(81,1,68,30),(82,4,69,30),(83,1,70,31),(84,1,71,31),(85,10,72,31),(86,1,73,1),(87,1,74,1),(88,1,75,1),(89,4,76,1),(90,1,77,1),(91,1,78,1),(92,1,79,1),(93,1,80,1),(94,1,81,1),(95,12,82,1),(96,3,83,1),(97,50,84,1),(98,1,22,16),(99,1,85,1),(100,2,86,16),(101,1,87,16),(102,1,88,1),(103,26,89,1),(104,50,90,1),(105,5,91,1),(107,1,93,1),(108,3,94,1),(109,3,94,1),(110,1,95,1),(111,3,96,1),(112,5,97,1),(113,4,98,1),(114,3,99,1),(115,4,100,1),(116,8,101,1),(117,1,102,1),(118,15,103,1),(119,3,44,16),(120,1,51,16),(121,5,105,1),(122,19,106,1),(123,6,107,1),(124,2,108,1),(125,1,35,25),(126,1,8,26),(127,1,6,5),(128,1,36,23),(129,1,109,1),(130,1,33,20),(131,1,110,16),(132,50,111,1),(134,2,112,1),(135,3,113,1),(136,3,114,1),(137,4,115,1),(138,1,116,1),(139,1,117,1),(140,2,118,1),(141,20,119,1),(142,5,120,1),(145,1,92,1),(146,1,52,14),(147,9,121,1),(148,3,122,1),(149,1,123,1),(150,1,124,1);
/*!40000 ALTER TABLE `komp_lok_kol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komponente`
--

DROP TABLE IF EXISTS `komponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komponente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime_komponente` varchar(255) COLLATE cp1250_croatian_ci NOT NULL,
  `kratak_opis_komp` varchar(400) COLLATE cp1250_croatian_ci DEFAULT NULL,
  `slika` varchar(255) COLLATE cp1250_croatian_ci DEFAULT NULL,
  `kateg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kateg_id` (`kateg_id`),
  CONSTRAINT `komponente_ibfk_1` FOREIGN KEY (`kateg_id`) REFERENCES `kategorije` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=cp1250 COLLATE=cp1250_croatian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komponente`
--

LOCK TABLES `komponente` WRITE;
/*!40000 ALTER TABLE `komponente` DISABLE KEYS */;
INSERT INTO `komponente` VALUES (1,'Konektori 2pin','Konektori vodootporni','conn_waterproof_2_pin.png',4),(2,'BMP 280','Senzor atmosferskog tlaka','bmp_280_atm.jpg',8),(3,'DC-DC mini 360','dc-dc konverter step-down mislim',NULL,2),(4,'NODEMCU','ESP 8266','nodemcu_lolin.jpg',5),(5,'Konektori 2 pin plavi','Vodootporni plavi konektori','male_female_waterp_conn_2pin.jpg',4),(6,'USB DC-DC 5V','Step up konverter USB 5V','dc_dc_stepup_usb_5v.jpg',2),(7,'AC-DC 220V->5V','Konverter sa 220 na 5V 1 Amper','ac_dc_5v.jpg',2),(8,'Potenciometar s ručicom','10 kilo oma potenciometar',NULL,21),(9,'Senzor pokreta','senzor pokreta','pir_infrared_motion_sensor_arduino.jpg',8),(10,'Konektori za zvučnike','Ženski Plus/Minus konektori','speaker_connector.jpg',4),(11,'Konektori 3pin','Vodootporni konektori muško/ženski','conne_waterpr_3pin_male_female.jpg',4),(12,'Senzor težine driver','Driver za težinske ćelije','hx_7111_weight_sensor_driver.jpg',8),(13,'LCD Ekran 1602','Led ekran 1602','lcd_screen_1602.jpg',12),(14,'Relej 2 kanala','Relej za arduino 2 kanala','2ch_relay_arduino.jpg',13),(15,'Relej 4 kanala','Relej za arduino 4 kanala','4ch_relay_arduino.jpg',13),(16,'PT 1000 sonda','Temperaturna sonda pt 1000 inox 1/2 cola','pt1000_npt_12.jpg',8),(17,'LED diode svakakve','Svakakvi tipovi led dioda',NULL,16),(18,'Otpornici svakakvi i trimeri','Svakakve vrijednosti otpornika',NULL,6),(19,'BCY 56 tranzisor','Tranzistor bcy 56',NULL,13),(20,'DHT 11','Senzor temperature i vlage','dht11_humid_temp.jpg',8),(21,'LM386 Audio pojačalo','Pojačalo',NULL,23),(22,'Relej 1 kanal','Jednokanalni relej','1ch_relay_arduino.jpg',13),(23,'MAX 31865','Driver za temperaturnu sondu PT1000','max31864 _sensor_temp_driver.jpg',8),(24,'Arduino pinovi','Muško muški i muško ženski pinovi',NULL,4),(25,'MG 995 servo motor','Servo motor sa dodacima',NULL,15),(26,'Mini tipkice 4pin','Mini tipkice 4pin',NULL,13),(27,'Led Žarulje','Ne zna ako su 12 ili 24 V',NULL,16),(28,'Kondenzatori bipolarni razni','Razne vrijednosti',NULL,7),(29,'Micro SD čitač','Modul za arduino','micro_sd_card_reader_arduino.jpg',20),(30,'Arduino Nano','Arduino nano','arduino_nano.jpg',5),(31,'Vremenski modul','Modul za vrijeme','time_moduleds3231.jpg',8),(32,'Senzor razine vode','Mjeri razinu vode','water_level_sensor.jpg',8),(33,'USB to TTL','Konverter za programiranje arduino pro mini sa kabloviima','usb_to_ttl.jpg',5),(34,'Arduino pro mini','Arduino pro mini 328p 5V','arduino_pro_mini_5v_328.jpg',5),(35,'28BYJ 5V step motor','Step motor',NULL,15),(36,'Driver za 28BYJ','pripadajući driver',NULL,15),(37,'Senzor kiše','Senzor za mjerenje razine kiše. U kompletu sa pripadajućim driverom.','raindrop_module_sensor_arduino.jpg',8),(38,'Audio pojačalo 2x100W','12V pojačalo dvokanalno',NULL,23),(39,'BC556B tranzisor','tranzistor BC556B','bc556b-pinout.jpg',13),(40,'Lot trimera i potenciometra','više vrijednosti',NULL,21),(41,'RF relej Prijemnik','prijeminik',NULL,17),(42,'Predajnik/daljinski za relej prijemnik','daljinski za relej prijemnik',NULL,17),(43,'Postolje za atmel čip 24pin','Postolej za čip 24pin','24_p_atmel_328_socket_adapter.png',4),(44,'AMS 1117 step-down dc-dc 3.3V','konverter dc-dc na 3.3V.\r\nRegulator napona 4-20V input 3.3V output max 800mA','ams1117.jpg',2),(45,'Logic level shifter','3.3-5V step-up konverter za esp8266','logic_level_shifter.jpg',2),(46,'Driver za led panele','MAX 7219 CNG','max_7219_cng.jpg',12),(47,'Ekran nokia 5110','LCD ekran od nokie','nokia5110_lcd.jpg',12),(48,'Bluetooth modul','Bluetooth modul','bluetooth_module_arduino.jpg',17),(49,'Audio pojačalo 2x3W','PAM 8403 pojačalo 5V DC',NULL,23),(50,'Blok kondenzator 33pF','Blok kondenzator 33pF',NULL,7),(51,'Hladnjaci za rapsberry','Set od 3 hladnjaka za rapsberry pi',NULL,18),(52,'CR 2032 baterija','3V baterija pločasta','cr2032-3-volt-lithium-battery.jpeg',2),(53,'Sklopke brodske razne','Vodootporne tipke',NULL,13),(54,'LCD 1602 driveri','Za 1602 driveri','ii2_lcd_1602_driver.jpg',12),(55,'GPS modul','GPS modul sumnjive kvalitete','gyneo6mv2_gps_module_arduino.jpg',17),(56,'Micro USB konektori muški','Micro USB konektori muški s kućištem i svime','micro_usb_conn_male_white.png',4),(57,'Senzor vlage tla','Senzor vlage tla','soil_moist_sensor_arduino.jpg',8),(58,'Driver za senzor vlage tla','Driver za senzor vlage tla',NULL,8),(60,'14988 step motor driver','14988 step motor driver',NULL,15),(61,'Punte promjer 1mm','Punte promjer 1mm',NULL,11),(62,'Vide 3mm','razne vide od 3mm',NULL,11),(63,'Matice za vide od 3mm','Matice za vide od 3mm',NULL,11),(64,'Senzor težine ćelije','Ćelija od 50kg','weight_cell_50kg_sensor.jpg',8),(65,'LED diode UV','Ultra violet diode',NULL,16),(66,'Kondenzatori bipolarni 4700uF','Kondenzatori bipolarni 4700uF',NULL,7),(67,'PT 100 aplifier -50 do 50 celzijusa','Pojačalo za pt100 sondu 24 V ','pt100_amp_transmitt_24vdc_5050cels.jpg',8),(68,'PT 100 aplifier 0 do 200 celzijusa','Pojačalo za pt100 sondu 24 V ','pt100_amp_transmitt_24vdc_0200cels.jpg',8),(69,'RJ45 konektori','RJ45 konektori','rj_45_conn_male.png',4),(70,'RFID kartica i privjesak','RFID kartica i privjesak','rfid_card_keychain.jpg',20),(71,'RFID čitač','RfId čitač','rfid_reader_writer_arduino.jpg',20),(72,'220V ženski konektori','220V ženski konektori',NULL,4),(73,'Set PCB svrdla','Set PCB svrdla različitih veličina.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','pcb_set_razlic.jpg',1),(74,'Rezač za staklo','Rezač za staklo.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','glass_cutter.jpg',1),(75,'Pila','Pila sa više različitih nastavaka','jig_saw_Set.jpg',1),(76,'Upaljači survival benzinski','Survival Upaljač, gorivo Benzin, oblik ručne granate iz WW2. Trenutno se nalaze u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','survival_granade_lighter.jpg',11),(77,'Elektroventil 12V DC','Elektroventil 12 V DC. Trenutno se nalaze u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','solenoid_valve_12_v.jpg',13),(78,'Elektroventil 220V AC','Elektroventil 220V AC. Trenutno se nalazi u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','220_v_water_valve.jpg',13),(79,'Relej Plutajući Folat Switch','Relej plutajući, float switch, Max 20A, 12-24-32 VDC, ignition protected. Trenutno se nalazi u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','float_switch.jpg',13),(80,'NODEMCU Shield','Nodemcu protection board. Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','nodemcu_shield.jpg',5),(81,'3.5mm audio jack muski 5m','3.5 mm audio jack muški oko 5 metara.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','3-4_mm_jack_audio_5_m.jpg',3),(82,'Fitilji','Fitilji mislim za zippo, nisu za petrolejku, promjer cca 3-4mm sa metalnom žicom unutra.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','zippo_vick.jpg',11),(83,'Baterije 1.5v AAA','baterije.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','aaa_battery_1-5_v.jpg',2),(84,'Plasticne spojnice za cijevi','Plasticne spojnice za cijevi, crne, mislim da su za vrtlarstvo, promjer cca 4-5mm.',NULL,11),(85,'Ethernet splitter','Ethernet spliter 3 interfacea:Line,Phone,DSL. Novi.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','ethernet_splitter.png',1),(86,'Tipkica 2pin','Tipkica, samovraćajuća',NULL,13),(87,'Konektor zenski klasicni za adaptere','Koristeni zenski konektor, pase na vecinu adaptera i punjača promjer cca 6mm',NULL,4),(88,'Super ljepilo','Superljepilo pattex.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.',NULL,11),(89,'MOSFET IRLZ44N','Mosfet tranzistor.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','mosfet_irlz44n.jpg',13),(90,'Konektor Čokolatin','Konektor na Vidu, može se zalemit na Pločicu.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.',NULL,4),(91,'LM 2596S DC-DC converter','LM2596S DC-DC konverter.\r\nInput voltage 40-35V, output 1.23V-30V.\r\n3A.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','lm25296s.jpg',2),(92,'OLED display 0.96 inch','128x64. VCC SDA SCL za Arduino.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','oled_display_128x64_096inch.jpg',12),(93,'Set PCB svrdla 0.9mm','Set od 9 komada, PCB svrdla 0.9mm.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','pcb_set_0_9_mm.png',1),(94,'Fotopločica 75x100','Vetronit foto 75mm x 100mm.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.',NULL,19),(95,'Anti static narukvica','Anti static narukvica.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','anti_stat_bracelet_glove.jpg',1),(96,'Senzor vlage tla V1.2','Kapacitivni senzor vlage tla.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','capacitive_soli_moisture_sensor_v12.jpg',8),(97,'DS18B20 temp senzor','Vodootporni trožilni, dužina kabla cca 1 metar.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','ds18b20_temp_sensor_inox.jpg',8),(98,'Ventil Inox 1/2\"','Inox 304 kuglicni ventil, NPT navoj.Lokacija Toolbox u špajzi.','ball_valve_1-2_inch_30g_inox.jpg',10),(99,'T spoj Zenski','Inox 304 1/2\" T spoj ženski, NPT navoj.Lokacija Toolbox u špajzi.','tee_npt_1-2_inox.jpg',10),(100,'Inox spoj za cijev','Inox spoj, sa jedne strane se moze prikacit cijev promjera cca 8mm, a s druge strane ima muški 1/2\" NPT navoj.Lokacija Toolbox u špajzi.','male_thread_nipple_fitting_barb.jpg',10),(101,'Spoj za Inox cijev bez navoja','Spoj, s jedne strane ima sistem spajanja bakrene, inox ili bilo koje krute cijevi bez navoja, a s druge strane ima 1/2\" muški NPT navoj.Lokacija Toolbox u špajzi. Dimezije 1/2\" NPTx14MM.','ferrule_fitting_male_inox_304.jpg',10),(102,'Muško-Muška inox spojnica','Musko muska inox spojnica, s obe strane ima 1/2\" muski NPT navoj.Lokacija Toolbox u špajzi.','nipple_inox_1-2_male_male.jpg',10),(103,'L7805CV','L7805CV Regulator napona 7-35Vin->5Vout+Toplina.Lokacija Toolbox u špajzi.','l7805cv.png',2),(105,'IRF 540N MOSFET','Irf 540n mosfet.Lokacija toolbox u špajzi.','irf_540_n.jpg',13),(106,'16MHz oscilatori','16MHz oscilatori.Lokacija toolbox u špajzi.',NULL,22),(107,'Piezzo komponenta','Piezzo komponenta, ne znam koliko Hz-a.Lokacija toolbox u špajzi.',NULL,1),(108,'8x8 LED panel','8x8 led panel.Lokacija toolbox u špajzi.','led_matrix_8x8.jpg',12),(109,'HR4988 Driver','Stepper motor driver sa pripadajucim hladnjakom.Lokacija toolbox u špajzi.',NULL,15),(110,'LED dioda 220V','Led dioda, ne znam koje jačine, ali neka jaka jer je predviđena za montažu na hladnjak.',NULL,16),(111,'Senzor pokreta Vibr','Senzor pokreta radi na principu kratkog spoja u slucaju vibracije.Lokacija toolbox u špajzi.','vibration_sensor_switch.jpg',8),(112,'Set Žica za testnu plocicu','Set od 140 žica za testnu PCB pločicu. Svakakve dužine. Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','jump_wire_set_140.png',3),(113,'Pločica bakrena 70x100','Bakrena pločica 70x100.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.',NULL,19),(114,'Vetronit foto negativ 50x100','Pločica vetronit foto negativ dimenzije 50mmx100mm.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.',NULL,19),(115,'Kabel 220V AC dvožilni','Kabel za napajanje oldschool kakve imaju stari radio i tranzistori, dvožilni.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','cable_220_v_ac.png',3),(116,'Kutija Osiguračka 12/24V','Kutija za autoosigurače za 4 trošila.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','fuse_box.jpg',1),(117,'Auto upaljač utor ženski','12/24V autoupaljač utor ženski, za vanjsku upotrebu.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','cig_light_socket_boat.png',1),(118,'Buzzer 3-24VDC','Buzzer 3-24VDC.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','piezzo_buzzer.jpg',1),(119,'TermoOtpornik 1kOhm','Thermistor 1kOmh MF52AT MF52 B 3950 NTC.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','',6),(120,'Shotkey Dioda 15SQ045','Šotki dioda 15 Ampera i 45 Volti MAX.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.',NULL,16),(121,'PH Buffer set 4.01, 6.86, 9.18','PH Buffer set 4.01, 6.86, 9.18, po tri komada od svake vrijednosti. Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','PH_buffer_set.jpg',11),(122,'LED ekran Voltmetar','Digital Voltmeter DC 4.5V to 30V Digital Voltmeter Voltage Panel Meter Red/Blue/Green For 6V 12V Electromobile Motorcycle Car.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','voltmeter_led_12_v.png',12),(123,'LCD2004+I2C driver','Lcd ekran dužine 20 karaktera i 4 reda. Dolazi sa već zalemljenim i2c driverom.Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','LCD_2004_I2C.png',12),(124,'Musko ženski konektori višepinski set','230 komada konektori od 2,3 i 4 pinova, muški dio se lemi na pločicu a ženski ima...........Trenutna lokacija u trostrukom plastincnom ladicaru u sobi u najgornjoj ladici.','conn_230_pcs_2_54.png',4);
/*!40000 ALTER TABLE `komponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokacije`
--

DROP TABLE IF EXISTS `lokacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokacije` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime_lokacije` varchar(255) COLLATE cp1250_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=cp1250 COLLATE=cp1250_croatian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokacije`
--

LOCK TABLES `lokacije` WRITE;
/*!40000 ALTER TABLE `lokacije` DISABLE KEYS */;
INSERT INTO `lokacije` VALUES (1,'Nema'),(2,'A1'),(3,'A2'),(4,'A3'),(5,'A4'),(6,'A5'),(7,'B1'),(8,'B2'),(9,'B3'),(10,'B4'),(11,'B5'),(12,'C1'),(13,'C2'),(14,'C3'),(15,'C4'),(16,'C5'),(17,'D1'),(18,'D2'),(19,'D3'),(20,'D4'),(21,'D5'),(22,'E1'),(23,'E2'),(24,'E3'),(25,'E4'),(26,'E5'),(27,'F1'),(28,'F2'),(29,'F3'),(30,'F4'),(31,'F5');
/*!40000 ALTER TABLE `lokacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'baza_komponenti1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-01 13:12:20
