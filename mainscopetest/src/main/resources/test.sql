CREATE TABLE `users` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `clients` (
  `id_client` int(50) NOT NULL AUTO_INCREMENT,
  `comercial` varchar(50) NOT NULL,
  `fiscal` varchar(50) NOT NULL,
  `rfc` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `status` int(50) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `contacts` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `fk_client_contact_idx` (`id_client`),
  CONSTRAINT `fk_client_contact` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
