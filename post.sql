-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Mar 2023, 14:47
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms_ss`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `filename` varchar(1024) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID`, `timestamp`, `filename`, `title`) VALUES
(1, '2023-03-01 14:33:03', 'img/4ac1858062cb4aa7a6b7ef106b7d8743c16b78fa6949e4fc9b774d2b88318cbb.webp', ''),
(2, '2023-03-01 14:33:06', 'img/34d788384e7f49acb65eac03e0053442217a68c033eeab28d5293c5f264a456d.webp', ''),
(3, '2023-03-01 14:33:44', 'img/a710c57dbe577cb693c89ee48f92c964a4693bf3349a2c708926c50dfe8679b8.webp', ''),
(4, '2023-03-01 14:52:40', 'img/67f4ec65d699c1a2ac0a037615fa051a0b8cd1cf0b65fc084ee21e682c67feb5.webp', ''),
(5, '2023-03-01 14:54:18', 'img/980d73dd06b30cb296a01a71c86763a4761889c81c144adb69f684c896bf1ae2.webp', ''),
(6, '2023-03-01 14:54:37', 'img/cf33077560312061b1d305eeedfa987da93babb833496d295fc6408bafa07f97.webp', ''),
(7, '2023-03-01 15:15:24', 'img/16241e9c3be76f8a48536e11688cc3c0098c994364a250401bd37dbc45a6beb7.webp', ''),
(8, '2023-03-01 15:16:54', 'img/7159753d8aacefabca36e5cc60a40eabcdad4d0b1f27b1a907f3e7d3312b4a66.webp', ''),
(9, '2023-03-08 15:03:08', 'img/eac700e8a7baef8fe209d0556f71fe46a7debf5634ef72ad39088ba9d55e1fe8.webp', ''),
(10, '2023-03-08 15:30:48', 'img/6f852ff4407b33a83c7f5fb7267b4c0cd8aba29172ea6a0d0ceee01a4e719446.webp', ''),
(11, '2023-03-08 15:31:25', 'img/16fe0815dac0b4b355462bebe2f815b2c119b44ff9754f0cd5a81554c68dec38.webp', ''),
(12, '2023-03-08 15:31:48', 'img/df2b5cb31d9f05a3967f144f34e00d2aade8726f849a2620dad5aee38ae2bd09.webp', ''),
(13, '2023-03-08 15:31:59', 'img/ceaf10edb42538e3dba8183290fa8195af37d13419fb677da8d7915fca7a1df7.webp', ''),
(14, '2023-03-08 15:32:32', 'img/6687103d68ed458887ee8928af3685a6616870d33337c3a4788f8487d16535e1.webp', ''),
(15, '2023-03-08 15:32:41', 'img/7ddb8d2236ecfa4f9f4b0f8607033a3d44c3b9ab26bd2e1fb700fcf02cc98333.webp', ''),
(16, '2023-03-22 13:54:20', '/img45456929c727ba779f5e3c9387c299eb10e89ac4365851b81f02a1bad39ff42d.webp', 'grg34h34h34'),
(17, '2023-03-22 13:55:00', '/img08e4360d168a6378ee4c0526e8537611777e0185f2c139a19b7504942f49d1e1.webp', 'h4h3h34h'),
(18, '2023-03-22 13:56:04', '/img4ea73c611156264b93eeb81dac581229950336f3593372fe59a61d14c38c8935.webp', 'hj45j45j4'),
(19, '2023-03-22 13:56:23', '/img4cc1be0cb39ec7595467a8751af91909bb577058cee84c2dfad5f8eb64d6dc99.webp', 'hj45j45j4'),
(20, '2023-03-22 13:56:42', '99e76049b9310d8a7ed00e1417002bd54f84a8a963826af61f085ec6d53a4a0e.webp', '34h34'),
(21, '2023-03-22 13:57:15', '/img92f309783cca1852df8b66c7ca42294576020f5f8c503a37b7581125cd076ffa.webp', 'jjtymjjhj45'),
(22, '2023-03-22 13:57:49', 'img/92bde0f6afab5c1a3b1419dbacdbbab6376253f01aa18667838020195b3711af.webp', '235t24y24h42hj'),
(23, '2023-03-22 13:58:12', 'img/3118d68633c67d6c38fa373dba5bf4e98074a5ce6d57dc6da00542b20423d548.webp', 'JEbać didsa');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
