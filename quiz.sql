-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Paź 2022, 08:50
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `quiz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedzi`
--

CREATE TABLE `odpowiedzi` (
  `id` int(11) NOT NULL,
  `Treść` varchar(45) DEFAULT NULL,
  `Poprawna` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `odpowiedzi`
--

INSERT INTO `odpowiedzi` (`id`, `Treść`, `Poprawna`) VALUES
(1, '17', '1'),
(2, 'My, tutaj? Bagno', NULL),
(3, 'Uwuvuevuevue', NULL),
(5, 'Bo jego wieżyczki biją za około 3', '1'),
(6, 'Bo Fabian nim gra', NULL),
(7, 'Bo ma fajnego wąsa', NULL),
(9, 'Nie jest broken bo nie ma knockupa albo nie o', NULL),
(10, 'Bo ma slowa/wizje/mandat i umbral jest omega ', '1'),
(12, 'Beka z ciebie low elo nerdzie Fabiś', NULL),
(13, 'Bo ma stuna/slowa/shielda/heala i charma', '1'),
(14, 'Bo składa ardenta', NULL),
(15, 'Ben to fajny pies', NULL),
(16, 'Annie do nerfa', NULL),
(17, 'Po smaku', NULL),
(18, 'Po kolorku', NULL),
(19, 'Po wszystkim bo jak piwcio jest dobre to ??', '1'),
(20, 'Bo mieszka tam jedna osoba', '1'),
(21, 'Bo mieszka tam Nizer a on kopie koparki i meg', '1'),
(22, 'Ale essa beka z cb', NULL),
(23, 'Druga zła no :(', NULL),
(24, 'Bo jest łysy', '1'),
(25, 'Bo nie ma włosów', '1'),
(26, 'Bo ma jasną glace', '1'),
(27, 'Bo jest dziwny', NULL),
(28, 'Bo jest dziwniejszy', NULL),
(29, 'BO nie zolte', NULL),
(30, 'Bo nie czerwone', NULL),
(31, ' Nie sa', '1'),
(32, 'Bo pan nam kazał :(', '1'),
(33, 'Bo my chcemy ;(', NULL),
(34, 'Bo musimy miec ocenke ', '1'),
(35, 'Bo sie uczymy na egzamin', '1'),
(36, 'Bo lubie php :D', NULL),
(37, 'No ja wiem :(', NULL),
(38, 'Nie no co ty bardzo proste', '1'),
(39, 'Rob rob bo jedyneczka jedyneczka', '1'),
(40, 'Słabiaki 200', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedziuczniow`
--

CREATE TABLE `odpowiedziuczniow` (
  `id` int(11) NOT NULL,
  `Treść` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania`
--

CREATE TABLE `pytania` (
  `id` int(11) NOT NULL,
  `Treść` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pytania`
--

INSERT INTO `pytania` (`id`, `Treść`) VALUES
(1, 'Ile ty masz lat?'),
(2, 'Dlaczego Heimerdinger jest bezużyteczny?'),
(3, 'Dlaczego Ashe support jest broken?'),
(4, 'Czemu powinni znerfić seraphine?'),
(5, 'Czemu Mielżyn jest takim syfem i śmierdzi'),
(6, 'Dlaczego tede wiadomo kim jest'),
(7, 'Jak rozpoznać dobre piwcio'),
(8, 'Czemu liscie jesienią są niebieskie'),
(9, 'Czemu robimy tak trudny quiz :('),
(10, 'Bardzo to jest trudne prosze pana :(');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania_has_odpowiedzi`
--

CREATE TABLE `pytania_has_odpowiedzi` (
  `Pytania_id` int(11) NOT NULL,
  `Odpowiedzi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pytania_has_odpowiedzi`
--

INSERT INTO `pytania_has_odpowiedzi` (`Pytania_id`, `Odpowiedzi_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 5),
(2, 6),
(2, 7),
(3, 9),
(3, 10),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(6, 24),
(6, 25),
(6, 26),
(6, 27),
(6, 28),
(7, 17),
(7, 18),
(7, 19),
(8, 29),
(8, 30),
(8, 31),
(9, 32),
(9, 33),
(9, 34),
(9, 35),
(9, 36),
(10, 37),
(10, 38),
(10, 39),
(10, 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id` int(11) NOT NULL,
  `Imie` varchar(45) DEFAULT NULL,
  `Nazwisko` varchar(45) DEFAULT NULL,
  `OdpowiedziUczniow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `odpowiedziuczniow`
--
ALTER TABLE `odpowiedziuczniow`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pytania`
--
ALTER TABLE `pytania`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pytania_has_odpowiedzi`
--
ALTER TABLE `pytania_has_odpowiedzi`
  ADD PRIMARY KEY (`Pytania_id`,`Odpowiedzi_id`),
  ADD KEY `fk_Pytania_has_Odpowiedzi_Odpowiedzi1` (`Odpowiedzi_id`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id`,`OdpowiedziUczniow_id`),
  ADD KEY `fk_Uczniowie_OdpowiedziUczniow1` (`OdpowiedziUczniow_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `odpowiedziuczniow`
--
ALTER TABLE `odpowiedziuczniow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pytania`
--
ALTER TABLE `pytania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pytania_has_odpowiedzi`
--
ALTER TABLE `pytania_has_odpowiedzi`
  ADD CONSTRAINT `fk_Pytania_has_Odpowiedzi_Odpowiedzi1` FOREIGN KEY (`Odpowiedzi_id`) REFERENCES `odpowiedzi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pytania_has_Odpowiedzi_Pytania` FOREIGN KEY (`Pytania_id`) REFERENCES `pytania` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD CONSTRAINT `fk_Uczniowie_OdpowiedziUczniow1` FOREIGN KEY (`OdpowiedziUczniow_id`) REFERENCES `odpowiedziuczniow` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
