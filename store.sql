create database store;
use store;



--
-- Table structure for table `cpus`
--

CREATE TABLE `cpus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `socket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speed` double(8,2) NOT NULL,
  `max_speed` double(8,2) NOT NULL,
  `cache` int(11) NOT NULL,
  `integrated_graphic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cpus`
--

INSERT INTO `cpus` (`id`, `name`, `socket`, `processor`, `speed`, `max_speed`, `cache`, `integrated_graphic`, `created_at`, `updated_at`) VALUES
(1, 'cpu 2', 'LGA 1356', 'i3', 2.00, 2.00, 5, 'e0rowPzsny', NULL, '2018-11-15 06:01:11'),
(2, 'cpu 3', 'LGA 1155', 'i3', 1.00, 1.00, 6, 'kUXC3tF4bM', NULL, '2018-11-05 13:34:17'),
(3, 'cpu 4', 'LGA 1150', 'i7', 3.00, 2.00, 3, 'NcbbRRr3VD', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(4, 'cpu 5', 'LGA 2011-3', 'i3', 3.00, 2.00, 3, 'R40lFuBUva', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(5, 'cpu 6', 'LGA 2011-3', 'i5', 2.00, 3.00, 5, 's45Te0YRFX', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(6, 'cpu 1', 'LGA 2011-3', 'i3', 2.00, 4.00, 5, 'FiFq13tzic', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(7, 'cpu 7', 'LGA 2011', 'i5', 3.00, 2.00, 5, 'coCE4EDCSe', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(8, 'cpu 8', 'LGA 1366', 'i7', 3.00, 4.00, 6, 'fWFBUmDyuI', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(9, 'cpu 9', 'LGA 1150', 'i5', 1.00, 2.00, 3, '4NsynU38N8', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(11, 'CPU AMD Ryzen 5 2400G', 'Socket AM4', ' 4 nhân 8 luồng ', 3.60, 3.90, 4, ' Radeon™ Vega 11', '2018-11-05 13:33:52', NULL),
(12, 'test', 'Socket AM4', 'core i3', 2.30, 2.30, 2, ' Radeon™ Vega 11', NULL, '2018-11-05 13:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone_number`, `email`, `created_at`, `updated_at`, `username`, `password`) VALUES
(1, 'Dr. Chase Nolan', '+1-503-478-7650', 'runolfsson.peggie@example.net', NULL, '2018-11-05 11:11:50', 'Nolan', '123'),
(2, 'Mr. Ole Luettgen', '1-695-744-9302 x241', 'romaguera.sarai@example.org', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Luettgen', '123'),
(3, 'Ardith Barton', '847.942.3943 x9736', 'dmohr@example.org', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Barton', '123'),
(4, 'Beulah Jacobi Jr.', '226.962.6648', 'lane.bruen@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Jacobi ', '123'),
(5, 'Miss Elsa Reinger', '743.975.3960 x017', 'hollis.muller@example.org', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Reinger', '123'),
(6, 'Nelda Mueller', '+1-304-801-6986', 'gibson.kamren@example.net', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Mueller', '123'),
(7, 'Audreanne Batz PhD', '901.962.5371 x5252', 'emmitt49@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Audreanne ', '123'),
(8, 'Etha Lowe II', '(792) 531-2724 x48817', 'carolanne77@example.net', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Lowe ', '123'),
(9, 'Queenie Veum', '(490) 625-9104 x26816', 'quigley.reece@example.net', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Queenie ', '123'),
(10, 'Emmitt Fay', '(840) 818-3545 x58818', 'mallory.schumm@example.net', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Emmitt ', '123'),
(11, 'Ms. Kaycee Williamson Jr.', '+1-435-806-5867', 'whitney.kulas@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Williamson ', '123'),
(12, 'Nia Spinka', '458-810-1897', 'ignatius37@example.org', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Spinka', '123'),
(13, 'Mr. Saige Batz', '+1 (691) 350-9688', 'meggie.reynolds@example.net', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Saige ', '123'),
(14, 'Gabrielle Johnson', '825-393-8279 x971', 'rafael56@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Johnson', '123'),
(15, 'Malcolm O\'Hara', '420.867.4577 x2175', 'wehner.pink@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Malcolm ', '123'),
(16, 'Dr. Ethel Skiles', '(862) 432-4307 x4038', 'owill@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Skiles', '123'),
(17, 'Alejandra King', '1-990-575-6325', 'tate83@example.org', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'King', '123'),
(18, 'Betsy Gaylord', '(795) 619-2587 x7497', 'daniela.robel@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Gaylord', '123'),
(19, 'Mr. Fausto Fritsch', '1-898-524-8638 x864', 'bridgette18@example.com', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Fausto ', '123'),
(20, 'Grover Auer', '1-728-508-9611 x3870', 'verona.green@example.org', '2018-09-21 15:20:35', '2018-09-21 15:20:35', 'Auer', '123'),
(21, 'SBE', '0975123443', 'sbe@gmail.com', '2018-11-16 08:30:15', '2018-11-16 08:30:15', 'SBE', '202cb962ac59075b964b07152d234b70'),
(22, 'sanero', '326013766', 'a@a.a', '2018-11-16 09:30:39', NULL, 'sanero', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` bit(1) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` bit(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf32_unicode_ci NOT NULL DEFAULT '123'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `gender`, `date_of_birth`, `phone_number`, `address`, `email`, `role`, `created_at`, `updated_at`, `username`, `password`) VALUES
(3, 'Marcella Hermann', b'1', '1986-01-17', '+18742843958', '89376 Cole Hills\nWest Daphne, MN 75396-2188', 'lisette.kerluke@example.com', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Hermann', '123'),
(4, 'Murphy Bartoletti', b'0', '1994-01-10', '1-534-593-2380 x00558', '7892 Lehner Rue Suite 136\nPort Amie, AZ 94933', 'kellie.kessler@example.com', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Bartoletti', '123'),
(5, 'Kelsi Treutel', b'0', '1984-08-25', '(597) 510-9884 x47490', '5554 Graham Cove Apt. 110\nLake Jaydeside, NH 30835-3822', 'kiana04@example.org', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Treutel', '123'),
(6, 'Dr. Sheldon Pacocha I', b'1', '1971-12-04', '543-208-9835', '257 Esperanza Freeway\nLake Curtismouth, LA 78738', 'raynor.una@example.net', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Pacocha ', '123'),
(7, 'Miss Domenica Huels PhD', b'0', '1995-06-30', '504-313-7226', '8875 Abernathy Forks Apt. 936\nEast Fostermouth, SD 13158', 'brycen22@example.net', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Domenica ', '123'),
(8, 'Maximus Blick', b'1', '1980-04-30', '1-832-424-7900', '522 Runte Causeway Apt. 000\nLeopoldotown, GA 37129-7978', 'tina77@example.org', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Maximus ', '123'),
(9, 'Michale D\'Amore', b'1', '1991-01-07', '(624) 394-4039', '35677 Kulas Causeway\nSouth Cassidyshire, NY 11953-7159', 'schiller.lukas@example.com', b'0', '2018-09-21 15:20:34', '2018-09-21 15:20:34', 'Michale ', '123'),
(11, 'Sanero', b'1', '1997-03-14', '0969965727', 'HN', 'sanero@email.com', b'1', '2018-10-23 16:18:22', '2018-10-23 16:18:22', 'sanero', '202cb962ac59075b964b07152d234b70'),
(12, 'Vương Sơn', b'1', '1997-01-01', '326013766', 'xóm Ngoại, thôn 4, xã Cộng Hoà', 'a@a.a', b'1', NULL, '2018-11-05 15:09:40', 'a', '202cb962ac59075b964b07152d234b70'),
(13, 'Apple', b'0', '1111-01-01', '111', '1111', 'a@a.a', b'0', NULL, '2018-11-05 15:21:56', 'qb', '7363a0d0604902af7b70b271a0b96480');

-- --------------------------------------------------------

--
-- Table structure for table `laptops`
--

CREATE TABLE `laptops` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration_id` int(10) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `accessories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warranty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot` bit(1) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laptops`
--

INSERT INTO `laptops` (`id`, `name`, `configuration_id`, `price`, `accessories`, `weight`, `os`, `image`, `warranty`, `hot`, `discount`, `created_by`, `modified_by`, `created_at`, `updated_at`, `quantity`) VALUES
(1, 'laptop wBZn', 2, 10491287, 'Dây sạc', 2.00, 'Window', '1_1.jpg', '12 tháng', b'1', 20.00, 0, 11, NULL, '2018-11-15 06:17:10', 0),
(3, 'laptop Spby', 6, 24770892, 'Dây sạc', 2.00, 'Window', '1_2.jpg', '12 tháng', b'1', 15.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 6),
(5, 'laptop bhY2', 2, 34677062, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 10),
(6, 'laptop gWVJ', 6, 32386754, 'Dây sạc', 1.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 15.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 25),
(7, 'laptop 8yFn', 2, 45405691, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 32),
(8, 'laptop Qdeu', 1, 14682913, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 5),
(9, 'laptop zwxz', 12, 13388233, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 15),
(10, 'laptop wCIl', 3, 22635638, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 14),
(12, 'laptop yO35', 1, 41682506, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 19),
(13, 'laptop uTfJ', 5, 21154333, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 15.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 9),
(16, 'laptop iqBR', 6, 25896951, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 3),
(17, 'laptop uWVb', 7, 27849382, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 5),
(18, 'laptop gN2M', 1, 38753137, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 9),
(19, 'laptop CvZk', 3, 15184996, 'Dây sạc', 1.00, 'Mac Os', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 0),
(20, 'laptop RgLt', 11, 15233215, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 4),
(22, 'laptop yO35', 1, 41682506, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 16),
(23, 'laptop uTfJ', 5, 21154333, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 15.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 14),
(26, 'laptop iqBR', 6, 25896951, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 5),
(27, 'laptop uWVb', 7, 27849382, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 8),
(28, 'laptop gN2M', 1, 38753137, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 3),
(29, 'laptop CvZk', 3, 15184996, 'Dây sạc', 1.00, 'Mac Os', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 4),
(30, 'laptop RgLt', 10, 15233215, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 7),
(32, 'laptop yO35', 1, 41682506, 'Dây sạc', 2.00, 'Mac Os', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 5),
(33, 'laptop uTfJ', 5, 21154333, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 15.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 11),
(36, 'laptop iqBR', 11, 25896951, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '24 tháng', b'1', 10.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 12),
(37, 'laptop uWVb', 7, 27849382, 'Dây sạc', 3.00, 'Mac Os', '1_1.jpg', '12 tháng', b'0', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 0),
(38, 'laptop gN2M', 1, 38753137, 'Dây sạc', 1.00, 'Window', '1_1.jpg', '12 tháng', b'1', 0.00, 1, 1, '2018-09-21 15:20:38', '2018-09-21 15:20:38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `laptop_config`
--

CREATE TABLE `laptop_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `producer_id` int(10) UNSIGNED NOT NULL,
  `cpu_id` int(10) UNSIGNED NOT NULL,
  `ram_id` int(10) UNSIGNED NOT NULL,
  `memory_socket_count` int(11) NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port_connect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dimension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `battery` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laptop_config`
--

INSERT INTO `laptop_config` (`id`, `producer_id`, `cpu_id`, `ram_id`, `memory_socket_count`, `disk`, `port_connect`, `dimension`, `screen`, `battery`, `created_at`, `updated_at`) VALUES
(1, 6, 7, 27, 2, 'HDD 1TB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 6, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(2, 3, 5, 19, 2, 'HDD 1TB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 6, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(3, 7, 9, 15, 2, 'HDD 512GB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 2, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(4, 2, 1, 10, 1, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 4, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(5, 7, 6, 8, 2, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 6, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(6, 4, 5, 28, 2, 'HDD 1TB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 2, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(7, 1, 5, 26, 1, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 3, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(8, 3, 5, 39, 2, 'HDD 1TB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 2, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(10, 1, 1, 34, 1, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 5, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(11, 7, 2, 17, 2, 'HDD 512GB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 3, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(12, 2, 9, 22, 2, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 4, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(13, 4, 2, 22, 1, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 4, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(14, 3, 2, 29, 1, 'HDD 1TB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 5, '2018-09-21 15:20:38', '2018-09-21 15:20:38'),
(15, 2, 3, 16, 2, 'HDD 512GB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 4, '2018-09-21 15:20:38', '2018-09-21 15:20:38'),
(16, 2, 3, 3, 1, 'HDD 512GB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 2, '2018-09-21 15:20:38', '2018-09-21 15:20:38'),
(17, 7, 1, 34, 2, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 4, '2018-09-21 15:20:38', '2018-09-21 15:20:38'),
(18, 4, 1, 19, 2, '0', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'Full HD 1080p', 6, '2018-09-21 15:20:38', '2018-09-21 15:20:38'),
(19, 3, 9, 13, 2, 'HDD 1TB', '2xUSB 3.0, 2xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone', '277mm x 325mm', 'HD 720p', 3, '2018-09-21 15:20:38', '2018-09-21 15:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_date` date NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `modified_by` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `user_id`, `customer_id`, `address`, `discount`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '2016-12-31', 8, 2, 'Hà Nội', 0.00, b'1', 4, 11, '2018-09-21 15:20:39', '2018-09-21 15:20:39'),
(2, '2016-10-20', 4, 4, 'Hà Nội', 5.00, b'1', 4, 11, '2018-09-21 15:20:39', '2018-09-21 15:20:39'),
(3, '2016-09-20', 8, 1, 'Hà Nội', 10.00, b'1', 4, 0, '2018-09-21 15:20:39', '2018-09-21 15:20:39'),
(4, '2017-04-24', 3, 20, 'Hà Nội', 10.00, b'0', 2, 0, '2018-09-21 15:20:39', '2018-09-21 15:20:39'),
(6, '2017-01-09', 8, 15, 'Hà Nội', 1.00, b'0', 2, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(8, '2017-09-02', 5, 8, 'Hà Nội', 10.00, b'0', 5, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(10, '2017-09-12', 9, 9, 'Hà Nội', 5.00, b'1', 8, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(11, '2017-12-02', 7, 19, 'Hà Nội', 0.00, b'0', 3, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(12, '2018-02-23', 7, 15, 'Hà Nội', 20.00, b'0', 6, 11, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(13, '2018-10-21', 3, 16, 'Hà Nội', 0.00, b'0', 10, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(14, '2018-06-04', 5, 13, 'Hà Nội', 0.00, b'1', 5, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(15, '2018-03-29', 7, 20, 'Hà Nội', 15.00, b'0', 7, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(16, '2018-09-16', 6, 19, 'Hà Nội', 0.00, b'1', 5, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(18, '2018-04-07', 3, 4, 'Hà Nội', 0.00, b'0', 2, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(19, '2018-06-16', 3, 3, 'Hà Nội', 5.00, b'0', 3, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(23, '2018-11-19', 3, 22, 'xóm Ngoại, thôn 4, xã Cộng Hoà', 0.00, b'0', 0, 0, '2018-11-19 15:50:10', NULL),
(24, '2018-11-19', 3, 22, 'xóm Ngoại, thôn 4, xã Cộng Hoà', 0.00, b'0', 0, 0, '2018-11-19 16:11:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `laptop_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `modified_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `laptop_id`, `quantity`, `price`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 23780823, 7, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(1, 20, 1, 15233215, 1, 0, '2018-11-15 07:04:19', '2018-11-15 07:04:19'),
(2, 12, 1, 33091932, 8, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(3, 16, 1, 40901609, 9, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(4, 18, 2, 22243808, 7, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(6, 20, 2, 29859907, 1, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(8, 6, 2, 20887904, 3, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(10, 12, 1, 32860913, 4, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(11, 3, 1, 26437824, 1, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(12, 20, 1, 41149426, 9, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(14, 17, 1, 35506368, 6, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(15, 7, 1, 39543392, 6, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(16, 10, 1, 14975965, 1, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(18, 17, 1, 13038147, 6, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40'),
(19, 20, 2, 16643545, 2, 0, '2018-09-21 15:20:40', '2018-09-21 15:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `producers`
--

CREATE TABLE `producers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producers`
--

INSERT INTO `producers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Apple', NULL, '2018-11-05 11:09:02'),
(2, 'Asus', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(3, 'Acer', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(4, 'Dell', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(5, 'Hp', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(6, 'Lenovo', '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(7, 'MSI', '2018-09-21 15:20:37', '2018-09-21 15:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `rams`
--

CREATE TABLE `rams` (
  `id` int(10) UNSIGNED NOT NULL,
  `memory_capacity` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rams`
--

INSERT INTO `rams` (`id`, `memory_capacity`, `type`, `bus`, `created_at`, `updated_at`) VALUES
(1, 4, 'DDR3', 1333, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(2, 4, 'DDR3', 1600, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(3, 4, 'DDR3', 2133, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(4, 4, 'DDR3', 2400, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(5, 4, 'DDR3', 2666, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(6, 4, 'DDR3L', 1333, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(7, 4, 'DDR3L', 1600, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(8, 4, 'DDR3L', 2133, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(9, 4, 'DDR3L', 2400, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(10, 4, 'DDR3L', 2666, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(11, 4, 'DDR4', 1333, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(12, 4, 'DDR4', 1600, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(13, 4, 'DDR4', 2133, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(14, 4, 'DDR4', 2400, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(15, 4, 'DDR4', 2666, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(16, 8, 'DDR3', 1333, '2018-09-21 15:20:35', '2018-09-21 15:20:35'),
(17, 8, 'DDR3', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(18, 8, 'DDR3', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(19, 8, 'DDR3', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(20, 8, 'DDR3', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(21, 8, 'DDR3L', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(22, 8, 'DDR3L', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(23, 8, 'DDR3L', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(24, 8, 'DDR3L', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(25, 8, 'DDR3L', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(26, 8, 'DDR4', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(27, 8, 'DDR4', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(28, 8, 'DDR4', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(29, 8, 'DDR4', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(30, 8, 'DDR4', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(31, 16, 'DDR3', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(32, 16, 'DDR3', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(33, 16, 'DDR3', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(34, 16, 'DDR3', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(35, 16, 'DDR3', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(36, 16, 'DDR3L', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(37, 16, 'DDR3L', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(38, 16, 'DDR3L', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(39, 16, 'DDR3L', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(40, 16, 'DDR3L', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(41, 16, 'DDR4', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(42, 16, 'DDR4', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(43, 16, 'DDR4', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(44, 16, 'DDR4', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(45, 16, 'DDR4', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(46, 32, 'DDR3', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(47, 32, 'DDR3', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(48, 32, 'DDR3', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(49, 32, 'DDR3', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(50, 32, 'DDR3', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(51, 32, 'DDR3L', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(52, 32, 'DDR3L', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(53, 32, 'DDR3L', 2133, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(54, 32, 'DDR3L', 2400, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(55, 32, 'DDR3L', 2666, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(56, 32, 'DDR4', 1333, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(57, 32, 'DDR4', 1600, '2018-09-21 15:20:36', '2018-09-21 15:20:36'),
(58, 32, 'DDR4', 2133, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(59, 32, 'DDR4', 2400, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(60, 32, 'DDR4', 2666, '2018-09-21 15:20:37', '2018-09-21 15:20:37'),
(63, 32, 'DDR4', 3200, NULL, '2018-11-05 14:47:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpus`
--
ALTER TABLE `cpus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laptops`
--
ALTER TABLE `laptops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laptops_configuration_id_foreign` (`configuration_id`);

--
-- Indexes for table `laptop_config`
--
ALTER TABLE `laptop_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laptop_config_producer_id_foreign` (`producer_id`),
  ADD KEY `laptop_config_cpu_id_foreign` (`cpu_id`),
  ADD KEY `laptop_config_ram_id_foreign` (`ram_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_user_id_foreign` (`user_id`),
  ADD KEY `bills_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`laptop_id`),
  ADD KEY `bill_details_laptop_id_foreign` (`laptop_id`);

--
-- Indexes for table `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rams`
--
ALTER TABLE `rams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cpus`
--
ALTER TABLE `cpus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `laptops`
--
ALTER TABLE `laptops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `laptop_config`
--
ALTER TABLE `laptop_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `producers`
--
ALTER TABLE `producers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rams`
--
ALTER TABLE `rams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laptops`
--
ALTER TABLE `laptops`
  ADD CONSTRAINT `laptops_configuration_id_foreign` FOREIGN KEY (`configuration_id`) REFERENCES `laptop_config` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laptop_config`
--
ALTER TABLE `laptop_config`
  ADD CONSTRAINT `laptop_config_cpu_id_foreign` FOREIGN KEY (`cpu_id`) REFERENCES `cpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laptop_config_producer_id_foreign` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laptop_config_ram_id_foreign` FOREIGN KEY (`ram_id`) REFERENCES `rams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `bills_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `bill_details_bill_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_details_laptop_id_foreign` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

--
-- Database: `store`
--

DELIMITER $$
--
-- Functions
--
CREATE FUNCTION `getBillPriceByMonthAndYear` (`month` INT, `year` INT) RETURNS INT(11) deterministic BEGIN DECLARE total int; set total = 0; select sum(d.price*d.quantity) into total from order_details d JOIN orders o on d.order_id = o.id where year(o.order_date) = year and month(o.order_date)=month; return total; end$$

CREATE FUNCTION `getBillPriceByYear` (`year` INT) RETURNS INT(11) deterministic BEGIN DECLARE total int; set total = 0; select sum(d.price*d.quantity) into total from order_details d JOIN orders o on d.order_id = o.id where year(o.order_date) = year; return total; end$$

DELIMITER ;

-- --------------------------------------------------------

