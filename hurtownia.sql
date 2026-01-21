-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 20, 2026 at 06:20 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hurtownia`
--
CREATE DATABASE IF NOT EXISTS `hurtownia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hurtownia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawcy`
--

CREATE TABLE IF NOT EXISTS `dostawcy` (
  `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(60) DEFAULT NULL,
  `kraj` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_dostawcy`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dostawcy`
--

INSERT INTO `dostawcy` (`id_dostawcy`, `nazwa`, `kraj`) VALUES
(1, 'ToolCorp', 'Polska'),
(2, 'BuildMaster', 'Niemcy'),
(3, 'GardenPro', 'Czechy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `id_klienta` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_firmy` varchar(80) DEFAULT NULL,
  `miasto` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `nazwa_firmy`, `miasto`) VALUES
(1, 'TechPol', 'Warszawa'),
(2, 'BudMax', 'Kraków'),
(3, 'AgroTrans', 'Poznań'),
(4, 'MetalPro', 'Gdańsk');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycjezamowienia`
--

CREATE TABLE IF NOT EXISTS `pozycjezamowienia` (
  `id_pozycji` int(11) NOT NULL AUTO_INCREMENT,
  `id_zamowienia` int(11) DEFAULT NULL,
  `id_produktu` int(11) DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `id_dostawcy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pozycji`),
  KEY `id_zamowienia` (`id_zamowienia`),
  KEY `id_produktu` (`id_produktu`),
  KEY `id_dostawcy` (`id_dostawcy`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pozycjezamowienia`
--

INSERT INTO `pozycjezamowienia` (`id_pozycji`, `id_zamowienia`, `id_produktu`, `ilosc`, `id_dostawcy`) VALUES
(1, 1, 1, 3, NULL),
(2, 1, 2, 5, NULL),
(3, 2, 3, 20, NULL),
(4, 3, 4, 2, NULL),
(5, 4, 5, 1, NULL),
(6, 5, 1, 1, NULL),
(7, 5, 3, 10, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE IF NOT EXISTS `pracownicy` (
  `id_pracownika` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(40) DEFAULT NULL,
  `nazwisko` varchar(40) DEFAULT NULL,
  `stanowisko` varchar(40) DEFAULT NULL,
  `zarobki` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `stanowisko`, `zarobki`) VALUES
(1, 'Jan', 'Kowalski', 'Magazynier', 4200.00),
(2, 'Anna', 'Nowak', 'Księgowa', 5200.00),
(3, 'Piotr', 'Zieliński', 'Handlowiec', 6100.00),
(4, 'Kasia', 'Mazur', 'Handlowiec', 5900.00),
(5, 'Tomasz', 'Wójcik', 'Kierownik', 8200.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE IF NOT EXISTS `produkty` (
  `id_produktu` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(60) DEFAULT NULL,
  `kategoria` varchar(40) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `id_dostawcy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produktu`),
  KEY `id_dostawcy` (`id_dostawcy`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id_produktu`, `nazwa`, `kategoria`, `cena`, `id_dostawcy`) VALUES
(1, 'Wkrętarka', 'Narzędzia', 299.00, NULL),
(2, 'Młotek', 'Narzędzia', 49.00, NULL),
(3, 'Cement 25kg', 'Materiały', 19.00, NULL),
(4, 'Farba biała 10L', 'Materiały', 89.00, NULL),
(5, 'Kosiarka spalinowa', 'Ogród', 1299.00, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE IF NOT EXISTS `zamowienia` (
  `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `id_klienta` int(11) DEFAULT NULL,
  `id_pracownika` int(11) DEFAULT NULL,
  `data_zamowienia` date DEFAULT NULL,
  `id_dostawcy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_zamowienia`),
  KEY `id_klienta` (`id_klienta`),
  KEY `id_pracownika` (`id_pracownika`),
  KEY `id_dostawcy` (`id_dostawcy`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `id_klienta`, `id_pracownika`, `data_zamowienia`, `id_dostawcy`) VALUES
(1, 1, 3, '2024-01-10', NULL),
(2, 2, 3, '2024-01-12', NULL),
(3, 3, 4, '2024-01-15', NULL),
(4, 4, 3, '2024-01-20', NULL),
(5, 1, 4, '2024-01-22', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pozycjezamowienia`
--
ALTER TABLE `pozycjezamowienia`
  ADD CONSTRAINT `pozycjezamowienia_ibfk_1` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`),
  ADD CONSTRAINT `pozycjezamowienia_ibfk_2` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id_produktu`),
  ADD CONSTRAINT `pozycjezamowienia_ibfk_3` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`);

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `produkty_ibfk_1` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`);

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`),
  ADD CONSTRAINT `zamowienia_ibfk_3` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
