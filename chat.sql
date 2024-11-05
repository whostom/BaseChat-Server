-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 03, 2024 at 05:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `attachment` varchar(50) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `content`, `attachment`, `receiver_id`, `author_id`) VALUES
(1, 'Cześć! Jak się masz?', '', 2, 1),
(2, 'Dzięki za pomoc! Wszystko działa', '', 1, 2),
(3, 'Czy możesz wysłać mi te pliki?', '', 1, 2),
(4, 'Mam nadzieję, że nie zapomnisz o jutrzejszym spotkaniu!', '', 2, 1),
(5, 'Hej, pamiętaj o przesłaniu raportu do końca dnia!', '', 2, 1),
(6, 'Jak ci poszedł projekt? Wszystko w porządku?', '', 2, 1),
(7, 'Kiedy będziesz mieć czas na spotkanie?', '', 2, 1),
(8, 'Spotkamy się o 15:00 w biurze?', '', 2, 1),
(9, 'Dziękuję za pomoc przy tym zadaniu!', '', 2, 1),
(10, 'Co sądzisz o tej propozycji?', '', 2, 1),
(11, 'Czy mogę ci jeszcze w czymś pomóc?', '', 2, 1),
(12, 'Zadzwonię do Ciebie po południu, omówimy szczegóły', '', 3, 1),
(13, 'Chciałem Ci podziękować za pomoc przy projekcie!', '', 3, 1),
(14, 'Jak tam Twój weekend? Widzimy się w poniedziałek?', '', 2, 1),
(15, 'Jutro o 10:00 mamy spotkanie, pamiętaj!', '', 2, 1),
(16, 'Zgadzasz się na te zmiany w projekcie?', '', 2, 1),
(17, 'Czy masz dostęp do tych dokumentów? Potrzebuję ich na już!', '', 3, 1),
(18, 'Pamiętaj, aby przesłać prezentację przed spotkaniem!', '', 2, 1),
(19, 'Dzięki za odpowiedź, rozumiem! Pozdrawiam', '', 2, 1),
(20, 'Czy będziesz w biurze dzisiaj po południu?', '', 2, 1),
(21, 'Dzień dobry! Jak Ci minął weekend?', '', 2, 1),
(22, 'Pamiętaj o wysłaniu zaproszeń na spotkanie', '', 2, 1),
(23, 'Spotykamy się o 14:00, nie zapomnij!', '', 2, 1),
(24, 'Dzięki za informację, wszystko jasne!', '', 2, 1),
(25, 'Będę na miejscu za godzinę', '', 3, 1),
(26, 'Przypominam o jutrzejszym deadlinie', '', 3, 1),
(27, 'Wszystko gotowe na prezentację?', '', 2, 1),
(28, 'Spotkanie o 16:00, nie zapomnij!', '', 2, 1),
(29, 'O której godzinie będzie spotkanie w przyszłym tygodniu?', '', 2, 1),
(30, 'Mam dla Ciebie kilka dokumentów do przeglądu', '', 2, 1),
(31, 'Spotkanie zostało przełożone na piątek', '', 2, 1),
(32, 'Dzięki za współpracę! Do usłyszenia', '', 2, 1),
(33, 'Jak idzie praca nad nowym projektem?', '', 2, 1),
(34, 'Kiedy będziesz mieć czas na spotkanie?', '', 2, 1),
(35, 'Spotkanie o 9:00, nie zapomnij!', '', 2, 1),
(36, 'Mam dla Ciebie ważną wiadomość', '', 0, 1),
(37, 'Jak się czujesz po wczorajszym spotkaniu?', '', 0, 1),
(38, 'Pamiętaj o jutrzejszym spotkaniu!', '', 0, 1),
(39, 'Będę na spotkaniu za 10 minut', '', 0, 1),
(40, 'Proszę o przesłanie raportu do końca dnia', '', 0, 1),
(41, 'Widzimy się o 15:00, tak?', '', 0, 1),
(42, 'Dziękuję za przesłanie dokumentów', '', 0, 1),
(43, 'Proszę o przesłanie tego maila do zespołu', '', 0, 1),
(44, 'Czy możesz przypomnieć o tym na spotkaniu?', '', 0, 1),
(45, 'Zadzwonię do Ciebie później', '', 0, 1),
(46, 'Cześć! Co słychać?', '', 0, 1),
(47, 'Dzięki za pomoc!', '', 0, 1),
(48, 'Przypomnienie: spotkanie o 14:00', '', 0, 1),
(49, 'Cześć, jak się czujesz po wczorajszym dniu?', '', 2, 1),
(50, 'Jak się czujesz po tym projekcie? Wszystko w porządku?', '', 0, 1),
(51, 'Siema! Co u Ciebie?', '', 3, 1),
(52, 'Hej, co słychać?', '', 2, 1),
(53, 'Jak się masz? Długo się nie odzywałeś', '', 2, 1),
(54, 'Cześć! Jak leci?', '', 2, 1),
(55, 'Widzimy się na lunchu?', '', 2, 1),
(56, 'Cześć, co słychać?', '', 2, 1),
(57, 'Czy spotykamy się o 15:00?', '', 2, 1),
(58, 'Dzięki za pomoc, sprawa rozwiązana!', '', 0, 1),
(59, 'Dzięki za informacje!', '', 0, 1),
(60, 'Przypominam o spotkaniu o 16:00', '', 0, 1),
(61, 'Jak tam projekt? Idzie zgodnie z planem?', '', 0, 1),
(62, 'Cześć! Co u Ciebie?', '', 0, 1),
(63, 'Będziesz na spotkaniu o 9:00?', '', 0, 1),
(64, 'Czy masz dostęp do tych dokumentów?', '', 0, 1),
(65, 'Przypomnienie: spotkanie o 13:00', '', 0, 1),
(66, 'Siema! Jak się masz?', '', 1, 3),
(67, 'Dzień dobry, jak się czujesz?', '', 1, 3),
(68, 'Cześć, jak się czujesz?', '', 2, 3),
(69, 'Witaj! Jak tam Twój dzień?', '', 4, 3),
(70, 'Cześć, jak się miewasz?', '', 4, 3),
(71, 'Siema, jak tam praca?', '', 1, 3),
(72, 'Siema! Wszystko ok?', '', 1, 9),
(73, 'Siema! Co u Ciebie?', '', 9, 1),
(74, 'Siema! Jak się masz?', '', 1, 9),
(75, 'Hej! Jak leci?', '', 9, 1),
(76, 'Siema, co u Ciebie?', '', 9, 1),
(77, 'Co słychać?', '', 1, 9),
(78, 'Cześć, jak się czujesz?', '', 10, 1),
(79, 'Cześć, jak się masz?', '', 1, 10),
(80, 'Siema! Co słychać?', '', 10, 1),
(81, 'Jak się czujesz po tej prezentacji?', '', 1, 10),
(82, 'Cześć, co nowego?', '', 1, 10),
(83, 'Hej! Jak tam?', '', 1, 10),
(84, 'Cześć, co u Ciebie?', '', 1, 10),
(85, 'Siema! Wszystko ok?', '', 1, 10),
(86, 'Siema! Jak tam w pracy?', '', 1, 10),
(87, 'Cześć, jak się czujesz?', '', 10, 1),
(88, 'Siema, co tam?', '', 10, 1),
(89, 'Siema! Jak się masz?', '', 10, 1),
(90, 'Cześć, co słychać?', '', 10, 1),
(91, 'Dzień dobry! Jak minął dzień?', '', 10, 1),
(92, 'Co tam? Jak się czujesz?', '', 10, 1),
(93, 'Siema! Wszystko ok?', '', 10, 1),
(94, 'Cześć! Jak się masz?', '', 10, 1),
(95, 'Cześć, jak się czujesz?', '', 4, 1),
(96, 'Jak tam? Wszystko w porządku?', '', 4, 1),
(97, 'Jak się masz? Długo się nie widzieliśmy', '', 4, 1),
(98, 'Cześć, jak minął dzień?', '', 4, 1),
(99, 'Banana jest! :)', '', 4, 1),
(100, 'Banana, ale nie wiem, co z tym zrobić :(', '', 4, 1);


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(120) NOT NULL,
  `pass` varchar(120) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `login`, `pass`, `email`) VALUES
(2, 'jan_kowalski', '5f4dcc3b5aa765d61d8327deb882cf99', 'jan.kowalski@email.com'),
(3, 'anna_nowak', '7c6a180b36896a0a8c02787ee8e8b8d8', 'anna.nowak@email.com'),
(4, 'piotr_majewski', 'b74f9a2f27f91c4d5b1d7d43370b6602', 'piotr.majewski@email.com'),
(9, 'krzysztof_wilczek', '9c56c26519cc88decd8b2a6822f6d60f', 'krzysztof.wilczek@email.com'),
(11, 'joanna_kaczmarek', 'a4d9c7c95ed8428cdd3d2f5fa9f465f6', 'joanna.kaczmarek@email.com'),
(12, 'adam_smith', 'd8578edf8458ce06fbc5bb6c4b5d9a4c8', 'adam.smith@email.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
