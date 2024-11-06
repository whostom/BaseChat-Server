-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 06, 2024 at 11:49 AM
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
(2, 'Hej, wszystko w porządku, a Ty?', '', 1, 2),
(3, 'Dzięki, dobrze. Czy możesz wysłać mi te pliki?', '', 1, 2),
(4, 'Jasne, zaraz je prześlę.', '', 2, 1),
(5, 'Super, dzięki!', '', 1, 2),
(6, 'Dobrze, już wysyłam.', '', 2, 1),
(7, 'Ok, dzięki!', '', 1, 2),
(8, 'Jak Ci poszedł projekt? Wszystko w porządku?', '', 1, 2),
(9, 'Tak, wszystko idzie zgodnie z planem, dziękuję!', '', 2, 1),
(10, 'To świetnie, trzymam kciuki!', '', 1, 2),
(11, 'Cześć Piotr! Jak się czujesz po wczorajszym spotkaniu?', '', 3, 1),
(12, 'Cześć, wszystko ok, dzięki za zapytanie! Spotkanie było owocne.', '', 1, 3),
(13, 'Super, cieszę się! Jak tam projekt? Wszystko idzie zgodnie z planem?', '', 1, 3),
(14, 'Tak, myślę, że wkrótce będziemy mogli zacząć testy.', '', 3, 1),
(15, 'Brzmi dobrze! Daj znać, jeśli będziesz potrzebował pomocy.', '', 1, 3),
(16, 'Dzięki, na pewno! Wiesz, że zawsze mogę liczyć na Twoją pomoc.', '', 3, 1),
(17, 'Oczywiście, daj znać jak coś.', '', 1, 3),
(18, 'Będziemy w kontakcie!', '', 3, 1),
(19, 'Hej Joanna, jak się czujesz po tej prezentacji?', '', 5, 3),
(20, 'Cześć Piotr! Dziękuję, czułam się trochę zestresowana, ale chyba poszło dobrze.', '', 3, 5),
(21, 'Na pewno, byłaś świetna! Jakie masz plany na resztę dnia?', '', 3, 5),
(22, 'Teraz muszę jeszcze zrobić kilka rzeczy, ale później odpocznę. A Ty?', '', 5, 3),
(23, 'Też muszę dokończyć kilka rzeczy, ale potem chyba się zrelaksuję.', '', 3, 5),
(24, 'Odpoczynek to zawsze dobry pomysł.', '', 5, 3),
(25, 'Zgadza się! Jak tam praca nad nowym projektem?', '', 3, 5),
(26, 'Całkiem nieźle, ale mamy parę drobnych opóźnień.', '', 5, 3),
(27, 'Rozumiem, mam nadzieję, że uda się nadrobić.', '', 3, 5),
(28, 'Tak, już załatwiam te opóźnienia. Dzięki za wsparcie!', '', 5, 3),
(29, 'Żaden problem, zawsze możesz na mnie liczyć.', '', 3, 5),
(30, 'Dzięki, Piotr!', '', 5, 3),
(31, 'Cześć Adam! Jak tam Twoje plany na dzisiaj?', '', 6, 4),
(32, 'Hej Krzysiek! Muszę skończyć raport, ale poza tym luz. A Ty?', '', 4, 6),
(33, 'Też muszę dokończyć projekt, ale wieczorem chyba pójdę na trening.', '', 6, 4),
(34, 'O, fajnie! Ja chyba na spokojnie spędzę wieczór w domu.', '', 4, 6),
(35, 'Odpoczynek to zawsze dobry pomysł.', '', 6, 4),
(36, 'Zgadza się! Jak tam praca nad nowym projektem?', '', 4, 6),
(37, 'W porządku, chociaż kilka kwestii wymaga jeszcze doprecyzowania.', '', 6, 4),
(38, 'Rozumiem, mam nadzieję, że uda się nadrobić.', '', 4, 6),
(39, 'Zdecydowanie! Daj znać, jeśli będziesz potrzebował pomocy.', '', 6, 4),
(40, 'Dzięki, na pewno!', '', 4, 6),
(41, 'Cześć Anna! Jak się masz?', '', 2, 4),
(42, 'Hej Krzysiek, wszystko w porządku, dzięki! A Ty?', '', 4, 2),
(43, 'Dobrze, trochę zabiegany, ale damy radę. Jak idzie praca nad projektem?', '', 2, 4),
(44, 'Całkiem nieźle, ale mamy parę drobnych opóźnień.', '', 4, 2),
(45, 'Rozumiem, mam nadzieję, że uda się nadrobić.', '', 2, 4),
(46, 'Tak, już załatwiam te opóźnienia. Dzięki za wsparcie!', '', 4, 2),
(47, 'Żaden problem, zawsze możesz na mnie liczyć.', '', 2, 4),
(48, 'Dzięki, Krzysiek!', '', 4, 2),
(119, 'Patrz jaki pipotam', 'b5491427-c2c6-4e5d-8c07-51dcba352f76.gif', 3, 1),
(120, 'Świent, patrz na mojego pipotama', 'a5ff23dc-c171-4482-bb90-6e2d271dec43.gif', 1, 3),
(123, 'elo', '', 13, 1),
(124, '', 'c00dc015-4459-4cbd-a4f7-e6b237cd9ca3.gif', 3, 1),
(126, 'dsadsada', '', 3, 1),
(127, 'dsadsa', '', 3, 1),
(128, 'dsadadsad', 'ab308ae7-b63f-4d50-982f-319f345b2cad.gif', 3, 1),
(129, 'dsad', '342d8cd5-e21d-45a2-8c93-baadca353459.gif', 4, 1),
(130, 'ew1ee1', '', 3, 1),
(131, 'dsadsa', '', 3, 1),
(132, 'de344', '576f4137-1f82-405c-9a32-9dfc7b18f176.gif', 3, 1),
(133, 'aaaaaa', '', 4, 13),
(134, '', '14bc86fa-f6ec-473b-8d4f-3246f6c3e61d.mp4', 3, 1),
(135, 'aaa', '', 3, 1),
(136, 'asdf', '', 3, 1),
(137, 'aaaaaaaaa', '', 6, 1),
(138, 'dsadadsada', '', 13, 1),
(139, 'aaaa', '', 5, 1),
(140, 'dsadasd', '', 2, 1),
(141, 'aaaa', '', 2, 1),
(142, 'dsdsad', '', 4, 1),
(143, 'dsdasad', '16f745e0-7e57-43bb-ab4a-1cd86ccfbfaa.mp4', 13, 1),
(144, 'aaaa', '', 13, 1),
(145, 'aaaaa', '6d0d6ac7-079b-4287-ac14-2e019dd48907.gif', 13, 1),
(146, '123', 'b2edac78-ea17-482e-b380-74efb121ae19.mp4', 13, 1),
(147, '', '', 13, 1),
(149, 'aaaa', '', 1, 13),
(150, 'asdf', '5f206d81-78e4-4440-a56a-0ee007126b9e.png', 1, 13),
(151, 'pdf', '466c46e7-03dc-4589-b1ff-4fd7c5eb8667.pdf', 13, 1),
(152, 'elo kolego', '', 1, 13),
(153, 'elo, patrz jaki fajny pipotam', '54bdbfaf-580f-45c6-b6e1-242bb0ca315f.gif', 13, 1),
(154, 'no fajny', '', 1, 13),
(155, 'fajny tez', '464315c4-bca5-4902-8509-5901d840a3e2.gif', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(120) NOT NULL,
  `pass` varchar(120) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `profile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `login`, `pass`, `email`, `profile`) VALUES
(1, 'jan_kowalski', '17cfe9937ce30884b96ad64e2bf0682e0f6dfb6c513cabf163ad8b8f814ab385', 'jan.kowalski@email.com', '62bd2480-11e2-4673-9eb2-dbcad7d7557e.gif'),
(2, 'anna_nowak', '8fd1ffc6d185c25664900f35906540d131329e01a57808c10d041d2ecd675a94', 'anna.nowak@email.com', ''),
(3, 'piotr_majewski', '879314f12536b8be8513235077e02b0c3afa53a1c56cc4bc98a98acdf1a53b92', 'piotr.majewski@email.com', ''),
(4, 'krzysztof_wilczek', '78764f9927bad53daa852f9f20d724b3f19e71ac4466ada8c8c020a35b776e10', 'krzysztof.wilczek@email.com', ''),
(5, 'joanna_kaczmarek', '9957bd2a61d14cbb8b0b23eb4260abb4944a17998f4a8c8b09ad8410b14d4952', 'joanna.kaczmarek@email.com', ''),
(6, 'adam_smith', 'bb48a2dd45e1ab5b3736981b7b09da7aab01edf3f615219f1ffd02a7c404adf2', 'adam.smith@email.com', ''),
(13, 'pipotam', '31b0d347bc8b72d6fd0ddba63e2bdc67dfe2809159ede8fd3c9fe292e921fc96', '', '5a04bbe9-a39b-4a57-a65a-d04360c0f185.gif');

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
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
