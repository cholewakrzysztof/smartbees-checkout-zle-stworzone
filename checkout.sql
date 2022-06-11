-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Cze 2022, 11:47
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `checkout`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `discount_percent` tinyint(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `discount_codes`
--

INSERT INTO `discount_codes` (`id`, `code`, `discount_percent`, `active`) VALUES
(3, 'AB-123-456', 30, 1),
(4, 'CD-789-123', 50, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `country` enum('Polska','Niemcy','','') NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `street` varchar(40) NOT NULL,
  `house_number` varchar(40) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `deliver_type` text NOT NULL,
  `payment_type` text NOT NULL,
  `total` int(11) NOT NULL,
  `discount_code` varchar(10) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `order_code` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `surname`, `country`, `city`, `zip_code`, `street`, `house_number`, `phone`, `deliver_type`, `payment_type`, `total`, `discount_code`, `comment`, `order_code`) VALUES
(1, NULL, 'Krzysztof', 'Cholewa', 'Polska', 'Jełowa', '46-024', 'Polna', '2P/2', '785247771', 'Paczkomat', 'PayU', 9149, 'AB-123-456', '', '202206110001');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
