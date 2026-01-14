-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 14, 2026 at 12:00 PM
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firma`
--
CREATE DATABASE IF NOT EXISTS `firma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `firma`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupa`
--

CREATE TABLE IF NOT EXISTS `grupa` (
  `id_grupa` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_grupa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grupa`
--

INSERT INTO `grupa` (`id_grupa`, `nazwa`) VALUES
(1, 'Administracja'),
(2, 'IT'),
(3, 'Produkcja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE IF NOT EXISTS `pracownik` (
  `id_pracownik` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `id_stanowisko` int(11) DEFAULT NULL,
  `pensja` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pracownik`),
  KEY `id_stanowisko` (`id_stanowisko`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pracownik`
--

INSERT INTO `pracownik` (`id_pracownik`, `imie`, `nazwisko`, `id_stanowisko`, `pensja`) VALUES
(1, 'Adam', 'Kowalski', 1, 8000.00),
(2, 'Ewa', 'Nowak', 2, 6000.00),
(3, 'Jan', 'Wiśniewski', 3, 12000.00),
(4, 'Ola', 'Zielińska', 3, 11000.00),
(5, 'Piotr', 'Mazur', 4, 9000.00),
(6, 'Karol', 'Krawczyk', 5, 5000.00),
(7, 'Anna', 'Lewandowska', 6, 5500.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `premia`
--

CREATE TABLE IF NOT EXISTS `premia` (
  `id_premia` int(11) NOT NULL AUTO_INCREMENT,
  `id_pracownik` int(11) DEFAULT NULL,
  `kwota` decimal(10,2) DEFAULT NULL,
  `data_premii` date DEFAULT NULL,
  PRIMARY KEY (`id_premia`),
  KEY `id_pracownik` (`id_pracownik`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `premia`
--

INSERT INTO `premia` (`id_premia`, `id_pracownik`, `kwota`, `data_premii`) VALUES
(1, 1, 1000.00, '2024-01-10'),
(2, 1, 1500.00, '2024-03-10'),
(3, 2, 500.00, '2024-02-15'),
(4, 3, 2000.00, '2024-01-20'),
(5, 3, 2500.00, '2024-03-20'),
(6, 4, 1800.00, '2024-02-10'),
(7, 5, 700.00, '2024-01-05'),
(8, 6, 300.00, '2024-03-01'),
(9, 7, 400.00, '2024-02-18');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowisko`
--

CREATE TABLE IF NOT EXISTS `stanowisko` (
  `id_stanowisko` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) DEFAULT NULL,
  `id_grupa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_stanowisko`),
  KEY `id_grupa` (`id_grupa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stanowisko`
--

INSERT INTO `stanowisko` (`id_stanowisko`, `nazwa`, `id_grupa`) VALUES
(1, 'Kierownik', 1),
(2, 'Specjalista', 1),
(3, 'Programista', 2),
(4, 'Administrator', 2),
(5, 'Operator', 3),
(6, 'Technik', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `pracownik_ibfk_1` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko` (`id_stanowisko`);

--
-- Constraints for table `premia`
--
ALTER TABLE `premia`
  ADD CONSTRAINT `premia_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`);

--
-- Constraints for table `stanowisko`
--
ALTER TABLE `stanowisko`
  ADD CONSTRAINT `stanowisko_ibfk_1` FOREIGN KEY (`id_grupa`) REFERENCES `grupa` (`id_grupa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
