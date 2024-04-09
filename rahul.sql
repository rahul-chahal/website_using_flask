-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2024 at 08:40 AM
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
-- Database: `rahul`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'rahul', 'admin'),
(2, 'monu@gmail.com', 'monu');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mssg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `mssg`) VALUES
(1, 'rahul', 'rahul.151897@gmail.com', '0451955531', 'testing'),
(49, 'rahul', 'rahul.151897@gmail.com', '0451955531', 'hii rahul chahal ksee ho'),
(50, 'rahul', 'rahul.151897@gmail.com', '0451955531', 'hii rahul chahal ksee ho'),
(51, 'Kirat', 'rahul.151897@gmail.com', '5678', 'hii rahul ji'),
(52, 'Kirat', 'rahul.151897@gmail.com', '45678', 'this is testing phase'),
(53, 'Kirat', 'rahul.151897@gmail.com', '45678', 'this is testing phase'),
(54, 'monu', 'rahul.151897@gmail.com', '567', 'hiii'),
(55, 'monu', 'rahul.151897@gmail.com', '567', 'hiii'),
(56, 'kirat', 'rahul.151897@gmail.com', '45678', 'hii'),
(57, 'kirat', 'rahul.151897@gmail.com', '45678', 'hii'),
(58, 'kirat', 'rahul.151897@gmail.com', '45678', 'hii'),
(59, 'fghj', 'rahul.151897@gmail.com', '5678', 'huvbuh'),
(60, 'kirat baby', 'gurikirat680@gmail.com', '0451955531', 'kya haal h'),
(61, 'himanshi', 'malikhimanshi23@gmail.com', '345678', 'hii testing from rahul '),
(62, 'shivam', 'sbh327@gmail.com', '4356789', 'hii shivam');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(2) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `subtitle` varchar(500) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `date` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `subtitle`, `content`, `date`) VALUES
(1, 'Man must explore, and this is exploration at its greatest', '', 'Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman\'s earth, if free men make it, will be truly round: a globe in practice, not in theory.\r\n\r\nScience cuts two ways, of course; its products can be used for both good and evil. But there\'s no turning back from science. The early warnings about technological dangers also come from science.\r\n\r\nWhat was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.\r\n\r\nA Chinese tale tells of some men sent to harm a young gir who, upon seeing her beauty, become her protectors rather than her violators. That\'s how I felt seeing the Earth for the first time. I could not help but love and cherish her.\r\n\r\nFor those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.', '31032024'),
(2, 'The Final Frontier', '', 'There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.\r\n\r\nThere can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.\r\n\r\nThe dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.\r\nSpaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.', '31032024'),
(7, 'Truth about ‘embarrassing’ photo of long queue of Teslas waiting to recharge', 'The sight of a long queue of Teslas waiting at a charging station sparked raucous ribbing online and gloomy headlines about the future of EVs.', 't’s the jarring photo said to prove that Australia will struggle in its goal to ditch petrol cars.\r\n\r\nBut supporters of electric vehicles, a dozen of which are seen queuing for a spot at a charging station in the image in question, say it’s unfair to judge the convenience of EVs on one example.\r\n\r\nPicked up by news outlets and shared widely on social media in the past day, the picture is actually a screenshot of a 10-second TikTok, uploaded on Tuesday.', '03042024');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
