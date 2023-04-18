-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Kwi 2023, 15:52
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

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
-- Struktura tabeli dla tabeli `liked`
--

CREATE TABLE `liked` (
  `user_id` int(255) NOT NULL,
  `post_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `liked`
--

INSERT INTO `liked` (`user_id`, `post_id`) VALUES
(5, 4),
(5, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `filename` varchar(1024) NOT NULL,
  `title` text NOT NULL,
  `likes` int(255) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `userID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID`, `timestamp`, `filename`, `title`, `likes`, `removed`, `userID`) VALUES
(1, '2023-03-22 15:42:32', 'img/ea036693156016150666650c7e570c3bb1264ce9a1f8265c642692f87d4727f8.webp', 'geg', 0, 0, 3),
(2, '2023-04-18 15:52:30', 'img/4458378570289dc7a210da4a1d6b78ff0dabea878f0a40acb41a8fae758668ac.webp', 'hhh', 1, 0, 3),
(3, '2023-04-18 15:44:54', 'img/3fbce6c1a59c6af4515a631a04664a710bb88e9c2945209ba1b0158a09cb9fea.webp', 'hree', 1, 0, 3),
(4, '2023-04-18 15:44:26', 'img/5fdbe1dfc38ad1672fe4b49352a200a18b0c7e5a2ac7baf2778ac61792b89ca5.webp', 'essa123123', 1, 0, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `email`, `password`) VALUES
(1, 'Sebaskiba1@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NU02Z1d3NkRZbnhVUWNISg$8EMlLvEyjgmoBqGa92jObgT/CWd1j6EFlqWi09sCgqU'),
(2, 'geg@geg.crf', '$argon2i$v=19$m=65536,t=4,p=1$TTlNa0JmY3ZYblRwTlNhdA$09rR0RIjHxEYW5ZHrmtQ1G0anfx+p6r8s01JJdQuDmg'),
(3, 'a@a.a', '$argon2i$v=19$m=65536,t=4,p=1$eDhpRmowVTlMeHFxcy9MSg$9P8ok0tkSKqtnZTx6+w4uQvhUaaH8vaJ2mGsll0fZbs'),
(4, 'q@q.q', '$argon2i$v=19$m=65536,t=4,p=1$LmRLVHdWTEJFMTFsTTV1RQ$DmbCzK+Eu26ydq6wDskyQgWX9p9GB3ooOt/pbQK22og'),
(5, 'z@z.z', '$argon2i$v=19$m=65536,t=4,p=1$TXcvYUhOb2R3eUNSMFBsMA$yGB2s8oAz4vbevA0Bt4rj97t+ctVUltsuZruP5YqhVo');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
