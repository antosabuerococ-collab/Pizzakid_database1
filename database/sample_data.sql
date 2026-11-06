-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2026 at 04:14 PM
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
-- Database: `pizza_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action_performed` varchar(100) NOT NULL,
  `target_entity` varchar(50) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `user_id`, `action_performed`, `target_entity`, `entity_id`, `details`) VALUES
(1, 1, 'Price Adjustment', 'menu_items', 4, 'Updated PizzaKid Supreme price to 285.00 PHP'),
(2, 2, 'Shift Open', 'cashiers', 1, 'Opened register drawer with 1000.00 PHP starting float'),
(3, 3, 'Shift Open', 'cashiers', 2, 'Opened register drawer with 1000.00 PHP starting float');

-- --------------------------------------------------------

--
-- Table structure for table `cashiers`
--

CREATE TABLE `cashiers` (
  `cashier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pos_system_id` int(11) DEFAULT NULL,
  `drawer_code` varchar(50) DEFAULT NULL,
  `shift_status` varchar(50) DEFAULT 'Offline',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cashiers`
--

INSERT INTO `cashiers` (`cashier_id`, `user_id`, `pos_system_id`, `drawer_code`, `shift_status`, `created_at`) VALUES
(1, 2, 1, 'DRAWER-PABAYO-01', 'Online', '2026-11-04 15:13:17'),
(2, 3, 2, 'DRAWER-PABAYO-02', 'Online', '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`, `created_at`) VALUES
(1, 'Classic Pizzas', 'Everyday classic pizza favorites', '2026-11-04 15:13:17'),
(2, 'Specialty Pizzas', 'PizzaKid premium loaded toppings', '2026-11-04 15:13:17'),
(3, 'Pasta & Sides', 'Pasta, fries, and side snacks', '2026-11-04 15:13:17'),
(4, 'Beverages', 'Cold sodas and juices', '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `inventory_item_id` int(11) NOT NULL,
  `item_name` varchar(150) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `quantity_in_stock` decimal(10,2) DEFAULT NULL,
  `minimum_stock` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_items`
--

INSERT INTO `inventory_items` (`inventory_item_id`, `item_name`, `unit`, `quantity_in_stock`, `minimum_stock`) VALUES
(1, 'Pizza Dough (Medium 10\")', 'pcs', 150.00, 20.00),
(2, 'Pizza Dough (Large 14\")', 'pcs', 100.00, 15.00),
(3, 'Signature Tomato Sauce', 'kg', 40.00, 5.00),
(4, 'Mozzarella Cheese', 'kg', 50.00, 8.00),
(5, 'Pepperoni Slices', 'kg', 25.00, 4.00),
(6, 'Sweet Ham Slices', 'kg', 20.00, 3.00),
(7, 'Pineapple Tidbits', 'kg', 18.00, 3.00),
(8, 'Ground Beef', 'kg', 22.00, 4.00),
(9, 'Spaghetti Pasta', 'kg', 30.00, 5.00),
(10, 'Coke 1.5L', 'bottles', 80.00, 15.00),
(11, 'Sprite 1.5L', 'bottles', 60.00, 10.00),
(12, 'French Fries Frozen', 'kg', 35.00, 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_staff`
--

CREATE TABLE `kitchen_staff` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_station` varchar(100) DEFAULT NULL,
  `shift_status` varchar(50) DEFAULT 'Offline',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kitchen_staff`
--

INSERT INTO `kitchen_staff` (`staff_id`, `user_id`, `assigned_station`, `shift_status`, `created_at`) VALUES
(1, 4, 'Pizza Oven Station', 'Online', '2026-11-04 15:13:17'),
(2, 5, 'Preparation & Assembly', 'Online', '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_updates`
--

CREATE TABLE `kitchen_updates` (
  `update_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kitchen_updates`
--

INSERT INTO `kitchen_updates` (`update_id`, `order_id`, `staff_id`, `order_status`, `updated_at`) VALUES
(1, 1, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(2, 2, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(3, 3, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(4, 4, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(5, 5, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(6, 6, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(7, 7, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(8, 8, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(9, 9, 4, 'Ready for Pickup', '2026-11-04 15:13:17'),
(10, 10, 4, 'Ready for Pickup', '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `manager_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `manager_pin` varchar(10) NOT NULL,
  `approval_level` varchar(50) DEFAULT 'Senior',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`manager_id`, `user_id`, `manager_pin`, `approval_level`, `created_at`) VALUES
(1, 1, '8888', 'Senior', '2026-11-04 15:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `menu_item_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `availability_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_item_id`, `category_id`, `item_name`, `description`, `price`, `availability_status`) VALUES
(1, 1, 'Hawaiian Delight (Medium)', 'Classic sweet ham and pineapple with cheese', 185.00, 'Available'),
(2, 1, 'Pepperoni Overload (Medium)', 'Loaded with sliced beef pepperoni and mozzarella', 195.00, 'Available'),
(3, 1, 'Cheese Lover (Medium)', 'Triple mozzarella cheese blend', 175.00, 'Available'),
(4, 2, 'PizzaKid Supreme (Large)', 'Ham, pepperoni, beef, pineapple, and extra cheese', 285.00, 'Available'),
(5, 2, 'All Meat Special (Large)', 'Beef, ham, bacon, and pepperoni', 295.00, 'Available'),
(6, 3, 'Meaty Spaghetti Regular', 'Filipino-style sweet spaghetti with ground beef', 85.00, 'Available'),
(7, 3, 'Crispy French Fries', 'Golden salted French fries', 65.00, 'Available'),
(8, 4, 'Coke 1.5L', '1.5L chilled Coca-Cola bottle', 75.00, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_ingredients`
--

CREATE TABLE `menu_item_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `menu_item_id` int(11) DEFAULT NULL,
  `inventory_item_id` int(11) DEFAULT NULL,
  `quantity_required` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_item_ingredients`
--

INSERT INTO `menu_item_ingredients` (`recipe_id`, `menu_item_id`, `inventory_item_id`, `quantity_required`) VALUES
(1, 1, 1, 1.00),
(2, 1, 3, 0.10),
(3, 1, 4, 0.15),
(4, 1, 6, 0.08),
(5, 1, 7, 0.08),
(6, 2, 1, 1.00),
(7, 2, 3, 0.10),
(8, 2, 4, 0.15),
(9, 2, 5, 0.12),
(10, 4, 2, 1.00),
(11, 4, 3, 0.15),
(12, 4, 4, 0.20),
(13, 4, 5, 0.10),
(14, 4, 6, 0.10),
(15, 4, 8, 0.10);

-- --------------------------------------------------------

--
-- Table structure for table `modifiers`
--

CREATE TABLE `modifiers` (
  `modifier_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `inventory_item_id` int(11) DEFAULT NULL,
  `additional_price` decimal(10,2) DEFAULT 0.00,
  `modifier_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modifiers`
--

INSERT INTO `modifiers` (`modifier_id`, `group_id`, `inventory_item_id`, `additional_price`, `modifier_name`) VALUES
(1, 1, NULL, 0.00, 'Original Thin Crust'),
(2, 1, 4, 45.00, 'Cheese Stuffed Crust'),
(3, 2, 4, 30.00, 'Extra Mozzarella Cheese'),
(4, 2, 5, 35.00, 'Extra Pepperoni');

-- --------------------------------------------------------

--
-- Table structure for table `modifier_groups`
--

CREATE TABLE `modifier_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `is_required` tinyint(1) DEFAULT 0,
  `min_selection` int(11) DEFAULT 0,
  `max_selection` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modifier_groups`
--

INSERT INTO `modifier_groups` (`group_id`, `group_name`, `is_required`, `min_selection`, `max_selection`) VALUES
(1, 'Crust Type', 1, 1, 1),
(2, 'Extra Toppings', 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `inventory_item_id` int(11) DEFAULT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `inventory_item_id`, `notification_type`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 5, 'Low Stock Warning', 'Pepperoni Slices inventory is approaching minimum stock limit.', 0, '2026-11-04 15:13:17'),
(2, 1, 7, 'Low Stock Warning', 'Pineapple Tidbits inventory is below minimum threshold.', 0, '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `pos_system_id` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `external_transaction_id` varchar(100) DEFAULT NULL,
  `order_type` varchar(50) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `pos_system_id`, `cashier_id`, `external_transaction_id`, `order_type`, `order_status`, `total_amount`, `order_date`) VALUES
(1, 2, 2, 'PK-PABAYO-202611-001', 'Delivery', 'Completed', 185.00, '2026-11-04 15:13:17'),
(2, 1, 3, 'PK-PABAYO-202611-002', 'Dine-In', 'Completed', 285.00, '2026-11-04 15:13:17'),
(3, 1, 2, 'PK-PABAYO-202611-003', 'Delivery', 'Completed', 185.00, '2026-11-04 15:13:17'),
(4, 1, 2, 'PK-PABAYO-202611-004', 'Dine-In', 'Completed', 360.00, '2026-11-04 15:13:17'),
(5, 2, 3, 'PK-PABAYO-202611-005', 'Dine-In', 'Completed', 430.00, '2026-11-04 15:13:17'),
(6, 2, 3, 'PK-PABAYO-202611-006', 'Dine-In', 'Completed', 175.00, '2026-11-04 15:13:17'),
(7, 2, 2, 'PK-PABAYO-202611-007', 'Takeout', 'Completed', 480.00, '2026-11-04 15:13:17'),
(8, 2, 2, 'PK-PABAYO-202611-008', 'Dine-In', 'Completed', 360.00, '2026-11-04 15:13:17'),
(9, 1, 3, 'PK-PABAYO-202611-009', 'Dine-In', 'Completed', 480.00, '2026-11-04 15:13:17'),
(10, 2, 2, 'PK-PABAYO-202611-010', 'Dine-In', 'Completed', 260.00, '2026-11-04 15:13:17'),
(11, 2, 2, 'PK-PABAYO-202611-011', 'Delivery', 'Completed', 150.00, '2026-11-04 15:13:17'),
(12, 1, 3, 'PK-PABAYO-202611-012', 'Takeout', 'Completed', 285.00, '2026-11-04 15:13:17'),
(13, 1, 2, 'PK-PABAYO-202611-013', 'Takeout', 'Completed', 360.00, '2026-11-04 15:13:17'),
(14, 1, 2, 'PK-PABAYO-202611-014', 'Takeout', 'Completed', 260.00, '2026-11-04 15:13:17'),
(15, 2, 3, 'PK-PABAYO-202611-015', 'Takeout', 'Completed', 185.00, '2026-11-04 15:13:17'),
(16, 1, 2, 'PK-PABAYO-202611-016', 'Takeout', 'Completed', 260.00, '2026-11-04 15:13:17'),
(17, 2, 2, 'PK-PABAYO-202611-017', 'Dine-In', 'Completed', 260.00, '2026-11-04 15:13:17'),
(18, 1, 3, 'PK-PABAYO-202611-018', 'Delivery', 'Completed', 195.00, '2026-11-04 15:13:17'),
(19, 1, 2, 'PK-PABAYO-202611-019', 'Delivery', 'Completed', 360.00, '2026-11-04 15:13:17'),
(20, 1, 3, 'PK-PABAYO-202611-020', 'Dine-In', 'Completed', 430.00, '2026-11-04 15:13:17'),
(21, 1, 3, 'PK-PABAYO-202611-021', 'Takeout', 'Completed', 185.00, '2026-11-04 15:13:17'),
(22, 1, 3, 'PK-PABAYO-202611-022', 'Dine-In', 'Completed', 285.00, '2026-11-04 15:13:17'),
(23, 1, 3, 'PK-PABAYO-202611-023', 'Takeout', 'Completed', 260.00, '2026-11-04 15:13:17'),
(24, 1, 3, 'PK-PABAYO-202611-024', 'Delivery', 'Completed', 175.00, '2026-11-04 15:13:17'),
(25, 2, 2, 'PK-PABAYO-202611-025', 'Dine-In', 'Completed', 360.00, '2026-11-04 15:13:17'),
(26, 1, 2, 'PK-PABAYO-202611-026', 'Takeout', 'Completed', 185.00, '2026-11-04 15:13:17'),
(27, 2, 2, 'PK-PABAYO-202611-027', 'Delivery', 'Completed', 360.00, '2026-11-04 15:13:17'),
(28, 2, 3, 'PK-PABAYO-202611-028', 'Dine-In', 'Completed', 260.00, '2026-11-04 15:13:17'),
(29, 2, 2, 'PK-PABAYO-202611-029', 'Takeout', 'Completed', 185.00, '2026-11-04 15:13:17'),
(30, 2, 3, 'PK-PABAYO-202611-030', 'Delivery', 'Completed', 260.00, '2026-11-04 15:13:17'),
(31, 1, 2, 'PK-PABAYO-202611-031', 'Delivery', 'Completed', 430.00, '2026-11-04 15:13:17'),
(32, 1, 3, 'PK-PABAYO-202611-032', 'Takeout', 'Completed', 480.00, '2026-11-04 15:13:17'),
(33, 2, 3, 'PK-PABAYO-202611-033', 'Dine-In', 'Completed', 175.00, '2026-11-04 15:13:17'),
(34, 1, 3, 'PK-PABAYO-202611-034', 'Dine-In', 'Completed', 285.00, '2026-11-04 15:13:17'),
(35, 2, 2, 'PK-PABAYO-202611-035', 'Takeout', 'Completed', 360.00, '2026-11-04 15:13:17'),
(36, 1, 2, 'PK-PABAYO-202611-036', 'Dine-In', 'Completed', 360.00, '2026-11-04 15:13:17'),
(37, 2, 3, 'PK-PABAYO-202611-037', 'Takeout', 'Completed', 430.00, '2026-11-04 15:13:17'),
(38, 2, 2, 'PK-PABAYO-202611-038', 'Delivery', 'Completed', 285.00, '2026-11-04 15:13:17'),
(39, 1, 3, 'PK-PABAYO-202611-039', 'Delivery', 'Completed', 260.00, '2026-11-04 15:13:17'),
(40, 2, 3, 'PK-PABAYO-202611-040', 'Takeout', 'Completed', 185.00, '2026-11-04 15:13:17'),
(41, 1, 3, 'PK-PABAYO-202611-041', 'Delivery', 'Completed', 360.00, '2026-11-04 15:13:17'),
(42, 1, 2, 'PK-PABAYO-202611-042', 'Takeout', 'Completed', 285.00, '2026-11-04 15:13:17'),
(43, 2, 3, 'PK-PABAYO-202611-043', 'Takeout', 'Completed', 430.00, '2026-11-04 15:13:17'),
(44, 2, 2, 'PK-PABAYO-202611-044', 'Takeout', 'Completed', 360.00, '2026-11-04 15:13:17'),
(45, 1, 3, 'PK-PABAYO-202611-045', 'Dine-In', 'Completed', 285.00, '2026-11-04 15:13:17'),
(46, 2, 2, 'PK-PABAYO-202611-046', 'Delivery', 'Completed', 260.00, '2026-11-04 15:13:17'),
(47, 1, 3, 'PK-PABAYO-202611-047', 'Dine-In', 'Completed', 185.00, '2026-11-04 15:13:17'),
(48, 2, 2, 'PK-PABAYO-202611-048', 'Takeout', 'Completed', 260.00, '2026-11-04 15:13:17'),
(49, 1, 3, 'PK-PABAYO-202611-049', 'Dine-In', 'Completed', 185.00, '2026-11-04 15:13:17'),
(50, 1, 2, 'PK-PABAYO-202611-050', 'Delivery', 'Completed', 360.00, '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `menu_item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `menu_item_id`, `quantity`, `item_price`, `subtotal`) VALUES
(1, 1, 1, 1, 185.00, 185.00),
(2, 2, 4, 1, 285.00, 285.00),
(3, 3, 1, 1, 185.00, 185.00),
(4, 4, 1, 1, 185.00, 185.00),
(5, 4, 3, 1, 175.00, 175.00),
(6, 5, 4, 1, 285.00, 285.00),
(7, 5, 1, 1, 185.00, 185.00),
(8, 6, 3, 1, 175.00, 175.00),
(9, 7, 2, 1, 195.00, 195.00),
(10, 7, 4, 1, 285.00, 285.00),
(11, 8, 1, 1, 185.00, 185.00),
(12, 8, 3, 1, 175.00, 175.00),
(13, 9, 2, 1, 195.00, 195.00),
(14, 9, 4, 1, 285.00, 285.00),
(15, 10, 1, 1, 185.00, 185.00),
(16, 10, 8, 1, 75.00, 75.00),
(17, 11, 8, 2, 75.00, 150.00),
(18, 12, 4, 1, 285.00, 285.00),
(19, 13, 1, 1, 185.00, 185.00),
(20, 13, 3, 1, 175.00, 175.00),
(21, 14, 1, 1, 185.00, 185.00),
(22, 14, 8, 1, 75.00, 75.00),
(23, 15, 1, 1, 185.00, 185.00),
(24, 16, 1, 1, 185.00, 185.00),
(25, 16, 8, 1, 75.00, 75.00),
(26, 17, 1, 1, 185.00, 185.00),
(27, 17, 8, 1, 75.00, 75.00),
(28, 18, 2, 1, 195.00, 195.00),
(29, 19, 1, 1, 185.00, 185.00),
(30, 19, 3, 1, 175.00, 175.00),
(31, 20, 4, 1, 285.00, 285.00),
(32, 20, 1, 1, 185.00, 185.00),
(33, 21, 1, 1, 185.00, 185.00),
(34, 22, 4, 1, 285.00, 285.00),
(35, 23, 1, 1, 185.00, 185.00),
(36, 23, 8, 1, 75.00, 75.00),
(37, 24, 3, 1, 175.00, 175.00),
(38, 25, 1, 1, 185.00, 185.00),
(39, 25, 3, 1, 175.00, 175.00),
(40, 26, 1, 1, 185.00, 185.00),
(41, 27, 1, 1, 185.00, 185.00),
(42, 27, 3, 1, 175.00, 175.00),
(43, 28, 1, 1, 185.00, 185.00),
(44, 28, 8, 1, 75.00, 75.00),
(45, 29, 1, 1, 185.00, 185.00),
(46, 30, 1, 1, 185.00, 185.00),
(47, 30, 8, 1, 75.00, 75.00),
(48, 31, 4, 1, 285.00, 285.00),
(49, 31, 1, 1, 185.00, 185.00),
(50, 32, 2, 1, 195.00, 195.00),
(51, 32, 4, 1, 285.00, 285.00),
(52, 33, 3, 1, 175.00, 175.00),
(53, 34, 4, 1, 285.00, 285.00),
(54, 35, 1, 1, 185.00, 185.00),
(55, 35, 3, 1, 175.00, 175.00),
(56, 36, 1, 1, 185.00, 185.00),
(57, 36, 3, 1, 175.00, 175.00),
(58, 37, 4, 1, 285.00, 285.00),
(59, 37, 1, 1, 185.00, 185.00),
(60, 38, 4, 1, 285.00, 285.00),
(61, 39, 1, 1, 185.00, 185.00),
(62, 39, 8, 1, 75.00, 75.00),
(63, 40, 1, 1, 185.00, 185.00),
(64, 41, 1, 1, 185.00, 185.00),
(65, 41, 3, 1, 175.00, 175.00),
(66, 42, 4, 1, 285.00, 285.00),
(67, 43, 4, 1, 285.00, 285.00),
(68, 43, 1, 1, 185.00, 185.00),
(69, 44, 1, 1, 185.00, 185.00),
(70, 44, 3, 1, 175.00, 175.00),
(71, 45, 4, 1, 285.00, 285.00),
(72, 46, 1, 1, 185.00, 185.00),
(73, 46, 8, 1, 75.00, 75.00),
(74, 47, 1, 1, 185.00, 185.00),
(75, 48, 1, 1, 185.00, 185.00),
(76, 48, 8, 1, 75.00, 75.00),
(77, 49, 1, 1, 185.00, 185.00),
(78, 50, 1, 1, 185.00, 185.00),
(79, 50, 3, 1, 175.00, 175.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_item_modifiers`
--

CREATE TABLE `order_item_modifiers` (
  `order_item_modifier_id` int(11) NOT NULL,
  `modifier_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `cashier_id`, `amount_paid`, `payment_method`, `payment_status`, `payment_date`) VALUES
(1, 1, 2, 185.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(2, 2, 3, 300.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(3, 3, 2, 200.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(4, 4, 2, 360.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(5, 5, 3, 500.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(6, 6, 3, 175.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(7, 7, 2, 500.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(8, 8, 2, 360.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(9, 9, 3, 480.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(10, 10, 2, 260.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(11, 11, 2, 150.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(12, 12, 3, 300.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(13, 13, 2, 360.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(14, 14, 2, 260.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(15, 15, 3, 200.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(16, 16, 2, 260.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(17, 17, 2, 260.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(18, 18, 3, 195.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(19, 19, 2, 360.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(20, 20, 3, 430.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(21, 21, 3, 200.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(22, 22, 3, 285.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(23, 23, 3, 260.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(24, 24, 3, 175.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(25, 25, 2, 360.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(26, 26, 2, 200.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(27, 27, 2, 360.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(28, 28, 3, 260.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(29, 29, 2, 185.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(30, 30, 3, 260.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(31, 31, 2, 430.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(32, 32, 3, 500.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(33, 33, 3, 175.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(34, 34, 3, 300.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(35, 35, 2, 360.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(36, 36, 2, 360.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(37, 37, 3, 430.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(38, 38, 2, 285.00, 'Credit Card', 'Completed', '2026-11-04 15:13:17'),
(39, 39, 3, 300.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(40, 40, 3, 185.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(41, 41, 3, 360.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(42, 42, 2, 285.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(43, 43, 3, 430.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(44, 44, 2, 360.00, 'GCash', 'Completed', '2026-11-04 15:13:17'),
(45, 45, 3, 300.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(46, 46, 2, 260.00, 'Maya', 'Completed', '2026-11-04 15:13:17'),
(47, 47, 3, 200.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(48, 48, 2, 300.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(49, 49, 3, 200.00, 'Cash', 'Completed', '2026-11-04 15:13:17'),
(50, 50, 2, 360.00, 'GCash', 'Completed', '2026-11-04 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `pos_sync_logs`
--

CREATE TABLE `pos_sync_logs` (
  `sync_id` int(11) NOT NULL,
  `pos_system_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `external_transaction_id` varchar(100) DEFAULT NULL,
  `sync_type` varchar(50) DEFAULT NULL,
  `sync_status` varchar(50) DEFAULT NULL,
  `sync_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `error_message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos_sync_logs`
--

INSERT INTO `pos_sync_logs` (`sync_id`, `pos_system_id`, `order_id`, `external_transaction_id`, `sync_type`, `sync_status`, `sync_date`, `error_message`) VALUES
(1, 2, 1, 'PK-PABAYO-202611-001', 'Order Sync', 'Success', '2026-11-04 15:13:17', NULL),
(2, 1, 2, 'PK-PABAYO-202611-002', 'Order Sync', 'Success', '2026-11-04 15:13:17', NULL),
(3, 1, 3, 'PK-PABAYO-202611-003', 'Order Sync', 'Success', '2026-11-04 15:13:17', NULL),
(4, 1, 4, 'PK-PABAYO-202611-004', 'Order Sync', 'Success', '2026-11-04 15:13:17', NULL),
(5, 2, 5, 'PK-PABAYO-202611-005', 'Order Sync', 'Success', '2026-11-04 15:13:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_systems`
--

CREATE TABLE `pos_systems` (
  `pos_system_id` int(11) NOT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `integration_method` varchar(100) DEFAULT NULL,
  `connection_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos_systems`
--

INSERT INTO `pos_systems` (`pos_system_id`, `system_name`, `integration_method`, `connection_status`) VALUES
(1, 'Pabayo Main Counter POS-01', 'LAN Local', 'Online'),
(2, 'Pabayo Express Counter POS-02', 'LAN Local', 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `transaction_id` int(11) NOT NULL,
  `inventory_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `account_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `role`, `account_status`) VALUES
(1, 'Juan Dela Cruz', 'manager.pabayo@pizzakid.ph', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeF123456789012345678901234567890', 'Manager', 'Active'),
(2, 'Maria Santos', 'cashier1.pabayo@pizzakid.ph', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeF123456789012345678901234567890', 'Cashier', 'Active'),
(3, 'Ana Reyes', 'cashier2.pabayo@pizzakid.ph', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeF123456789012345678901234567890', 'Cashier', 'Active'),
(4, 'Pedro Penduko', 'kitchen1.pabayo@pizzakid.ph', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeF123456789012345678901234567890', 'Kitchen Staff', 'Active'),
(5, 'Mark Bautista', 'kitchen2.pabayo@pizzakid.ph', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeF123456789012345678901234567890', 'Kitchen Staff', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cashiers`
--
ALTER TABLE `cashiers`
  ADD PRIMARY KEY (`cashier_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `pos_system_id` (`pos_system_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`inventory_item_id`);

--
-- Indexes for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `kitchen_updates`
--
ALTER TABLE `kitchen_updates`
  ADD PRIMARY KEY (`update_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`manager_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`menu_item_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `menu_item_ingredients`
--
ALTER TABLE `menu_item_ingredients`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `menu_item_id` (`menu_item_id`),
  ADD KEY `inventory_item_id` (`inventory_item_id`);

--
-- Indexes for table `modifiers`
--
ALTER TABLE `modifiers`
  ADD PRIMARY KEY (`modifier_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `inventory_item_id` (`inventory_item_id`);

--
-- Indexes for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `inventory_item_id` (`inventory_item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `pos_system_id` (`pos_system_id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `order_item_modifiers`
--
ALTER TABLE `order_item_modifiers`
  ADD PRIMARY KEY (`order_item_modifier_id`),
  ADD KEY `modifier_id` (`modifier_id`),
  ADD KEY `order_item_id` (`order_item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `pos_sync_logs`
--
ALTER TABLE `pos_sync_logs`
  ADD PRIMARY KEY (`sync_id`),
  ADD KEY `pos_system_id` (`pos_system_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pos_systems`
--
ALTER TABLE `pos_systems`
  ADD PRIMARY KEY (`pos_system_id`);

--
-- Indexes for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `inventory_item_id` (`inventory_item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cashiers`
--
ALTER TABLE `cashiers`
  MODIFY `cashier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `inventory_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kitchen_updates`
--
ALTER TABLE `kitchen_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `menu_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menu_item_ingredients`
--
ALTER TABLE `menu_item_ingredients`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `modifiers`
--
ALTER TABLE `modifiers`
  MODIFY `modifier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `order_item_modifiers`
--
ALTER TABLE `order_item_modifiers`
  MODIFY `order_item_modifier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pos_sync_logs`
--
ALTER TABLE `pos_sync_logs`
  MODIFY `sync_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pos_systems`
--
ALTER TABLE `pos_systems`
  MODIFY `pos_system_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cashiers`
--
ALTER TABLE `cashiers`
  ADD CONSTRAINT `cashiers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cashiers_ibfk_2` FOREIGN KEY (`pos_system_id`) REFERENCES `pos_systems` (`pos_system_id`);

--
-- Constraints for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  ADD CONSTRAINT `kitchen_staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `kitchen_updates`
--
ALTER TABLE `kitchen_updates`
  ADD CONSTRAINT `kitchen_updates_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `kitchen_updates_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `managers`
--
ALTER TABLE `managers`
  ADD CONSTRAINT `managers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `menu_item_ingredients`
--
ALTER TABLE `menu_item_ingredients`
  ADD CONSTRAINT `menu_item_ingredients_ibfk_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`menu_item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_item_ingredients_ibfk_2` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`inventory_item_id`);

--
-- Constraints for table `modifiers`
--
ALTER TABLE `modifiers`
  ADD CONSTRAINT `modifiers_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `modifier_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `modifiers_ibfk_2` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`inventory_item_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`inventory_item_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`pos_system_id`) REFERENCES `pos_systems` (`pos_system_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`cashier_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`menu_item_id`);

--
-- Constraints for table `order_item_modifiers`
--
ALTER TABLE `order_item_modifiers`
  ADD CONSTRAINT `order_item_modifiers_ibfk_1` FOREIGN KEY (`modifier_id`) REFERENCES `modifiers` (`modifier_id`),
  ADD CONSTRAINT `order_item_modifiers_ibfk_2` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`order_item_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`cashier_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pos_sync_logs`
--
ALTER TABLE `pos_sync_logs`
  ADD CONSTRAINT `pos_sync_logs_ibfk_1` FOREIGN KEY (`pos_system_id`) REFERENCES `pos_systems` (`pos_system_id`),
  ADD CONSTRAINT `pos_sync_logs_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD CONSTRAINT `stock_transactions_ibfk_1` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`inventory_item_id`),
  ADD CONSTRAINT `stock_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
