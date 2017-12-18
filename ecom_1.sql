-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2017 at 01:39 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_settings`
--

CREATE TABLE `all_settings` (
  `all_id` int(3) NOT NULL,
  `all_name_settings` varchar(60) NOT NULL,
  `all_value_settings` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `all_settings`
--

INSERT INTO `all_settings` (`all_id`, `all_name_settings`, `all_value_settings`) VALUES
(1, 'footer', 'Excel Company'),
(2, 'site_name', 'Excel Company');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `gro_id` tinyint(1) NOT NULL,
  `gro_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`gro_id`, `gro_name`) VALUES
(1, 'admin'),
(2, 'c_admin'),
(3, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(16) NOT NULL,
  `data` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` enum('paid','confirmed','unpaid','canceled','expired') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `data`, `due_date`, `user_id`, `status`) VALUES
(10001001, '2015-05-06 08:13:09', '2015-05-07 08:13:09', 2, 'confirmed'),
(10001002, '2015-05-06 08:17:15', '2015-05-07 08:17:15', 3, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(16) NOT NULL,
  `invoice_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL,
  `product_type` varchar(60) NOT NULL,
  `product_title` varchar(60) NOT NULL,
  `qty` int(3) NOT NULL,
  `price` int(9) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `product_id`, `product_type`, `product_title`, `qty`, `price`, `options`) VALUES
(10001001, 10001001, 1, 'PC', 'Dell', 1, 25000, ''),
(10001002, 10001002, 5, 'Mobile', 'Iphone 6', 1, 46000, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(16) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_title` varchar(20) NOT NULL,
  `pro_description` text NOT NULL,
  `pro_price` int(9) NOT NULL,
  `pro_stock` int(3) NOT NULL,
  `pro_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_title`, `pro_description`, `pro_price`, `pro_stock`, `pro_image`) VALUES
(1, 'PC', 'Dell', 'Dell INSPIRON N5111\r\nRAM 2GB\r\nCORE i5\r\nAVG 1Gb\r\nCPU 3000', 25000, 3, 'Dell_Computer.jpg'),
(2, 'Laptop', 'Toshiba', 'RAM 1GB\r\nCORE i7\r\nAVG 2Gb\r\nCPU 3500', 50000, 5, 'prod_satA205-OFTWH_300-01.jpg'),
(3, 'PC', 'HP', 'HP 300 \r\nram 2 gb\r\navg 2\r\ncpu 3500\r\ndvd\r\ncam 16 px\r\n', 75000, 1, 'images.jpg'),
(4, 'Mobile', 'HTC sensation XL', 'htc', 45000, 1, 'htc_sensation_xl_28.jpg'),
(5, 'Mobile', 'Iphone 6', 'Iphone 6', 46000, 1, 'aabffb1c6425f95fd26db8595ee28c0e_png.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `rep_id` int(9) NOT NULL,
  `rep_name` varchar(60) NOT NULL,
  `rep_id_product` int(9) NOT NULL,
  `rep_title_product` varchar(60) NOT NULL,
  `rep_usr_name` varchar(60) NOT NULL,
  `rep_usr_group` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`rep_id`, `rep_name`, `rep_id_product`, `rep_title_product`, `rep_usr_name`, `rep_usr_group`) VALUES
(3, 'PC', 1, 'Dell', '', '0'),
(4, 'Laptop', 2, 'Toshiba', '', '0'),
(5, 'Mobile', 4, 'HTC sensation XL', 'test', '3'),
(6, 'Laptop', 2, 'Toshiba', 'test', '3'),
(7, 'PC', 3, 'HP', 'Gost', 'Gost'),
(8, 'PC', 1, 'Dell', 'hichamtest', '3'),
(9, 'Mobile', 5, 'Iphone 6', 'Gost', 'Gost'),
(10, 'PC', 3, 'HP', 'Gost', 'Gost');

-- --------------------------------------------------------

--
-- Table structure for table `shop_session`
--

CREATE TABLE `shop_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_session`
--

INSERT INTO `shop_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0056750e80f770b669fe527b15de3d60', '::1', 1504700139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303133393b),
('0123a998a1a33e03a168c75c3144927a', '::1', 1504699401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393430313b),
('024272f15c38aca399100d5ba60d3a5a', '::1', 1504699230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393233303b),
('02ad9303862c348831dc26baae73f62a', '::1', 1504754192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343139323b),
('0568461a0a0c6d4d72d7110845e687bd', '::1', 1504700065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303036353b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('082f8ef234a64a9610dbfab6786b7d2a', '::1', 1504699374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393337343b757365726e616d657c4e3b67726f75707c4e3b),
('0a1dd79a5a3b4bf10c965a93e72161e7', '::1', 1504699568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393536383b),
('0ab562122ba469cc010f322256388719', '::1', 1513600068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303036383b),
('0bb4501e351e88681aebca968cd4885f', '::1', 1504699402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393430323b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('0e94a6e66df70703b294b92bca3267da', '::1', 1504699569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393536393b757365726e616d657c733a353a2261646d696e223b67726f75707c693a313b),
('0f029f6cc0413c947bcd0db44ebd04c4', '::1', 1513600047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303034373b),
('129a0ed89b7818d8876016cbf9b85f50', '::1', 1504699351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335313b),
('1457b20eaa24604a476643e8c82fa63c', '::1', 1504699041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393034313b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('1a11668c2bf0ee3dc7105239b452ac0299c4c2a8', '::1', 1504758242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735383234323b),
('1a952168f69adc7e246e9e5a5f69310e', '::1', 1504698758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735383b),
('1bd1d0becdf9da779b22872a679f60d0', '::1', 1504700090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303039303b),
('1c76e6eb038b9433dd1397292e29ef81', '::1', 1504699104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393130343b),
('22f50e9cb988305d26e682c9c6c0d165', '::1', 1504699416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393431363b),
('29de1d5eb7a63175d1491579936630ea', '::1', 1504698978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383937383b),
('2b225151f81bfdaf787a81f5ca8b318d', '::1', 1504700141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303134313b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('2f8ea32cc6558832124833d251782d5b', '::1', 1504699666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393636363b),
('3562c103342b5485f79c2f497c09c0f8', '::1', 1504699177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393137373b),
('360419a8c2e37f68b6f825fe2d29d8e1', '::1', 1504698757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735373b),
('362d1094a8278b4a9c57cc8f7af5b3d6', '::1', 1510910727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303931303732373b),
('381845da64a3902666fbde3501a0e2b3', '::1', 1504754165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343136353b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('3963ef962d443bb370e2a35be3457a47', '::1', 1504699401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393430313b),
('39a4308ac0850c7b0f3d7fd9442bc072', '::1', 1504699352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335323b),
('3de92e13954ba62b9bdaa13525d1aa9c', '::1', 1504699361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393336313b),
('3effadf33d656826b40f432d12234b66', '::1', 1504700163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303136333b),
('3f20afcc235a5099436225176260afbe', '::1', 1504699660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393636303b),
('409aba9c62bd9032710f3ac6785a35c2', '::1', 1510910738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303931303733383b),
('40ff9f4a9e62a0ded557a417adae9949', '::1', 1504698758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735383b),
('4101d9529781cedf98f649c1db0d1f49', '::1', 1513600073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303037333b),
('454e92e0d37b8a61a533e3ac225a140c', '::1', 1513600067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303036373b),
('460b55e96b97135ac01126fee564061b', '::1', 1504700231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303233313b),
('48bb6c11055b5add3e5ff2ca28ff32ae', '::1', 1504700190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303139303b),
('4fc7c97880006c3a1dc7f7cbc20d94f6', '::1', 1504698748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383734383b),
('5330e5b4b36d565d4178bee0b6522886', '::1', 1504699416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393431363b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('5360cb1214dd51f0dbcb6c5e47327007', '::1', 1504700170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303137303b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('54cf774890d1569af5cacf9c412ecdac', '::1', 1504754201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343230313b),
('55dccc91ac35240163a6da6bbf74b36c', '::1', 1504699219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393231393b),
('563b9782638ea8c10193da52c8840c6e', '::1', 1504699177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393137373b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('5b90b41b6f3d19cb13952c73db0c84cc', '::1', 1504699668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393636383b),
('5ed213856d5ca50f4f8e893f88e6c64f', '::1', 1504699378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393337383b),
('62ee5a03bda6320a3b9355e08bbd8ff8', '::1', 1504698978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383937383b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('62f885c4e1c3088a8a8e6469f5203d4f', '::1', 1504700026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303032363b),
('652b4018205bb33b51712eb8bf792d8b', '::1', 1504754163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343136333b),
('6899139c50784128c9df6aa1eb6b095d', '::1', 1504699092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393039323b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('6a3cf0711b93d3d1cdfa3dd91d6de33b', '::1', 1504699223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393232333b),
('6bb6402ab06c52149b017ea99c597354', '::1', 1513600063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303036333b),
('6c84b2ea6f5462e2dd86279c494dd002', '::1', 1504699540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393534303b),
('6e125e5014412bd4fe9f6b78ea46aafa', '::1', 1504699359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335393b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('71ca98541824c2d15dde9bbfc231b112', '::1', 1504700025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303032353b),
('732bbe3154fce9959b5fa69ec2d2bfe8', '::1', 1504699039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393033393b),
('74aa5146bc01be1917a1f720fd3abb2d', '::1', 1504754165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343136353b),
('75a0e4f37de2cbee559efd71fe345200', '::1', 1513600075, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303037353b),
('75bdcc58e8cd30373383432f69f11898', '::1', 1504699569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393536393b),
('7b53018b4f3412671b026d624c36dfa4', '::1', 1504700026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303032363b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('7c03df50f1cdb48349ed8bccb52ce76a', '::1', 1504699104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393130343b),
('8203209bbb0c0ba1a911b1c582151913', '::1', 1504699057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393035373b),
('82248a9f9266db4404eb642354b895a0', '::1', 1504699668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393636383b),
('822bb3533005fd5c6992030324bf601b', '::1', 1504700106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303130363b),
('85c46330bc982d4112009334b23b1363', '::1', 1504699103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393130333b),
('86fec7339d24bfade9b14e117409c88c', '::1', 1504699092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393039323b),
('87b4cbfa048bea5c429eb247f04d9271', '::1', 1513600060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303036303b),
('8894538da476e52f83a6d19b1dd5e6ae', '::1', 1504699223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393232333b),
('889967b654ca175c15dfbd853cfc71ac', '::1', 1504699370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393337303b),
('8b0bfe8a6126e09bd452a3bb2c425e81', '::1', 1513600071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303037313b),
('8bee6762eb05a808f0ad35d30ae4a6b8', '::1', 1504700168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303136383b),
('8f210d619291e0164005241117bc58c3', '::1', 1504699050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393035303b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('8f64c1437a9ad841c58297634999aadb', '::1', 1504700228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303232383b),
('90c5f736fa359913e07a52b12aa46b47', '::1', 1504698751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735313b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('93a07c7cdaa87999c77c9e5b02237373', '::1', 1504698751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735313b),
('93d1cdf7efdda65bc4fa65a291f0e84c', '::1', 1504699359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335393b),
('9416d0b67a6ec5c106b394aa7a9b0bc4', '::1', 1504699384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393338343b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('94670232818660451e7bfbad8026bfd3', '::1', 1504699415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393431353b),
('946b912ce00fe5783e3aec5f5aea1d46', '::1', 1513600064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303036343b),
('948ca211163f4b55041fe07ad7a70c1a', '::1', 1504699709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393730393b),
('978bf1843c55ff29244d70c8adcff725', '::1', 1504698758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735383b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('97d33b42f6a1ce980926083c33ca6bc5', '::1', 1504699416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393431363b),
('991f868716fef6d7e461ad54ebf6202a', '::1', 1504699843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393834333b),
('9c27993217a0a3634687df4e97d8e637', '::1', 1504699811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393831313b),
('9d07af342cbc89ed6c83f9b3c7d5e2cf', '::1', 1504699106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393130363b),
('9de607f859c5624c639bc9922169a1bf', '::1', 1504699219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393231393b),
('a2dbd48212b082c04277f0d09899b4eb', '::1', 1504699399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393339393b),
('a304faf9731891fa0d6f66af59991f16', '::1', 1504700170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303137303b),
('a45eeff244a1364ef75930f72800376a', '::1', 1504699223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393232333b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('a683e050ac40a77f04cf856c0208df42', '::1', 1504698977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383937373b),
('a78ef3863256fa2ebb844d8a71d4c4bc', '::1', 1504698746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383734363b),
('a7a18952fbfa5c192a33bf8ffc0e41e7', '::1', 1504698978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383937383b),
('a9a7a73fb6bc17e413607a14b4790b5f', '::1', 1504700231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303233313b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('a9cdda7ae59d3d5e7aa925a5f3a34c4d', '::1', 1510910736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303931303733363b),
('acf8b3666205c89ac520c04a1dd42dc1', '::1', 1504698981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383938313b),
('ae06f75606fb11afaf6372828cd581fc', '::1', 1513600057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303035373b),
('b09ab7c685fff37dc674ede68e3a23ad', '::1', 1504699366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393336363b757365726e616d657c4e3b67726f75707c4e3b),
('b5728ea592559c1d187698915178c4c1', '::1', 1504699399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393339393b),
('b8519a04c571b931a54a793254b88344', '::1', 1504698750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735303b),
('b8e14069d6985da85db43d694d29eda4', '::1', 1504699857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393835373b),
('b9a073eca826134a32bb9b22859a9c6c', '::1', 1504699402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393430323b),
('c29d4831a8ae65d358fcd1eb66ad456a', '::1', 1504699540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393534303b),
('c6aca5e27faed90f8d9bc1802559dcdd', '::1', 1504699357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335373b),
('c6d5beb0a0ad54e2af7887594ddc6954', '::1', 1504699356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335363b),
('c8c8f796e6344f214efee68c31cffdd1', '::1', 1504699221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393232313b),
('cd0f8771a2bcb151778f6a2269dd2249', '::1', 1504699042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393034323b),
('d1771ab4d1b763603201a6e3a0a046a4', '::1', 1504699384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393338343b),
('d335ae75fb9b68a8a268a6c1ba495a44', '::1', 1504700132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303133323b),
('d5e0e2496e309b48b9fdaf15c2140262', '::1', 1504699101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393130313b),
('d7611b2b99cd7b92d9f7c2df1ac0ebfb', '::1', 1504699352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393335323b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('da0bbd73f7c62d612109565b0e0f5e1e', '::1', 1504699879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393837393b),
('da107ce840ec4b72a5e1b748018a1db2', '::1', 1504699402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393430323b),
('dccf3b5db2c940c6417da0a11ae0b86b', '::1', 1504699668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393636383b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('ddcda9bd4ee80c68ecac191c9030257b', '::1', 1504754161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343136313b),
('de2acd5fb5ee5acf169fc64b19463fa0', '::1', 1504699104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393130333b757365726e616d657c733a353a2261646d696e223b67726f75707c733a313a2231223b),
('e1f76d9f82189e51ddb343e06f184d64', '::1', 1504700141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303134313b),
('e26c044b6cf64c517145cedacb068857', '::1', 1504699092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393039323b),
('e642d3a9908eea098ac08a1e04a4a8e2', '::1', 1504700004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303030343b),
('e9dffdc0b7dde329bdb300a6778b761f', '::1', 1513600065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531333630303036353b),
('ec81157be71061dd2d83aad498e7fa84', '::1', 1504699538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393533383b),
('f397206b6e80b392a23d75cdb06d06e9', '::1', 1504699540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393534303b757365726e616d657c733a353a2261646d696e223b67726f75707c693a313b),
('f3980e623c1851e107ac5edf453e3a74', '::1', 1504699414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393431343b),
('f4a6193448415643b4f79e51a81ae012', '::1', 1504699567, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393536373b),
('f849e649fb06d23857c9bd1bf56f3cab', '::1', 1504700063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303036333b),
('f9ba1c6d123acd5df54e05abe5a0fe01', '::1', 1504699176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639393137363b),
('fa0e623a0468aa7a599925c554dc40be', '::1', 1504698751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343639383735313b),
('fa456ccf94a1ec6d273c42a1b7c686df', '::1', 1504700065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343730303036353b),
('faa327117267caa14d02a54bb7a9f012', '::1', 1504754152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530343735343135323b);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(10) NOT NULL,
  `usr_name` varchar(25) NOT NULL,
  `usr_password` varchar(60) NOT NULL,
  `usr_group` tinyint(1) NOT NULL,
  `stuts` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_password`, `usr_group`, `stuts`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1),
(2, 'hicham', '21232f297a57a5a743894a0e4a801fc3', 3, 1),
(3, 'dyaa', '21232f297a57a5a743894a0e4a801fc3', 3, 1),
(4, 'rdhaw', 'e10adc3949ba59abbe56e057f20f883e', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_settings`
--
ALTER TABLE `all_settings`
  ADD PRIMARY KEY (`all_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`gro_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`rep_id`);

--
-- Indexes for table `shop_session`
--
ALTER TABLE `shop_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_settings`
--
ALTER TABLE `all_settings`
  MODIFY `all_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `gro_id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001003;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001003;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `rep_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;