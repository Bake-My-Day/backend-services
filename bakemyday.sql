-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 07:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakemyday`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`user_id`, `name`, `email`, `password`, `nomor_telp`) VALUES
(1, 'Novian Darmawan', 'noviandarmawan@gmail.com', '$2y$10$v88E51NMRDg9AQjt93buCe5x7ZHnzGADUthpWdlH7Uj/KUpeubdqK', '087802124555'),
(2, 'John Doe', 'johndoe@gmail.com', '$2y$10$Vjqv7mrFBF79JQ1jvxy50eF3G5Fy7lomVwJ5iZ73ojQ7qFe3bpo9K', '089876541234'),
(3, 'Jane Smith', 'janesmith@gmail.com', '$2y$10$uVfOx46WiKns/c8ewWegTuQJPCq7f6RgRKsB/EV7xdNB6xoD873pi', '087654321098'),
(4, 'Michael Brown', 'michaelbrown@gmail.com', '$2y$10$ZiECLvOMytZsbiCSZH0ve.uxHk4e3OYktUpOUb1oGzIlWsUVP1iCG', '087612348760'),
(5, 'Emily Davis', 'emilydavis@gmail.com', '$2y$10$eq7oN0y1C2htUWuF6GEwBOa7XTbMds62NW2aWKgxR8X5WIqLkoqSS', '087812347654');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` enum('pending','completed','canceled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `status`) VALUES
(1, 1, '2024-06-06', 'completed'),
(2, 2, '2024-06-02', 'pending'),
(3, 3, '2024-06-03', 'canceled'),
(4, 4, '2024-06-04', 'completed'),
(5, 5, '2024-06-05', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `subtotal`) VALUES
(1, 1, 1, 2, 20000.00),
(2, 2, 4, 1, 7000.00),
(3, 3, 6, 3, 39000.00),
(4, 4, 7, 2, 18000.00),
(5, 5, 10, 1, 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` enum('pending','completed','Failed') NOT NULL,
  `payment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `payment_date`) VALUES
(1, 1, 'DANA', 'completed', '2024-06-06 08:37:21'),
(2, 2, 'GoPay', 'pending', '2024-06-02 11:41:21'),
(3, 4, 'DANA', 'completed', '2024-06-04 13:41:21'),
(4, 5, 'GoPay', 'pending', '2024-06-05 11:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name_product`, `description`, `price`) VALUES
(1, 'Sausage Roll', 'Roti lembut dengan isian sosis gurih, sempurna untuk sarapan atau camilan.', 10000.00),
(2, 'Garlic Bread', 'Roti dengan lapisan mentega bawang putih yang gurih dan harum.', 10000.00),
(3, 'Spicy Beef Floss Bread', 'Roti lembut berisi abon pedas yang memberi sensasi rasa gurih dan pedas.', 15000.00),
(4, 'Blueberry Bread', 'Roti lembut isi blueberry manis, penuh rasa segar dan nikmat.', 7000.00),
(5, 'Corn Muffin', 'Muffin jagung manis dengan tekstur lembut dan sedikit renyah di bagian atas.', 13000.00),
(6, 'Blueberry Turnover', 'Pastry berlapis dengan isian blueberry manis yang meleleh, renyah di luar dan juicy di dalam.', 12000.00),
(7, 'Sweet Banana Bread', 'Roti lembut dengan isian pisang manis yang memberikan rasa alami dan lembut.', 9000.00),
(8, 'Cheese Scone', 'Scone gurih dengan isian keju leleh yang menciptakan rasa kaya dan nikmat.', 15000.00),
(9, 'Potato Curry Puff', 'Pastry berlapis dengan isian kentang berbumbu kari yang gurih dan menggugah selera', 10000.00),
(10, 'Meat Bun', 'Roti dengan isian daging giling yang gurih dan kaya rasa.', 15000.00),
(11, 'Chocolate Croissant', 'Croissant berlapis dengan isian cokelat lembut yang lumer, renyah di luar dan manis di dalam.', 13000.00),
(12, 'Strawberry Breakfast Danish', 'Pastry berlapis renyah dengan isian stroberi segar dan manis, sempurna untuk memulai hari dengan kenikmatan', 11000.00),
(13, 'Mushroom Flatbread', 'Roti isi jamur dengan rasa gurih yang kaya, cocok untuk penyuka jamur.', 14000.00),
(14, 'Brocolli Bread Grilled Cheese', 'Roti panggang isi brokoli segar dan keju leleh gurih, menghadirkan rasa creamy dan tekstur renyah!', 15000.00),
(15, 'Apple Cinnamon Bread', 'Roti lembut dengan isian apel manis dan kayu manis yang memberi rasa hangat.', 12000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
