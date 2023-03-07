CREATE DATABASE  IF NOT EXISTS `synthworld` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `synthworld`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: synthworld
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Make Noise',NULL,NULL),(2,'1010Music',NULL,NULL),(3,'Vpme.de',NULL,NULL),(4,'Eventide',NULL,NULL),(5,'Frap Tools',NULL,NULL),(6,'Nano',NULL,NULL),(7,'Behringer',NULL,NULL),(8,'Arturia',NULL,NULL),(9,'OXI',NULL,NULL),(10,'Korg',NULL,NULL),(11,'Elektron',NULL,NULL),(12,'Befaco',NULL,NULL),(13,'Doepfer',NULL,NULL),(14,'Erica Synths',NULL,NULL),(15,'Dreadbox',NULL,NULL),(16,'Empress Effects',NULL,NULL),(17,'Eventide',NULL,NULL),(18,'Alter Audio',NULL,NULL),(19,'Eowave',NULL,NULL),(20,'Dato',NULL,NULL),(21,'SOMA',NULL,NULL),(22,'Meng Qi',NULL,NULL),(23,'Cre8audio',NULL,NULL),(24,'Singular Audio',NULL,NULL),(25,'Expressive E',NULL,NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `product` (`product_id`),
  KEY `order` (`order_id`),
  CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Modules & Cases',NULL,NULL),(2,'Sequencers',NULL,NULL),(3,'Accesories',NULL,NULL),(4,'Effects',NULL,NULL),(5,'WeirdGear',NULL,NULL),(6,'New Releases',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `checkout` tinyint DEFAULT '0',
  `checkout_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `productC` (`product_id`),
  KEY `category` (`category_id`),
  CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `productC` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (52,44,1,'2023-03-05 19:49:50','2023-03-05 19:49:50'),(54,45,1,'2023-03-05 20:08:25','2023-03-05 20:08:25'),(55,46,1,'2023-03-05 20:11:57','2023-03-05 20:11:57'),(56,47,1,'2023-03-05 20:15:55','2023-03-05 20:15:55'),(57,48,1,'2023-03-05 20:19:02','2023-03-05 20:19:02'),(58,49,1,'2023-03-05 20:22:59','2023-03-05 20:22:59'),(59,50,1,'2023-03-05 20:48:28','2023-03-05 20:48:28'),(60,51,1,'2023-03-05 20:54:17','2023-03-05 20:54:17'),(61,52,2,'2023-03-05 20:57:56','2023-03-05 20:57:56'),(62,53,2,'2023-03-05 21:02:02','2023-03-05 21:02:02'),(63,54,2,'2023-03-05 21:04:50','2023-03-05 21:04:50'),(64,55,2,'2023-03-05 21:23:30','2023-03-05 21:23:30'),(65,56,3,'2023-03-05 21:25:58','2023-03-05 21:25:58'),(66,57,3,'2023-03-05 21:28:04','2023-03-05 21:28:04'),(67,58,3,'2023-03-05 21:29:07','2023-03-05 21:29:07'),(68,59,3,'2023-03-05 21:31:04','2023-03-05 21:31:04'),(69,60,4,'2023-03-05 21:32:56','2023-03-05 21:32:56'),(70,61,4,'2023-03-05 21:33:58','2023-03-05 21:33:58'),(71,62,4,'2023-03-05 21:34:54','2023-03-05 21:34:54'),(72,63,4,'2023-03-05 21:36:05','2023-03-05 21:36:05'),(73,64,5,'2023-03-07 11:50:29','2023-03-07 11:50:29'),(74,65,5,'2023-03-07 12:02:01','2023-03-07 12:02:01'),(76,66,5,'2023-03-07 12:10:23','2023-03-07 12:10:23'),(77,67,1,'2023-03-07 12:12:23','2023-03-07 12:12:23'),(78,68,5,'2023-03-07 12:26:42','2023-03-07 12:26:42'),(79,69,6,'2023-03-07 12:39:10','2023-03-07 12:39:10'),(80,70,6,'2023-03-07 12:40:48','2023-03-07 12:40:48');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(4,2) DEFAULT '0.00',
  `image` varchar(100) NOT NULL,
  `description` text,
  `extra_info` text,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `brand` (`brand_id`),
  CONSTRAINT `brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (44,'Mimeophon Stereo Multi-Zone',1,399.00,0.00,'productImg-1678045312823.png','   The Mimeophon music synthesizer module is a stereo, multi-zone color audio repeater by Make Noise and soundhack, coded by Tom Erbe.\r\n\r\nNEW FIRMWARE AVAILABLE! Mimeophon will now save current Input Gain Level setting when powered off. Click here to download.\r\n\r\nThe Mimeophon (from Greek mimeo (repeat/copy) and phon (sound)) is a modern take on various historical sound copying, echo and repeating devices. It allows for Stereo modulations of Time, Space and Timbre of Mono or Stereo sound sources. The Mimeophon is capable of modulating and morphing time scales of repeated sound from micro-sound to note to phrase length while also coloring and spatializing the repeats. ','Stereo multi-zone color audio repeater\r\nDesigned in collaboration with Tom Erbe of Soundhack fame\r\nContinues the forward-thinking legacy of modules like Phonogene, Echophon, Erbe-Verb, and Morphagene\r\nPerfect for all sorts of time-based effects from Karplus-Strong to delays, microsound to lengthy loops\r\nZone control provides access to nested layers of repeats, acting as a master timescale control\r\nRate provides playback speed/Doppler-style \"delay rate\" control\r\nSkew for offsetting left and right repeat rates\r\nmicro Rate for subtler Doppler effects\r\nFlip and Hold for reverse and freeze effects\r\nRepeats, Halo, and Color interact to create effects that smear in space and change in spectral focus over time\r\nGate output derived from Rate control\r\nMono or stereo input with stereo output\r\nCV or Gate control for all parameters',1,'2023-03-05 19:41:52','2023-03-05 19:49:50'),(45,'Bitbox Micro Black Edition – Compact Sampling Module',2,439.00,0.00,'productImg-1678046857815.jpg',' Powerful Sampling Capabilities in a Smaller Form Factor\r\nWith the sampling features of bitbox micro you can add interesting new ways of generating sound and music to your Eurorack. Trigger one shots, play time synched loops or record live looping. Bitbox micro is equally at home in your studio or as a component of your live performance. ','Features\r\nSample Playback\r\nPlay up to 24 stereo polyphonic notes when your samples fit in the 64 MB of internal memory or up to 8 larger stereo samples streaming directly from the microSD card\r\nConfigure 8 stereo sample pads per preset as single or multi-samples, clips, slicers, granular or new recordings\r\nStream long samples from the microSD card with a max sample size of 4 GB, which can be many hours of audio\r\nTrigger samples with the touch screen, CV gate inputs, or MIDI input\r\nControl how samples start and stop by choosing from one-shot, toggle, and gate launch modes\r\nTweak playback through a variety of sample parameters, including start position, length, pitch, gain, filter, loop mode, launch quantization, ADSR, Exclusive Grouping, clip synchronization, slice placement and sequencing, grain size, grain spread, grain count, and MIDI note and channel mapping\r\n',1,'2023-03-05 20:07:37','2023-03-05 20:08:25'),(46,'QD - Eurorack Module',3,349.00,0.00,'productImg-1678047117501.png','4 digital drum voices in a 22hp compact module\r\nevery voice can be a sample player, a wavetable VCO or a digital drum model\r\ncontrol of pitch, decay and sample selection per voice\r\nuSD card slot, up to 1536 samples total, up to 128 samples per drum voice under CV control\r\n','digital models offer range of kicks, snares, hats, strings and other percussive sounds\r\n4 trigger inputs\r\n4 assignable CV inputs\r\n4 mute buttons and a very intuitive and powerful control interface\r\n4 internal LFOs or mod envelopes than can be synced to triggers\r\ninternal 4 channel mixer, 2 output channels\r\ninternal 3-band equalizer and compressor  ',1,'2023-03-05 20:11:57','2023-03-05 20:11:57'),(47,'Misha',4,599.00,0.00,'productImg-1678047355260.jpg','  A New Way to Make Music\r\nMisha is an innovative Eurorack instrument/sequencer that utilizes a unique, interval-based approach to playing and creating melodies. It’s designed to be played like a keyboard instrument and yet it makes music in a way unlike any instrument before it. In addition to playing it live, you can also record sequences that can be modified in a multitude of ways, allowing for new paths of spontaneous creativity. ','Inspired by twelve-tone composition, Misha’s sequencer expands upon the tone row technique, allowing for new paths of spontaneous creativity. Modify your sequence using some of the classic techniques such as Prime, Retrograde, or Inverted playback, or completely rearrange your sequence in unpredictable and exciting ways. \r\nMisha comes preloaded with a variety of scales ranging from typical Western scales, microtonal scales, scales that use just intonation, and everything in between. Additionally, two banks of User scales allow you to upload your own scales using the Scala format for further experimentation.\r\n',1,'2023-03-05 20:15:55','2023-03-05 20:15:55'),(48,'BRENSO',5,550.00,0.00,'productImg-1678047542421.png','  word created from the Italian adjectives breve ‘short’ and intenso ‘intense,’ probably around the early 2000s in the area of Bologna; pronounced with the long, closed e instead of the expected open ɛ, as typical of the Northern Italian regions] — This adjective may have originally referred to events or experiences that were particularly powerful despite their short duration. Soon its meaning broadened, indicating anything (objects or even thoughts) that feature great content in proportion to the size. For example, nowadays, a thick lasagna or a massive live performance can be equally ‘brense.’','BRENSO consists of three sections: two for sound generation (yellow and green), and one for sound processing (white and red).\r\n\r\nThe generation sections allow control over the two triangle-core oscillators, which can be modulated and synced both internally and externally. The Frequency Modulation can be any combination of exponential and/or linear through-zero.\r\n\r\nThe processing section is composed of a Timbre Modulation section (white) and a final stage of Amplitude Modulation (red). The Timbre Modulation contains two parallel waveshapers with a PWM circuit, which are mixed with a crossfader and processed by a wavefolder. The wavefolder has symmetry control and can be pinged through a dedicated clock input with a shapeable, nonlinear behavior.',1,'2023-03-05 20:19:02','2023-03-05 20:19:02'),(49,'Modules CAIXA 104',6,649.00,0.00,'productImg-1678047779089.jpg','CAIXA 104 is an advanced fully portable 104HP Eurorack Modular Case, with a wide range of utilities integrated on it. Connect up to 18 modules and carry it anywhere you go thanks to its handle.','We designed CAIXA 104 to provide a solid base for starting your modular journey and squeezing every centimeter of your system in case you’re already an experienced Eurorack-head.\r\nA selection of utilities that everyone usually needs to have in their modular synthesizer, just like the Buffered Multiples, the Stereo Mixer or its 2 LFOs.\r\n\r\nWe have also focused on improving connectivity with the integrated inputs and outputs.',1,'2023-03-05 20:22:59','2023-03-05 20:22:59'),(50,'EURORACK GO',7,329.00,0.00,'productImg-1678049308655.png','The EURORACK GO was engineered specifically to protect your favorite synthesizer modules and similar 3U electronics. With 2 rows of 140 HP useable mounting space (for a total of 280 HP), the rugged aluminum chassis features 96 sliding nuts for ultra-easy positioning of your precious gear. In the studio or on the road, the EURORACK GO is the ideal way to protect your rig – wherever the gig takes you...','Massive Power Supply\r\nOne of the features that separates EURORACK GO from competing products is the massive, ultra-low noise power supply. The auto-ranging universal switch-mode supply works anywhere in the world and uses 32 keyed power connectors to protect your valuable modules from accidental reverse power hookup.\r\n\r\nAt Home in the Studio, Ready for the Road\r\nAt Home in the Studio, Ready for the Road\r\nDesigned for rugged reliability, the all-aluminum chassis houses an adjustable support plus oversized rubber feet to provide 0-50° setup capability and ensures rock-solid stability for use on a wide range of surfaces.',1,'2023-03-05 20:48:28','2023-03-05 20:48:28'),(51,'RackBrute 6U',8,339.00,0.00,'productImg-1678049657622.jpg','Armored eurorack carrier\r\n\r\nRackBrute 6U is an all-inclusive Eurorack case ensuring the total security of your modules and maximum practicality in all conditions of use. Its multi-position configuration and included dependable power supply make it the true specialist solution.','Modules deserve armor-plating.\r\n\r\nRackBrute 6U provides you with 176HP to store and secure your enviable collection of Eurorack modules in an everlasting yet lightweight aluminum chassis flanked by two wood panels. Once you\'re locked and loaded, your modular setup will look and feel like a monolith, yet more flexible than ever thanks the Link fastening system and the paired handle. When on the move, it will make the transport of your modular equipment a walk in the park. When in position, it will let you organize your command center the way you want it. Modules don\'t live on love alone, and RackBrute 6U keeps everything alive with its +12V / -12V / +5V power supply.\r\n\r\n“This is my modular. There are many like it but this one is mine. My modular is my best friend. It is my life. I must master it as I must master my life.”',1,'2023-03-05 20:54:17','2023-03-05 20:54:17'),(52,'Oxi One',9,749.00,0.00,'productImg-1678049875997.png','THE NEW WAVE OF SEQUENCING\r\nA new inspiring way to create musical ideas, perform and control all your studio gear','ALL IN ONE\r\n+100 NEW FEATURES SINCE LAUNCH\r\n4 FULLY CONFIGURABLE SEQUENCERS\r\n8 LFOS\r\n4 LOOPERS\r\n4 ARPEGGIATORS\r\n8 CVS & 8 GATES FULLY ROUTABLE\r\nDRAW & PERFORM MODULATIONSnew\r\nUP TO 32 INDEPENDENT MOD LANESnew\r\nFULL MODULATION CAPABILITIES\r\nTONS OF RANDOMIZATION OPTIONS\r\nEUCLIDEAN & PATTERN GENERATORS\r\nADVANCED SONG ARRANGER\r\nPERFORMATIVE KEYBOARD LAYOUTS\r\nMIDI USB HOST new\r\nBLUETOOTH & BATTERY POWERED\r\nCOMPACT & SLEEK\r\nBUILT TO LAST',1,'2023-03-05 20:57:56','2023-03-05 20:57:56'),(53,'Make Noise 0-CTRL',1,449.00,0.00,'productImg-1678050122133.png','The Make Noise 0-CTRL is a patchable, clockable controller and step sequencer for voltage controlled synthesizer systems. Designed to be patch pals with the 0-Coast, it is a tabletop device whose inputs and outputs follow Eurorack standards, making it also a great partner for a modular system or another patchable tabletop synth.','Fully analog and patch programmable, no menus or modes, what you patch is what you get!\r\nSequence and Control the Pitch, Strength, and Time of your synthesizer voice, per step\r\nVoltage control over Stop and Direction\r\nDynamic Reset, select Reset Step while sequencing\r\nPressure and Touch Gate outputs for human generated events and expression\r\nSynchronize the 0-CTRL via the Clock In, or clock other machines with the Clock and/ or Gate Outs\r\nGate output per step for patch programming sequence behavior and triggering unique events per step',1,'2023-03-05 21:02:02','2023-03-05 21:02:02'),(54,'Korg SQ-64',10,229.00,0.00,'productImg-1678050290035.png','The SQ-64 is an incredibly powerful and compact Polyphonic Step Sequencer with amazing hands-on intuitive controls and deep editing options to give you all the flexibility and sequencing power needed for all your musical projects.\r\n\r\nWith its 64 step pad Matrix, Crystal clear OLED display, sturdy and elegant aluminium body, a wealth of connections and a variety of modes and features, the SQ-64 will become the central piece of your music studio providing total and seamless control over all your instruments so you can focus on what matters most; your music!','Despite its compact size, the SQ-64 has unparalleled connectivity and will allow you to easily control, connect and make the most of all your analog and digital gear. MIDI IN (x1) and OUT (x2), micro USB type B, Sync IN & OUT, 3 Melody tracks each with MODULATION, PITCH and GATE outputs and a DRUM track with 8 individual trigger outputs for controlling analog synths, Eurorack, and drum machines.',1,'2023-03-05 21:04:50','2023-03-05 21:04:50'),(55,'Elektron Octatrack MKII Black',11,1489.00,0.00,'productImg-1678051410033.png','With the Octatrack MKII, discovering the perfect sample is only the beginning. Twist it, distort it, and carve it into something that is truly yours. Dynamic in name and nature: this is the ultimate sampler for recording sessions, creative kick-starts, and improvisational performances. A stereo sampler, looper, arranger, mixing and effects hub, workstation, performance instrument: you name it. Its power scales and evolves with you during your musical journey.','The Octatrack MKII redefines how you transform your sounds, as well as how you interact and play with them. It is a stereo sampler, processor, and live looper with a powerful sequencer and workstation workflow on top. Choose between several custom machines – static, flex, thru, neighbor, pickup – to suit your sample recording, manipulation, and effects processing needs for each of the eight tracks.\r\n\r\nWhether you use only a few aspects of its capabilities, such as sample crafting, slicing, effects, and playback – or gradually include its connectivity and control for a deeper and more comprehensive composition – the Octatrack will sit confidently as the central hub of your musical world.',1,'2023-03-05 21:23:30','2023-03-05 21:23:30'),(56,'Erica Synths Eurorack Cable Holder 300mm',14,23.00,0.00,'productImg-1678051558816.jpg','We wanted to organize patch cables that were hanging on all possible objects in our Lab, therefore we decided to make patch cable holders.','Rigid, 2mm aluminium powder coated cable holders can host over 100 patch cables in perfect order! Patch cable holders come in two sizes - 205mm and 305mm wide, two screws for fixing the cable holder are included. Holder gaps are 4mm wide.\r\n\r\n!NB! A cat, seen on the photo, can not be bought, it\'s for illustration purposes only',1,'2023-03-05 21:25:58','2023-03-05 21:25:58'),(57,'Befaco Synth Duster',12,13.60,0.00,'productImg-1678051684931.jpg','The Befaco Synth Duster is a super soft brush to keep your modular synth and audio equipment far away from the dust!!','Size: 100x110x30 millimeters (w/h/d)',1,'2023-03-05 21:28:04','2023-03-05 21:28:04'),(58,'3.5mm TRS to MIDI Adapter (Type B)',2,4.95,0.00,'productImg-1678051747766.jpg','1010 MUSIC 3.5MM TRS TO MIDI ADAPTER\r\n1010 Music\'s 3.5mm TRS to MIDI Adapter helps synthesists everywhere realize their ultimate dream: controlling multiple MIDI devices from a single source. This 8.5\" cable features a 3.5mm male TRS connection at one end and a female MIDI 5-pin DIN cable on the other. Use it to take modules like the Bitbox, MX4, and FxBox to the next level.','3.5MM TRS TO MIDI ADAPTER FEATURES\r\n3.5mm male TRS to female MIDI 5-pin DIN\r\nType B\r\nConnect traditional MIDI cable to any 1010Music module or TRS MIDI port\r\n8.5\" cable constructed from durable materials',1,'2023-03-05 21:29:07','2023-03-05 21:29:07'),(59,'Doepfer Cable Set for DIY Synth Kit',13,21.40,0.00,'productImg-1678051864510.jpg','Cable Set\r\nFor DIY Synthesizer kit\r\nConsisting of two 16-pin and five 10-pin flat-ribbon cables\r\nWith matching counterparts to the 2-pin contact strips on the DIY Synth board','Length: Each 50 cm\r\nThe other end of each cable is open, which allows all connections to the board to be carried out completely without soldering',1,'2023-03-05 21:31:04','2023-03-05 21:31:04'),(60,'Timetosser Live Audio Sampler + Slicer',18,379.00,0.00,'productImg-1678051976400.jpg','ALTER AUDIO TIMETOSSER\r\nAdd flare, chops, and repetition to your performances and recordings with Alter Audio\'s Timetosser, a performative audio re-arranger. Constantly recording into a buffer for audio manipulation, the top eight buttons provide a division of the current buffer in which you can effect via looping, reversing, and even playback and beat juggle much like you could in a DJ setup or even on a drum machine. To capture the audio at a correct tempo, the metronome key acts as a tap-tempo feature for matching the beats of what you capture. Alternatively, you have full MIDI implementation to sync Timetosser to other musical devices as well as an analog clock input to even integrate with a modular system.','To perform a section of your audio, you can simply jump to it by pressing the section or even loop it by holding down the section. The length of the step in which you press or hold is determined via the three note value buttons, offering quarter, eighth, and sixteenth notes as well as triplet variations of each. Utilizing the mode button, you can access how the Timetosser reacts in response to your playing, following any combination of un/synchronized looping and un/quantized playback. Timetosser can send you back in time by engaging the reverse key, and even get a record-stop effect when holding down shift simultaneously. Along with performative re-arranging your audio, you can also apply rhythmic muting or just complete muting to pull elements out of the audio for room to breathe or feature other elements.\r\n\r\nEasily set up Timetosser with your DAW via the available VST plugin, making it easy to remix audio on your computer or even utilize Timetosser as a master effect for expressive DJ scenarios. Whether you\'re wanting to inspire glitchy audio playback or just looking for easy ways to remix your instruments and tracks, Alter Audio\'s Timetosser is an amazing tool on the stage or in the studio.',1,'2023-03-05 21:32:56','2023-03-05 21:32:56'),(61,'H90 Harmonizer Multi-Effects Pedal',17,899.00,0.00,'productImg-1678052038874.jpg','EVENTIDE H90 HARMONIZER\r\nSetting the new bar that any powerful multi-effects processors should look up to, Eventide\'s H90 Harmonizer pedal flawlessly covers effects ranging from delays, pitch-shifting, and more, all with the ability to run two algorithms at the same time. Building on the platform established by the H9, H90 is the most powerful pedal Eventide has ever produced. You could think of H90 as two H9s in one pedal, but it also packs in numerous new effect algorithms, routing options, and performance features that transcend the capabilities of traditional guitar pedals. And with a completely overhauled screen-based interface, H90 is a pedal that you\'ll always want to be tweaking.\r\n\r\nH90 offers a total of 62 different effects algorithms: 52 returning from the H9, and ten all-new effects taking advantage of H90\'s impressive processing power. Among these, the Polyphonic algorithm sticks out—it makes use of Eventide\'s proprietary Spectral Instantaneous Frequency Tracking technology, or SIFT for short. The result is stunning, as even the most dissonant chords and timbres are shifted with perfection. Regardless of your chosen effects, you can use two of H90\'s algorithms simultaneously, which means you can stack delay into reverb, tremolo into chorus, or any other combination that your heart desires.','With two effects algorithms available at once, H90 also provides incredible flexibility in arranging signal flow. Series and Parallel routings are easily achieved, but even more possibilities are available with external effects. Unlike most pedals, H90 has four inputs and four outputs, with the secondary pairs available for use as two mono inserts or a single stereo loop. Insert loops may be placed anywhere on the effects path, whether it\'s before, after, or in between H90\'s algorithm blocks. Alternatively, head into the Global Settings and enable dual mode, which decouples the algorithms into their own independent signal paths, allowing you to set up four-cable method connections with your amp, process two stereo instruments independently, or any other niche audio scenario.\r\n\r\nH90\'s effects and audio routing is only part of the story though, for this pedal sports incredible control capabilities. In Perform mode, you can assign effects parameters to macro-style HotKnobs, instantly recall settings with scene-like HotSwitches, or keep a handful of essential controls at your disposal by assigning them to the QuickKnobs beneath the screen. But if that\'s not enough for you, H90 also offers two controller ports for expression pedals and auxiliary footswitches, as well as MIDI control over USB-C or traditional 5-pin DIN. Nearly every aspect of an effect may be assigned to an external controller, along with numerous global H90 parameters.',1,'2023-03-05 21:33:58','2023-03-05 21:33:58'),(62,'ZOIA Euroburo Programmable Synthesizer Module',16,714.00,0.00,'productImg-1678052094141.jpg','EMPRESS EFFECTS ZOIA EUROBURO\r\nThe Empress ZOIA Euroburo is a Eurorack adaptation of the ultra-powerful ZOIA pedal, retaining all the same features as the pedal version but adding extra CV ins and outs as well as additional function modules. The original ZOIA pedal was an entire self-contained modular environment with the ability to route effects and modulation throughout the signal path—and ZOIA Euroburo brings this concept full circle by taking it off the pedalboard and placing it directly into a modular synthesizer.\r\n\r\nThe RGB backlit buttons provide a tactile interface and allow for representation of the routing and module functions. The OLED screen adds another level of monitoring indicating everything from patch names to LFO waveforms. There are over 80 different modules that can be assigned to a wide variety of functions. The vast selection of CV modules includes classic modulation types like envelopes, LFOs, comparators, sample and hold, and slew limiters. Audio modules include oscillators, looper, VCAs, and more. The built-in effects include fuzz, delay, reverb, ring mod, EQ, and many others.','The ZOIA Euroburo features four assignable CV inputs and outputs, with the ability to mix and route any combination of internal or external modulation sources to the CV outputs. It retains the original ZOIA\'s MIDI functionality with MIDI in and out on 3.5mm jacks. It has stereo in and out as well as a dedicated headphone output.\r\n\r\nNot a version 2, the ZOIA Euroburo is an entirely new creation that brings the flexibility and power of the pedal ZOIA into a truly modular environment.',1,'2023-03-05 21:34:54','2023-03-05 21:34:54'),(63,'Dreadbox Raindrops Delay, Pitch, Reverb',15,259.00,0.00,'productImg-1678052165821.jpg','Dreadbox Raindrops is a Hybrid Delay/Pitch Shifter/Reverb pedal that takes the concept of short echos on a different level\r\nIt is equipped with multiple delay stages and different chips and you can choose between 3 different play modes, where in each one you can have a whole new experience and alternative soundscapes. You can achieve from simple short echos, to long, dirty and lo-fi delays and from simple pitch shifting bursts to extensively lasting reverbs','Delay, Pitch Shifter, Reverb\r\nHybrid circuit with multiple delay stages and ICs\r\nDelay times from 50ms up to 1 sec with tap tempo\r\n(above 700ms starts to become lo-fi and some dirt is added to the repeats)\r\nTrue stereo in and out\r\n3 different algorithms:\r\nModulated delay\r\nPitch shifted delay\r\nLush reverb\r\nPreset memory for each algorithm',1,'2023-03-05 21:36:05','2023-03-05 21:36:05'),(64,'Quadrantid Swarm Module',19,493.20,0.00,'productImg-1678189829481.png','Synthvoice with sequencer and spring reverb\r\nEoWave\'s Quadrantid Swarm Module attracts attention as a new Eurorack synthesizer with an unusual design and exciting features. The core of the sound is a digital triangular oscillator with wave spread. A percussive sound element and noise can be added. The generated spectrum is processed with filter 1, which operates in 12 dB low-pass or high-pass mode, and filter 2, which is designed as low-pass only.','Movement in the sound comes with an A/D (Attack/Decay) envelope, as well as an LFO with eight waveforms, the final level control adopts a VCA. The icing on the cake is the built-in, true analog spring reverb at the end of the signal path. The eight gold plates are used to input further functions, make the Quadrantid Swarm playable monophonically or polyphonically, and provide access to the eight-step sequencer. The module is well suited for generic and experimental music. The numerous CV and port connections invite more complex patches. If desired, the module can be played and synchronized via MIDI using an adapter cable.',1,'2023-03-07 11:50:29','2023-03-07 11:50:29'),(65,'Dato DUO',20,329.00,0.00,'productImg-1678190520968.jpg','This is the Dato DUO — an instrument for making electronic music together. You don\'t have to be an experienced musician: we designed the DUO to be enjoyed by kids aged 3 to 99 and up — that includes you!','Synthesizer\r\nThis side is the synthesizer. Generate and sculpt gritty, bold or soft sounds. You play with filters and add effects such as a  bitcrusher and  accent. And add  beats!\r\nSequencer\r\nLoop eight notes on the sequencer side. Compose a melody using the keyboard — flashy lights indicate which tone is playing. You can randomize the sequence,  speed up and pitch up and down.',1,'2023-03-07 12:02:00','2023-03-07 12:02:00'),(66,'Lyra-8 Black Beast',21,748.00,0.00,'productImg-1678190990914.png',' Soma Laboratory Lyra-8 Analogue Synthesizer \r\nThe Soma Laboratory Lyra-8 (White Angel) is an Analogue Synthesizer designed by Vlad Kreimer, which operates on a Modular principle. The Lyra-8 is an incredibly expressive and organic sounding Drone Synthesizer in Desktop format. This fully Analogue Instrument has 8x Oscillators with Variable Waveforms, which can be used individually with their own Envelope, but also combined for complex FM Sounds. ','Expressive\r\n\r\nThe Soma Lyra-8 can be played either with open VCA (Drone Mode) or with the 16x Sensors below the Oscillators. Each of them represents a pair of Contacts; the upper one triggers the Envelope, the lower one the Pitch Control. Both Keys are so sensitive that Pressure Speed, Intensity and Duration have a significant influence on the Sound. Even environmental influences such as higher humidity affect the Sensors.\r\n\r\nEffects\r\n\r\nA Dual Delay with attached Distortion can be employed to the processing of the sounds produced by the Lyra-8. The 2x Timelines are separately adjustable and can be driven into self-oscillation if required, creating resonant and pulsating Pads. The Timelines can also be Modulated with different intensities by the LFO. Transformer-like Sounds, Flanger Sounds and everything you can use for \"Dub\" can be created in no time. The Distortion after the Delay has an enormous share in the possible Sound Design.',1,'2023-03-07 12:09:50','2023-03-07 12:10:23'),(67,'Meng Qi Wing Pinger',1,1499.00,0.00,'productImg-1678191143108.jpg','The Wing Pinger is an analog musical instrument, centered around a pair of 4-pole resonating low pass filters.\r\n \r\nFilter Pinging\r\n\r\nWing Pinger exploits the idea of filter pinging (the operation of using narrow pulses as filter input). With Q near self-oscillation it makes naturally decaying tones of various lengths, assembling sounds from percussions to plucking. A special Q compensation is implemented, to balance pinging behaviors at different pitches.\r\n\r\nIntuitive Playability\r\n\r\nEssential controls unveil the complex synthesizer patch hidden within, respond musically to your playing. Control layout is in symmetric, follows natural hand position with comfortable spacing. All control components are of light action and silky smooth. As the signals from filters generate pulses and modulations, the Q controls become playful and interactive.','Chaos\r\n\r\nWith multiple feedback and cross modulation paths, Wing Pinger operates according to the principles of chaos theory. All parameters except volume are interactive, future outputs are related to the current state as well as parameter settings.\r\n\r\nTonal Patterning\r\n\r\nBe chaotic at will, you don\'t miss the expressions from melodies. Wing Pinger is capable of generating pentatonic patterns from its carefully weighted STEP modulation. With practice, you can play noise or melody at will.\r\n\r\nExternal Sound Processing\r\n\r\nProcess stereo or dual mono signals through the filters, add spice to the tone, generate movements with special Wing Pinger modulations.',1,'2023-03-07 12:12:23','2023-03-07 12:12:23'),(68,'cre8audio West Pest',23,239.00,0.00,'productImg-1678192002056.png','Almost too fat to be buzzing around…\r\nWest Pest’s oscillator, designed in partnership with the ultra-serious people at Pittsburgh Modular Synthesizers, stems from 10 long years of stoic commitment to a continuous development of analog oscillator research and development (sounds fun right?). \r\n\r\nIts beautiful buzzy circuitry is not a clone or based on any outside designs. It is made with 100% modern components. This keeps it very stable, and giving it a super rich, and unique sound. \r\n\r\nNo animals we harmed in the development of West Pest’s oscillator (except some of the pests that work at Pittsburgh Modular Synthesizers, but ehh, they had it coming).','Folding waves, space, time & laundry?\r\nOur not-so-very wacky colleagues at Pittsburgh Modular Synthesizers love to drone on and on about wave folding/shaping, you’d think they’d invented or something. Seriously, never ask their founder Richard Nicol about wave folding, that is unless you are looking for a fast track lulling to sleepytime. That said, what wave folding does to your sound is super interesting. So we’ll give you just the short important bits…\r\n\r\nWest Pest utilizes a custom wave folder to shape the sound. It adds additional dimensions to West Pest’s already unique sounding oscillator core.\r\n\r\nA wave folder shapes sounds differently than a filter. Instead of removing harmonics, the wave folder increases the harmonic content of the oscillator by folding the wave in on itself to create sonically rich waveforms. \r\n\r\nWest Pest’s wave folder takes what traditional wave folding circuits have done for years and ups the ante, allowing the user to fold previously unfoldable waveforms. We’re not gonna get into the how’s and why’s. Richard would feel the need to jump in with too many boring facts. We’d frankly rather go on a juice cleanse than listen to another lecture on wave folding/shaping, so just suffice it to say, it’s super cool and we’ll leave it at that.\r\n\r\nIn addition to being able to send all of West Pest’s waveforms through its wave folder/shaper, you can also input external sound sources. So go ahead, get weird with it. We do.',1,'2023-03-07 12:26:42','2023-03-07 12:26:42'),(69,'Osmose Keyboard Synthesizer + MPE MIDI Controller',25,1799.00,0.00,'productImg-1678192750793.jpg','EXPRESSIVE E OSMOSE\r\nWith Osmose, Expressive-E is ushering in an all-new era of musical expression by coupling an inventive keyboard design with incredibly deep sound capabilities. Developed and refined over several years, Osmose offers a piano-style keybed with numerous three-dimensional playing gestures for an experience like no other. And by incorporating Haken Audio\'s superb EaganMatrix sound engine, the physical design of Osmose is matched with an equally deep synthesizer—all-contained in one elegant package. And of course, Osmose serves as an excellent MIDI and MPE controller for other hardware and software instruments in your studio.\r\n\r\nThe defining feature of Osmose is almost certainly the keybed, with a wonderfully reimagined take on the universal piano-style layout. Capable of far more than just defining notes with pitch and velocity, each and every note note may be generated or controlled with gestures like press and shake for levels of nuance previously unheard of in other synthesizers. Play a note and bend it left or right for per-note vibrato that would otherwise be reserved for vocalists, string, and wind players, yet is made available to you on Osmose. And through varying degrees of pressure and polyphonic aftertouch, further unique playing styles like strummed notes, intuitive portamento, and immersive blending of sonic layers are all at your fingertips.','An instrument with such potential for expressivity would be wasted without an equally capable sound engine, which is why Expressive E partnered with Haken Audio to incorporate their EaganMatrix synthesis platform into Osmose. Though most well known for their Continuum Fingerboard instruments, Haken Audio designed EaganMatrix as a deeply configurable sonic companion for highly performative instruments like Osmose. With 24 voices of polyphony and nearly limitless assignment of gestures to parameters, Osmose and EaganMatrix place an emphasis on performing your sound design, rather than exclusively relying upon LFOs and automation. But don\'t worry—if you don\'t want to enter the Matrix, Osmose ships with 500 sound presets to get you started.\r\n\r\nWhile you totally can—and should—explore the built-in sonic language of Osmose, Expressive E realizes that a large part of its appeal is using those fun, wiggly keys on other instruments. You can quickly configure Osmose from its internal interface without a computer, enabling you to jump into a variety of different MIDI and MPE playing modes. But regardless of how you decide to use Osmose, you\'ll set down a path of electronic musical expression unlike anything you\'ve ever heard before.',1,'2023-03-07 12:39:10','2023-03-07 12:39:10'),(70,'Hades Desktop Analog Semi-Modular Synthesizer (2022 Reissue)',15,399.00,0.00,'productImg-1678192848749.jpg','DREADBOX HADES\r\nA reissue of their famous analog bass synth, the Hades from Dreadbox is a faithful reproduction complete with OTA distortion, USB power, and the ability to be racked up in a Eurorack case, taking up 42hp. You still have one massive sounding VCO with two sub octaves and two waveforms. All of that feeds an OTA VCA capable of lovely distortion and a nice, thick 3-pole lowpass resonating filter. Two envelopes, one AD/RS and an improved AR over the original, plus a wide-range triangle LFO for exceptional modulation capabilities. If that wasn\'t enough, there are 11 patch points available to customize the sound. The new Hades reproduction form Dreadbox brings back the rumble and girth of the original with some nice improvements.','HADES FEATURES\r\nReproduction of original Hades bass synth\r\nRackable and takes up 42HP in Eurorack format\r\n1 VCO with 2 Sub outs\r\n2 Envelopes\r\nTriangle LFO\r\nUSB powered\r\n11 Patch points\r\nOTA VCA and distortion circuit\r\n3-Pole low pass filter',1,'2023-03-07 12:40:48','2023-03-07 12:40:48');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT 'defaultAvatar.png',
  `is_admin` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (18,'Admin','Admin','admin@admin.com','$2a$10$3X.8uWX08XJMVo03Ym9NBu/Q2/XxvKtolWA8UTxeDEfS/NOsuAl5S','userAvatar-1678043297257.png',1,'2023-03-05 19:08:17','2023-03-05 19:08:17'),(19,'Customer','Customer','customer@customer.com','$2a$10$rt.mLi7UF7FSs0T4toyVsOZcxCBrim3QZS2nVcIY5wf1VmvK9j5xS','userAvatar-1678043598686.png',0,'2023-03-05 19:13:18','2023-03-05 19:13:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-07 16:42:38
