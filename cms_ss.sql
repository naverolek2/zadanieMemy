-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Kwi 2023, 14:53
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
  `title` text NOT NULL,
  `likes` int(255) NOT NULL DEFAULT 0,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `userID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID`, `timestamp`, `filename`, `title`, `likes`, `removed`, `userID`) VALUES
(4, '2023-04-19 14:46:28', 'img/5fdbe1dfc38ad1672fe4b49352a200a18b0c7e5a2ac7baf2778ac61792b89ca5.webp', 'essa123123', 1, 0, 3),
(10, '2023-04-19 14:49:36', 'img/bc17617da5ed6c92e3a5c5586d3def8921fc68e799cd0cfa21f41f84f26c8b75.webp', 'g43j45j45j45j', 1, 0, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `email`, `password`) VALUES
(1, 'Sebaskiba1@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NU02Z1d3NkRZbnhVUWNISg$8EMlLvEyjgmoBqGa92jObgT/CWd1j6EFlqWi09sCgqU'),
(2, 'geg@geg.crf', '$argon2i$v=19$m=65536,t=4,p=1$TTlNa0JmY3ZYblRwTlNhdA$09rR0RIjHxEYW5ZHrmtQ1G0anfx+p6r8s01JJdQuDmg'),
(3, 'a@a.a', '$argon2i$v=19$m=65536,t=4,p=1$eDhpRmowVTlMeHFxcy9MSg$9P8ok0tkSKqtnZTx6+w4uQvhUaaH8vaJ2mGsll0fZbs'),
(4, 'q@q.q', '$argon2i$v=19$m=65536,t=4,p=1$LmRLVHdWTEJFMTFsTTV1RQ$DmbCzK+Eu26ydq6wDskyQgWX9p9GB3ooOt/pbQK22og'),
(5, 'z@z.z', '$argon2i$v=19$m=65536,t=4,p=1$TXcvYUhOb2R3eUNSMFBsMA$yGB2s8oAz4vbevA0Bt4rj97t+ctVUltsuZruP5YqhVo'),
(6, 'm@m.m', '$argon2i$v=19$m=65536,t=4,p=1$b2tFRFlzSzZvZURmd3VNRA$HORhXjWuFZzynbPvg8FJQiG7WPDx5s7jdnVaZoWQSAY'),
(7, '1@1.1', '$argon2i$v=19$m=65536,t=4,p=1$NDVhUjc3Mml2WWpzQ1dXZw$6E1xrkR4cr6w/LQq6ElHUrLzRmXIva5Y6AofLbwMJIU'),
(8, '2@2.2', '$argon2i$v=19$m=65536,t=4,p=1$bzV1ZWw3Z25MYlJMenBVeQ$Uy8/0aYAKib3e4OIVV2Q94qm+78hCTrrkOP535n+uVk'),
(9, '3@3.3', '$argon2i$v=19$m=65536,t=4,p=1$MFdxRi81U1ovS1IxaFBYdA$PUAWpAnlQC8mh99zp1c0LuLldaHxt6SsKgp1OvczWc8');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
