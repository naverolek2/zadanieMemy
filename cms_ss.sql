-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Maj 2023, 22:43
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
-- Struktura tabeli dla tabeli `disliked`
--

CREATE TABLE `disliked` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liked`
--

CREATE TABLE `liked` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `filename` varchar(1024) NOT NULL,
  `title` text NOT NULL,
  `likes` int(255) NOT NULL DEFAULT 0,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `userID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID`, `timestamp`, `filename`, `title`, `likes`, `removed`, `userID`) VALUES
(1, '2023-05-04 22:40:04', 'img/48021e813b80d90fdb71c089394d1208c1334fbe94e9f382559d1534af54152f.webp', 'gegeg', -1, 0, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `isAdmin` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `email`, `isAdmin`, `password`) VALUES
(1, 'Sebaskiba1@gmail.com', 0, '$argon2i$v=19$m=65536,t=4,p=1$NU02Z1d3NkRZbnhVUWNISg$8EMlLvEyjgmoBqGa92jObgT/CWd1j6EFlqWi09sCgqU'),
(2, 'geg@geg.crf', 0, '$argon2i$v=19$m=65536,t=4,p=1$TTlNa0JmY3ZYblRwTlNhdA$09rR0RIjHxEYW5ZHrmtQ1G0anfx+p6r8s01JJdQuDmg'),
(3, 'a@a.a', 1, '$argon2i$v=19$m=65536,t=4,p=1$eDhpRmowVTlMeHFxcy9MSg$9P8ok0tkSKqtnZTx6+w4uQvhUaaH8vaJ2mGsll0fZbs'),
(4, 'q@q.q', 0, '$argon2i$v=19$m=65536,t=4,p=1$LmRLVHdWTEJFMTFsTTV1RQ$DmbCzK+Eu26ydq6wDskyQgWX9p9GB3ooOt/pbQK22og'),
(5, 'z@z.z', 0, '$argon2i$v=19$m=65536,t=4,p=1$TXcvYUhOb2R3eUNSMFBsMA$yGB2s8oAz4vbevA0Bt4rj97t+ctVUltsuZruP5YqhVo'),
(6, 'm@m.m', 0, '$argon2i$v=19$m=65536,t=4,p=1$b2tFRFlzSzZvZURmd3VNRA$HORhXjWuFZzynbPvg8FJQiG7WPDx5s7jdnVaZoWQSAY'),
(7, '1@1.1', 0, '$argon2i$v=19$m=65536,t=4,p=1$NDVhUjc3Mml2WWpzQ1dXZw$6E1xrkR4cr6w/LQq6ElHUrLzRmXIva5Y6AofLbwMJIU'),
(8, '2@2.2', 0, '$argon2i$v=19$m=65536,t=4,p=1$bzV1ZWw3Z25MYlJMenBVeQ$Uy8/0aYAKib3e4OIVV2Q94qm+78hCTrrkOP535n+uVk'),
(9, '3@3.3', 0, '$argon2i$v=19$m=65536,t=4,p=1$MFdxRi81U1ovS1IxaFBYdA$PUAWpAnlQC8mh99zp1c0LuLldaHxt6SsKgp1OvczWc8'),
(10, 't@t.t', 0, '$argon2i$v=19$m=65536,t=4,p=1$MEM2WDgxcHRmMVVmbzBhcg$zvXc0IWDmZeGeukh+stFiAlM3ifTaaXRZgPrO/b1SW8'),
(11, 'k@k.k', 0, '$argon2i$v=19$m=65536,t=4,p=1$cWpSUmtWZVBQM2t3SjZVZA$0h9ibDIm1ypLwe49SgoaG3cYFusK5ezDeSTB/lg9QVY'),
(12, '', 0, '$argon2i$v=19$m=65536,t=4,p=1$TndoVTBsNXBVSVZLNFN2aQ$JIgtr9fdpHEAifx2uwYj5d1mrIQVod5BwAaYWgHFdks');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
