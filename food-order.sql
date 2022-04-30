-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 06:22 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(56, 'Rajib Kumar Maity', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(21, 'Pizza', 'Pizza.jpg', 'Yes', 'Yes'),
(22, 'Burger', 'burger.jpg', 'Yes', 'Yes'),
(27, 'Momo', 'momo.jpg', 'Yes', 'Yes'),
(30, 'Fried Chiken', 'FriedChiken.jpg', 'Yes', 'Yes'),
(31, 'French Fries', 'FrenchFries.jpg', 'Yes', 'Yes'),
(32, 'Hot Dog', 'Hotdog.jpg', 'Yes', 'Yes'),
(34, 'Drinks', 'Drinks.jpg', 'Yes', 'Yes'),
(35, 'Ice Cream', 'vanilla.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(19, 'Vej Pizza', 'We put broccoli, cauliflower, and carrots', '4.00', 'vejpizza.jpg', 21, 'Yes', 'Yes'),
(20, 'Chiken Pizza', 'It is a trustworthy choice on the long list of toppings.', '5.00', 'chikenpizza.jpg', 21, 'Yes', 'Yes'),
(21, 'Burger', 'Only meat.', '3.00', 'Burger.jpg', 22, 'Yes', 'Yes'),
(22, 'Veg Momo', 'Comes with Paneer.', '5.00', 'vejmomo.jpg', 27, 'Yes', 'Yes'),
(23, 'Chiken Fried Momo', 'Comes with Chiken.', '5.00', 'chikenmomo.jpg', 27, 'Yes', 'Yes'),
(24, 'Fried Chiken', 'Chiken Leg.', '6.00', 'FriedChiken.jpg', 30, 'Yes', 'Yes'),
(25, 'French Fries', 'comes with delicious sauce.', '3.00', 'FrenchFries.jpg', 31, 'Yes', 'Yes'),
(26, 'Hot Dog', 'Only Chiken', '4.00', 'Hotdog.jpg', 32, 'Yes', 'Yes'),
(27, 'Fruit Juice', 'Cold Drink made of fruit', '2.00', 'fruitjuice.jpg', 34, 'Yes', 'Yes'),
(28, 'Cold Drink', 'coke with ice', '1.00', 'Drinks.jpg', 34, 'Yes', 'Yes'),
(29, 'vanilla icecream', 'cold and testy', '2.00', 'vanilla.jpg', 35, 'Yes', 'Yes'),
(30, 'chocolate icecream', 'cold and chocolaty.', '2.00', 'chokoice.jpg', 35, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(9, 'Hot Dog', '4.00', 5, '20.00', '2022-03-02 05:59:35', 'Delivered', 'Rajib Kumar Maity', '8917317557', 'rajibkumarmaity1110@gmail.com', 'Ramnagar\r\nWest Bengal\r\n721423'),
(10, 'Chiken Fried Momo', '3.00', 2, '6.00', '2022-03-02 06:00:42', 'On delivery', 'Ratikanta', '8917317557', 'rajibkr.maity0420@outlook.com', 'Radhapur, shyampur, Ramnagar, purba Medinipur'),
(11, 'chocolate icecream', '2.00', 5, '10.00', '2022-03-02 06:04:32', 'Delivered', 'Laltu', '9876543201', 'rajibkr.maity0420@outlook.com', 'Radhapur, shyampur, Ramnagar, purba Medinipur'),
(12, 'French Fries', '3.00', 2, '6.00', '2022-03-02 06:05:51', 'Ordered', 'Sumit', '9876543012', 'hg654@gmail.com', 'Vill-Arkhana'),
(13, 'vanilla icecream', '2.00', 5, '10.00', '2022-03-03 03:14:00', 'Ordered', 'Laltu', '9876543210', 'abv@gmail.om', 'bihar'),
(14, 'Vej Pizza', '4.00', 1, '4.00', '2022-03-05 09:47:56', 'Ordered', 'Rajib Maity', '8917317557', 'rajibkr.maity0420@outlook.com', 'Radhapur, shyampur, Ramnagar, purba Medinipur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
