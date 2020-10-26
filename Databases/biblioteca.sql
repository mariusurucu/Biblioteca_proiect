-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 15 Apr 2020 la 12:10
-- Versiune server: 5.6.31
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `autori`
--

CREATE TABLE IF NOT EXISTS `autori` (
  `autorid` int(11) NOT NULL,
  `numeautor` varchar(255) NOT NULL,
  `prenumeautor` varchar(255) NOT NULL,
  `taraorigine` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `autori`
--

INSERT INTO `autori` (`autorid`, `numeautor`, `prenumeautor`, `taraorigine`) VALUES
(2, 'Balzac', 'Honore', 'Franta'),
(3, 'test', 'test', 'test'),
(4, 'zac', 'zac', 'usa');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `biblioteca`
--

CREATE TABLE IF NOT EXISTS `biblioteca` (
  `bibliotecaid` int(11) NOT NULL,
  `denumire` varchar(255) NOT NULL,
  `adresa` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `biblioteca`
--

INSERT INTO `biblioteca` (`bibliotecaid`, `denumire`, `adresa`) VALUES
(1, 'Tineretului', 'Sincai'),
(2, 'Carturesti', 'Lipscani'),
(3, 'Continental', 'Universitate'),
(4, 'socrate', 'romana'),
(6, 'tester', 'tester'),
(9, 'raza', 'raza'),
(10, 'giulesti', 'crangasi');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `carti`
--

CREATE TABLE IF NOT EXISTS `carti` (
  `carteid` int(11) NOT NULL,
  `denumire` varchar(255) NOT NULL,
  `anaparitie` date NOT NULL,
  `editura` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `carti`
--

INSERT INTO `carti` (`carteid`, `denumire`, `anaparitie`, `editura`) VALUES
(1, 'Mos Goriot', '2018-09-01', 'Rao'),
(2, 'Opera comica', '2016-02-02', 'agerpress'),
(5, 'zac', '2016-01-01', 'agerpress');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `categorieid` int(11) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `rand` varchar(32) NOT NULL,
  `carteid` int(11) NOT NULL,
  `bibliotecaid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `categorie`
--

INSERT INTO `categorie` (`categorieid`, `titlu`, `rand`, `carteid`, `bibliotecaid`) VALUES
(1, 'Comedie', '13', 2, 1),
(3, 'Opera franceza', '3', 5, 10);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `parola` varchar(255) NOT NULL,
  `functie` enum('admin','client','','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `user`
--

INSERT INTO `user` (`id`, `username`, `parola`, `functie`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'client', 'client', 'client');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `volume`
--

CREATE TABLE IF NOT EXISTS `volume` (
  `volumeid` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `editia` int(11) NOT NULL,
  `carteid` int(11) NOT NULL,
  `autorid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `volume`
--

INSERT INTO `volume` (`volumeid`, `nume`, `editia`, `carteid`, `autorid`) VALUES
(1, 'Opera balzaciana', 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autori`
--
ALTER TABLE `autori`
  ADD PRIMARY KEY (`autorid`);

--
-- Indexes for table `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD PRIMARY KEY (`bibliotecaid`);

--
-- Indexes for table `carti`
--
ALTER TABLE `carti`
  ADD PRIMARY KEY (`carteid`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorieid`),
  ADD KEY `carteid` (`carteid`),
  ADD KEY `bibliotecaid` (`bibliotecaid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volume`
--
ALTER TABLE `volume`
  ADD PRIMARY KEY (`volumeid`),
  ADD KEY `carteid` (`carteid`),
  ADD KEY `autorid` (`autorid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autori`
--
ALTER TABLE `autori`
  MODIFY `autorid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `bibliotecaid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `carti`
--
ALTER TABLE `carti`
  MODIFY `carteid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorieid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `volume`
--
ALTER TABLE `volume`
  MODIFY `volumeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `fk_categ1` FOREIGN KEY (`carteid`) REFERENCES `carti` (`carteid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_categ2` FOREIGN KEY (`bibliotecaid`) REFERENCES `biblioteca` (`bibliotecaid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrictii pentru tabele `volume`
--
ALTER TABLE `volume`
  ADD CONSTRAINT `fk_volume1` FOREIGN KEY (`autorid`) REFERENCES `autori` (`autorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_volume2` FOREIGN KEY (`carteid`) REFERENCES `carti` (`carteid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
