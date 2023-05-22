-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2022 at 12:41 PM
-- Server version: 10.3.32-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firewing_demo_stackfood_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `name`, `price`, `created_at`, `updated_at`, `restaurant_id`, `status`) VALUES
(1, 'Cheese', 10.00, '2021-08-21 14:19:15', '2021-08-21 14:19:15', 1, 1),
(2, 'Cheese', 15.00, '2021-08-21 14:19:43', '2021-08-21 14:19:43', 2, 1),
(3, 'Cheese', 15.00, '2021-08-21 14:20:33', '2021-08-21 14:20:33', 9, 1),
(4, 'Coke', 10.00, '2021-08-21 14:21:51', '2021-08-21 14:21:51', 9, 1),
(5, 'Extra Spice', 5.00, '2021-08-21 14:23:05', '2021-08-21 14:23:05', 9, 1),
(6, 'Cheese', 10.00, '2021-08-21 14:29:48', '2021-08-21 14:29:48', 14, 1),
(7, 'Extra Spice', 5.00, '2021-08-21 14:30:01', '2021-08-21 14:30:01', 14, 1),
(8, 'Extra Chicken', 15.00, '2021-08-21 14:30:18', '2021-08-21 14:30:18', 14, 1),
(9, 'Extra Beef', 50.00, '2021-08-21 15:21:50', '2021-08-21 15:21:50', 14, 1),
(10, 'SALAD', 10.00, '2021-08-21 15:22:09', '2021-08-21 15:22:09', 14, 1),
(11, 'Sauce', 5.00, '2021-08-21 15:22:31', '2021-08-21 15:22:31', 14, 1),
(12, 'salad', 10.00, '2021-08-21 15:27:11', '2021-08-21 15:27:11', 1, 1),
(13, 'extra beef', 40.00, '2021-08-21 15:27:32', '2021-08-21 15:27:32', 1, 1),
(14, 'extra chicken', 30.00, '2021-08-21 15:27:45', '2021-08-21 15:27:45', 1, 1),
(15, 'sauce', 5.00, '2021-08-21 15:27:55', '2021-08-21 15:27:55', 1, 1),
(16, 'Coke', 15.00, '2021-08-21 15:41:15', '2021-08-21 15:41:15', 13, 1),
(17, 'Pepsi', 18.00, '2021-08-21 15:41:30', '2021-08-21 15:41:30', 13, 1),
(18, 'Extra Cheese', 19.00, '2021-08-21 15:44:11', '2021-08-21 15:44:11', 13, 1),
(19, 'Extra Chicken', 14.00, '2021-08-21 16:07:48', '2021-08-21 16:07:48', 13, 1),
(20, 'Extra Meat', 18.00, '2021-08-21 16:07:59', '2021-08-21 16:07:59', 13, 1),
(21, 'Sauce', 5.00, '2021-08-21 16:13:10', '2021-08-21 16:13:10', 8, 1),
(22, 'Extra Chicken', 39.00, '2021-08-21 16:13:25', '2021-08-21 16:13:25', 8, 1),
(23, 'Extra Beef', 50.00, '2021-08-21 16:13:35', '2021-08-21 16:13:35', 8, 1),
(24, 'salad', 10.00, '2021-08-21 16:13:44', '2021-08-21 16:13:44', 8, 1),
(25, 'Coke', 15.00, '2021-08-21 16:18:05', '2021-08-21 16:18:05', 14, 1),
(26, 'Pepsi', 18.00, '2021-08-21 16:18:29', '2021-08-21 16:18:29', 14, 1),
(27, 'Tomato Sauce', 10.00, '2021-08-21 17:01:41', '2021-08-21 17:03:37', 10, 1),
(28, 'Hot Sauce', 12.00, '2021-08-21 17:03:52', '2021-08-21 17:03:52', 10, 1),
(29, 'Taco Sauce', 11.00, '2021-08-21 17:04:26', '2021-08-21 17:04:26', 10, 1),
(30, 'Coke', 12.00, '2021-08-21 17:29:24', '2021-08-21 17:29:24', 2, 1),
(31, 'Pepsi', 18.00, '2021-08-21 17:29:34', '2021-08-21 17:29:34', 2, 1),
(32, 'Sauce', 11.00, '2021-08-21 17:29:59', '2021-08-21 17:29:59', 2, 1),
(33, 'Extra Spice', 9.00, '2021-08-21 17:32:13', '2021-08-21 17:32:13', 2, 1),
(34, 'Extra Meat', 14.00, '2021-08-21 17:32:24', '2021-08-21 17:32:24', 2, 1),
(35, 'Extra Chicken', 12.00, '2021-08-21 17:32:35', '2021-08-21 17:32:35', 2, 1),
(36, 'Tomato Sauce', 10.00, '2021-08-21 17:44:58', '2021-08-21 17:44:58', 6, 1),
(37, 'Hot Sauce', 12.00, '2021-08-21 17:45:07', '2021-08-21 17:45:07', 6, 1),
(38, 'Soft Drinks', 20.00, '2021-08-21 17:45:48', '2021-08-21 17:45:48', 6, 1),
(39, 'Tomato Sauce', 10.00, '2021-08-21 18:20:37', '2021-08-21 18:20:37', 3, 1),
(40, 'Soft Drinks', 20.00, '2021-08-21 20:26:27', '2021-08-21 20:26:27', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'Jhon', 'Doe', '01700000000', 'admin@admin.com', '2021-08-22-61214c4e9e0cb.png', '$2a$12$NQBXTu9.U.jS0McEJPVEZuVcC2eAorHB8vQXCPlbcXuJM/mb9RpfO', 'LM8Ti4yhDa6CjoEVtNVAvtVb366OR4PQT5hsP0uS54RXleKuaqPhZpAqmJlf', '2021-05-08 04:30:27', '2021-08-22 00:56:14', 1, NULL),
(2, 'Monali', 'Khan', '+8801254444444', 'test.employee@gmail.com', '2021-08-22-61228bc40bf5b.png', '$2y$10$.5lp2mMOMOGUJK2aFB6YO.3Gd.eua/KYUDXHQCzWPLHaNVro8rX8S', NULL, '2021-08-22 23:39:16', '2021-08-22 23:39:16', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(2, 'Customer Care Executive', '[\"customerList\",\"deliveryman\",\"order\",\"restaurant\"]', 1, '2021-08-22 23:32:29', '2021-08-22 23:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `digital_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `manual_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `total_commission_earning`, `digital_received`, `manual_received`, `created_at`, `updated_at`, `delivery_charge`) VALUES
(1, 1, 1788.11, 14938.64, 2211.90, '2021-08-21 13:54:22', '2022-01-20 18:25:32', 29638.84);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2021-08-20 20:57:27', '2021-08-20 20:57:27'),
(2, 'Capacity', '2021-08-20 20:57:50', '2021-08-20 20:57:50'),
(3, 'Type', '2021-12-05 18:48:51', '2021-12-05 18:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`) VALUES
(1, 'Offer', 'restaurant_wise', '2021-08-20-611fd481acaf1.png', 1, '1', '2021-08-20 21:55:49', '2021-08-20 22:12:49', 1),
(2, 'Test Banner', 'restaurant_wise', '2021-08-21-611ff25c7385f.png', 1, '4', '2021-08-20 22:02:24', '2021-08-21 00:20:12', 1),
(4, 'Fast Delivery', 'restaurant_wise', '2021-08-21-612003b75c7f6.png', 1, '2', '2021-08-21 01:33:28', '2021-08-21 01:34:15', 1),
(5, 'Local', 'restaurant_wise', '2021-08-21-612003fc6f492.png', 1, '6', '2021-08-21 01:35:24', '2021-08-21 01:35:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-07-01 15:51:17', '2021-07-01 15:51:17'),
(2, 'stripe', '{\"status\":\"1\",\"api_key\":\"sk_test_4eC39HqLyjWDarjtT1zdp7dc\",\"published_key\":\"pk_test_TYooMQauvdEDq54NiTphI7jx\"}', '2021-05-11 03:57:02', '2021-09-08 11:28:06'),
(4, 'mail_config', '{\"name\":\"Efood multivendor\",\"host\":\"mail.6amtech.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"info@6amtech.com\",\"email_id\":\"info@6amtech.com\",\"encryption\":\"tls\",\"password\":\"K@Yb.3+r1BVs\"}', NULL, '2021-07-01 14:24:07'),
(5, 'fcm_project_id', 'e-food-9e6e3', NULL, NULL),
(6, 'push_notification_key', 'AAAA9Gb8H_I:APA91bHgVLGopGJibQIPZHcLT8JJz_UbryesnRE6rz4rqs6McQyCZ2A9LcdnclZd_3CqdwPcaxaEUphO42OJB_-JdK0_JLopXCo8Ubl2ABMql_BCysLoCj4k-iIOYXd3_dYIvuB8cEee', NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Your order is successfully placed\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Your order is confirmed\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Your order is started for cooking\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"Your food is ready for delivery\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"Your order is delivered\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":1,\"message\":\"Your order has been assigned to a delivery man\"}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":1,\"message\":\"Your order is picked up by delivery man\"}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":\"Order delivered successfully\"}', NULL, NULL),
(15, 'terms_and_conditions', '<p>This is a test Teams &amp; Conditions<br />\r\n<br />\r\nThese terms of use (the &quot;Terms of Use&quot;) govern your use of our website www.evaly.com.bd (the &quot;Website&quot;) and our &quot;StackFood&quot; application for mobile and handheld devices (the &quot;App&quot;). The Website and the App are jointly referred to as the &quot;Platform&quot;. Please read these Terms of Use carefully before you use the services. If you do not agree to these Terms of Use, you may not use the services on the Platform, and we request you to uninstall the App. By installing, downloading and/or even merely using the Platform, you shall be contracting with StackFood and you provide your acceptance to the Terms of Use and other StackFood policies (including but not limited to the Cancellation &amp; Refund Policy, Privacy Policy etc.) as posted on the Platform from time to time, which takes effect on the date on which you download, install or use the Services, and create a legally binding arrangement to abide by the same. The Platforms will be used by (i) natural persons who have reached 18 years of age and (ii) corporate legal entities, e.g companies. Where applicable, these Terms shall be subject to country-specific provisions as set out herein.</p>\r\n\r\n<h3>USE OF PLATFORM AND SERVICES</h3>\r\n\r\n<p>All commercial/contractual terms are offered by and agreed to between Buyers and Merchants alone. The commercial/contractual terms include without limitation to price, taxes, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. StackFood does not have any kind of control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial/contractual terms between the Buyers and Merchants. StackFood may, however, offer support services to Merchants in respect to order fulfilment, payment collection, call centre, and other services, pursuant to independent contracts executed by it with the Merchants. eFood is not responsible for any non-performance or breach of any contract entered into between Buyers and Merchants on the Platform. eFood cannot and does not guarantee that the concerned Buyers and/or Merchants shall perform any transaction concluded on the Platform. eFood is not responsible for unsatisfactory services or non-performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.</p>\r\n\r\n<p>StackFood&nbsp;is operating an e-commerce platform and assumes and operates the role of facilitator, and does not at any point of time during any transaction between Buyer and Merchant on the Platform come into or take possession of any of the products or services offered by Merchant. At no time shall StackFood hold any right, title or interest over the products nor shall StackFood have any obligations or liabilities in respect of such contract entered into between Buyer and Merchant. You agree and acknowledge that we shall not be responsible for:</p>\r\n\r\n<ul>\r\n	<li>The goods provided by the shops or restaurants including, but not limited, serving of food orders suiting your requirements and needs;</li>\r\n	<li>The Merchant&quot;s goods not being up to your expectations or leading to any loss, harm or damage to you;</li>\r\n	<li>The availability or unavailability of certain items on the menu;</li>\r\n	<li>The Merchant serving the incorrect orders.</li>\r\n</ul>\r\n\r\n<p>The details of the menu and price list available on the Platform are based on the information provided by the Merchants and we shall not be responsible for any change or cancellation or unavailability. All Menu &amp; Food Images used on our platforms are only representative and shall/might not match with the actual Menu/Food Ordered, StackFood shall not be responsible or Liable for any discrepancies or variations on this aspect.</p>\r\n\r\n<h3>Personal Information that you provide</h3>\r\n\r\n<p>If you want to use our service, you must create an account on our Site. To establish your account, we will ask for personally identifiable information that can be used to contact or identify you, which may include your name, phone number, and e-mail address. We may also collect demographic information about you, such as your zip code, and allow you to submit additional information that will be part of your profile. Other than basic information that we need to establish your account, it will be up to you to decide how much information to share as part of your profile. We encourage you to think carefully about the information that you share and we recommend that you guard your identity and your sensitive information. Of course, you can review and revise your profile at any time.</p>\r\n\r\n<p>You understand that delivery periods quoted to you at the time of confirming the order is an approximate estimate and may vary. We shall not be responsible for any delay in the delivery of your order due to the delay at seller/merchant end for order processing or any other unavoidable circumstances.</p>\r\n\r\n<p>Your order shall be only delivered to the address designated by you at the time of placing the order on the Platform. We reserve the right to cancel the order, in our sole discretion, in the event of any change to the place of delivery and you shall not be entitled to any refund for the same. Delivery in the event of change of the delivery location shall be at our sole discretion and reserve the right to charge with additional delivery fee if required.</p>\r\n\r\n<p>You shall undertake to provide adequate directions, information and authorizations to accept delivery. In the event of any failure to accept delivery, failure to deliver within the estimated time due to your failure to provide appropriate instructions, or authorizations, then such goods shall be deemed to have been delivered to you and all risk and responsibility in relation to such goods shall pass to you and you shall not be entitled to any refund for the same. Our decision in relation to this shall be final and binding. You understand that our liability ends once your order has been delivered to you.</p>\r\n\r\n<p>You might be required to provide your credit or debit card details to the approved payment gateways while making the payment. In this regard, you agree to provide correct and accurate credit/ debit card details to the approved payment gateways for availing the Services. You shall not use the credit/ debit card which is not lawfully owned by you, i.e. in any transaction, you must use your own credit/ debit card. The information provided by you shall not be utilized or shared with any third party unless required in relation to fraud verifications or by law, regulation or court order. You shall be solely responsible for the security and confidentiality of your credit/ debit card details. We expressly disclaim all liabilities that may arise as a consequence of any unauthorized use of your credit/ debit card. You agree that the Services shall be provided by us only during the working hours of the relevant Merchants.</p>\r\n\r\n<h3>ACTIVITIES PROHIBITED ON THE PLATFORM</h3>\r\n\r\n<p>The following is a partial list of the kinds of conduct that are illegal or prohibited on the Websites. StackFood reserves the right to investigate and take appropriate legal action/s against anyone who, in StackFood sole discretion, engages in any of the prohibited activities. Prohibited activities include &mdash; but are not limited to &mdash; the following:</p>\r\n\r\n<ul>\r\n	<li>Using the Websites for any purpose in violation of laws or regulations;</li>\r\n	<li>Posting Content that infringes the intellectual property rights, privacy rights, publicity rights, trade secret rights, or any other rights of any party;</li>\r\n	<li>Posting Content that is unlawful, obscene, defamatory, threatening, harassing, abusive, slanderous, hateful, or embarrassing to any other person or entity as determined by StackFood in its sole discretion or pursuant to local community standards;</li>\r\n	<li>Posting Content that constitutes cyber-bullying, as determined by StackFood in its sole discretion;</li>\r\n	<li>Posting Content that depicts any dangerous, life-threatening, or otherwise risky behavior;</li>\r\n	<li>Posting telephone numbers, street addresses, or last names of any person;</li>\r\n	<li>Posting URLs to external websites or any form of HTML or programming code;</li>\r\n	<li>Posting anything that may be &quot;spam,&quot; as determined by StackFood in its sole discretion;</li>\r\n	<li>Impersonating another person when posting Content;</li>\r\n	<li>Harvesting or otherwise collecting information about others, including email addresses, without their consent;</li>\r\n	<li>Allowing any other person or entity to use your identification for posting or viewing comments;</li>\r\n	<li>Harassing, threatening, stalking, or abusing any person;</li>\r\n	<li>Engaging in any other conduct that restricts or inhibits any other person from using or enjoying the Websites, or which, in the sole discretion of StackFood , exposes eFood or any of its customers, suppliers, or any other parties to any liability or detriment of any type; or</li>\r\n	<li>Encouraging other people to engage in any prohibited activities as described herein.</li>\r\n</ul>\r\n\r\n<p>StackFood&nbsp;reserves the right but is not obligated to do any or all of the following:</p>\r\n\r\n<ul>\r\n	<li>Investigate an allegation that any Content posted on the Websites does not conform to these Terms of Use and determine in its sole discretion to remove or request the removal of the Content;</li>\r\n	<li>Remove Content which is abusive, illegal, or disruptive, or that otherwise fails to conform with these Terms of Use;</li>\r\n	<li>Terminate a user&#39;s access to the Websites upon any breach of these Terms of Use;</li>\r\n	<li>Monitor, edit, or disclose any Content on the Websites; and</li>\r\n	<li>Edit or delete any Content posted on the Websites, regardless of whether such Content violates these standards.</li>\r\n</ul>\r\n\r\n<h3>AMENDMENTS</h3>\r\n\r\n<p>StackFood&nbsp;reserves the right to change or modify these Terms (including our policies which are incorporated into these Terms) at any time by posting changes on the Platform. You are strongly recommended to read these Terms regularly. You will be deemed to have agreed to the amended Terms by your continued use of the Platforms following the date on which the amended Terms are posted.</p>\r\n\r\n<h3>PAYMENT</h3>\r\n\r\n<p>StackFood&nbsp;reserves the right to offer additional payment methods and/or remove existing payment methods at any time in its sole discretion. If you choose to pay using an online payment method, the payment shall be processed by our third party payment service provider(s). With your consent, your credit card / payment information will be stored with our third party payment service provider(s) for future orders. StackFood does not store your credit card or payment information. You must ensure that you have sufficient funds on your credit and debit card to fulfil payment of an Order. Insofar as required, StackFood takes responsibility for payments made on our Platforms including refunds, chargebacks, cancellations and dispute resolution, provided if reasonable and justifiable and in accordance with these Terms.</p>\r\n\r\n<h3>CANCELLATION</h3>\r\n\r\n<p>StackFood&nbsp;can cancel any order anytime due to the foods/products unavailability, out of coverage area and any other unavoidable circumstances.</p>', NULL, '2021-08-22 01:48:01'),
(16, 'business_name', 'StackFood', NULL, NULL),
(17, 'currency', 'USD', NULL, NULL),
(18, 'logo', '2021-08-20-611fc89a8d30b.png', NULL, NULL),
(19, 'phone', '01700000000', NULL, NULL),
(20, 'email_address', 'admin@gmail.com', NULL, NULL),
(21, 'address', '101, Dhaka, 1207', NULL, NULL),
(22, 'footer_text', 'Demo footer text @ 2021', NULL, NULL),
(23, 'customer_verification', '0', NULL, NULL),
(24, 'map_api_key', 'AIzaSyDrUK3f60CHz23cGXrjHTwlFUG9u4EkYI8', NULL, NULL),
(25, 'about_us', '<p>Lorem <strong>ipsum </strong>dolor sit amet, <em><strong>consectetur </strong></em>adipiscing elit. <em>Cras </em>dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, <a href=\"http://google.com\">suscipit </a>metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>', NULL, '2021-07-28 07:09:19'),
(26, 'privacy_policy', '<h2>This is a Demo Privacy Policy</h2>\r\n\r\n<p>This policy explains how StackFood&nbsp;website and related applications (the &ldquo;Site&rdquo;, &ldquo;we&rdquo; or &ldquo;us&rdquo;) collects, uses, shares and protects the personal information that we collect through this site or different channels. StackFood has established the site to link up the users who need foods or grocery items to be shipped or delivered by the riders from the affiliated restaurants or shops to the desired location. This policy also applies to any mobile applications that we develop for use with our services on the Site, and references to this &ldquo;Site&rdquo;, &ldquo;we&rdquo; or &ldquo;us&rdquo; is intended to also include these mobile applications. Please read below to learn more about our information policies. By using this Site, you agree to these policies.</p>\r\n\r\n<h2>How the Information is collected</h2>\r\n\r\n<h3>Information provided by web browser</h3>\r\n\r\n<p>You have to provide us with personal information like your name, contact no, mailing address and email id, our app will also fetch your location information in order to give you the best service. Like many other websites, we may record information that your web browser routinely shares, such as your browser type, browser language, software and hardware attributes, the date and time of your visit, the web page from which you came, your Internet Protocol address and the geographic location associated with that address, the pages on this Site that you visit and the time you spent on those pages. This will generally be anonymous data that we collect on an aggregate basis.</p>\r\n\r\n<h3>Personal Information that you provide</h3>\r\n\r\n<p>If you want to use our service, you must create an account on our Site. To establish your account, we will ask for personally identifiable information that can be used to contact or identify you, which may include your name, phone number, and e-mail address. We may also collect demographic information about you, such as your zip code, and allow you to submit additional information that will be part of your profile. Other than basic information that we need to establish your account, it will be up to you to decide how much information to share as part of your profile. We encourage you to think carefully about the information that you share and we recommend that you guard your identity and your sensitive information. Of course, you can review and revise your profile at any time.</p>\r\n\r\n<h3>Payment Information</h3>\r\n\r\n<p>To make the payment online for availing our services, you have to provide the bank account, mobile financial service (MFS), debit card, credit card information to the StackFood platform.</p>\r\n\r\n<h2>How the Information is collected</h2>\r\n\r\n<h3>Session and Persistent Cookies</h3>\r\n\r\n<p>Cookies are small text files that are placed on your computer by websites that you visit. They are widely used in order to make websites work, or work more efficiently, as well as to provide information to the owners of the site. As is commonly done on websites, we may use cookies and similar technology to keep track of our users and the services they have elected. We use both &ldquo;session&rdquo; and &ldquo;persistent&rdquo; cookies. Session cookies are deleted after you leave our website and when you close your browser. We use data collected with session cookies to enable certain features on our Site, to help us understand how users interact with our Site, and to monitor at an aggregate level Site usage and web traffic routing. We may allow business partners who provide services to our Site to place cookies on your computer that assist us in analyzing usage data. We do not allow these business partners to collect your personal information from our website except as may be necessary for the services that they provide.</p>\r\n\r\n<h3>Web Beacons</h3>\r\n\r\n<p>We may also use web beacons or similar technology to help us track the effectiveness of our communications.</p>\r\n\r\n<h3>Advertising Cookies</h3>\r\n\r\n<p>We may use third parties, such as Google, to serve ads about our website over the internet. These third parties may use cookies to identify ads that may be relevant to your interest (for example, based on your recent visit to our website), to limit the number of times that you see an ad, and to measure the effectiveness of the ads.</p>\r\n\r\n<h3>Google Analytics</h3>\r\n\r\n<p>We may also use Google Analytics or a similar service to gather statistical information about the visitors to this Site and how they use the Site. This, also, is done on an anonymous basis. We will not try to associate anonymous data with your personally identifiable data. If you would like to learn more about Google Analytics, please click here.</p>', NULL, '2021-08-22 01:49:58'),
(27, 'minimum_shipping_charge', '10', NULL, NULL),
(28, 'per_km_shipping_charge', '2', NULL, NULL),
(29, 'digital_payment', '{\"status\":\"1\"}', '2021-07-01 14:27:38', '2021-08-22 00:47:42'),
(30, 'ssl_commerz_payment', '{\"status\":\"1\",\"store_id\":\"custo5cc042f7abf4c\",\"store_password\":\"custo5cc042f7abf4c@ssl\"}', '2021-07-04 15:41:24', '2021-07-04 16:13:54'),
(31, 'razor_pay', '{\"status\":\"1\",\"razor_key\":\"rzp_test_Vio27YvAonerHa\",\"razor_secret\":\"92BIuLdPAkDYx7Bbc9IzqSES\"}', '2021-07-04 15:41:28', '2021-07-04 16:14:37'),
(32, 'paypal', '{\"status\":\"1\",\"paypal_client_id\":\"AabIbRZ97J0GHt0xf_DJj3u1dp6MU9boJGwnRY7OZ6fqBJVsrxd7PaBqqi6OGTYe2e4N4dWkYOkFSNtM\",\"paypal_secret\":\"EIeb5GszxCqanj964p4HYBQ5HMx6TwUGedqY6zdfJqlV-TQMF-cgIP2kZP6d_ZgbS3qjiVJxQH1X6wPt\"}', '2021-07-04 15:41:34', '2021-07-04 16:14:58'),
(33, 'paystack', '{\"status\":\"1\",\"publicKey\":\"sk_test_6eec6c4373b17e031388e60c43153426f15b560e\",\"secretKey\":\"pk_test_9a51c1e76338a611666c2439924b5c21976d7548\",\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":\"showrov2185@gmail.com\"}', '2021-07-04 15:41:42', '2021-07-04 16:16:04'),
(34, 'senang_pay', '{\"status\":\"1\",\"secret_key\":\"3464-669\",\"published_key\":null,\"merchant_id\":\"635161855028588\"}', '2021-07-04 15:41:48', '2021-07-04 16:15:37'),
(35, 'order_handover_message', '{\"status\":1,\"message\":\"Delivery man is on the way\"}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Order is canceled by your request\"}', NULL, NULL),
(37, 'timezone', 'Asia/Dhaka', NULL, NULL),
(38, 'order_delivery_verification', '0', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '10', NULL, NULL),
(44, 'country', 'US', NULL, NULL),
(45, 'app_url', 'https://www.google.com', NULL, NULL),
(46, 'default_location', '{\"lat\":\"23.76469684059319\",\"lng\":\"90.3514959774026\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":\"ACbf855229b8b2e5d02cad58e116365164\",\"token\":\"46b9779af3aa3e10a3d2fea800cb3b15\",\"from\":\"+12312992176\",\"otp_template\":\"Your otp is #OTP#.\"}', '2021-08-22 01:09:40', '2021-08-22 01:09:40'),
(48, 'nexmo_sms', '{\"status\":0,\"api_key\":\"5923ec09\",\"api_secret\":\"lkryf6xhyBzhftmj\",\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":\"+8801723019985\",\"otp_template\":\"Your otp is #OTP#.\"}', '2021-08-19 17:00:20', '2021-08-19 17:00:20'),
(49, '2factor_sms', '{\"status\":0,\"api_key\":\"aabf4e9c-f55f-11eb-85d5-0200cd936042\"}', '2021-08-19 17:00:20', '2021-08-19 17:00:20'),
(50, 'msg91_sms', '{\"status\":0,\"template_id\":\"611e267a897b2022f5561052\",\"authkey\":\"365307AW0mawSKCda610b8e5aP1\"}', '2021-08-19 17:00:20', '2021-08-19 17:00:20'),
(51, 'free_delivery_over', '1000', NULL, NULL),
(52, 'maintenance_mode', '0', '2021-09-08 15:44:28', '2022-01-11 13:35:22'),
(53, 'app_minimum_version_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(54, 'app_minimum_version_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(55, 'app_url_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(56, 'app_url_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(57, 'flutterwave', '{\"status\":1,\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(58, 'dm_maximum_orders', '2', '2021-09-24 17:46:13', '2021-09-24 17:46:13'),
(59, 'order_confirmation_model', 'deliveryman', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(60, 'popular_food', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(61, 'popular_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(62, 'new_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(64, 'map_api_key_server', 'AIzaSyA4sgE7JsbiOlqVNzXuNLpkOoDYrBNDRH8', NULL, NULL),
(66, 'most_reviewed_foods', '1', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(67, 'landing_page_text', '{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(68, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(69, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(70, 'testimonial', '[{\"img\":\"img-1.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-2.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-3.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-4.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(71, 'landing_page_images', '{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(72, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(73, 'admin_order_notification', '1', NULL, NULL),
(74, 'show_dm_earning', '1', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(75, 'canceled_by_deliveryman', '1', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(76, 'canceled_by_restaurant', '1', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(77, 'timeformat', '24', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(78, 'toggle_veg_non_veg', '1', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(79, 'toggle_dm_registration', '1', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(80, 'toggle_restaurant_registration', '1', '2022-01-11 13:19:36', '2022-01-11 13:19:36'),
(81, 'recaptcha', '{\"status\":\"1\",\"site_key\":\"6LeIQgYeAAAAAFKEP5fxYiFFtDVO9A5sT-mnmNZc\",\"secret_key\":\"6LeIQgYeAAAAAC8jrBDZvbC4nYFJpVQMuesA0m5t\"}', '2022-01-11 13:33:43', '2022-01-11 13:33:43');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `image`, `description`, `status`, `admin_id`, `created_at`, `updated_at`, `start_date`, `end_date`, `start_time`, `end_time`) VALUES
(1, 'Mega Sale', '2021-08-21-6120028199deb.png', 'This is a test Campaign by admin. You can join for testing purposes only. Offer your best food and increase your earnings.', 1, NULL, '2021-08-20 21:54:59', '2021-08-21 01:29:05', '2021-08-20', '2025-02-20', '00:01:00', '23:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_restaurant`
--

CREATE TABLE `campaign_restaurant` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_restaurant`
--

INSERT INTO `campaign_restaurant` (`campaign_id`, `restaurant_id`) VALUES
(1, 1),
(1, 3),
(1, 6),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`) VALUES
(5, 'Burger', '2021-08-20-611fbe0e334c5.png', 0, 0, 1, '2021-08-20 20:37:02', '2021-08-20 20:37:02', 0),
(6, 'Biriyani', '2021-08-20-611fbeadbf729.png', 0, 0, 1, '2021-08-20 20:39:41', '2021-08-20 20:39:41', 0),
(7, 'Asian', '2021-08-20-611fbebbc8db2.png', 0, 0, 1, '2021-08-20 20:39:55', '2021-08-20 20:39:55', 0),
(8, 'Cake', '2021-08-20-611fbecb2b870.png', 0, 0, 1, '2021-08-20 20:40:11', '2021-08-20 20:40:11', 0),
(9, 'Coffee & Drinks', '2021-08-20-611fbede98fba.png', 0, 0, 1, '2021-08-20 20:40:30', '2021-08-20 20:40:30', 0),
(10, 'Chinese', '2021-08-20-611fbf1b426e1.png', 0, 0, 1, '2021-08-20 20:41:31', '2021-08-20 20:41:31', 0),
(11, 'Fast Food', '2021-08-20-611fbf30f1a68.png', 0, 0, 1, '2021-08-20 20:41:52', '2021-08-20 20:41:52', 0),
(12, 'Kabab & More', '2021-08-20-611fbf491f625.png', 0, 0, 1, '2021-08-20 20:42:17', '2021-08-20 20:42:17', 0),
(13, 'Indian', '2021-08-20-611fbf6a9a159.png', 0, 0, 1, '2021-08-20 20:42:50', '2021-08-20 20:42:50', 0),
(14, 'Noodles', '2021-08-20-611fbf779aef1.png', 0, 0, 1, '2021-08-20 20:43:03', '2021-08-20 20:43:03', 0),
(15, 'Mexican Food', '2021-08-20-611fbf96910eb.png', 0, 0, 1, '2021-08-20 20:43:34', '2021-08-20 20:43:34', 0),
(16, 'Pasta', '2021-08-20-611fbfa397c7c.png', 0, 0, 1, '2021-08-20 20:43:47', '2021-08-20 20:43:47', 0),
(17, 'Pizza', '2021-08-20-611fbfb0af526.png', 0, 0, 1, '2021-08-20 20:44:00', '2021-08-20 20:44:00', 0),
(18, 'Snacks', '2021-08-20-611fbfbc0e2ed.png', 0, 0, 1, '2021-08-20 20:44:12', '2021-08-20 20:44:12', 0),
(19, 'Thai', '2021-08-20-611fbfc6ac515.png', 0, 0, 1, '2021-08-20 20:44:22', '2021-08-20 20:44:22', 0),
(20, 'Varieties', '2021-08-20-611fbfd13f7db.png', 0, 0, 1, '2021-08-20 20:44:33', '2021-08-20 20:44:33', 0),
(24, 'Kubie Burger', 'def.png', 5, 1, 1, '2021-08-20 20:46:55', '2021-08-20 20:46:55', 0),
(25, 'Steamed Cheese', 'def.png', 5, 1, 1, '2021-08-20 20:47:28', '2021-08-20 20:47:28', 0),
(26, 'Theta Burger', 'def.png', 5, 1, 1, '2021-08-20 20:47:40', '2021-08-20 20:47:40', 0),
(27, 'Nutburger', 'def.png', 5, 1, 1, '2021-08-20 20:47:51', '2021-08-20 20:47:51', 0),
(28, 'Pimento Cheese', 'def.png', 5, 1, 1, '2021-08-20 20:48:13', '2021-08-20 20:48:13', 0),
(29, 'Pound Cake', 'def.png', 8, 1, 1, '2021-08-20 20:54:43', '2021-08-20 20:54:43', 0),
(30, 'Yellow Butter', 'def.png', 8, 1, 1, '2021-08-20 20:54:52', '2021-08-20 20:54:52', 0),
(31, 'Red Velvet', 'def.png', 8, 1, 1, '2021-08-20 20:55:03', '2021-08-20 20:55:03', 0),
(32, 'Black Coffee', 'def.png', 9, 1, 1, '2021-08-20 20:55:42', '2021-08-20 20:55:42', 0),
(33, 'Robusta', 'def.png', 9, 1, 1, '2021-08-20 20:55:50', '2021-08-20 20:55:50', 0),
(34, 'Cappuccino', 'def.png', 9, 1, 1, '2021-08-20 20:56:01', '2021-08-20 20:56:01', 0),
(35, 'Macchiato', 'def.png', 9, 1, 1, '2021-08-20 20:56:08', '2021-08-20 20:56:08', 0),
(36, 'Soft Drinks', 'def.png', 9, 1, 1, '2021-08-20 20:56:20', '2021-08-20 20:56:20', 0),
(37, 'Food', '2021-12-05-61acb51584a1f.png', 0, 0, 1, '2021-12-05 18:48:21', '2021-12-05 18:48:21', 0),
(38, 'Food1', 'def.png', 37, 1, 1, '2021-12-05 18:48:39', '2021-12-05 18:48:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 1.00, NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', 1.00, NULL, NULL),
(3, 'Euro', 'EUR', '€', 1.00, NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', 1.00, NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', 1.00, NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', 1.00, NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', 1.00, NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', 1.00, NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', 1.00, NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', 1.00, NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', 1.00, NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1.00, NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', 1.00, NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', 1.00, NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', 1.00, NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', 1.00, NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', 1.00, NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', 1.00, NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', 1.00, NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', 1.00, NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', 1.00, NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', 1.00, NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', 1.00, NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', 1.00, NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', 1.00, NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', 1.00, NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', 1.00, NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', 1.00, NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', 1.00, NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', 1.00, NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', 1.00, NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', 1.00, NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', 1.00, NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', 1.00, NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', 1.00, NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', 1.00, NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', 1.00, NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', 1.00, NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', 1.00, NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', 1.00, NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', 1.00, NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', 1.00, NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', 1.00, NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', 1.00, NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', 1.00, NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', 1.00, NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', 1.00, NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', 1.00, NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', 1.00, NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', 1.00, NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', 1.00, NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', 1.00, NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', 1.00, NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', 1.00, NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', 1.00, NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', 1.00, NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', 1.00, NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', 1.00, NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', 1.00, NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', 1.00, NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', 1.00, NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', 1.00, NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', 1.00, NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', 1.00, NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', 1.00, NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', 1.00, NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', 1.00, NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', 1.00, NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', 1.00, NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', 1.00, NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', 1.00, NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', 1.00, NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', 1.00, NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', 1.00, NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', 1.00, NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', 1.00, NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', 1.00, NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', 1.00, NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', 1.00, NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', 1.00, NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', 1.00, NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', 1.00, NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', 1.00, NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', 1.00, NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', 1.00, NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', 1.00, NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', 1.00, NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', 1.00, NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', 1.00, NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', 1.00, NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', 1.00, NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', 1.00, NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', 1.00, NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', 1.00, NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', 1.00, NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', 1.00, NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', 1.00, NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', 1.00, NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', 1.00, NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', 1.00, NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', 1.00, NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', 1.00, NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', 1.00, NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', 1.00, NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', 1.00, NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', 1.00, NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', 1.00, NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', 1.00, NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', 1.00, NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', 1.00, NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', 1.00, NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', 1.00, NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', 1.00, NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', 1.00, NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', 1.00, NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', 1.00, NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', 1.00, NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`, `zone_id`) VALUES
(1, 'home', '+8801673138207', 'Flat#602 Dhaka 1205 Bangladesh', '23.7435119', '90.4091189', 6, 'Spencer Hasting', '2021-08-21 21:39:06', '2021-08-21 21:39:06', 1),
(3, 'home', '+8801723019985', 'Dhaka Medical College Hospital, Secretariat Road, Dhaka, Bangladesh', '23.726057172633265', '90.39752919226885', 9, 'Sultan 0 Mahamud 1', '2021-08-22 01:30:09', '2021-08-22 01:30:09', 1),
(4, 'home', '+8801723019986', 'United States', '37.09024007051737', '-95.71289096027614', 13, 'sultan mahamud 2', '2021-08-22 02:20:02', '2021-08-22 02:20:02', 1),
(7, 'home', '+21620555555', '53 Dhaka  Bangladesh', '23.76639123991971', '90.35126108676195', 15, 'hello yes', '2021-08-22 08:58:09', '2021-08-22 08:58:09', 1),
(8, 'office', '+21620555555', 'SS 127 km 59.000 Bortigiadas 07030 Italy', '40.86096044586421', '8.991410359740257', 15, 'hello yes', '2021-08-22 09:16:03', '2021-08-22 09:16:03', 1),
(9, 'home', '+21620555555', 'H#22,R#4,Block -B,Nobodoy Housing, Dhaka  Bangladesh', '23.765276472908237', '90.35011779516935', 15, 'hello yes', '2021-08-23 02:35:51', '2021-08-23 02:35:51', 1),
(10, 'home', '+38163627543', 'Bulevar Kraljice MArije 54E, Kragujevac, Serbia', '44.0177', '20.922200000000004', 20, 'Dejan Đusić', '2021-10-17 00:41:11', '2021-10-17 00:41:11', 1),
(11, 'office', '+919496462273', 'Seeroo IT Solutions, NAD Road, HMT Colony, North Kalamassery, HMT Kalamassery, Kochi, Kerala, India', '10.064429247800163', '76.35124683380127', 33, 'Elizabeth John', '2022-01-11 13:13:39', '2022-01-11 13:13:39', 1),
(12, 'others', '+919496462273', 'PNRA-74, near Oberon Mall, Padivattom, Edappally, Kochi, Kerala 682024, India', '10.014865006456871', '76.312319599092', 33, 'Elizabeth John', '2022-01-11 13:14:20', '2022-01-11 13:14:20', 1),
(13, 'home', '+919876543210', 'new colony deoria near gurudwara park', '26.5276801931362', '83.9127155765891', 37, 'Asdfghj Asdfghj', '2022-01-11 14:16:35', '2022-01-11 14:16:35', 1),
(14, 'home', '+919746658386', 'Q972+VPF, Dhaka, Bangladesh', '23.76469684059319', '90.3514959774026', 28, 'Sreekumar Pankjakshan Nair Sreekumar Pankjakshan Nair', '2022-01-20 18:20:44', '2022-01-20 18:20:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, '2021-08-21 19:59:46', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 19:59:46', '2021-08-21 19:59:46'),
(2, NULL, 1, '2021-08-21 19:59:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 19:59:55', '2021-08-21 19:59:55'),
(3, NULL, 1, '2021-08-21 20:00:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:00:05', '2021-08-21 20:00:05'),
(4, NULL, 1, '2021-08-21 20:00:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:00:15', '2021-08-21 20:00:15'),
(5, NULL, 1, '2021-08-21 20:00:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:00:25', '2021-08-21 20:00:25'),
(6, NULL, 1, '2021-08-21 20:08:04', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:08:04', '2021-08-21 20:08:04'),
(7, NULL, 1, '2021-08-21 20:08:14', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:08:14', '2021-08-21 20:08:14'),
(8, NULL, 1, '2021-08-21 20:08:24', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:08:24', '2021-08-21 20:08:24'),
(9, NULL, 1, '2021-08-21 20:08:34', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:08:34', '2021-08-21 20:08:34'),
(10, NULL, 1, '2021-08-21 20:08:44', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:08:44', '2021-08-21 20:08:44'),
(11, NULL, 1, '2021-08-21 20:08:54', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:08:54', '2021-08-21 20:08:54'),
(12, NULL, 1, '2021-08-21 20:09:04', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:09:04', '2021-08-21 20:09:04'),
(13, NULL, 1, '2021-08-21 20:09:14', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:09:14', '2021-08-21 20:09:14'),
(14, NULL, 1, '2021-08-21 20:09:24', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:09:24', '2021-08-21 20:09:24'),
(15, NULL, 1, '2021-08-21 20:09:34', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:09:34', '2021-08-21 20:09:34'),
(16, NULL, 1, '2021-08-21 20:09:44', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:09:44', '2021-08-21 20:09:44'),
(17, NULL, 1, '2021-08-21 20:09:54', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:09:54', '2021-08-21 20:09:54'),
(18, 100005, 1, '2021-08-21 20:10:22', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:10:22', '2021-08-21 20:10:22'),
(19, 100005, 1, '2021-08-21 20:10:32', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:10:32', '2021-08-21 20:10:32'),
(20, NULL, 1, '2021-08-21 20:10:42', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:10:42', '2021-08-21 20:10:42'),
(21, NULL, 1, '2021-08-21 20:10:52', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:10:52', '2021-08-21 20:10:52'),
(22, NULL, 1, '2021-08-21 20:11:02', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:11:02', '2021-08-21 20:11:02'),
(23, NULL, 1, '2021-08-21 20:11:12', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:11:12', '2021-08-21 20:11:12'),
(24, NULL, 1, '2021-08-21 20:11:22', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:11:22', '2021-08-21 20:11:22'),
(25, NULL, 1, '2021-08-21 20:11:32', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:11:32', '2021-08-21 20:11:32'),
(26, NULL, 1, '2021-08-21 20:11:42', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:11:42', '2021-08-21 20:11:42'),
(27, NULL, 1, '2021-08-21 20:11:52', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:11:52', '2021-08-21 20:11:52'),
(28, NULL, 1, '2021-08-21 20:12:02', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:12:02', '2021-08-21 20:12:02'),
(29, NULL, 1, '2021-08-21 20:12:12', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:12:12', '2021-08-21 20:12:12'),
(30, NULL, 1, '2021-08-21 20:12:22', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:12:22', '2021-08-21 20:12:22'),
(31, NULL, 1, '2021-08-21 20:12:32', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:12:32', '2021-08-21 20:12:32'),
(32, NULL, 1, '2021-08-21 20:12:42', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:12:42', '2021-08-21 20:12:42'),
(33, NULL, 1, '2021-08-21 20:12:52', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:12:52', '2021-08-21 20:12:52'),
(34, NULL, 1, '2021-08-21 20:13:02', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:13:02', '2021-08-21 20:13:02'),
(35, NULL, 1, '2021-08-21 20:13:12', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:13:12', '2021-08-21 20:13:12'),
(36, NULL, 1, '2021-08-21 20:13:22', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:13:22', '2021-08-21 20:13:22'),
(37, NULL, 1, '2021-08-21 20:13:32', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:13:32', '2021-08-21 20:13:32'),
(38, NULL, 1, '2021-08-21 20:13:42', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:13:42', '2021-08-21 20:13:42'),
(39, NULL, 1, '2021-08-21 20:13:52', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:13:52', '2021-08-21 20:13:52'),
(40, NULL, 1, '2021-08-21 20:14:02', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:14:02', '2021-08-21 20:14:02'),
(41, NULL, 1, '2021-08-21 20:14:12', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:14:12', '2021-08-21 20:14:12'),
(42, NULL, 1, '2021-08-21 20:14:22', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:14:22', '2021-08-21 20:14:22'),
(43, NULL, 1, '2021-08-21 20:14:32', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:14:32', '2021-08-21 20:14:32'),
(44, NULL, 1, '2021-08-21 20:14:42', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:14:42', '2021-08-21 20:14:42'),
(45, NULL, 1, '2021-08-21 20:14:52', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:14:52', '2021-08-21 20:14:52'),
(46, NULL, 1, '2021-08-21 20:15:02', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:15:02', '2021-08-21 20:15:02'),
(47, NULL, 1, '2021-08-21 20:15:12', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:15:12', '2021-08-21 20:15:12'),
(48, NULL, 1, '2021-08-21 20:15:22', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:15:22', '2021-08-21 20:15:22'),
(49, NULL, 1, '2021-08-21 20:15:32', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:15:32', '2021-08-21 20:15:32'),
(50, NULL, 1, '2021-08-21 20:15:42', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:15:42', '2021-08-21 20:15:42'),
(51, NULL, 1, '2021-08-21 20:15:52', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:15:52', '2021-08-21 20:15:52'),
(52, NULL, 1, '2021-08-21 20:16:02', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:16:02', '2021-08-21 20:16:02'),
(53, NULL, 1, '2021-08-21 20:16:20', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:16:20', '2021-08-21 20:16:20'),
(54, NULL, 1, '2021-08-21 20:16:30', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:16:30', '2021-08-21 20:16:30'),
(55, NULL, 1, '2021-08-21 20:16:40', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:16:40', '2021-08-21 20:16:40'),
(56, NULL, 1, '2021-08-21 20:16:50', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:16:50', '2021-08-21 20:16:50'),
(57, 100005, 1, '2021-08-21 20:17:00', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:17:00', '2021-08-21 20:17:00'),
(58, 100005, 1, '2021-08-21 20:17:10', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:17:10', '2021-08-21 20:17:10'),
(59, 100005, 1, '2021-08-21 20:17:20', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:17:20', '2021-08-21 20:17:20'),
(60, 100005, 1, '2021-08-21 20:17:30', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:17:30', '2021-08-21 20:17:30'),
(61, 100005, 1, '2021-08-21 20:17:40', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:17:40', '2021-08-21 20:17:40'),
(62, 100005, 1, '2021-08-21 20:17:50', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:17:50', '2021-08-21 20:17:50'),
(63, 100005, 1, '2021-08-21 20:18:00', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:18:00', '2021-08-21 20:18:00'),
(64, NULL, 1, '2021-08-21 20:18:10', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:18:10', '2021-08-21 20:18:10'),
(65, NULL, 1, '2021-08-21 20:18:20', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:18:20', '2021-08-21 20:18:20'),
(66, NULL, 1, '2021-08-21 20:18:30', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:18:30', '2021-08-21 20:18:30'),
(67, NULL, 1, '2021-08-21 20:18:40', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:18:40', '2021-08-21 20:18:40'),
(68, NULL, 1, '2021-08-21 20:18:50', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:18:50', '2021-08-21 20:18:50'),
(69, NULL, 1, '2021-08-21 20:19:00', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:19:00', '2021-08-21 20:19:00'),
(70, NULL, 1, '2021-08-21 20:19:10', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:19:10', '2021-08-21 20:19:10'),
(71, NULL, 1, '2021-08-21 20:19:20', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:19:20', '2021-08-21 20:19:20'),
(72, NULL, 1, '2021-08-21 20:19:30', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:19:30', '2021-08-21 20:19:30'),
(73, NULL, 1, '2021-08-21 20:19:40', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:19:40', '2021-08-21 20:19:40'),
(74, NULL, 1, '2021-08-21 20:19:50', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:19:50', '2021-08-21 20:19:50'),
(75, NULL, 1, '2021-08-21 20:20:00', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:20:00', '2021-08-21 20:20:00'),
(76, NULL, 1, '2021-08-21 20:20:10', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:20:10', '2021-08-21 20:20:10'),
(77, NULL, 1, '2021-08-21 20:20:20', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:20:20', '2021-08-21 20:20:20'),
(78, NULL, 1, '2021-08-21 20:20:47', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:20:47', '2021-08-21 20:20:47'),
(79, NULL, 1, '2021-08-21 20:20:57', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 20:20:57', '2021-08-21 20:20:57'),
(80, NULL, 1, '2021-08-21 21:15:29', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:15:29', '2021-08-21 21:15:29'),
(81, NULL, 1, '2021-08-21 21:15:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:15:45', '2021-08-21 21:15:45'),
(82, NULL, 1, '2021-08-21 21:15:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:15:55', '2021-08-21 21:15:55'),
(83, NULL, 1, '2021-08-21 21:16:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:16:05', '2021-08-21 21:16:05'),
(84, NULL, 1, '2021-08-21 21:16:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:16:15', '2021-08-21 21:16:15'),
(85, NULL, 1, '2021-08-21 21:16:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:16:25', '2021-08-21 21:16:25'),
(86, NULL, 1, '2021-08-21 21:16:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:16:35', '2021-08-21 21:16:35'),
(87, NULL, 1, '2021-08-21 21:16:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:16:45', '2021-08-21 21:16:45'),
(88, NULL, 1, '2021-08-21 21:16:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:16:55', '2021-08-21 21:16:55'),
(89, NULL, 1, '2021-08-21 21:17:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:17:05', '2021-08-21 21:17:05'),
(90, NULL, 1, '2021-08-21 21:17:16', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:17:16', '2021-08-21 21:17:16'),
(91, NULL, 1, '2021-08-21 21:17:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:17:25', '2021-08-21 21:17:25'),
(92, NULL, 1, '2021-08-21 21:17:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:17:35', '2021-08-21 21:17:35'),
(93, NULL, 1, '2021-08-21 21:17:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:17:45', '2021-08-21 21:17:45'),
(94, NULL, 1, '2021-08-21 21:17:56', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:17:56', '2021-08-21 21:17:56'),
(95, NULL, 1, '2021-08-21 21:18:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:18:05', '2021-08-21 21:18:05'),
(96, NULL, 1, '2021-08-21 21:18:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:18:15', '2021-08-21 21:18:15'),
(97, NULL, 1, '2021-08-21 21:18:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:18:25', '2021-08-21 21:18:25'),
(98, NULL, 1, '2021-08-21 21:18:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:18:35', '2021-08-21 21:18:35'),
(99, NULL, 1, '2021-08-21 21:18:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:18:45', '2021-08-21 21:18:45'),
(100, NULL, 1, '2021-08-21 21:18:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:18:55', '2021-08-21 21:18:55'),
(101, NULL, 1, '2021-08-21 21:19:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:19:05', '2021-08-21 21:19:05'),
(102, NULL, 1, '2021-08-21 21:19:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:19:15', '2021-08-21 21:19:15'),
(103, NULL, 1, '2021-08-21 21:19:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:19:25', '2021-08-21 21:19:25'),
(104, NULL, 1, '2021-08-21 21:19:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:19:35', '2021-08-21 21:19:35'),
(105, NULL, 1, '2021-08-21 21:19:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:19:45', '2021-08-21 21:19:45'),
(106, NULL, 1, '2021-08-21 21:19:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:19:55', '2021-08-21 21:19:55'),
(107, NULL, 1, '2021-08-21 21:20:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:20:05', '2021-08-21 21:20:05'),
(108, NULL, 1, '2021-08-21 21:20:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:20:15', '2021-08-21 21:20:15'),
(109, NULL, 1, '2021-08-21 21:20:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:20:25', '2021-08-21 21:20:25'),
(110, NULL, 1, '2021-08-21 21:20:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:20:35', '2021-08-21 21:20:35'),
(111, NULL, 1, '2021-08-21 21:20:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:20:45', '2021-08-21 21:20:45'),
(112, NULL, 1, '2021-08-21 21:20:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:20:55', '2021-08-21 21:20:55'),
(113, NULL, 1, '2021-08-21 21:21:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:21:05', '2021-08-21 21:21:05'),
(114, NULL, 1, '2021-08-21 21:21:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:21:15', '2021-08-21 21:21:15'),
(115, NULL, 1, '2021-08-21 21:21:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:21:25', '2021-08-21 21:21:25'),
(116, NULL, 1, '2021-08-21 21:21:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:21:35', '2021-08-21 21:21:35'),
(117, NULL, 1, '2021-08-21 21:21:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:21:45', '2021-08-21 21:21:45'),
(118, NULL, 1, '2021-08-21 21:21:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:21:55', '2021-08-21 21:21:55'),
(119, NULL, 1, '2021-08-21 21:22:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:22:05', '2021-08-21 21:22:05'),
(120, NULL, 1, '2021-08-21 21:22:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:22:15', '2021-08-21 21:22:15'),
(121, NULL, 1, '2021-08-21 21:22:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:22:25', '2021-08-21 21:22:25'),
(122, NULL, 1, '2021-08-21 21:22:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:22:35', '2021-08-21 21:22:35'),
(123, NULL, 1, '2021-08-21 21:22:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:22:45', '2021-08-21 21:22:45'),
(124, NULL, 1, '2021-08-21 21:22:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:22:55', '2021-08-21 21:22:55'),
(125, NULL, 1, '2021-08-21 21:23:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:23:05', '2021-08-21 21:23:05'),
(126, NULL, 1, '2021-08-21 21:23:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:23:15', '2021-08-21 21:23:15'),
(127, NULL, 1, '2021-08-21 21:23:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:23:25', '2021-08-21 21:23:25'),
(128, NULL, 1, '2021-08-21 21:23:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:23:35', '2021-08-21 21:23:35'),
(129, NULL, 1, '2021-08-21 21:23:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:23:45', '2021-08-21 21:23:45'),
(130, NULL, 1, '2021-08-21 21:23:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:23:55', '2021-08-21 21:23:55'),
(131, NULL, 1, '2021-08-21 21:24:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:24:05', '2021-08-21 21:24:05'),
(132, NULL, 1, '2021-08-21 21:24:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:24:15', '2021-08-21 21:24:15'),
(133, NULL, 1, '2021-08-21 21:24:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:24:25', '2021-08-21 21:24:25'),
(134, NULL, 1, '2021-08-21 21:24:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:24:35', '2021-08-21 21:24:35'),
(135, NULL, 1, '2021-08-21 21:24:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:24:45', '2021-08-21 21:24:45'),
(136, NULL, 1, '2021-08-21 21:24:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:24:55', '2021-08-21 21:24:55'),
(137, NULL, 1, '2021-08-21 21:25:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:25:05', '2021-08-21 21:25:05'),
(138, NULL, 1, '2021-08-21 21:25:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:25:15', '2021-08-21 21:25:15'),
(139, NULL, 1, '2021-08-21 21:25:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:25:25', '2021-08-21 21:25:25'),
(140, NULL, 1, '2021-08-21 21:25:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:25:35', '2021-08-21 21:25:35'),
(141, NULL, 1, '2021-08-21 21:25:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:25:45', '2021-08-21 21:25:45'),
(142, NULL, 1, '2021-08-21 21:25:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:25:55', '2021-08-21 21:25:55'),
(143, NULL, 1, '2021-08-21 21:26:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:26:05', '2021-08-21 21:26:05'),
(144, NULL, 1, '2021-08-21 21:26:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:26:15', '2021-08-21 21:26:15'),
(145, NULL, 1, '2021-08-21 21:26:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:26:25', '2021-08-21 21:26:25'),
(146, NULL, 1, '2021-08-21 21:26:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:26:35', '2021-08-21 21:26:35'),
(147, NULL, 1, '2021-08-21 21:26:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:26:45', '2021-08-21 21:26:45'),
(148, NULL, 1, '2021-08-21 21:26:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:26:55', '2021-08-21 21:26:55'),
(149, NULL, 1, '2021-08-21 21:27:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:27:05', '2021-08-21 21:27:05'),
(150, NULL, 1, '2021-08-21 21:27:16', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:27:16', '2021-08-21 21:27:16'),
(151, NULL, 1, '2021-08-21 21:27:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:27:25', '2021-08-21 21:27:25'),
(152, NULL, 1, '2021-08-21 21:27:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:27:35', '2021-08-21 21:27:35'),
(153, NULL, 1, '2021-08-21 21:27:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:27:45', '2021-08-21 21:27:45'),
(154, NULL, 1, '2021-08-21 21:27:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:27:55', '2021-08-21 21:27:55'),
(155, NULL, 1, '2021-08-21 21:28:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:28:05', '2021-08-21 21:28:05'),
(156, NULL, 1, '2021-08-21 21:28:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:28:15', '2021-08-21 21:28:15'),
(157, NULL, 1, '2021-08-21 21:28:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:28:25', '2021-08-21 21:28:25'),
(158, NULL, 1, '2021-08-21 21:28:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:28:35', '2021-08-21 21:28:35'),
(159, NULL, 1, '2021-08-21 21:28:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:28:45', '2021-08-21 21:28:45'),
(160, NULL, 1, '2021-08-21 21:28:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:28:55', '2021-08-21 21:28:55'),
(161, NULL, 1, '2021-08-21 21:29:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:29:05', '2021-08-21 21:29:05'),
(162, NULL, 1, '2021-08-21 21:29:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:29:15', '2021-08-21 21:29:15'),
(163, NULL, 1, '2021-08-21 21:29:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:29:25', '2021-08-21 21:29:25'),
(164, NULL, 1, '2021-08-21 21:29:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:29:35', '2021-08-21 21:29:35'),
(165, NULL, 1, '2021-08-21 21:29:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:29:45', '2021-08-21 21:29:45'),
(166, NULL, 1, '2021-08-21 21:29:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:29:55', '2021-08-21 21:29:55'),
(167, NULL, 1, '2021-08-21 21:30:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:30:05', '2021-08-21 21:30:05'),
(168, NULL, 1, '2021-08-21 21:30:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:30:15', '2021-08-21 21:30:15'),
(169, NULL, 1, '2021-08-21 21:30:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:30:25', '2021-08-21 21:30:25'),
(170, NULL, 1, '2021-08-21 21:30:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:30:35', '2021-08-21 21:30:35'),
(171, NULL, 1, '2021-08-21 21:30:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:30:45', '2021-08-21 21:30:45'),
(172, NULL, 1, '2021-08-21 21:30:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:30:55', '2021-08-21 21:30:55'),
(173, NULL, 1, '2021-08-21 21:31:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:31:05', '2021-08-21 21:31:05'),
(174, NULL, 1, '2021-08-21 21:31:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:31:15', '2021-08-21 21:31:15'),
(175, NULL, 1, '2021-08-21 21:31:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:31:25', '2021-08-21 21:31:25'),
(176, NULL, 1, '2021-08-21 21:31:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:31:35', '2021-08-21 21:31:35'),
(177, NULL, 1, '2021-08-21 21:31:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:31:45', '2021-08-21 21:31:45'),
(178, NULL, 1, '2021-08-21 21:31:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:31:55', '2021-08-21 21:31:55'),
(179, NULL, 1, '2021-08-21 21:32:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:32:05', '2021-08-21 21:32:05'),
(180, NULL, 1, '2021-08-21 21:32:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:32:15', '2021-08-21 21:32:15'),
(181, NULL, 1, '2021-08-21 21:32:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:32:25', '2021-08-21 21:32:25'),
(182, NULL, 1, '2021-08-21 21:32:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:32:35', '2021-08-21 21:32:35'),
(183, NULL, 1, '2021-08-21 21:32:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:32:45', '2021-08-21 21:32:45'),
(184, NULL, 1, '2021-08-21 21:32:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:32:55', '2021-08-21 21:32:55'),
(185, NULL, 1, '2021-08-21 21:33:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:33:05', '2021-08-21 21:33:05'),
(186, NULL, 1, '2021-08-21 21:33:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:33:15', '2021-08-21 21:33:15'),
(187, NULL, 1, '2021-08-21 21:33:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:33:25', '2021-08-21 21:33:25'),
(188, NULL, 1, '2021-08-21 21:33:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:33:35', '2021-08-21 21:33:35'),
(189, NULL, 1, '2021-08-21 21:33:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:33:45', '2021-08-21 21:33:45'),
(190, NULL, 1, '2021-08-21 21:33:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:33:55', '2021-08-21 21:33:55'),
(191, NULL, 1, '2021-08-21 21:34:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:34:05', '2021-08-21 21:34:05'),
(192, NULL, 1, '2021-08-21 21:34:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:34:15', '2021-08-21 21:34:15'),
(193, NULL, 1, '2021-08-21 21:34:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:34:25', '2021-08-21 21:34:25'),
(194, NULL, 1, '2021-08-21 21:34:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:34:35', '2021-08-21 21:34:35'),
(195, NULL, 1, '2021-08-21 21:34:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:34:45', '2021-08-21 21:34:45'),
(196, NULL, 1, '2021-08-21 21:34:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:34:55', '2021-08-21 21:34:55'),
(197, NULL, 1, '2021-08-21 21:35:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:35:05', '2021-08-21 21:35:05'),
(198, NULL, 1, '2021-08-21 21:35:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:35:15', '2021-08-21 21:35:15'),
(199, NULL, 1, '2021-08-21 21:35:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:35:25', '2021-08-21 21:35:25'),
(200, NULL, 1, '2021-08-21 21:35:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:35:35', '2021-08-21 21:35:35'),
(201, NULL, 1, '2021-08-21 21:35:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:35:45', '2021-08-21 21:35:45'),
(202, NULL, 1, '2021-08-21 21:35:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:35:55', '2021-08-21 21:35:55'),
(203, NULL, 1, '2021-08-21 21:36:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:36:05', '2021-08-21 21:36:05'),
(204, NULL, 1, '2021-08-21 21:36:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:36:15', '2021-08-21 21:36:15'),
(205, NULL, 1, '2021-08-21 21:36:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:36:25', '2021-08-21 21:36:25'),
(206, NULL, 1, '2021-08-21 21:36:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:36:35', '2021-08-21 21:36:35'),
(207, NULL, 1, '2021-08-21 21:36:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:36:45', '2021-08-21 21:36:45'),
(208, NULL, 1, '2021-08-21 21:36:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:36:55', '2021-08-21 21:36:55'),
(209, NULL, 1, '2021-08-21 21:37:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:37:05', '2021-08-21 21:37:05'),
(210, NULL, 1, '2021-08-21 21:37:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:37:15', '2021-08-21 21:37:15'),
(211, NULL, 1, '2021-08-21 21:37:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:37:25', '2021-08-21 21:37:25'),
(212, NULL, 1, '2021-08-21 21:37:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:37:35', '2021-08-21 21:37:35'),
(213, NULL, 1, '2021-08-21 21:37:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:37:45', '2021-08-21 21:37:45'),
(214, NULL, 1, '2021-08-21 21:37:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:37:55', '2021-08-21 21:37:55'),
(215, NULL, 1, '2021-08-21 21:38:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:38:05', '2021-08-21 21:38:05'),
(216, NULL, 1, '2021-08-21 21:38:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:38:15', '2021-08-21 21:38:15'),
(217, NULL, 1, '2021-08-21 21:38:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:38:25', '2021-08-21 21:38:25'),
(218, NULL, 1, '2021-08-21 21:38:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:38:35', '2021-08-21 21:38:35'),
(219, NULL, 1, '2021-08-21 21:38:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:38:45', '2021-08-21 21:38:45'),
(220, NULL, 1, '2021-08-21 21:38:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:38:55', '2021-08-21 21:38:55'),
(221, NULL, 1, '2021-08-21 21:39:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:39:05', '2021-08-21 21:39:05'),
(222, NULL, 1, '2021-08-21 21:39:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:39:15', '2021-08-21 21:39:15'),
(223, NULL, 1, '2021-08-21 21:39:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:39:25', '2021-08-21 21:39:25'),
(224, NULL, 1, '2021-08-21 21:39:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:39:35', '2021-08-21 21:39:35'),
(225, NULL, 1, '2021-08-21 21:39:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:39:45', '2021-08-21 21:39:45'),
(226, NULL, 1, '2021-08-21 21:39:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:39:55', '2021-08-21 21:39:55'),
(227, NULL, 1, '2021-08-21 21:40:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:40:05', '2021-08-21 21:40:05'),
(228, NULL, 1, '2021-08-21 21:40:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:40:15', '2021-08-21 21:40:15'),
(229, NULL, 1, '2021-08-21 21:40:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:40:25', '2021-08-21 21:40:25'),
(230, NULL, 1, '2021-08-21 21:40:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:40:35', '2021-08-21 21:40:35'),
(231, NULL, 1, '2021-08-21 21:40:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:40:45', '2021-08-21 21:40:45'),
(232, NULL, 1, '2021-08-21 21:40:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:40:55', '2021-08-21 21:40:55'),
(233, NULL, 1, '2021-08-21 21:41:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:41:05', '2021-08-21 21:41:05'),
(234, NULL, 1, '2021-08-21 21:41:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:41:15', '2021-08-21 21:41:15'),
(235, NULL, 1, '2021-08-21 21:41:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:41:25', '2021-08-21 21:41:25'),
(236, NULL, 1, '2021-08-21 21:41:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:41:35', '2021-08-21 21:41:35'),
(237, NULL, 1, '2021-08-21 21:41:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:41:45', '2021-08-21 21:41:45'),
(238, NULL, 1, '2021-08-21 21:41:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:41:55', '2021-08-21 21:41:55'),
(239, NULL, 1, '2021-08-21 21:42:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:42:05', '2021-08-21 21:42:05'),
(240, NULL, 1, '2021-08-21 21:42:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:42:15', '2021-08-21 21:42:15'),
(241, NULL, 1, '2021-08-21 21:42:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:42:25', '2021-08-21 21:42:25'),
(242, NULL, 1, '2021-08-21 21:42:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:42:35', '2021-08-21 21:42:35'),
(243, NULL, 1, '2021-08-21 21:42:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:42:45', '2021-08-21 21:42:45'),
(244, NULL, 1, '2021-08-21 21:42:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:42:55', '2021-08-21 21:42:55'),
(245, NULL, 1, '2021-08-21 21:43:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:43:05', '2021-08-21 21:43:05'),
(246, NULL, 1, '2021-08-21 21:43:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:43:15', '2021-08-21 21:43:15'),
(247, NULL, 1, '2021-08-21 21:43:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:43:25', '2021-08-21 21:43:25'),
(248, NULL, 1, '2021-08-21 21:43:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:43:35', '2021-08-21 21:43:35'),
(249, NULL, 1, '2021-08-21 21:43:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:43:45', '2021-08-21 21:43:45'),
(250, NULL, 1, '2021-08-21 21:43:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:43:55', '2021-08-21 21:43:55'),
(251, NULL, 1, '2021-08-21 21:44:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:44:05', '2021-08-21 21:44:05'),
(252, NULL, 1, '2021-08-21 21:44:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:44:15', '2021-08-21 21:44:15'),
(253, NULL, 1, '2021-08-21 21:44:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:44:25', '2021-08-21 21:44:25'),
(254, NULL, 1, '2021-08-21 21:44:35', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:44:35', '2021-08-21 21:44:35'),
(255, NULL, 1, '2021-08-21 21:44:45', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:44:45', '2021-08-21 21:44:45'),
(256, NULL, 1, '2021-08-21 21:44:55', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:44:55', '2021-08-21 21:44:55'),
(257, NULL, 1, '2021-08-21 21:45:05', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:45:05', '2021-08-21 21:45:05'),
(258, NULL, 1, '2021-08-21 21:45:15', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:45:15', '2021-08-21 21:45:15'),
(259, 100005, 1, '2021-08-21 21:45:25', '91.3857353', '22.8226167', 'Chor Chandia, Feni District, BD', '2021-08-21 21:45:25', '2021-08-21 21:45:25'),
(260, NULL, 2, '2021-08-21 21:49:25', '90.4226428', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:49:25', '2021-08-21 21:49:25'),
(261, NULL, 2, '2021-08-21 21:49:50', '90.4226475', '23.8581323', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:49:50', '2021-08-21 21:49:50'),
(262, NULL, 2, '2021-08-21 21:49:59', '90.4226458', '23.8581374', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:49:59', '2021-08-21 21:49:59'),
(263, NULL, 2, '2021-08-21 21:50:22', '90.4226462', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:50:22', '2021-08-21 21:50:22'),
(264, NULL, 2, '2021-08-21 21:50:32', '90.4226462', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:50:32', '2021-08-21 21:50:32'),
(265, NULL, 2, '2021-08-21 21:50:42', '90.4226468', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:50:42', '2021-08-21 21:50:42'),
(266, NULL, 2, '2021-08-21 21:50:52', '90.4226462', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:50:52', '2021-08-21 21:50:52'),
(267, NULL, 2, '2021-08-21 21:51:02', '90.4226467', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:51:02', '2021-08-21 21:51:02'),
(268, NULL, 2, '2021-08-21 21:51:12', '90.4226467', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:51:12', '2021-08-21 21:51:12'),
(269, NULL, 2, '2021-08-21 21:51:22', '90.4226442', '23.8581424', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:51:22', '2021-08-21 21:51:22'),
(270, NULL, 3, '2021-08-21 21:51:22', '90.4091193', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 21:51:22', '2021-08-21 21:51:22'),
(271, NULL, 3, '2021-08-21 21:51:32', '90.4091156', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 21:51:32', '2021-08-21 21:51:32'),
(272, NULL, 2, '2021-08-21 21:51:32', '90.4226473', '23.8581321', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:51:32', '2021-08-21 21:51:32'),
(273, NULL, 3, '2021-08-21 21:51:42', '90.4091145', '23.7435117', 'Flat#602, Dhaka District, BD', '2021-08-21 21:51:42', '2021-08-21 21:51:42'),
(274, NULL, 2, '2021-08-21 21:51:42', '90.4226453', '23.8581389', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:51:42', '2021-08-21 21:51:42'),
(275, NULL, 3, '2021-08-21 21:51:52', '90.4091165', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 21:51:52', '2021-08-21 21:51:52'),
(276, NULL, 2, '2021-08-21 21:51:52', '90.4226483', '23.8581355', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:51:52', '2021-08-21 21:51:52'),
(277, NULL, 3, '2021-08-21 21:52:02', '90.4091192', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 21:52:02', '2021-08-21 21:52:02'),
(278, NULL, 2, '2021-08-21 21:52:06', '90.4226458', '23.8581386', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:52:06', '2021-08-21 21:52:06'),
(279, NULL, 3, '2021-08-21 21:52:12', '90.4091149', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 21:52:12', '2021-08-21 21:52:12'),
(280, NULL, 2, '2021-08-21 21:52:16', '90.4226463', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:52:16', '2021-08-21 21:52:16'),
(281, NULL, 2, '2021-08-21 21:52:26', '90.4226459', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:52:26', '2021-08-21 21:52:26'),
(282, NULL, 3, '2021-08-21 21:52:26', '90.4091246', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 21:52:26', '2021-08-21 21:52:26'),
(283, NULL, 2, '2021-08-21 21:52:36', '90.4226461', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:52:36', '2021-08-21 21:52:36'),
(284, NULL, 3, '2021-08-21 21:52:36', '90.4091213', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 21:52:36', '2021-08-21 21:52:36'),
(285, NULL, 2, '2021-08-21 21:52:46', '90.4226471', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:52:46', '2021-08-21 21:52:46'),
(286, NULL, 3, '2021-08-21 21:52:46', '90.4091177', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 21:52:46', '2021-08-21 21:52:46'),
(287, NULL, 2, '2021-08-21 21:52:56', '90.4226426', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:52:56', '2021-08-21 21:52:56'),
(288, NULL, 3, '2021-08-21 21:52:56', '90.409119', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 21:52:56', '2021-08-21 21:52:56'),
(289, NULL, 2, '2021-08-21 21:53:06', '90.4226455', '23.8581441', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:53:06', '2021-08-21 21:53:06'),
(290, NULL, 3, '2021-08-21 21:53:06', '90.4091182', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 21:53:06', '2021-08-21 21:53:06'),
(291, NULL, 2, '2021-08-21 21:53:16', '90.4226478', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:53:16', '2021-08-21 21:53:16'),
(292, NULL, 3, '2021-08-21 21:53:16', '90.4091237', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 21:53:16', '2021-08-21 21:53:16'),
(293, NULL, 2, '2021-08-21 21:53:26', '90.4226443', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:53:26', '2021-08-21 21:53:26'),
(294, NULL, 3, '2021-08-21 21:53:26', '90.4091188', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 21:53:26', '2021-08-21 21:53:26'),
(295, NULL, 2, '2021-08-21 21:53:36', '90.4226462', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:53:36', '2021-08-21 21:53:36'),
(296, NULL, 3, '2021-08-21 21:53:37', '90.409123', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 21:53:37', '2021-08-21 21:53:37'),
(297, NULL, 2, '2021-08-21 21:53:46', '90.4226461', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:53:46', '2021-08-21 21:53:46'),
(298, NULL, 3, '2021-08-21 21:53:47', '90.4091233', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 21:53:47', '2021-08-21 21:53:47'),
(299, NULL, 2, '2021-08-21 21:53:56', '90.4226447', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:53:56', '2021-08-21 21:53:56'),
(300, NULL, 3, '2021-08-21 21:53:57', '90.4091193', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 21:53:57', '2021-08-21 21:53:57'),
(301, NULL, 2, '2021-08-21 21:54:06', '90.4226481', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 21:54:06', '2021-08-21 21:54:06'),
(302, NULL, 3, '2021-08-21 21:54:06', '90.4091191', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 21:54:06', '2021-08-21 21:54:06'),
(303, NULL, 3, '2021-08-21 21:54:16', '90.4091212', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 21:54:16', '2021-08-21 21:54:16'),
(304, NULL, 3, '2021-08-21 21:54:39', '90.409127', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 21:54:39', '2021-08-21 21:54:39'),
(305, NULL, 3, '2021-08-21 21:54:48', '90.409127', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 21:54:48', '2021-08-21 21:54:48'),
(306, NULL, 3, '2021-08-21 21:54:58', '90.4091272', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 21:54:58', '2021-08-21 21:54:58'),
(307, NULL, 3, '2021-08-21 21:55:08', '90.4091273', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 21:55:08', '2021-08-21 21:55:08'),
(308, NULL, 3, '2021-08-21 21:55:18', '90.4091252', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 21:55:18', '2021-08-21 21:55:18'),
(309, NULL, 3, '2021-08-21 21:55:28', '90.4091202', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 21:55:28', '2021-08-21 21:55:28'),
(310, NULL, 3, '2021-08-21 21:55:38', '90.4091259', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 21:55:38', '2021-08-21 21:55:38'),
(311, NULL, 3, '2021-08-21 21:55:48', '90.4091217', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 21:55:48', '2021-08-21 21:55:48'),
(312, NULL, 3, '2021-08-21 21:55:58', '90.4091248', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 21:55:58', '2021-08-21 21:55:58'),
(313, NULL, 3, '2021-08-21 21:56:09', '90.4091291', '23.7435158', 'Flat#602, Dhaka District, BD', '2021-08-21 21:56:09', '2021-08-21 21:56:09'),
(314, NULL, 3, '2021-08-21 21:56:19', '90.4091231', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 21:56:19', '2021-08-21 21:56:19'),
(315, NULL, 3, '2021-08-21 21:56:28', '90.4091227', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 21:56:28', '2021-08-21 21:56:28'),
(316, NULL, 3, '2021-08-21 21:56:38', '90.4091196', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-21 21:56:38', '2021-08-21 21:56:38'),
(317, NULL, 3, '2021-08-21 21:56:49', '90.4091205', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 21:56:49', '2021-08-21 21:56:49'),
(318, NULL, 3, '2021-08-21 21:56:59', '90.4091252', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-21 21:56:59', '2021-08-21 21:56:59'),
(319, NULL, 3, '2021-08-21 21:57:08', '90.4091239', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 21:57:08', '2021-08-21 21:57:08'),
(320, NULL, 3, '2021-08-21 21:57:18', '90.4091256', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 21:57:18', '2021-08-21 21:57:18'),
(321, NULL, 3, '2021-08-21 21:57:28', '90.4091234', '23.7435166', 'Flat#602, Dhaka District, BD', '2021-08-21 21:57:28', '2021-08-21 21:57:28'),
(322, NULL, 3, '2021-08-21 21:57:38', '90.4091218', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 21:57:38', '2021-08-21 21:57:38'),
(323, NULL, 3, '2021-08-21 21:57:49', '90.4091228', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 21:57:49', '2021-08-21 21:57:49'),
(324, NULL, 3, '2021-08-21 21:57:58', '90.4091182', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 21:57:58', '2021-08-21 21:57:58'),
(325, NULL, 3, '2021-08-21 21:58:09', '90.4091187', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 21:58:09', '2021-08-21 21:58:09'),
(326, NULL, 3, '2021-08-21 21:58:19', '90.4091169', '23.7435102', 'Flat#602, Dhaka District, BD', '2021-08-21 21:58:19', '2021-08-21 21:58:19'),
(327, NULL, 3, '2021-08-21 21:58:29', '90.4091215', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 21:58:29', '2021-08-21 21:58:29'),
(328, NULL, 3, '2021-08-21 21:58:39', '90.4091157', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 21:58:39', '2021-08-21 21:58:39'),
(329, NULL, 3, '2021-08-21 21:58:48', '90.4091184', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 21:58:48', '2021-08-21 21:58:48'),
(330, NULL, 3, '2021-08-21 21:58:58', '90.4091168', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 21:58:58', '2021-08-21 21:58:58'),
(331, NULL, 3, '2021-08-21 21:59:08', '90.4091224', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 21:59:08', '2021-08-21 21:59:08'),
(332, NULL, 3, '2021-08-21 21:59:18', '90.4091299', '23.7435244', 'Flat#602, Dhaka District, BD', '2021-08-21 21:59:18', '2021-08-21 21:59:18'),
(333, NULL, 3, '2021-08-21 21:59:29', '90.4091223', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 21:59:29', '2021-08-21 21:59:29'),
(334, NULL, 3, '2021-08-21 21:59:39', '90.4091236', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 21:59:39', '2021-08-21 21:59:39'),
(335, NULL, 3, '2021-08-21 21:59:49', '90.409118', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 21:59:49', '2021-08-21 21:59:49'),
(336, NULL, 3, '2021-08-21 21:59:59', '90.4091242', '23.7435098', 'Flat#602, Dhaka District, BD', '2021-08-21 21:59:59', '2021-08-21 21:59:59'),
(337, NULL, 3, '2021-08-21 22:00:09', '90.4091214', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 22:00:09', '2021-08-21 22:00:09'),
(338, NULL, 3, '2021-08-21 22:00:19', '90.4091155', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-21 22:00:19', '2021-08-21 22:00:19'),
(339, NULL, 3, '2021-08-21 22:00:29', '90.4091186', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-21 22:00:29', '2021-08-21 22:00:29'),
(340, NULL, 3, '2021-08-21 22:00:38', '90.4091248', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:00:38', '2021-08-21 22:00:38'),
(341, NULL, 3, '2021-08-21 22:00:48', '90.4091247', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-21 22:00:48', '2021-08-21 22:00:48'),
(342, NULL, 3, '2021-08-21 22:01:06', '90.4091236', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:01:06', '2021-08-21 22:01:06');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(343, NULL, 3, '2021-08-21 22:01:16', '90.4091204', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:01:16', '2021-08-21 22:01:16'),
(344, NULL, 3, '2021-08-21 22:01:26', '90.4091218', '23.7435168', 'Flat#602, Dhaka District, BD', '2021-08-21 22:01:26', '2021-08-21 22:01:26'),
(345, NULL, 3, '2021-08-21 22:01:36', '90.4091179', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:01:36', '2021-08-21 22:01:36'),
(346, NULL, 3, '2021-08-21 22:01:46', '90.4091255', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 22:01:46', '2021-08-21 22:01:46'),
(347, NULL, 3, '2021-08-21 22:01:57', '90.409117', '23.7435179', 'Flat#602, Dhaka District, BD', '2021-08-21 22:01:57', '2021-08-21 22:01:57'),
(348, NULL, 3, '2021-08-21 22:02:06', '90.4091177', '23.7435102', 'Flat#602, Dhaka District, BD', '2021-08-21 22:02:06', '2021-08-21 22:02:06'),
(349, NULL, 3, '2021-08-21 22:02:16', '90.4091186', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 22:02:16', '2021-08-21 22:02:16'),
(350, NULL, 3, '2021-08-21 22:02:27', '90.4091184', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 22:02:27', '2021-08-21 22:02:27'),
(351, NULL, 3, '2021-08-21 22:02:45', '90.4091317', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:02:45', '2021-08-21 22:02:45'),
(352, NULL, 3, '2021-08-21 22:02:55', '90.4091251', '23.7435153', 'Flat#602, Dhaka District, BD', '2021-08-21 22:02:55', '2021-08-21 22:02:55'),
(353, NULL, 3, '2021-08-21 22:03:05', '90.4091276', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-21 22:03:05', '2021-08-21 22:03:05'),
(354, NULL, 3, '2021-08-21 22:03:15', '90.4091266', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 22:03:15', '2021-08-21 22:03:15'),
(355, NULL, 3, '2021-08-21 22:03:24', '90.4091201', '23.743516', 'Flat#602, Dhaka District, BD', '2021-08-21 22:03:24', '2021-08-21 22:03:24'),
(356, NULL, 3, '2021-08-21 22:03:34', '90.4091279', '23.7435182', 'Flat#602, Dhaka District, BD', '2021-08-21 22:03:34', '2021-08-21 22:03:34'),
(357, NULL, 3, '2021-08-21 22:03:44', '90.4091163', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 22:03:44', '2021-08-21 22:03:44'),
(358, NULL, 3, '2021-08-21 22:03:55', '90.4091183', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:03:55', '2021-08-21 22:03:55'),
(359, NULL, 3, '2021-08-21 22:04:07', '90.409118', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 22:04:07', '2021-08-21 22:04:07'),
(360, NULL, 3, '2021-08-21 22:04:15', '90.4091172', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 22:04:15', '2021-08-21 22:04:15'),
(361, NULL, 3, '2021-08-21 22:04:25', '90.4091168', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-21 22:04:25', '2021-08-21 22:04:25'),
(362, NULL, 3, '2021-08-21 22:04:35', '90.4091211', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 22:04:35', '2021-08-21 22:04:35'),
(363, NULL, 3, '2021-08-21 22:04:45', '90.4091266', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:04:45', '2021-08-21 22:04:45'),
(364, NULL, 3, '2021-08-21 22:04:55', '90.4091225', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 22:04:55', '2021-08-21 22:04:55'),
(365, NULL, 3, '2021-08-21 22:05:05', '90.4091199', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:05:05', '2021-08-21 22:05:05'),
(366, NULL, 3, '2021-08-21 22:05:15', '90.409121', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-21 22:05:15', '2021-08-21 22:05:15'),
(367, NULL, 3, '2021-08-21 22:05:31', '90.4091225', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:05:31', '2021-08-21 22:05:31'),
(368, NULL, 3, '2021-08-21 22:05:41', '90.4091252', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:05:41', '2021-08-21 22:05:41'),
(369, NULL, 3, '2021-08-21 22:05:51', '90.4091273', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:05:51', '2021-08-21 22:05:51'),
(370, NULL, 3, '2021-08-21 22:06:01', '90.4091273', '23.7435172', 'Flat#602, Dhaka District, BD', '2021-08-21 22:06:01', '2021-08-21 22:06:01'),
(371, NULL, 3, '2021-08-21 22:06:11', '90.4091267', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:06:11', '2021-08-21 22:06:11'),
(372, NULL, 3, '2021-08-21 22:06:21', '90.4091213', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 22:06:21', '2021-08-21 22:06:21'),
(373, NULL, 3, '2021-08-21 22:06:36', '90.4091139', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 22:06:36', '2021-08-21 22:06:36'),
(374, NULL, 3, '2021-08-21 22:06:46', '90.4091304', '23.74352', 'Flat#602, Dhaka District, BD', '2021-08-21 22:06:46', '2021-08-21 22:06:46'),
(375, NULL, 3, '2021-08-21 22:06:56', '90.4091184', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 22:06:56', '2021-08-21 22:06:56'),
(376, NULL, 3, '2021-08-21 22:07:06', '90.4091184', '23.743508', 'Flat#602, Dhaka District, BD', '2021-08-21 22:07:06', '2021-08-21 22:07:06'),
(377, NULL, 3, '2021-08-21 22:07:16', '90.4091233', '23.7435141', 'Flat#602, Dhaka District, BD', '2021-08-21 22:07:16', '2021-08-21 22:07:16'),
(378, NULL, 3, '2021-08-21 22:07:26', '90.4091193', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:07:26', '2021-08-21 22:07:26'),
(379, NULL, 3, '2021-08-21 22:07:36', '90.4091224', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-21 22:07:36', '2021-08-21 22:07:36'),
(380, NULL, 3, '2021-08-21 22:07:45', '90.4091094', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:07:45', '2021-08-21 22:07:45'),
(381, NULL, 3, '2021-08-21 22:07:55', '90.4091236', '23.743519', 'Flat#602, Dhaka District, BD', '2021-08-21 22:07:55', '2021-08-21 22:07:55'),
(382, NULL, 3, '2021-08-21 22:08:06', '90.4091263', '23.7435114', 'Flat#602, Dhaka District, BD', '2021-08-21 22:08:06', '2021-08-21 22:08:06'),
(383, NULL, 3, '2021-08-21 22:08:16', '90.4091234', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-21 22:08:16', '2021-08-21 22:08:16'),
(384, NULL, 3, '2021-08-21 22:08:26', '90.4091255', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-21 22:08:26', '2021-08-21 22:08:26'),
(385, NULL, 3, '2021-08-21 22:08:36', '90.4091296', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:08:36', '2021-08-21 22:08:36'),
(386, NULL, 3, '2021-08-21 22:08:46', '90.4091277', '23.743516', 'Flat#602, Dhaka District, BD', '2021-08-21 22:08:46', '2021-08-21 22:08:46'),
(387, NULL, 3, '2021-08-21 22:08:56', '90.4091221', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:08:56', '2021-08-21 22:08:56'),
(388, NULL, 3, '2021-08-21 22:09:06', '90.4091171', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 22:09:06', '2021-08-21 22:09:06'),
(389, NULL, 3, '2021-08-21 22:09:16', '90.4091257', '23.7435171', 'Flat#602, Dhaka District, BD', '2021-08-21 22:09:16', '2021-08-21 22:09:16'),
(390, NULL, 3, '2021-08-21 22:09:26', '90.4091212', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:09:26', '2021-08-21 22:09:26'),
(391, NULL, 3, '2021-08-21 22:09:36', '90.4091269', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-21 22:09:36', '2021-08-21 22:09:36'),
(392, NULL, 3, '2021-08-21 22:09:46', '90.4091179', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:09:46', '2021-08-21 22:09:46'),
(393, NULL, 3, '2021-08-21 22:09:56', '90.4091176', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 22:09:56', '2021-08-21 22:09:56'),
(394, NULL, 3, '2021-08-21 22:10:06', '90.4091174', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:10:06', '2021-08-21 22:10:06'),
(395, NULL, 3, '2021-08-21 22:10:15', '90.4091257', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:10:15', '2021-08-21 22:10:15'),
(396, NULL, 3, '2021-08-21 22:10:26', '90.4091261', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 22:10:26', '2021-08-21 22:10:26'),
(397, NULL, 3, '2021-08-21 22:10:41', '90.4091166', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 22:10:41', '2021-08-21 22:10:41'),
(398, NULL, 3, '2021-08-21 22:10:51', '90.4091191', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:10:51', '2021-08-21 22:10:51'),
(399, NULL, 3, '2021-08-21 22:11:01', '90.4091226', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:11:01', '2021-08-21 22:11:01'),
(400, NULL, 3, '2021-08-21 22:11:11', '90.4091186', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-21 22:11:11', '2021-08-21 22:11:11'),
(401, NULL, 3, '2021-08-21 22:11:21', '90.4091229', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 22:11:21', '2021-08-21 22:11:21'),
(402, NULL, 3, '2021-08-21 22:11:31', '90.4091237', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:11:31', '2021-08-21 22:11:31'),
(403, NULL, 3, '2021-08-21 22:11:41', '90.4091272', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:11:41', '2021-08-21 22:11:41'),
(404, NULL, 3, '2021-08-21 22:11:51', '90.409122', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 22:11:51', '2021-08-21 22:11:51'),
(405, NULL, 3, '2021-08-21 22:12:01', '90.4091246', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 22:12:01', '2021-08-21 22:12:01'),
(406, NULL, 3, '2021-08-21 22:12:11', '90.409123', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 22:12:11', '2021-08-21 22:12:11'),
(407, NULL, 3, '2021-08-21 22:12:21', '90.4091291', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:12:21', '2021-08-21 22:12:21'),
(408, NULL, 3, '2021-08-21 22:12:31', '90.4091247', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 22:12:31', '2021-08-21 22:12:31'),
(409, NULL, 3, '2021-08-21 22:12:41', '90.409126', '23.743508', 'Flat#602, Dhaka District, BD', '2021-08-21 22:12:41', '2021-08-21 22:12:41'),
(410, NULL, 3, '2021-08-21 22:12:50', '90.4091211', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 22:12:50', '2021-08-21 22:12:50'),
(411, NULL, 3, '2021-08-21 22:13:01', '90.4091223', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 22:13:01', '2021-08-21 22:13:01'),
(412, NULL, 3, '2021-08-21 22:13:10', '90.4091206', '23.7435093', 'Flat#602, Dhaka District, BD', '2021-08-21 22:13:10', '2021-08-21 22:13:10'),
(413, NULL, 3, '2021-08-21 22:13:26', '90.4091134', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 22:13:26', '2021-08-21 22:13:26'),
(414, NULL, 3, '2021-08-21 22:13:36', '90.409115', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-21 22:13:36', '2021-08-21 22:13:36'),
(415, NULL, 3, '2021-08-21 22:13:46', '90.4091192', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 22:13:46', '2021-08-21 22:13:46'),
(416, NULL, 3, '2021-08-21 22:13:56', '90.4091357', '23.7435224', 'Flat#602, Dhaka District, BD', '2021-08-21 22:13:56', '2021-08-21 22:13:56'),
(417, NULL, 3, '2021-08-21 22:14:06', '90.4091215', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:14:06', '2021-08-21 22:14:06'),
(418, NULL, 3, '2021-08-21 22:14:16', '90.4091197', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:14:16', '2021-08-21 22:14:16'),
(419, NULL, 3, '2021-08-21 22:14:26', '90.4091234', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:14:26', '2021-08-21 22:14:26'),
(420, NULL, 3, '2021-08-21 22:14:36', '90.4091223', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 22:14:36', '2021-08-21 22:14:36'),
(421, NULL, 3, '2021-08-21 22:14:46', '90.4091197', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 22:14:46', '2021-08-21 22:14:46'),
(422, NULL, 3, '2021-08-21 22:14:56', '90.4091166', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 22:14:56', '2021-08-21 22:14:56'),
(423, NULL, 3, '2021-08-21 22:15:06', '90.4091209', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-21 22:15:06', '2021-08-21 22:15:06'),
(424, NULL, 3, '2021-08-21 22:15:16', '90.4091237', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:15:16', '2021-08-21 22:15:16'),
(425, NULL, 3, '2021-08-21 22:15:26', '90.4091279', '23.7435184', 'Flat#602, Dhaka District, BD', '2021-08-21 22:15:26', '2021-08-21 22:15:26'),
(426, NULL, 3, '2021-08-21 22:15:36', '90.4091262', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-21 22:15:36', '2021-08-21 22:15:36'),
(427, NULL, 3, '2021-08-21 22:15:46', '90.4091281', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 22:15:46', '2021-08-21 22:15:46'),
(428, NULL, 3, '2021-08-21 22:15:56', '90.409124', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:15:56', '2021-08-21 22:15:56'),
(429, NULL, 3, '2021-08-21 22:16:06', '90.4091189', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 22:16:06', '2021-08-21 22:16:06'),
(430, NULL, 3, '2021-08-21 22:16:16', '90.4091247', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 22:16:16', '2021-08-21 22:16:16'),
(431, NULL, 3, '2021-08-21 22:16:27', '90.4091157', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:16:27', '2021-08-21 22:16:27'),
(432, NULL, 3, '2021-08-21 22:16:36', '90.409124', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:16:36', '2021-08-21 22:16:36'),
(433, NULL, 3, '2021-08-21 22:16:46', '90.4091282', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:16:46', '2021-08-21 22:16:46'),
(434, NULL, 3, '2021-08-21 22:16:56', '90.4091284', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 22:16:56', '2021-08-21 22:16:56'),
(435, NULL, 3, '2021-08-21 22:17:06', '90.4091214', '23.7435081', 'Flat#602, Dhaka District, BD', '2021-08-21 22:17:06', '2021-08-21 22:17:06'),
(436, NULL, 3, '2021-08-21 22:17:17', '90.4091222', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:17:17', '2021-08-21 22:17:17'),
(437, NULL, 3, '2021-08-21 22:17:27', '90.4091193', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:17:27', '2021-08-21 22:17:27'),
(438, NULL, 3, '2021-08-21 22:17:36', '90.4091176', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 22:17:36', '2021-08-21 22:17:36'),
(439, NULL, 3, '2021-08-21 22:17:47', '90.4091241', '23.7435158', 'Flat#602, Dhaka District, BD', '2021-08-21 22:17:47', '2021-08-21 22:17:47'),
(440, NULL, 3, '2021-08-21 22:17:57', '90.4091234', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 22:17:57', '2021-08-21 22:17:57'),
(441, NULL, 3, '2021-08-21 22:18:06', '90.4091208', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:18:06', '2021-08-21 22:18:06'),
(442, NULL, 3, '2021-08-21 22:18:15', '90.4091226', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:18:15', '2021-08-21 22:18:15'),
(443, NULL, 3, '2021-08-21 22:18:26', '90.4091187', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:18:26', '2021-08-21 22:18:26'),
(444, NULL, 3, '2021-08-21 22:18:36', '90.4091181', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:18:36', '2021-08-21 22:18:36'),
(445, NULL, 3, '2021-08-21 22:18:46', '90.4091191', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 22:18:46', '2021-08-21 22:18:46'),
(446, NULL, 3, '2021-08-21 22:18:57', '90.4091231', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-21 22:18:57', '2021-08-21 22:18:57'),
(447, NULL, 3, '2021-08-21 22:19:06', '90.4091157', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 22:19:06', '2021-08-21 22:19:06'),
(448, NULL, 3, '2021-08-21 22:19:16', '90.4091267', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:19:16', '2021-08-21 22:19:16'),
(449, NULL, 3, '2021-08-21 22:19:26', '90.4091325', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:19:26', '2021-08-21 22:19:26'),
(450, NULL, 3, '2021-08-21 22:19:36', '90.4091282', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 22:19:36', '2021-08-21 22:19:36'),
(451, NULL, 3, '2021-08-21 22:19:46', '90.4091242', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:19:46', '2021-08-21 22:19:46'),
(452, NULL, 3, '2021-08-21 22:19:56', '90.4091197', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 22:19:56', '2021-08-21 22:19:56'),
(453, NULL, 3, '2021-08-21 22:20:06', '90.4091254', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:20:06', '2021-08-21 22:20:06'),
(454, NULL, 3, '2021-08-21 22:20:16', '90.4091279', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-21 22:20:16', '2021-08-21 22:20:16'),
(455, NULL, 3, '2021-08-21 22:20:26', '90.4091275', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 22:20:26', '2021-08-21 22:20:26'),
(456, NULL, 3, '2021-08-21 22:20:36', '90.4091251', '23.7435167', 'Flat#602, Dhaka District, BD', '2021-08-21 22:20:36', '2021-08-21 22:20:36'),
(457, NULL, 3, '2021-08-21 22:20:46', '90.4091231', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 22:20:46', '2021-08-21 22:20:46'),
(458, NULL, 3, '2021-08-21 22:20:56', '90.4091239', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:20:56', '2021-08-21 22:20:56'),
(459, NULL, 3, '2021-08-21 22:21:06', '90.409121', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 22:21:06', '2021-08-21 22:21:06'),
(460, NULL, 3, '2021-08-21 22:21:17', '90.4091191', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 22:21:17', '2021-08-21 22:21:17'),
(461, NULL, 3, '2021-08-21 22:21:27', '90.4091211', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:21:27', '2021-08-21 22:21:27'),
(462, NULL, 3, '2021-08-21 22:21:37', '90.4091307', '23.7435162', 'Flat#602, Dhaka District, BD', '2021-08-21 22:21:37', '2021-08-21 22:21:37'),
(463, NULL, 3, '2021-08-21 22:21:51', '90.4091243', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:21:51', '2021-08-21 22:21:51'),
(464, NULL, 2, '2021-08-21 22:21:53', '90.4226465', '23.8581396', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:21:53', '2021-08-21 22:21:53'),
(465, NULL, 3, '2021-08-21 22:22:01', '90.4091207', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:22:01', '2021-08-21 22:22:01'),
(466, NULL, 3, '2021-08-21 22:22:11', '90.4091241', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:22:11', '2021-08-21 22:22:11'),
(467, NULL, 3, '2021-08-21 22:22:21', '90.4091291', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:22:21', '2021-08-21 22:22:21'),
(468, NULL, 3, '2021-08-21 22:22:31', '90.4091234', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 22:22:31', '2021-08-21 22:22:31'),
(469, NULL, 3, '2021-08-21 22:22:41', '90.4091185', '23.7435098', 'Flat#602, Dhaka District, BD', '2021-08-21 22:22:41', '2021-08-21 22:22:41'),
(470, NULL, 3, '2021-08-21 22:22:51', '90.4091246', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:22:51', '2021-08-21 22:22:51'),
(471, NULL, 3, '2021-08-21 22:23:01', '90.4091223', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 22:23:01', '2021-08-21 22:23:01'),
(472, NULL, 3, '2021-08-21 22:23:11', '90.4091223', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:23:11', '2021-08-21 22:23:11'),
(473, NULL, 3, '2021-08-21 22:23:21', '90.4091218', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 22:23:21', '2021-08-21 22:23:21'),
(474, NULL, 3, '2021-08-21 22:23:31', '90.409126', '23.7435162', 'Flat#602, Dhaka District, BD', '2021-08-21 22:23:31', '2021-08-21 22:23:31'),
(475, NULL, 3, '2021-08-21 22:23:41', '90.4091239', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:23:41', '2021-08-21 22:23:41'),
(476, NULL, 3, '2021-08-21 22:23:51', '90.4091223', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-21 22:23:51', '2021-08-21 22:23:51'),
(477, NULL, 3, '2021-08-21 22:24:01', '90.4091176', '23.7435093', 'Flat#602, Dhaka District, BD', '2021-08-21 22:24:01', '2021-08-21 22:24:01'),
(478, NULL, 2, '2021-08-21 22:24:05', '90.422647', '23.8581397', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:24:05', '2021-08-21 22:24:05'),
(479, NULL, 3, '2021-08-21 22:24:11', '90.4091248', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:24:11', '2021-08-21 22:24:11'),
(480, NULL, 2, '2021-08-21 22:24:15', '90.4226387', '23.8581468', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:24:15', '2021-08-21 22:24:15'),
(481, NULL, 3, '2021-08-21 22:24:21', '90.4091258', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 22:24:21', '2021-08-21 22:24:21'),
(482, NULL, 2, '2021-08-21 22:24:25', '90.4226358', '23.8581408', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:24:25', '2021-08-21 22:24:25'),
(483, NULL, 3, '2021-08-21 22:24:31', '90.4091229', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 22:24:31', '2021-08-21 22:24:31'),
(484, NULL, 2, '2021-08-21 22:24:35', '90.4226461', '23.8581473', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:24:35', '2021-08-21 22:24:35'),
(485, NULL, 3, '2021-08-21 22:24:41', '90.409122', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-21 22:24:41', '2021-08-21 22:24:41'),
(486, NULL, 2, '2021-08-21 22:24:45', '90.4226476', '23.8581406', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:24:45', '2021-08-21 22:24:45'),
(487, NULL, 3, '2021-08-21 22:24:51', '90.4091232', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-21 22:24:51', '2021-08-21 22:24:51'),
(488, NULL, 2, '2021-08-21 22:24:55', '90.4226487', '23.8581411', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:24:55', '2021-08-21 22:24:55'),
(489, NULL, 3, '2021-08-21 22:25:01', '90.4091271', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:25:01', '2021-08-21 22:25:01'),
(490, NULL, 2, '2021-08-21 22:25:05', '90.422646', '23.8581489', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:25:05', '2021-08-21 22:25:05'),
(491, NULL, 3, '2021-08-21 22:25:11', '90.4091226', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 22:25:11', '2021-08-21 22:25:11'),
(492, NULL, 2, '2021-08-21 22:25:15', '90.4226466', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:25:15', '2021-08-21 22:25:15'),
(493, NULL, 3, '2021-08-21 22:25:21', '90.4091246', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:25:21', '2021-08-21 22:25:21'),
(494, NULL, 2, '2021-08-21 22:25:25', '90.4226422', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:25:25', '2021-08-21 22:25:25'),
(495, NULL, 3, '2021-08-21 22:25:31', '90.4091248', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 22:25:31', '2021-08-21 22:25:31'),
(496, NULL, 2, '2021-08-21 22:25:35', '90.4226432', '23.8581507', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:25:35', '2021-08-21 22:25:35'),
(497, NULL, 3, '2021-08-21 22:25:40', '90.4091159', '23.74351', 'Flat#602, Dhaka District, BD', '2021-08-21 22:25:40', '2021-08-21 22:25:40'),
(498, NULL, 2, '2021-08-21 22:25:45', '90.4226459', '23.8581408', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:25:45', '2021-08-21 22:25:45'),
(499, NULL, 3, '2021-08-21 22:25:51', '90.4091117', '23.7435092', 'Flat#602, Dhaka District, BD', '2021-08-21 22:25:51', '2021-08-21 22:25:51'),
(500, NULL, 2, '2021-08-21 22:25:55', '90.4226361', '23.8581482', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:25:55', '2021-08-21 22:25:55'),
(501, NULL, 3, '2021-08-21 22:26:01', '90.4091152', '23.7435102', 'Flat#602, Dhaka District, BD', '2021-08-21 22:26:01', '2021-08-21 22:26:01'),
(502, NULL, 2, '2021-08-21 22:26:05', '90.422642', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:26:05', '2021-08-21 22:26:05'),
(503, NULL, 3, '2021-08-21 22:26:11', '90.4091191', '23.7435174', 'Flat#602, Dhaka District, BD', '2021-08-21 22:26:11', '2021-08-21 22:26:11'),
(504, NULL, 2, '2021-08-21 22:26:15', '90.422642', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:26:15', '2021-08-21 22:26:15'),
(505, NULL, 3, '2021-08-21 22:26:21', '90.4091192', '23.7435114', 'Flat#602, Dhaka District, BD', '2021-08-21 22:26:21', '2021-08-21 22:26:21'),
(506, NULL, 2, '2021-08-21 22:26:25', '90.4226452', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:26:25', '2021-08-21 22:26:25'),
(507, NULL, 2, '2021-08-21 22:26:35', '90.4226416', '23.8581389', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:26:35', '2021-08-21 22:26:35'),
(508, NULL, 3, '2021-08-21 22:26:36', '90.4091148', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 22:26:36', '2021-08-21 22:26:36'),
(509, NULL, 3, '2021-08-21 22:26:41', '90.4091152', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 22:26:41', '2021-08-21 22:26:41'),
(510, NULL, 2, '2021-08-21 22:26:44', '90.4226453', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:26:44', '2021-08-21 22:26:44'),
(511, NULL, 3, '2021-08-21 22:26:51', '90.409124', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 22:26:51', '2021-08-21 22:26:51'),
(512, NULL, 2, '2021-08-21 22:26:55', '90.4226447', '23.858146', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:26:55', '2021-08-21 22:26:55'),
(513, NULL, 3, '2021-08-21 22:27:01', '90.4091241', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 22:27:01', '2021-08-21 22:27:01'),
(514, NULL, 2, '2021-08-21 22:27:05', '90.422646', '23.8581405', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:27:05', '2021-08-21 22:27:05'),
(515, NULL, 3, '2021-08-21 22:27:11', '90.4091189', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 22:27:11', '2021-08-21 22:27:11'),
(516, NULL, 2, '2021-08-21 22:27:15', '90.4226438', '23.858164', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:27:15', '2021-08-21 22:27:15'),
(517, NULL, 3, '2021-08-21 22:27:21', '90.4091257', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:27:21', '2021-08-21 22:27:21'),
(518, NULL, 2, '2021-08-21 22:27:25', '90.4226365', '23.8581497', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:27:25', '2021-08-21 22:27:25'),
(519, NULL, 3, '2021-08-21 22:27:31', '90.4091267', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 22:27:31', '2021-08-21 22:27:31'),
(520, NULL, 2, '2021-08-21 22:27:35', '90.422643', '23.8581486', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:27:35', '2021-08-21 22:27:35'),
(521, NULL, 3, '2021-08-21 22:27:41', '90.4091283', '23.7435178', 'Flat#602, Dhaka District, BD', '2021-08-21 22:27:41', '2021-08-21 22:27:41'),
(522, NULL, 2, '2021-08-21 22:27:45', '90.4226531', '23.8581647', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:27:45', '2021-08-21 22:27:45'),
(523, NULL, 3, '2021-08-21 22:27:51', '90.4091148', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 22:27:51', '2021-08-21 22:27:51'),
(524, NULL, 2, '2021-08-21 22:27:55', '90.422635', '23.858149', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:27:55', '2021-08-21 22:27:55'),
(525, NULL, 3, '2021-08-21 22:28:01', '90.4091232', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:28:01', '2021-08-21 22:28:01'),
(526, NULL, 2, '2021-08-21 22:28:05', '90.4226434', '23.858132', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:28:05', '2021-08-21 22:28:05'),
(527, NULL, 3, '2021-08-21 22:28:11', '90.4091201', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 22:28:11', '2021-08-21 22:28:11'),
(528, NULL, 2, '2021-08-21 22:28:15', '90.4226442', '23.858152', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:28:15', '2021-08-21 22:28:15'),
(529, NULL, 3, '2021-08-21 22:28:21', '90.4091017', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:28:21', '2021-08-21 22:28:21'),
(530, NULL, 2, '2021-08-21 22:28:25', '90.4226463', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:28:25', '2021-08-21 22:28:25'),
(531, NULL, 3, '2021-08-21 22:28:31', '90.4091258', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 22:28:31', '2021-08-21 22:28:31'),
(532, NULL, 2, '2021-08-21 22:28:35', '90.4226414', '23.8581476', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:28:35', '2021-08-21 22:28:35'),
(533, NULL, 3, '2021-08-21 22:28:41', '90.4091274', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:28:41', '2021-08-21 22:28:41'),
(534, NULL, 2, '2021-08-21 22:28:45', '90.4226388', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:28:45', '2021-08-21 22:28:45'),
(535, NULL, 3, '2021-08-21 22:28:51', '90.4091239', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:28:51', '2021-08-21 22:28:51'),
(536, NULL, 2, '2021-08-21 22:28:55', '90.4226433', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:28:55', '2021-08-21 22:28:55'),
(537, NULL, 3, '2021-08-21 22:29:01', '90.4091227', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 22:29:01', '2021-08-21 22:29:01'),
(538, NULL, 2, '2021-08-21 22:29:05', '90.422643', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:29:05', '2021-08-21 22:29:05'),
(539, NULL, 3, '2021-08-21 22:29:11', '90.4091242', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:29:11', '2021-08-21 22:29:11'),
(540, NULL, 2, '2021-08-21 22:29:15', '90.4226513', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:29:15', '2021-08-21 22:29:15'),
(541, NULL, 3, '2021-08-21 22:29:21', '90.4091224', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 22:29:21', '2021-08-21 22:29:21'),
(542, NULL, 2, '2021-08-21 22:29:25', '90.4226452', '23.8581497', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:29:25', '2021-08-21 22:29:25'),
(543, NULL, 3, '2021-08-21 22:29:31', '90.4091209', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 22:29:31', '2021-08-21 22:29:31'),
(544, NULL, 2, '2021-08-21 22:29:35', '90.4226459', '23.8581464', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:29:35', '2021-08-21 22:29:35'),
(545, NULL, 3, '2021-08-21 22:29:41', '90.4091218', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-21 22:29:41', '2021-08-21 22:29:41'),
(546, NULL, 2, '2021-08-21 22:29:45', '90.4226433', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:29:45', '2021-08-21 22:29:45'),
(547, NULL, 3, '2021-08-21 22:29:51', '90.4091214', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:29:51', '2021-08-21 22:29:51'),
(548, NULL, 2, '2021-08-21 22:29:55', '90.4226436', '23.8581504', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:29:55', '2021-08-21 22:29:55'),
(549, NULL, 3, '2021-08-21 22:30:01', '90.4091287', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:30:01', '2021-08-21 22:30:01'),
(550, NULL, 2, '2021-08-21 22:30:05', '90.4226434', '23.8581491', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:30:05', '2021-08-21 22:30:05'),
(551, NULL, 3, '2021-08-21 22:30:11', '90.4091315', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 22:30:11', '2021-08-21 22:30:11'),
(552, NULL, 2, '2021-08-21 22:30:15', '90.4226469', '23.8581392', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:30:15', '2021-08-21 22:30:15'),
(553, NULL, 3, '2021-08-21 22:30:21', '90.4091276', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 22:30:21', '2021-08-21 22:30:21'),
(554, NULL, 2, '2021-08-21 22:30:25', '90.4226445', '23.8581487', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:30:25', '2021-08-21 22:30:25'),
(555, NULL, 3, '2021-08-21 22:30:31', '90.4091332', '23.7435189', 'Flat#602, Dhaka District, BD', '2021-08-21 22:30:31', '2021-08-21 22:30:31'),
(556, NULL, 2, '2021-08-21 22:30:35', '90.4226453', '23.8581485', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:30:35', '2021-08-21 22:30:35'),
(557, NULL, 3, '2021-08-21 22:30:41', '90.4091331', '23.7435181', 'Flat#602, Dhaka District, BD', '2021-08-21 22:30:41', '2021-08-21 22:30:41'),
(558, NULL, 2, '2021-08-21 22:30:45', '90.4226441', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:30:45', '2021-08-21 22:30:45'),
(559, NULL, 3, '2021-08-21 22:30:51', '90.4091294', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:30:51', '2021-08-21 22:30:51'),
(560, NULL, 2, '2021-08-21 22:30:55', '90.4226443', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:30:55', '2021-08-21 22:30:55'),
(561, NULL, 3, '2021-08-21 22:31:01', '90.4091211', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:31:01', '2021-08-21 22:31:01'),
(562, NULL, 3, '2021-08-21 22:31:11', '90.4091188', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:31:11', '2021-08-21 22:31:11'),
(563, NULL, 3, '2021-08-21 22:31:21', '90.4091257', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:31:21', '2021-08-21 22:31:21'),
(564, NULL, 3, '2021-08-21 22:31:31', '90.4091167', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:31:31', '2021-08-21 22:31:31'),
(565, NULL, 3, '2021-08-21 22:31:41', '90.4091194', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 22:31:41', '2021-08-21 22:31:41'),
(566, NULL, 3, '2021-08-21 22:31:51', '90.4091256', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 22:31:51', '2021-08-21 22:31:51'),
(567, NULL, 3, '2021-08-21 22:32:01', '90.4091205', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 22:32:01', '2021-08-21 22:32:01'),
(568, NULL, 3, '2021-08-21 22:32:11', '90.409124', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 22:32:11', '2021-08-21 22:32:11'),
(569, NULL, 3, '2021-08-21 22:32:21', '90.4091194', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:32:21', '2021-08-21 22:32:21'),
(570, NULL, 3, '2021-08-21 22:32:31', '90.4091183', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 22:32:31', '2021-08-21 22:32:31'),
(571, NULL, 3, '2021-08-21 22:32:41', '90.4091236', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:32:41', '2021-08-21 22:32:41'),
(572, NULL, 3, '2021-08-21 22:32:51', '90.4091223', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 22:32:51', '2021-08-21 22:32:51'),
(573, NULL, 3, '2021-08-21 22:33:01', '90.4091176', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:33:01', '2021-08-21 22:33:01'),
(574, NULL, 3, '2021-08-21 22:33:11', '90.4091174', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 22:33:11', '2021-08-21 22:33:11'),
(575, NULL, 3, '2021-08-21 22:33:21', '90.4091168', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 22:33:21', '2021-08-21 22:33:21'),
(576, NULL, 3, '2021-08-21 22:33:31', '90.4091204', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:33:31', '2021-08-21 22:33:31'),
(577, NULL, 3, '2021-08-21 22:33:41', '90.4091261', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 22:33:41', '2021-08-21 22:33:41'),
(578, NULL, 3, '2021-08-21 22:33:51', '90.4091184', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 22:33:51', '2021-08-21 22:33:51'),
(579, NULL, 3, '2021-08-21 22:34:01', '90.4091251', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:34:01', '2021-08-21 22:34:01'),
(580, NULL, 3, '2021-08-21 22:34:11', '90.4091236', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 22:34:11', '2021-08-21 22:34:11'),
(581, NULL, 3, '2021-08-21 22:34:21', '90.4091194', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 22:34:21', '2021-08-21 22:34:21'),
(582, NULL, 3, '2021-08-21 22:34:31', '90.4091131', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:34:31', '2021-08-21 22:34:31'),
(583, NULL, 3, '2021-08-21 22:34:41', '90.4091251', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-21 22:34:41', '2021-08-21 22:34:41'),
(584, NULL, 3, '2021-08-21 22:34:51', '90.4091243', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 22:34:51', '2021-08-21 22:34:51'),
(585, NULL, 3, '2021-08-21 22:35:01', '90.4091213', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:35:01', '2021-08-21 22:35:01'),
(586, NULL, 3, '2021-08-21 22:35:11', '90.4091234', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:35:11', '2021-08-21 22:35:11'),
(587, NULL, 3, '2021-08-21 22:35:21', '90.4091199', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 22:35:21', '2021-08-21 22:35:21'),
(588, NULL, 3, '2021-08-21 22:35:31', '90.4091207', '23.7435117', 'Flat#602, Dhaka District, BD', '2021-08-21 22:35:31', '2021-08-21 22:35:31'),
(589, NULL, 3, '2021-08-21 22:35:41', '90.4091244', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 22:35:41', '2021-08-21 22:35:41'),
(590, NULL, 3, '2021-08-21 22:35:51', '90.409125', '23.7435117', 'Flat#602, Dhaka District, BD', '2021-08-21 22:35:51', '2021-08-21 22:35:51'),
(591, NULL, 3, '2021-08-21 22:36:01', '90.4091185', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 22:36:01', '2021-08-21 22:36:01'),
(592, NULL, 3, '2021-08-21 22:36:11', '90.4091203', '23.7435164', 'Flat#602, Dhaka District, BD', '2021-08-21 22:36:11', '2021-08-21 22:36:11'),
(593, NULL, 3, '2021-08-21 22:36:21', '90.4091225', '23.7435184', 'Flat#602, Dhaka District, BD', '2021-08-21 22:36:21', '2021-08-21 22:36:21'),
(594, NULL, 3, '2021-08-21 22:36:31', '90.4091231', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:36:31', '2021-08-21 22:36:31'),
(595, NULL, 3, '2021-08-21 22:36:41', '90.4091234', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 22:36:41', '2021-08-21 22:36:41'),
(596, NULL, 3, '2021-08-21 22:36:51', '90.4091235', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 22:36:51', '2021-08-21 22:36:51'),
(597, NULL, 3, '2021-08-21 22:37:01', '90.4091137', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:37:01', '2021-08-21 22:37:01'),
(598, NULL, 3, '2021-08-21 22:37:11', '90.4091096', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:37:11', '2021-08-21 22:37:11'),
(599, NULL, 3, '2021-08-21 22:37:21', '90.4091147', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 22:37:21', '2021-08-21 22:37:21'),
(600, NULL, 3, '2021-08-21 22:37:31', '90.4091237', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:37:31', '2021-08-21 22:37:31'),
(601, NULL, 3, '2021-08-21 22:37:41', '90.4091257', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:37:41', '2021-08-21 22:37:41'),
(602, NULL, 3, '2021-08-21 22:37:51', '90.4091244', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:37:51', '2021-08-21 22:37:51'),
(603, NULL, 3, '2021-08-21 22:38:01', '90.4091298', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-21 22:38:01', '2021-08-21 22:38:01'),
(604, NULL, 3, '2021-08-21 22:38:11', '90.4091281', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 22:38:11', '2021-08-21 22:38:11'),
(605, NULL, 3, '2021-08-21 22:38:21', '90.4091099', '23.7435188', 'Flat#602, Dhaka District, BD', '2021-08-21 22:38:21', '2021-08-21 22:38:21'),
(606, NULL, 3, '2021-08-21 22:38:31', '90.4091176', '23.7435211', 'Flat#602, Dhaka District, BD', '2021-08-21 22:38:31', '2021-08-21 22:38:31'),
(607, NULL, 3, '2021-08-21 22:38:41', '90.4091197', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:38:41', '2021-08-21 22:38:41'),
(608, NULL, 3, '2021-08-21 22:38:51', '90.4091228', '23.7435114', 'Flat#602, Dhaka District, BD', '2021-08-21 22:38:51', '2021-08-21 22:38:51'),
(609, NULL, 3, '2021-08-21 22:39:01', '90.4091211', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:39:01', '2021-08-21 22:39:01'),
(610, NULL, 3, '2021-08-21 22:39:10', '90.409122', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-21 22:39:10', '2021-08-21 22:39:10'),
(611, NULL, 3, '2021-08-21 22:39:21', '90.4091195', '23.743511', 'Flat#602, Dhaka District, BD', '2021-08-21 22:39:21', '2021-08-21 22:39:21'),
(612, NULL, 3, '2021-08-21 22:39:31', '90.40912', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 22:39:31', '2021-08-21 22:39:31'),
(613, NULL, 3, '2021-08-21 22:39:41', '90.4091217', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 22:39:41', '2021-08-21 22:39:41'),
(614, NULL, 3, '2021-08-21 22:39:51', '90.4091042', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:39:51', '2021-08-21 22:39:51'),
(615, NULL, 3, '2021-08-21 22:40:01', '90.4091101', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 22:40:01', '2021-08-21 22:40:01'),
(616, NULL, 3, '2021-08-21 22:40:11', '90.4091196', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 22:40:11', '2021-08-21 22:40:11'),
(617, NULL, 3, '2021-08-21 22:40:21', '90.4091215', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:40:21', '2021-08-21 22:40:21'),
(618, NULL, 3, '2021-08-21 22:40:31', '90.4091222', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:40:31', '2021-08-21 22:40:31'),
(619, NULL, 3, '2021-08-21 22:40:41', '90.4091229', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:40:41', '2021-08-21 22:40:41'),
(620, NULL, 3, '2021-08-21 22:40:51', '90.4091215', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:40:51', '2021-08-21 22:40:51'),
(621, NULL, 3, '2021-08-21 22:41:01', '90.4091193', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:41:01', '2021-08-21 22:41:01'),
(622, NULL, 3, '2021-08-21 22:41:11', '90.4091253', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:41:11', '2021-08-21 22:41:11'),
(623, NULL, 3, '2021-08-21 22:41:21', '90.4091156', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-21 22:41:21', '2021-08-21 22:41:21'),
(624, NULL, 3, '2021-08-21 22:41:31', '90.4091266', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 22:41:31', '2021-08-21 22:41:31'),
(625, NULL, 3, '2021-08-21 22:41:41', '90.4091302', '23.7435141', 'Flat#602, Dhaka District, BD', '2021-08-21 22:41:41', '2021-08-21 22:41:41'),
(626, NULL, 3, '2021-08-21 22:41:51', '90.4091215', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-21 22:41:51', '2021-08-21 22:41:51'),
(627, NULL, 3, '2021-08-21 22:42:01', '90.4091152', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-21 22:42:01', '2021-08-21 22:42:01'),
(628, NULL, 3, '2021-08-21 22:42:11', '90.4091155', '23.7435064', 'Flat#602, Dhaka District, BD', '2021-08-21 22:42:11', '2021-08-21 22:42:11'),
(629, NULL, 3, '2021-08-21 22:42:21', '90.4091151', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:42:21', '2021-08-21 22:42:21'),
(630, NULL, 3, '2021-08-21 22:42:31', '90.4091171', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:42:31', '2021-08-21 22:42:31'),
(631, NULL, 3, '2021-08-21 22:42:46', '90.4091176', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 22:42:46', '2021-08-21 22:42:46'),
(632, NULL, 3, '2021-08-21 22:42:56', '90.4091235', '23.7435175', 'Flat#602, Dhaka District, BD', '2021-08-21 22:42:56', '2021-08-21 22:42:56'),
(633, NULL, 3, '2021-08-21 22:43:06', '90.4091244', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:43:06', '2021-08-21 22:43:06'),
(634, NULL, 3, '2021-08-21 22:43:16', '90.4091244', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:43:16', '2021-08-21 22:43:16'),
(635, NULL, 3, '2021-08-21 22:43:26', '90.409126', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 22:43:26', '2021-08-21 22:43:26'),
(636, NULL, 3, '2021-08-21 22:43:36', '90.4091265', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 22:43:36', '2021-08-21 22:43:36'),
(637, NULL, 3, '2021-08-21 22:43:46', '90.4091296', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:43:46', '2021-08-21 22:43:46'),
(638, NULL, 3, '2021-08-21 22:43:56', '90.4091237', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 22:43:56', '2021-08-21 22:43:56'),
(639, NULL, 3, '2021-08-21 22:44:06', '90.4091201', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:44:06', '2021-08-21 22:44:06'),
(640, NULL, 3, '2021-08-21 22:44:16', '90.409123', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:44:16', '2021-08-21 22:44:16'),
(641, NULL, 3, '2021-08-21 22:44:26', '90.4091241', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 22:44:26', '2021-08-21 22:44:26'),
(642, NULL, 3, '2021-08-21 22:44:36', '90.4091206', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 22:44:36', '2021-08-21 22:44:36'),
(643, NULL, 3, '2021-08-21 22:44:47', '90.4091155', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:44:47', '2021-08-21 22:44:47'),
(644, NULL, 3, '2021-08-21 22:44:56', '90.4091193', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 22:44:56', '2021-08-21 22:44:56'),
(645, NULL, 3, '2021-08-21 22:45:07', '90.4091198', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 22:45:07', '2021-08-21 22:45:07'),
(646, NULL, 3, '2021-08-21 22:45:16', '90.409129', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 22:45:16', '2021-08-21 22:45:16'),
(647, NULL, 3, '2021-08-21 22:45:26', '90.4091279', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 22:45:26', '2021-08-21 22:45:26'),
(648, NULL, 3, '2021-08-21 22:45:37', '90.4091207', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:45:37', '2021-08-21 22:45:37'),
(649, NULL, 2, '2021-08-21 22:45:45', '90.4226461', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:45:45', '2021-08-21 22:45:45'),
(650, NULL, 3, '2021-08-21 22:45:46', '90.4091229', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:45:46', '2021-08-21 22:45:46'),
(651, NULL, 2, '2021-08-21 22:45:56', '90.4226424', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:45:56', '2021-08-21 22:45:56'),
(652, NULL, 3, '2021-08-21 22:45:56', '90.4091231', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 22:45:56', '2021-08-21 22:45:56'),
(653, NULL, 3, '2021-08-21 22:46:06', '90.4091279', '23.7435171', 'Flat#602, Dhaka District, BD', '2021-08-21 22:46:06', '2021-08-21 22:46:06'),
(654, NULL, 2, '2021-08-21 22:46:08', '90.4226453', '23.8581441', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:46:08', '2021-08-21 22:46:08'),
(655, NULL, 3, '2021-08-21 22:46:16', '90.4091297', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:46:16', '2021-08-21 22:46:16'),
(656, NULL, 2, '2021-08-21 22:46:18', '90.4226443', '23.8581465', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:46:18', '2021-08-21 22:46:18'),
(657, NULL, 3, '2021-08-21 22:46:26', '90.4091304', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 22:46:26', '2021-08-21 22:46:26'),
(658, NULL, 2, '2021-08-21 22:46:36', '90.4226477', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:46:36', '2021-08-21 22:46:36'),
(659, NULL, 3, '2021-08-21 22:46:36', '90.4091276', '23.7435172', 'Flat#602, Dhaka District, BD', '2021-08-21 22:46:36', '2021-08-21 22:46:36'),
(660, NULL, 3, '2021-08-21 22:46:46', '90.4091271', '23.7435173', 'Flat#602, Dhaka District, BD', '2021-08-21 22:46:46', '2021-08-21 22:46:46'),
(661, NULL, 2, '2021-08-21 22:46:46', '90.4226461', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:46:46', '2021-08-21 22:46:46'),
(662, NULL, 3, '2021-08-21 22:46:56', '90.4091249', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:46:56', '2021-08-21 22:46:56'),
(663, NULL, 2, '2021-08-21 22:46:56', '90.4226446', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:46:56', '2021-08-21 22:46:56'),
(664, NULL, 3, '2021-08-21 22:47:06', '90.409123', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-21 22:47:06', '2021-08-21 22:47:06'),
(665, NULL, 2, '2021-08-21 22:47:06', '90.4226466', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:47:06', '2021-08-21 22:47:06'),
(666, NULL, 3, '2021-08-21 22:47:16', '90.4091205', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 22:47:16', '2021-08-21 22:47:16'),
(667, NULL, 2, '2021-08-21 22:47:16', '90.4226458', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:47:16', '2021-08-21 22:47:16'),
(668, NULL, 3, '2021-08-21 22:47:26', '90.4091226', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 22:47:26', '2021-08-21 22:47:26'),
(669, NULL, 2, '2021-08-21 22:47:26', '90.4226457', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:47:26', '2021-08-21 22:47:26'),
(670, NULL, 2, '2021-08-21 22:47:36', '90.422647', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:47:36', '2021-08-21 22:47:36'),
(671, NULL, 3, '2021-08-21 22:47:36', '90.4091228', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 22:47:36', '2021-08-21 22:47:36'),
(672, NULL, 3, '2021-08-21 22:47:46', '90.4091174', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-21 22:47:46', '2021-08-21 22:47:46'),
(673, NULL, 2, '2021-08-21 22:47:46', '90.4226446', '23.8581432', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:47:46', '2021-08-21 22:47:46'),
(674, NULL, 3, '2021-08-21 22:47:56', '90.4091161', '23.7435094', 'Flat#602, Dhaka District, BD', '2021-08-21 22:47:56', '2021-08-21 22:47:56'),
(675, NULL, 2, '2021-08-21 22:47:56', '90.4226465', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:47:56', '2021-08-21 22:47:56'),
(676, NULL, 2, '2021-08-21 22:48:06', '90.4226477', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:48:06', '2021-08-21 22:48:06'),
(677, NULL, 3, '2021-08-21 22:48:06', '90.4091159', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:48:06', '2021-08-21 22:48:06'),
(678, NULL, 2, '2021-08-21 22:48:16', '90.4226456', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:48:16', '2021-08-21 22:48:16'),
(679, NULL, 3, '2021-08-21 22:48:16', '90.409124', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 22:48:16', '2021-08-21 22:48:16'),
(680, NULL, 3, '2021-08-21 22:48:26', '90.4091199', '23.7435158', 'Flat#602, Dhaka District, BD', '2021-08-21 22:48:26', '2021-08-21 22:48:26'),
(681, NULL, 2, '2021-08-21 22:48:26', '90.4226456', '23.8581455', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:48:26', '2021-08-21 22:48:26'),
(682, NULL, 3, '2021-08-21 22:48:36', '90.4091205', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 22:48:36', '2021-08-21 22:48:36'),
(683, NULL, 2, '2021-08-21 22:48:36', '90.4226447', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:48:36', '2021-08-21 22:48:36'),
(684, NULL, 2, '2021-08-21 22:48:46', '90.4226429', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:48:46', '2021-08-21 22:48:46'),
(685, NULL, 3, '2021-08-21 22:48:46', '90.4091268', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 22:48:46', '2021-08-21 22:48:46'),
(686, NULL, 2, '2021-08-21 22:48:55', '90.422646', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:48:55', '2021-08-21 22:48:55'),
(687, NULL, 3, '2021-08-21 22:48:56', '90.4091261', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 22:48:56', '2021-08-21 22:48:56'),
(688, NULL, 2, '2021-08-21 22:49:06', '90.4226514', '23.8581403', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:49:06', '2021-08-21 22:49:06');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(689, NULL, 3, '2021-08-21 22:49:06', '90.4091238', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-21 22:49:06', '2021-08-21 22:49:06'),
(690, NULL, 3, '2021-08-21 22:49:16', '90.409121', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-21 22:49:16', '2021-08-21 22:49:16'),
(691, NULL, 2, '2021-08-21 22:49:16', '90.4226423', '23.8581432', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:49:16', '2021-08-21 22:49:16'),
(692, NULL, 2, '2021-08-21 22:49:26', '90.4226456', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:49:26', '2021-08-21 22:49:26'),
(693, NULL, 3, '2021-08-21 22:49:26', '90.4091133', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:49:26', '2021-08-21 22:49:26'),
(694, NULL, 3, '2021-08-21 22:49:36', '90.4091296', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-21 22:49:36', '2021-08-21 22:49:36'),
(695, NULL, 2, '2021-08-21 22:49:36', '90.4226441', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:49:36', '2021-08-21 22:49:36'),
(696, NULL, 3, '2021-08-21 22:49:46', '90.4091192', '23.7435164', 'Flat#602, Dhaka District, BD', '2021-08-21 22:49:46', '2021-08-21 22:49:46'),
(697, NULL, 2, '2021-08-21 22:49:46', '90.4226398', '23.858147', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:49:46', '2021-08-21 22:49:46'),
(698, NULL, 2, '2021-08-21 22:49:56', '90.4226437', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:49:56', '2021-08-21 22:49:56'),
(699, NULL, 3, '2021-08-21 22:49:56', '90.4091173', '23.743518', 'Flat#602, Dhaka District, BD', '2021-08-21 22:49:56', '2021-08-21 22:49:56'),
(700, NULL, 3, '2021-08-21 22:50:06', '90.4091226', '23.7435198', 'Flat#602, Dhaka District, BD', '2021-08-21 22:50:06', '2021-08-21 22:50:06'),
(701, NULL, 2, '2021-08-21 22:50:06', '90.4226467', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:50:06', '2021-08-21 22:50:06'),
(702, NULL, 2, '2021-08-21 22:50:16', '90.422647', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:50:16', '2021-08-21 22:50:16'),
(703, NULL, 3, '2021-08-21 22:50:16', '90.4091172', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 22:50:16', '2021-08-21 22:50:16'),
(704, NULL, 2, '2021-08-21 22:50:26', '90.4226475', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:50:26', '2021-08-21 22:50:26'),
(705, NULL, 3, '2021-08-21 22:50:26', '90.4091162', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 22:50:26', '2021-08-21 22:50:26'),
(706, NULL, 2, '2021-08-21 22:50:36', '90.4226449', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:50:36', '2021-08-21 22:50:36'),
(707, NULL, 3, '2021-08-21 22:50:36', '90.409121', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 22:50:36', '2021-08-21 22:50:36'),
(708, NULL, 2, '2021-08-21 22:50:46', '90.4226437', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:50:46', '2021-08-21 22:50:46'),
(709, NULL, 3, '2021-08-21 22:50:46', '90.409117', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-21 22:50:46', '2021-08-21 22:50:46'),
(710, NULL, 3, '2021-08-21 22:50:56', '90.4091276', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 22:50:56', '2021-08-21 22:50:56'),
(711, NULL, 2, '2021-08-21 22:50:56', '90.4226435', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:50:56', '2021-08-21 22:50:56'),
(712, NULL, 3, '2021-08-21 22:51:06', '90.4091259', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-21 22:51:06', '2021-08-21 22:51:06'),
(713, NULL, 2, '2021-08-21 22:51:07', '90.4226416', '23.8581455', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:51:07', '2021-08-21 22:51:07'),
(714, NULL, 3, '2021-08-21 22:51:16', '90.409124', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 22:51:16', '2021-08-21 22:51:16'),
(715, NULL, 2, '2021-08-21 22:51:18', '90.4226456', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:51:18', '2021-08-21 22:51:18'),
(716, NULL, 3, '2021-08-21 22:51:26', '90.4091235', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:51:26', '2021-08-21 22:51:26'),
(717, NULL, 2, '2021-08-21 22:51:28', '90.4226421', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:51:28', '2021-08-21 22:51:28'),
(718, NULL, 3, '2021-08-21 22:51:36', '90.4091244', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:51:36', '2021-08-21 22:51:36'),
(719, NULL, 2, '2021-08-21 22:51:42', '90.4226499', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:51:42', '2021-08-21 22:51:42'),
(720, NULL, 3, '2021-08-21 22:51:46', '90.4091212', '23.7435174', 'Flat#602, Dhaka District, BD', '2021-08-21 22:51:46', '2021-08-21 22:51:46'),
(721, NULL, 2, '2021-08-21 22:51:52', '90.4226424', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:51:52', '2021-08-21 22:51:52'),
(722, NULL, 3, '2021-08-21 22:51:56', '90.4091225', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 22:51:56', '2021-08-21 22:51:56'),
(723, NULL, 2, '2021-08-21 22:52:02', '90.4226438', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:52:02', '2021-08-21 22:52:02'),
(724, NULL, 3, '2021-08-21 22:52:06', '90.409122', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 22:52:06', '2021-08-21 22:52:06'),
(725, NULL, 2, '2021-08-21 22:52:12', '90.4226436', '23.8581407', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:52:12', '2021-08-21 22:52:12'),
(726, NULL, 3, '2021-08-21 22:52:16', '90.4091207', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 22:52:16', '2021-08-21 22:52:16'),
(727, NULL, 2, '2021-08-21 22:52:22', '90.4226458', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:52:22', '2021-08-21 22:52:22'),
(728, NULL, 3, '2021-08-21 22:52:26', '90.4091159', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:52:26', '2021-08-21 22:52:26'),
(729, NULL, 2, '2021-08-21 22:52:32', '90.4226453', '23.8581407', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:52:32', '2021-08-21 22:52:32'),
(730, NULL, 3, '2021-08-21 22:52:36', '90.4091197', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 22:52:36', '2021-08-21 22:52:36'),
(731, NULL, 2, '2021-08-21 22:52:42', '90.4226466', '23.8581476', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:52:42', '2021-08-21 22:52:42'),
(732, NULL, 3, '2021-08-21 22:52:46', '90.409119', '23.7435102', 'Flat#602, Dhaka District, BD', '2021-08-21 22:52:46', '2021-08-21 22:52:46'),
(733, NULL, 2, '2021-08-21 22:52:51', '90.4226448', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:52:51', '2021-08-21 22:52:51'),
(734, NULL, 3, '2021-08-21 22:52:56', '90.4091253', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-21 22:52:56', '2021-08-21 22:52:56'),
(735, NULL, 2, '2021-08-21 22:53:02', '90.422637', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:53:02', '2021-08-21 22:53:02'),
(736, NULL, 3, '2021-08-21 22:53:06', '90.4091195', '23.7435117', 'Flat#602, Dhaka District, BD', '2021-08-21 22:53:06', '2021-08-21 22:53:06'),
(737, NULL, 2, '2021-08-21 22:53:12', '90.4226415', '23.8581462', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:53:12', '2021-08-21 22:53:12'),
(738, NULL, 2, '2021-08-21 22:53:22', '90.4226533', '23.858147', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:53:22', '2021-08-21 22:53:22'),
(739, NULL, 3, '2021-08-21 22:53:25', '90.4091253', '23.7435153', 'Flat#602, Dhaka District, BD', '2021-08-21 22:53:25', '2021-08-21 22:53:25'),
(740, NULL, 2, '2021-08-21 22:53:31', '90.422645', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:53:31', '2021-08-21 22:53:31'),
(741, NULL, 3, '2021-08-21 22:53:35', '90.4091246', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 22:53:35', '2021-08-21 22:53:35'),
(742, NULL, 2, '2021-08-21 22:53:42', '90.4226372', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:53:42', '2021-08-21 22:53:42'),
(743, NULL, 3, '2021-08-21 22:53:45', '90.4091245', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 22:53:45', '2021-08-21 22:53:45'),
(744, NULL, 2, '2021-08-21 22:53:51', '90.4226428', '23.8581493', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:53:51', '2021-08-21 22:53:51'),
(745, NULL, 3, '2021-08-21 22:53:55', '90.4091264', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 22:53:55', '2021-08-21 22:53:55'),
(746, NULL, 2, '2021-08-21 22:54:02', '90.4226471', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:54:02', '2021-08-21 22:54:02'),
(747, NULL, 3, '2021-08-21 22:54:05', '90.4091223', '23.7435166', 'Flat#602, Dhaka District, BD', '2021-08-21 22:54:05', '2021-08-21 22:54:05'),
(748, NULL, 2, '2021-08-21 22:54:11', '90.4226397', '23.8581374', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:54:11', '2021-08-21 22:54:11'),
(749, NULL, 3, '2021-08-21 22:54:15', '90.409127', '23.7435179', 'Flat#602, Dhaka District, BD', '2021-08-21 22:54:15', '2021-08-21 22:54:15'),
(750, NULL, 2, '2021-08-21 22:54:22', '90.4226457', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:54:22', '2021-08-21 22:54:22'),
(751, NULL, 3, '2021-08-21 22:54:25', '90.4091292', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:54:25', '2021-08-21 22:54:25'),
(752, NULL, 2, '2021-08-21 22:54:31', '90.4226454', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:54:31', '2021-08-21 22:54:31'),
(753, NULL, 3, '2021-08-21 22:54:35', '90.4091178', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-21 22:54:35', '2021-08-21 22:54:35'),
(754, NULL, 2, '2021-08-21 22:54:42', '90.4226458', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:54:42', '2021-08-21 22:54:42'),
(755, NULL, 3, '2021-08-21 22:54:45', '90.4091213', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-21 22:54:45', '2021-08-21 22:54:45'),
(756, NULL, 2, '2021-08-21 22:54:52', '90.4226427', '23.8581461', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:54:52', '2021-08-21 22:54:52'),
(757, NULL, 3, '2021-08-21 22:54:55', '90.4091222', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 22:54:55', '2021-08-21 22:54:55'),
(758, NULL, 2, '2021-08-21 22:55:02', '90.4226444', '23.8581531', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:55:02', '2021-08-21 22:55:02'),
(759, NULL, 3, '2021-08-21 22:55:05', '90.4091191', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 22:55:05', '2021-08-21 22:55:05'),
(760, NULL, 2, '2021-08-21 22:55:11', '90.4226469', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:55:11', '2021-08-21 22:55:11'),
(761, NULL, 3, '2021-08-21 22:55:15', '90.4091256', '23.743511', 'Flat#602, Dhaka District, BD', '2021-08-21 22:55:15', '2021-08-21 22:55:15'),
(762, NULL, 2, '2021-08-21 22:55:22', '90.4226495', '23.8581417', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:55:22', '2021-08-21 22:55:22'),
(763, NULL, 3, '2021-08-21 22:55:25', '90.4091207', '23.7435181', 'Flat#602, Dhaka District, BD', '2021-08-21 22:55:25', '2021-08-21 22:55:25'),
(764, NULL, 2, '2021-08-21 22:55:32', '90.4226409', '23.8581464', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:55:32', '2021-08-21 22:55:32'),
(765, NULL, 3, '2021-08-21 22:55:35', '90.4091153', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 22:55:35', '2021-08-21 22:55:35'),
(766, NULL, 2, '2021-08-21 22:55:41', '90.4226439', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:55:41', '2021-08-21 22:55:41'),
(767, NULL, 3, '2021-08-21 22:55:45', '90.4091215', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 22:55:45', '2021-08-21 22:55:45'),
(768, NULL, 2, '2021-08-21 22:55:51', '90.4226453', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:55:51', '2021-08-21 22:55:51'),
(769, NULL, 3, '2021-08-21 22:55:55', '90.4091217', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 22:55:55', '2021-08-21 22:55:55'),
(770, NULL, 2, '2021-08-21 22:56:01', '90.4226436', '23.8581424', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:56:01', '2021-08-21 22:56:01'),
(771, NULL, 3, '2021-08-21 22:56:05', '90.4091251', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 22:56:05', '2021-08-21 22:56:05'),
(772, NULL, 2, '2021-08-21 22:56:11', '90.4226409', '23.858148', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:56:11', '2021-08-21 22:56:11'),
(773, NULL, 3, '2021-08-21 22:56:15', '90.4091383', '23.7435221', 'Flat#602, Dhaka District, BD', '2021-08-21 22:56:15', '2021-08-21 22:56:15'),
(774, NULL, 2, '2021-08-21 22:56:22', '90.4226473', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:56:22', '2021-08-21 22:56:22'),
(775, NULL, 3, '2021-08-21 22:56:25', '90.4091262', '23.7435141', 'Flat#602, Dhaka District, BD', '2021-08-21 22:56:25', '2021-08-21 22:56:25'),
(776, NULL, 2, '2021-08-21 22:56:31', '90.4226482', '23.8581398', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:56:31', '2021-08-21 22:56:31'),
(777, NULL, 3, '2021-08-21 22:56:35', '90.4091212', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 22:56:35', '2021-08-21 22:56:35'),
(778, NULL, 2, '2021-08-21 22:56:42', '90.4226451', '23.8581402', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:56:42', '2021-08-21 22:56:42'),
(779, NULL, 3, '2021-08-21 22:56:45', '90.4091249', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:56:45', '2021-08-21 22:56:45'),
(780, NULL, 3, '2021-08-21 22:56:55', '90.4091292', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 22:56:55', '2021-08-21 22:56:55'),
(781, NULL, 2, '2021-08-21 22:56:58', '90.4226437', '23.8581412', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:56:58', '2021-08-21 22:56:58'),
(782, NULL, 3, '2021-08-21 22:57:05', '90.4091236', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:57:05', '2021-08-21 22:57:05'),
(783, NULL, 2, '2021-08-21 22:57:08', '90.4226453', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:57:08', '2021-08-21 22:57:08'),
(784, NULL, 3, '2021-08-21 22:57:15', '90.4091198', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 22:57:15', '2021-08-21 22:57:15'),
(785, NULL, 3, '2021-08-21 22:57:25', '90.4091215', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 22:57:25', '2021-08-21 22:57:25'),
(786, 100014, 2, '2021-08-21 22:57:26', '90.4226484', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:57:26', '2021-08-21 22:57:26'),
(787, NULL, 3, '2021-08-21 22:57:35', '90.4091193', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 22:57:35', '2021-08-21 22:57:35'),
(788, 100014, 2, '2021-08-21 22:57:36', '90.4226529', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:57:36', '2021-08-21 22:57:36'),
(789, NULL, 3, '2021-08-21 22:57:45', '90.4091162', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 22:57:45', '2021-08-21 22:57:45'),
(790, 100014, 2, '2021-08-21 22:57:46', '90.4226531', '23.8581532', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:57:46', '2021-08-21 22:57:46'),
(791, NULL, 3, '2021-08-21 22:57:55', '90.4091227', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 22:57:55', '2021-08-21 22:57:55'),
(792, 100014, 2, '2021-08-21 22:57:56', '90.4226485', '23.8581555', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:57:56', '2021-08-21 22:57:56'),
(793, NULL, 3, '2021-08-21 22:58:05', '90.4091235', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 22:58:05', '2021-08-21 22:58:05'),
(794, 100014, 2, '2021-08-21 22:58:06', '90.4226433', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:58:06', '2021-08-21 22:58:06'),
(795, NULL, 3, '2021-08-21 22:58:15', '90.4091175', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 22:58:15', '2021-08-21 22:58:15'),
(796, 100014, 2, '2021-08-21 22:58:16', '90.4226418', '23.8581432', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:58:16', '2021-08-21 22:58:16'),
(797, NULL, 3, '2021-08-21 22:58:25', '90.4091217', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 22:58:25', '2021-08-21 22:58:25'),
(798, 100014, 2, '2021-08-21 22:58:26', '90.4226435', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:58:26', '2021-08-21 22:58:26'),
(799, NULL, 3, '2021-08-21 22:58:35', '90.4091251', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-21 22:58:35', '2021-08-21 22:58:35'),
(800, 100014, 2, '2021-08-21 22:58:36', '90.4226481', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:58:36', '2021-08-21 22:58:36'),
(801, NULL, 3, '2021-08-21 22:58:45', '90.4091265', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 22:58:45', '2021-08-21 22:58:45'),
(802, 100014, 2, '2021-08-21 22:58:46', '90.4226431', '23.8581446', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:58:46', '2021-08-21 22:58:46'),
(803, NULL, 3, '2021-08-21 22:58:55', '90.4091274', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-21 22:58:55', '2021-08-21 22:58:55'),
(804, 100014, 2, '2021-08-21 22:58:56', '90.4226469', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:58:56', '2021-08-21 22:58:56'),
(805, NULL, 3, '2021-08-21 22:59:05', '90.4091248', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-21 22:59:05', '2021-08-21 22:59:05'),
(806, 100014, 2, '2021-08-21 22:59:06', '90.4226449', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:59:06', '2021-08-21 22:59:06'),
(807, NULL, 3, '2021-08-21 22:59:15', '90.4091225', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 22:59:15', '2021-08-21 22:59:15'),
(808, 100014, 2, '2021-08-21 22:59:16', '90.4226449', '23.8581408', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:59:16', '2021-08-21 22:59:16'),
(809, NULL, 3, '2021-08-21 22:59:25', '90.4091234', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 22:59:25', '2021-08-21 22:59:25'),
(810, 100014, 2, '2021-08-21 22:59:26', '90.4226444', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:59:26', '2021-08-21 22:59:26'),
(811, NULL, 3, '2021-08-21 22:59:35', '90.4091127', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 22:59:35', '2021-08-21 22:59:35'),
(812, 100014, 2, '2021-08-21 22:59:36', '90.4226479', '23.8581459', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:59:36', '2021-08-21 22:59:36'),
(813, NULL, 3, '2021-08-21 22:59:45', '90.4091135', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 22:59:45', '2021-08-21 22:59:45'),
(814, 100014, 2, '2021-08-21 22:59:46', '90.4226443', '23.8581475', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:59:46', '2021-08-21 22:59:46'),
(815, NULL, 3, '2021-08-21 22:59:55', '90.4091237', '23.7435161', 'Flat#602, Dhaka District, BD', '2021-08-21 22:59:55', '2021-08-21 22:59:55'),
(816, 100014, 2, '2021-08-21 22:59:56', '90.4226445', '23.8581494', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 22:59:56', '2021-08-21 22:59:56'),
(817, NULL, 3, '2021-08-21 23:00:05', '90.4091255', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 23:00:05', '2021-08-21 23:00:05'),
(818, 100014, 2, '2021-08-21 23:00:06', '90.4226406', '23.8581495', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:00:06', '2021-08-21 23:00:06'),
(819, NULL, 3, '2021-08-21 23:00:15', '90.4091199', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 23:00:15', '2021-08-21 23:00:15'),
(820, 100014, 2, '2021-08-21 23:00:16', '90.4226351', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:00:16', '2021-08-21 23:00:16'),
(821, NULL, 3, '2021-08-21 23:00:25', '90.409118', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 23:00:25', '2021-08-21 23:00:25'),
(822, 100014, 2, '2021-08-21 23:00:26', '90.4226357', '23.8581405', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:00:26', '2021-08-21 23:00:26'),
(823, NULL, 3, '2021-08-21 23:00:35', '90.4091143', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 23:00:35', '2021-08-21 23:00:35'),
(824, 100014, 2, '2021-08-21 23:00:36', '90.4226448', '23.8581408', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:00:36', '2021-08-21 23:00:36'),
(825, NULL, 3, '2021-08-21 23:00:44', '90.409112', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 23:00:44', '2021-08-21 23:00:44'),
(826, 100014, 2, '2021-08-21 23:00:46', '90.4226413', '23.8581429', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:00:46', '2021-08-21 23:00:46'),
(827, NULL, 3, '2021-08-21 23:00:54', '90.4091216', '23.7435114', 'Flat#602, Dhaka District, BD', '2021-08-21 23:00:54', '2021-08-21 23:00:54'),
(828, 100014, 2, '2021-08-21 23:00:56', '90.4226458', '23.8581545', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:00:56', '2021-08-21 23:00:56'),
(829, NULL, 3, '2021-08-21 23:01:05', '90.4091165', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 23:01:05', '2021-08-21 23:01:05'),
(830, 100014, 2, '2021-08-21 23:01:06', '90.4226444', '23.8581476', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:01:06', '2021-08-21 23:01:06'),
(831, NULL, 3, '2021-08-21 23:01:14', '90.4091197', '23.7435205', 'Flat#602, Dhaka District, BD', '2021-08-21 23:01:14', '2021-08-21 23:01:14'),
(832, 100014, 2, '2021-08-21 23:01:16', '90.4226448', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:01:16', '2021-08-21 23:01:16'),
(833, NULL, 3, '2021-08-21 23:01:24', '90.4091209', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 23:01:24', '2021-08-21 23:01:24'),
(834, 100014, 2, '2021-08-21 23:01:26', '90.4226449', '23.8581411', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:01:26', '2021-08-21 23:01:26'),
(835, NULL, 3, '2021-08-21 23:01:34', '90.4091149', '23.7435082', 'Flat#602, Dhaka District, BD', '2021-08-21 23:01:34', '2021-08-21 23:01:34'),
(836, 100014, 2, '2021-08-21 23:01:36', '90.4226434', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:01:36', '2021-08-21 23:01:36'),
(837, NULL, 3, '2021-08-21 23:01:44', '90.4091141', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 23:01:44', '2021-08-21 23:01:44'),
(838, 100014, 2, '2021-08-21 23:01:46', '90.4226456', '23.8581546', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:01:46', '2021-08-21 23:01:46'),
(839, NULL, 3, '2021-08-21 23:01:54', '90.4091263', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 23:01:54', '2021-08-21 23:01:54'),
(840, 100014, 2, '2021-08-21 23:01:56', '90.4226445', '23.8581479', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:01:56', '2021-08-21 23:01:56'),
(841, NULL, 3, '2021-08-21 23:02:04', '90.4091259', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-21 23:02:04', '2021-08-21 23:02:04'),
(842, 100014, 2, '2021-08-21 23:02:06', '90.4226509', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:02:06', '2021-08-21 23:02:06'),
(843, NULL, 3, '2021-08-21 23:02:15', '90.4091197', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-21 23:02:15', '2021-08-21 23:02:15'),
(844, 100014, 2, '2021-08-21 23:02:16', '90.4226458', '23.8581392', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:02:16', '2021-08-21 23:02:16'),
(845, NULL, 3, '2021-08-21 23:02:24', '90.409125', '23.7435186', 'Flat#602, Dhaka District, BD', '2021-08-21 23:02:24', '2021-08-21 23:02:24'),
(846, 100014, 2, '2021-08-21 23:02:26', '90.4226466', '23.8581424', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:02:26', '2021-08-21 23:02:26'),
(847, NULL, 3, '2021-08-21 23:02:34', '90.4091206', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 23:02:34', '2021-08-21 23:02:34'),
(848, 100014, 2, '2021-08-21 23:02:36', '90.4226471', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:02:36', '2021-08-21 23:02:36'),
(849, NULL, 3, '2021-08-21 23:02:44', '90.4091184', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:02:44', '2021-08-21 23:02:44'),
(850, 100014, 2, '2021-08-21 23:02:46', '90.4226414', '23.8581499', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:02:46', '2021-08-21 23:02:46'),
(851, NULL, 3, '2021-08-21 23:02:54', '90.40912', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 23:02:54', '2021-08-21 23:02:54'),
(852, 100014, 2, '2021-08-21 23:02:56', '90.4226437', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:02:56', '2021-08-21 23:02:56'),
(853, NULL, 3, '2021-08-21 23:03:04', '90.4091223', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 23:03:04', '2021-08-21 23:03:04'),
(854, 100014, 2, '2021-08-21 23:03:06', '90.4226475', '23.8581398', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:03:06', '2021-08-21 23:03:06'),
(855, NULL, 3, '2021-08-21 23:03:14', '90.4091237', '23.7435083', 'Flat#602, Dhaka District, BD', '2021-08-21 23:03:14', '2021-08-21 23:03:14'),
(856, 100014, 2, '2021-08-21 23:03:16', '90.4226454', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:03:16', '2021-08-21 23:03:16'),
(857, NULL, 3, '2021-08-21 23:03:24', '90.4091207', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 23:03:24', '2021-08-21 23:03:24'),
(858, NULL, 3, '2021-08-21 23:03:34', '90.4091269', '23.7435161', 'Flat#602, Dhaka District, BD', '2021-08-21 23:03:34', '2021-08-21 23:03:34'),
(859, 100014, 2, '2021-08-21 23:03:37', '90.4226441', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:03:37', '2021-08-21 23:03:37'),
(860, NULL, 3, '2021-08-21 23:03:44', '90.4091229', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 23:03:44', '2021-08-21 23:03:44'),
(861, 100014, 2, '2021-08-21 23:03:47', '90.4226435', '23.8581499', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:03:47', '2021-08-21 23:03:47'),
(862, NULL, 3, '2021-08-21 23:03:54', '90.4091186', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 23:03:54', '2021-08-21 23:03:54'),
(863, 100014, 2, '2021-08-21 23:03:57', '90.4226453', '23.8581441', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:03:57', '2021-08-21 23:03:57'),
(864, NULL, 3, '2021-08-21 23:04:05', '90.4091241', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 23:04:05', '2021-08-21 23:04:05'),
(865, 100014, 2, '2021-08-21 23:04:07', '90.4226512', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:04:07', '2021-08-21 23:04:07'),
(866, NULL, 3, '2021-08-21 23:04:14', '90.4091181', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 23:04:14', '2021-08-21 23:04:14'),
(867, 100014, 2, '2021-08-21 23:04:17', '90.4226413', '23.858138', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:04:17', '2021-08-21 23:04:17'),
(868, NULL, 3, '2021-08-21 23:04:24', '90.4091268', '23.743518', 'Flat#602, Dhaka District, BD', '2021-08-21 23:04:24', '2021-08-21 23:04:24'),
(869, 100014, 2, '2021-08-21 23:04:27', '90.4226442', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:04:27', '2021-08-21 23:04:27'),
(870, NULL, 3, '2021-08-21 23:04:34', '90.4091277', '23.743518', 'Flat#602, Dhaka District, BD', '2021-08-21 23:04:34', '2021-08-21 23:04:34'),
(871, 100014, 2, '2021-08-21 23:04:37', '90.422652', '23.8581471', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:04:37', '2021-08-21 23:04:37'),
(872, NULL, 3, '2021-08-21 23:04:44', '90.4091197', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 23:04:44', '2021-08-21 23:04:44'),
(873, 100014, 2, '2021-08-21 23:04:47', '90.4226452', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:04:47', '2021-08-21 23:04:47'),
(874, NULL, 3, '2021-08-21 23:04:54', '90.4091197', '23.7435059', 'Flat#602, Dhaka District, BD', '2021-08-21 23:04:54', '2021-08-21 23:04:54'),
(875, 100014, 2, '2021-08-21 23:04:57', '90.4226438', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:04:57', '2021-08-21 23:04:57'),
(876, NULL, 3, '2021-08-21 23:05:04', '90.4091245', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 23:05:04', '2021-08-21 23:05:04'),
(877, 100014, 2, '2021-08-21 23:05:07', '90.4226499', '23.858138', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:05:07', '2021-08-21 23:05:07'),
(878, NULL, 3, '2021-08-21 23:05:14', '90.4091234', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 23:05:14', '2021-08-21 23:05:14'),
(879, 100014, 2, '2021-08-21 23:05:17', '90.4226404', '23.8581457', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:05:17', '2021-08-21 23:05:17'),
(880, NULL, 3, '2021-08-21 23:05:24', '90.4091189', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 23:05:24', '2021-08-21 23:05:24'),
(881, NULL, 2, '2021-08-21 23:05:26', '90.4226431', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:05:26', '2021-08-21 23:05:26'),
(882, NULL, 3, '2021-08-21 23:05:34', '90.4091264', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-21 23:05:34', '2021-08-21 23:05:34'),
(883, NULL, 2, '2021-08-21 23:05:37', '90.4226467', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:05:37', '2021-08-21 23:05:37'),
(884, NULL, 3, '2021-08-21 23:05:44', '90.4091153', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 23:05:44', '2021-08-21 23:05:44'),
(885, NULL, 2, '2021-08-21 23:05:47', '90.422648', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:05:47', '2021-08-21 23:05:47'),
(886, NULL, 3, '2021-08-21 23:05:55', '90.4091212', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 23:05:55', '2021-08-21 23:05:55'),
(887, NULL, 2, '2021-08-21 23:05:57', '90.4226447', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:05:57', '2021-08-21 23:05:57'),
(888, NULL, 3, '2021-08-21 23:06:05', '90.4091201', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 23:06:05', '2021-08-21 23:06:05'),
(889, NULL, 2, '2021-08-21 23:06:07', '90.4226463', '23.8581409', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:06:07', '2021-08-21 23:06:07'),
(890, NULL, 3, '2021-08-21 23:06:15', '90.4091107', '23.7435082', 'Flat#602, Dhaka District, BD', '2021-08-21 23:06:15', '2021-08-21 23:06:15'),
(891, NULL, 2, '2021-08-21 23:06:17', '90.4226436', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:06:17', '2021-08-21 23:06:17'),
(892, NULL, 3, '2021-08-21 23:06:25', '90.4091163', '23.7435111', 'Flat#602, Dhaka District, BD', '2021-08-21 23:06:25', '2021-08-21 23:06:25'),
(893, NULL, 2, '2021-08-21 23:06:27', '90.4226427', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:06:27', '2021-08-21 23:06:27'),
(894, NULL, 3, '2021-08-21 23:06:35', '90.4091106', '23.7435117', 'Flat#602, Dhaka District, BD', '2021-08-21 23:06:35', '2021-08-21 23:06:35'),
(895, NULL, 3, '2021-08-21 23:06:45', '90.4091118', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:06:45', '2021-08-21 23:06:45'),
(896, 100014, 2, '2021-08-21 23:06:46', '90.4226442', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:06:46', '2021-08-21 23:06:46'),
(897, NULL, 3, '2021-08-21 23:06:55', '90.4091124', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 23:06:55', '2021-08-21 23:06:55'),
(898, 100014, 2, '2021-08-21 23:06:56', '90.4226468', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:06:56', '2021-08-21 23:06:56'),
(899, NULL, 3, '2021-08-21 23:07:05', '90.4091107', '23.7435174', 'Flat#602, Dhaka District, BD', '2021-08-21 23:07:05', '2021-08-21 23:07:05'),
(900, 100014, 2, '2021-08-21 23:07:06', '90.4226471', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:07:06', '2021-08-21 23:07:06'),
(901, NULL, 3, '2021-08-21 23:07:14', '90.4091121', '23.7435192', 'Flat#602, Dhaka District, BD', '2021-08-21 23:07:14', '2021-08-21 23:07:14'),
(902, 100014, 2, '2021-08-21 23:07:16', '90.4226443', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:07:16', '2021-08-21 23:07:16'),
(903, NULL, 3, '2021-08-21 23:07:23', '90.4091151', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-21 23:07:23', '2021-08-21 23:07:23'),
(904, 100014, 2, '2021-08-21 23:07:26', '90.4226465', '23.8581424', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:07:26', '2021-08-21 23:07:26'),
(905, NULL, 3, '2021-08-21 23:07:34', '90.4091156', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 23:07:34', '2021-08-21 23:07:34'),
(906, 100014, 2, '2021-08-21 23:07:36', '90.4226533', '23.8581392', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:07:36', '2021-08-21 23:07:36'),
(907, NULL, 3, '2021-08-21 23:07:44', '90.4091172', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 23:07:44', '2021-08-21 23:07:44'),
(908, 100014, 2, '2021-08-21 23:07:46', '90.4226461', '23.8581409', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:07:46', '2021-08-21 23:07:46'),
(909, NULL, 3, '2021-08-21 23:07:54', '90.4091134', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-21 23:07:54', '2021-08-21 23:07:54'),
(910, 100014, 2, '2021-08-21 23:07:56', '90.4226481', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:07:56', '2021-08-21 23:07:56'),
(911, NULL, 3, '2021-08-21 23:08:04', '90.4091228', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:08:04', '2021-08-21 23:08:04'),
(912, 100014, 2, '2021-08-21 23:08:06', '90.4226477', '23.858145', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:08:06', '2021-08-21 23:08:06'),
(913, NULL, 3, '2021-08-21 23:08:14', '90.4091204', '23.7435074', 'Flat#602, Dhaka District, BD', '2021-08-21 23:08:14', '2021-08-21 23:08:14'),
(914, 100014, 2, '2021-08-21 23:08:16', '90.4226436', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:08:16', '2021-08-21 23:08:16'),
(915, NULL, 3, '2021-08-21 23:08:24', '90.4091079', '23.7435167', 'Flat#602, Dhaka District, BD', '2021-08-21 23:08:24', '2021-08-21 23:08:24'),
(916, 100014, 2, '2021-08-21 23:08:26', '90.4226451', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:08:26', '2021-08-21 23:08:26'),
(917, NULL, 3, '2021-08-21 23:08:34', '90.4091134', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-21 23:08:34', '2021-08-21 23:08:34'),
(918, 100014, 2, '2021-08-21 23:08:36', '90.4226443', '23.8581459', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:08:36', '2021-08-21 23:08:36'),
(919, NULL, 3, '2021-08-21 23:08:44', '90.4091216', '23.7435141', 'Flat#602, Dhaka District, BD', '2021-08-21 23:08:44', '2021-08-21 23:08:44'),
(920, 100014, 2, '2021-08-21 23:08:46', '90.4226475', '23.858147', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:08:46', '2021-08-21 23:08:46'),
(921, NULL, 3, '2021-08-21 23:08:54', '90.4091201', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 23:08:54', '2021-08-21 23:08:54'),
(922, 100014, 2, '2021-08-21 23:08:56', '90.4226463', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:08:56', '2021-08-21 23:08:56'),
(923, NULL, 3, '2021-08-21 23:09:04', '90.4091115', '23.7435091', 'Flat#602, Dhaka District, BD', '2021-08-21 23:09:04', '2021-08-21 23:09:04'),
(924, 100014, 2, '2021-08-21 23:09:06', '90.4226495', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:09:06', '2021-08-21 23:09:06'),
(925, NULL, 3, '2021-08-21 23:09:13', '90.4091152', '23.7435086', 'Flat#602, Dhaka District, BD', '2021-08-21 23:09:13', '2021-08-21 23:09:13'),
(926, 100014, 2, '2021-08-21 23:09:16', '90.422647', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:09:16', '2021-08-21 23:09:16'),
(927, NULL, 3, '2021-08-21 23:09:25', '90.4091227', '23.7435093', 'Flat#602, Dhaka District, BD', '2021-08-21 23:09:25', '2021-08-21 23:09:25'),
(928, 100014, 2, '2021-08-21 23:09:26', '90.4226474', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:09:26', '2021-08-21 23:09:26'),
(929, NULL, 3, '2021-08-21 23:09:35', '90.409121', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-21 23:09:35', '2021-08-21 23:09:35'),
(930, 100014, 2, '2021-08-21 23:09:36', '90.4226423', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:09:36', '2021-08-21 23:09:36'),
(931, NULL, 3, '2021-08-21 23:09:45', '90.4091238', '23.7435211', 'Flat#602, Dhaka District, BD', '2021-08-21 23:09:45', '2021-08-21 23:09:45'),
(932, 100014, 2, '2021-08-21 23:09:46', '90.4226486', '23.8581406', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:09:46', '2021-08-21 23:09:46'),
(933, NULL, 3, '2021-08-21 23:09:55', '90.4091087', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-21 23:09:55', '2021-08-21 23:09:55'),
(934, 100014, 2, '2021-08-21 23:09:56', '90.4226491', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:09:56', '2021-08-21 23:09:56'),
(935, NULL, 3, '2021-08-21 23:10:05', '90.4091103', '23.7435093', 'Flat#602, Dhaka District, BD', '2021-08-21 23:10:05', '2021-08-21 23:10:05'),
(936, 100014, 2, '2021-08-21 23:10:06', '90.4226471', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:10:06', '2021-08-21 23:10:06'),
(937, NULL, 3, '2021-08-21 23:10:14', '90.4091088', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 23:10:14', '2021-08-21 23:10:14'),
(938, 100014, 2, '2021-08-21 23:10:16', '90.4226442', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:10:16', '2021-08-21 23:10:16'),
(939, NULL, 3, '2021-08-21 23:10:25', '90.4091093', '23.743509', 'Flat#602, Dhaka District, BD', '2021-08-21 23:10:25', '2021-08-21 23:10:25'),
(940, 100014, 2, '2021-08-21 23:10:26', '90.4226435', '23.8581419', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:10:26', '2021-08-21 23:10:26'),
(941, NULL, 3, '2021-08-21 23:10:35', '90.4091046', '23.7435066', 'Flat#602, Dhaka District, BD', '2021-08-21 23:10:35', '2021-08-21 23:10:35'),
(942, 100014, 2, '2021-08-21 23:10:36', '90.4226436', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:10:36', '2021-08-21 23:10:36'),
(943, NULL, 3, '2021-08-21 23:10:45', '90.4090906', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 23:10:45', '2021-08-21 23:10:45'),
(944, 100014, 2, '2021-08-21 23:10:46', '90.4226469', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:10:46', '2021-08-21 23:10:46'),
(945, NULL, 3, '2021-08-21 23:10:54', '90.4091049', '23.7435031', 'Flat#602, Dhaka District, BD', '2021-08-21 23:10:54', '2021-08-21 23:10:54'),
(946, 100014, 2, '2021-08-21 23:10:56', '90.4226499', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:10:56', '2021-08-21 23:10:56'),
(947, NULL, 3, '2021-08-21 23:11:04', '90.4091124', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 23:11:04', '2021-08-21 23:11:04'),
(948, 100014, 2, '2021-08-21 23:11:06', '90.4226448', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:11:06', '2021-08-21 23:11:06'),
(949, NULL, 3, '2021-08-21 23:11:14', '90.409111', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 23:11:14', '2021-08-21 23:11:14'),
(950, 100014, 2, '2021-08-21 23:11:16', '90.4226435', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:11:16', '2021-08-21 23:11:16'),
(951, NULL, 3, '2021-08-21 23:11:24', '90.4091079', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 23:11:24', '2021-08-21 23:11:24'),
(952, 100014, 2, '2021-08-21 23:11:26', '90.4226468', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:11:26', '2021-08-21 23:11:26'),
(953, NULL, 3, '2021-08-21 23:11:34', '90.4091128', '23.7435085', 'Flat#602, Dhaka District, BD', '2021-08-21 23:11:34', '2021-08-21 23:11:34'),
(954, 100014, 2, '2021-08-21 23:11:36', '90.4226461', '23.8581424', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:11:36', '2021-08-21 23:11:36'),
(955, NULL, 3, '2021-08-21 23:11:45', '90.4090977', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 23:11:45', '2021-08-21 23:11:45'),
(956, 100014, 2, '2021-08-21 23:11:47', '90.4226466', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:11:47', '2021-08-21 23:11:47'),
(957, NULL, 3, '2021-08-21 23:11:54', '90.4090908', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-21 23:11:54', '2021-08-21 23:11:54'),
(958, 100014, 2, '2021-08-21 23:11:56', '90.4226468', '23.8581415', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:11:56', '2021-08-21 23:11:56'),
(959, NULL, 3, '2021-08-21 23:12:04', '90.4091127', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 23:12:04', '2021-08-21 23:12:04'),
(960, 100014, 2, '2021-08-21 23:12:06', '90.4226468', '23.8581417', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:12:06', '2021-08-21 23:12:06'),
(961, NULL, 3, '2021-08-21 23:12:14', '90.4091063', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-21 23:12:14', '2021-08-21 23:12:14'),
(962, 100014, 2, '2021-08-21 23:12:16', '90.4226465', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:12:16', '2021-08-21 23:12:16'),
(963, NULL, 3, '2021-08-21 23:12:24', '90.4091052', '23.743517', 'Flat#602, Dhaka District, BD', '2021-08-21 23:12:24', '2021-08-21 23:12:24'),
(964, 100014, 2, '2021-08-21 23:12:26', '90.422647', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:12:26', '2021-08-21 23:12:26'),
(965, NULL, 3, '2021-08-21 23:12:34', '90.4090864', '23.7435072', 'Flat#602, Dhaka District, BD', '2021-08-21 23:12:34', '2021-08-21 23:12:34'),
(966, 100014, 2, '2021-08-21 23:12:36', '90.4226453', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:12:36', '2021-08-21 23:12:36'),
(967, NULL, 3, '2021-08-21 23:12:44', '90.4091079', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 23:12:44', '2021-08-21 23:12:44'),
(968, 100014, 2, '2021-08-21 23:12:46', '90.4226442', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:12:46', '2021-08-21 23:12:46'),
(969, NULL, 3, '2021-08-21 23:12:54', '90.4091103', '23.7435062', 'Flat#602, Dhaka District, BD', '2021-08-21 23:12:54', '2021-08-21 23:12:54'),
(970, 100014, 2, '2021-08-21 23:12:56', '90.4226464', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:12:56', '2021-08-21 23:12:56'),
(971, NULL, 3, '2021-08-21 23:13:04', '90.4090786', '23.7435007', 'Flat#602, Dhaka District, BD', '2021-08-21 23:13:04', '2021-08-21 23:13:04'),
(972, 100014, 2, '2021-08-21 23:13:06', '90.4226441', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:13:06', '2021-08-21 23:13:06'),
(973, NULL, 3, '2021-08-21 23:13:14', '90.4091049', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:13:14', '2021-08-21 23:13:14'),
(974, 100014, 2, '2021-08-21 23:13:16', '90.4226436', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:13:16', '2021-08-21 23:13:16'),
(975, NULL, 3, '2021-08-21 23:13:24', '90.4091019', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 23:13:24', '2021-08-21 23:13:24'),
(976, 100014, 2, '2021-08-21 23:13:26', '90.4226438', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:13:26', '2021-08-21 23:13:26'),
(977, NULL, 3, '2021-08-21 23:13:34', '90.4091043', '23.7435018', 'Flat#602, Dhaka District, BD', '2021-08-21 23:13:34', '2021-08-21 23:13:34'),
(978, 100014, 2, '2021-08-21 23:13:36', '90.4226436', '23.8581429', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:13:36', '2021-08-21 23:13:36'),
(979, NULL, 3, '2021-08-21 23:13:44', '90.409074', '23.7435062', 'Flat#602, Dhaka District, BD', '2021-08-21 23:13:44', '2021-08-21 23:13:44'),
(980, 100014, 2, '2021-08-21 23:13:46', '90.4226438', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:13:46', '2021-08-21 23:13:46'),
(981, NULL, 3, '2021-08-21 23:13:54', '90.4090986', '23.7435048', 'Flat#602, Dhaka District, BD', '2021-08-21 23:13:54', '2021-08-21 23:13:54'),
(982, 100014, 2, '2021-08-21 23:13:56', '90.4226461', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:13:56', '2021-08-21 23:13:56'),
(983, NULL, 3, '2021-08-21 23:14:04', '90.4091027', '23.743504', 'Flat#602, Dhaka District, BD', '2021-08-21 23:14:04', '2021-08-21 23:14:04'),
(984, 100014, 2, '2021-08-21 23:14:06', '90.4226532', '23.8581401', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:14:06', '2021-08-21 23:14:06'),
(985, NULL, 3, '2021-08-21 23:14:15', '90.4091056', '23.7435029', 'Flat#602, Dhaka District, BD', '2021-08-21 23:14:15', '2021-08-21 23:14:15'),
(986, NULL, 3, '2021-08-21 23:14:24', '90.4091206', '23.743504', 'Flat#602, Dhaka District, BD', '2021-08-21 23:14:24', '2021-08-21 23:14:24'),
(987, NULL, 3, '2021-08-21 23:14:34', '90.4091181', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 23:14:34', '2021-08-21 23:14:34'),
(988, 100014, 2, '2021-08-21 23:14:42', '90.4226531', '23.8581458', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:14:42', '2021-08-21 23:14:42'),
(989, NULL, 3, '2021-08-21 23:14:44', '90.4091067', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 23:14:44', '2021-08-21 23:14:44'),
(990, 100014, 2, '2021-08-21 23:14:52', '90.4226434', '23.8581459', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:14:52', '2021-08-21 23:14:52'),
(991, NULL, 3, '2021-08-21 23:14:54', '90.4090934', '23.7435027', 'Flat#602, Dhaka District, BD', '2021-08-21 23:14:54', '2021-08-21 23:14:54'),
(992, 100014, 2, '2021-08-21 23:15:02', '90.4226449', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:15:02', '2021-08-21 23:15:02'),
(993, NULL, 3, '2021-08-21 23:15:04', '90.4091139', '23.7435047', 'Flat#602, Dhaka District, BD', '2021-08-21 23:15:04', '2021-08-21 23:15:04'),
(994, NULL, 3, '2021-08-21 23:15:15', '90.4091152', '23.7435111', 'Flat#602, Dhaka District, BD', '2021-08-21 23:15:15', '2021-08-21 23:15:15'),
(995, NULL, 2, '2021-08-21 23:15:15', '90.4226466', '23.8581429', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:15:15', '2021-08-21 23:15:15'),
(996, NULL, 3, '2021-08-21 23:15:24', '90.4091139', '23.7435031', 'Flat#602, Dhaka District, BD', '2021-08-21 23:15:24', '2021-08-21 23:15:24'),
(997, NULL, 2, '2021-08-21 23:15:25', '90.4226451', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:15:25', '2021-08-21 23:15:25'),
(998, NULL, 3, '2021-08-21 23:15:34', '90.4091109', '23.7435046', 'Flat#602, Dhaka District, BD', '2021-08-21 23:15:34', '2021-08-21 23:15:34'),
(999, NULL, 2, '2021-08-21 23:15:35', '90.422646', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:15:35', '2021-08-21 23:15:35'),
(1000, NULL, 3, '2021-08-21 23:15:44', '90.4091084', '23.7435078', 'Flat#602, Dhaka District, BD', '2021-08-21 23:15:44', '2021-08-21 23:15:44'),
(1001, NULL, 2, '2021-08-21 23:15:45', '90.4226447', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:15:45', '2021-08-21 23:15:45'),
(1002, NULL, 3, '2021-08-21 23:15:54', '90.4091114', '23.7435057', 'Flat#602, Dhaka District, BD', '2021-08-21 23:15:54', '2021-08-21 23:15:54'),
(1003, NULL, 2, '2021-08-21 23:15:55', '90.4226443', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:15:55', '2021-08-21 23:15:55'),
(1004, NULL, 3, '2021-08-21 23:16:05', '90.4091162', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 23:16:05', '2021-08-21 23:16:05'),
(1005, NULL, 2, '2021-08-21 23:16:05', '90.42264', '23.8581462', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:16:05', '2021-08-21 23:16:05'),
(1006, NULL, 3, '2021-08-21 23:16:14', '90.4091177', '23.7435042', 'Flat#602, Dhaka District, BD', '2021-08-21 23:16:14', '2021-08-21 23:16:14'),
(1007, NULL, 2, '2021-08-21 23:16:15', '90.4226462', '23.8581457', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:16:15', '2021-08-21 23:16:15'),
(1008, NULL, 3, '2021-08-21 23:16:24', '90.4091031', '23.743507', 'Flat#602, Dhaka District, BD', '2021-08-21 23:16:24', '2021-08-21 23:16:24'),
(1009, NULL, 2, '2021-08-21 23:16:26', '90.4226474', '23.858145', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:16:26', '2021-08-21 23:16:26'),
(1010, NULL, 3, '2021-08-21 23:16:34', '90.4090967', '23.7435058', 'Flat#602, Dhaka District, BD', '2021-08-21 23:16:34', '2021-08-21 23:16:34'),
(1011, NULL, 2, '2021-08-21 23:16:36', '90.4226471', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:16:36', '2021-08-21 23:16:36'),
(1012, NULL, 3, '2021-08-21 23:16:44', '90.4090999', '23.7435058', 'Flat#602, Dhaka District, BD', '2021-08-21 23:16:44', '2021-08-21 23:16:44'),
(1013, NULL, 2, '2021-08-21 23:16:46', '90.4226452', '23.8581405', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:16:46', '2021-08-21 23:16:46'),
(1014, NULL, 3, '2021-08-21 23:16:54', '90.4091088', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-21 23:16:54', '2021-08-21 23:16:54'),
(1015, NULL, 2, '2021-08-21 23:16:56', '90.4226459', '23.8581467', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:16:56', '2021-08-21 23:16:56'),
(1016, NULL, 3, '2021-08-21 23:17:04', '90.4091126', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 23:17:04', '2021-08-21 23:17:04'),
(1017, NULL, 2, '2021-08-21 23:17:06', '90.422645', '23.8581501', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:17:06', '2021-08-21 23:17:06'),
(1018, NULL, 3, '2021-08-21 23:17:14', '90.4091081', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 23:17:14', '2021-08-21 23:17:14'),
(1019, NULL, 2, '2021-08-21 23:17:16', '90.4226433', '23.858152', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:17:16', '2021-08-21 23:17:16'),
(1020, NULL, 3, '2021-08-21 23:17:24', '90.4091054', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 23:17:24', '2021-08-21 23:17:24'),
(1021, NULL, 2, '2021-08-21 23:17:26', '90.4226427', '23.8581512', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:17:26', '2021-08-21 23:17:26'),
(1022, NULL, 3, '2021-08-21 23:17:34', '90.4091048', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 23:17:34', '2021-08-21 23:17:34'),
(1023, NULL, 2, '2021-08-21 23:17:36', '90.4226468', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:17:36', '2021-08-21 23:17:36'),
(1024, NULL, 3, '2021-08-21 23:17:45', '90.4091046', '23.7434975', 'Flat#602, Dhaka District, BD', '2021-08-21 23:17:45', '2021-08-21 23:17:45'),
(1025, NULL, 2, '2021-08-21 23:17:46', '90.4226472', '23.8581412', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:17:46', '2021-08-21 23:17:46'),
(1026, NULL, 3, '2021-08-21 23:17:54', '90.409092', '23.7435066', 'Flat#602, Dhaka District, BD', '2021-08-21 23:17:54', '2021-08-21 23:17:54'),
(1027, NULL, 2, '2021-08-21 23:17:56', '90.4226476', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:17:56', '2021-08-21 23:17:56'),
(1028, NULL, 3, '2021-08-21 23:18:05', '90.4091178', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-21 23:18:05', '2021-08-21 23:18:05');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1029, NULL, 2, '2021-08-21 23:18:06', '90.4226453', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:18:06', '2021-08-21 23:18:06'),
(1030, NULL, 3, '2021-08-21 23:18:14', '90.409111', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-21 23:18:14', '2021-08-21 23:18:14'),
(1031, NULL, 2, '2021-08-21 23:18:16', '90.4226463', '23.858141', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:18:16', '2021-08-21 23:18:16'),
(1032, NULL, 3, '2021-08-21 23:18:24', '90.4091092', '23.743504', 'Flat#602, Dhaka District, BD', '2021-08-21 23:18:24', '2021-08-21 23:18:24'),
(1033, NULL, 2, '2021-08-21 23:18:26', '90.4226449', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:18:26', '2021-08-21 23:18:26'),
(1034, NULL, 3, '2021-08-21 23:18:34', '90.4091018', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 23:18:34', '2021-08-21 23:18:34'),
(1035, NULL, 2, '2021-08-21 23:18:36', '90.4226406', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:18:36', '2021-08-21 23:18:36'),
(1036, NULL, 3, '2021-08-21 23:18:45', '90.4090817', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-21 23:18:45', '2021-08-21 23:18:45'),
(1037, NULL, 2, '2021-08-21 23:18:46', '90.4226457', '23.8581411', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:18:46', '2021-08-21 23:18:46'),
(1038, NULL, 3, '2021-08-21 23:18:54', '90.4090945', '23.7435053', 'Flat#602, Dhaka District, BD', '2021-08-21 23:18:54', '2021-08-21 23:18:54'),
(1039, NULL, 2, '2021-08-21 23:18:56', '90.4226467', '23.8581397', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:18:56', '2021-08-21 23:18:56'),
(1040, NULL, 3, '2021-08-21 23:19:04', '90.4091242', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 23:19:04', '2021-08-21 23:19:04'),
(1041, NULL, 3, '2021-08-21 23:19:15', '90.4091219', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 23:19:15', '2021-08-21 23:19:15'),
(1042, NULL, 3, '2021-08-21 23:19:25', '90.4091129', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-21 23:19:25', '2021-08-21 23:19:25'),
(1043, NULL, 3, '2021-08-21 23:19:35', '90.4091124', '23.743509', 'Flat#602, Dhaka District, BD', '2021-08-21 23:19:35', '2021-08-21 23:19:35'),
(1044, NULL, 3, '2021-08-21 23:19:45', '90.4091135', '23.7435071', 'Flat#602, Dhaka District, BD', '2021-08-21 23:19:45', '2021-08-21 23:19:45'),
(1045, NULL, 3, '2021-08-21 23:19:55', '90.4091144', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-21 23:19:55', '2021-08-21 23:19:55'),
(1046, NULL, 3, '2021-08-21 23:20:05', '90.4091128', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 23:20:05', '2021-08-21 23:20:05'),
(1047, NULL, 3, '2021-08-21 23:20:15', '90.4091179', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-21 23:20:15', '2021-08-21 23:20:15'),
(1048, NULL, 3, '2021-08-21 23:20:25', '90.4091171', '23.7435102', 'Flat#602, Dhaka District, BD', '2021-08-21 23:20:25', '2021-08-21 23:20:25'),
(1049, NULL, 3, '2021-08-21 23:20:35', '90.4091208', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 23:20:35', '2021-08-21 23:20:35'),
(1050, NULL, 3, '2021-08-21 23:20:45', '90.4091148', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 23:20:45', '2021-08-21 23:20:45'),
(1051, NULL, 3, '2021-08-21 23:21:45', '90.4091233', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-21 23:21:45', '2021-08-21 23:21:45'),
(1052, NULL, 3, '2021-08-21 23:21:55', '90.4091205', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 23:21:55', '2021-08-21 23:21:55'),
(1053, NULL, 3, '2021-08-21 23:22:05', '90.409122', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 23:22:05', '2021-08-21 23:22:05'),
(1054, NULL, 3, '2021-08-21 23:22:15', '90.4091248', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-21 23:22:15', '2021-08-21 23:22:15'),
(1055, NULL, 3, '2021-08-21 23:22:25', '90.4091105', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-21 23:22:25', '2021-08-21 23:22:25'),
(1056, NULL, 3, '2021-08-21 23:22:35', '90.4091143', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 23:22:35', '2021-08-21 23:22:35'),
(1057, NULL, 2, '2021-08-21 23:22:41', '90.4226461', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:22:41', '2021-08-21 23:22:41'),
(1058, NULL, 3, '2021-08-21 23:22:45', '90.4091077', '23.7435083', 'Flat#602, Dhaka District, BD', '2021-08-21 23:22:45', '2021-08-21 23:22:45'),
(1059, NULL, 2, '2021-08-21 23:22:51', '90.4226466', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:22:51', '2021-08-21 23:22:51'),
(1060, NULL, 3, '2021-08-21 23:22:55', '90.4091118', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:22:55', '2021-08-21 23:22:55'),
(1061, NULL, 2, '2021-08-21 23:23:01', '90.4226467', '23.8581432', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:23:01', '2021-08-21 23:23:01'),
(1062, NULL, 3, '2021-08-21 23:23:05', '90.4091152', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 23:23:05', '2021-08-21 23:23:05'),
(1063, NULL, 2, '2021-08-21 23:23:11', '90.4226464', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:23:11', '2021-08-21 23:23:11'),
(1064, NULL, 3, '2021-08-21 23:23:15', '90.4091151', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 23:23:15', '2021-08-21 23:23:15'),
(1065, NULL, 2, '2021-08-21 23:23:21', '90.4226462', '23.8581441', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:23:21', '2021-08-21 23:23:21'),
(1066, NULL, 3, '2021-08-21 23:23:25', '90.4091185', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 23:23:25', '2021-08-21 23:23:25'),
(1067, NULL, 2, '2021-08-21 23:23:31', '90.4226469', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:23:31', '2021-08-21 23:23:31'),
(1068, NULL, 3, '2021-08-21 23:23:35', '90.4091101', '23.7435084', 'Flat#602, Dhaka District, BD', '2021-08-21 23:23:35', '2021-08-21 23:23:35'),
(1069, NULL, 2, '2021-08-21 23:23:41', '90.4226498', '23.8581581', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:23:41', '2021-08-21 23:23:41'),
(1070, NULL, 3, '2021-08-21 23:23:44', '90.4091164', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 23:23:44', '2021-08-21 23:23:44'),
(1071, NULL, 2, '2021-08-21 23:23:51', '90.4226457', '23.8581464', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:23:51', '2021-08-21 23:23:51'),
(1072, NULL, 3, '2021-08-21 23:23:54', '90.4091182', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 23:23:54', '2021-08-21 23:23:54'),
(1073, NULL, 2, '2021-08-21 23:24:01', '90.4226435', '23.8581455', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:24:01', '2021-08-21 23:24:01'),
(1074, NULL, 3, '2021-08-21 23:24:05', '90.4091102', '23.74351', 'Flat#602, Dhaka District, BD', '2021-08-21 23:24:05', '2021-08-21 23:24:05'),
(1075, NULL, 2, '2021-08-21 23:24:11', '90.4226386', '23.8581457', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:24:11', '2021-08-21 23:24:11'),
(1076, NULL, 3, '2021-08-21 23:24:15', '90.4091066', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 23:24:15', '2021-08-21 23:24:15'),
(1077, NULL, 2, '2021-08-21 23:24:21', '90.4226362', '23.8581496', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:24:21', '2021-08-21 23:24:21'),
(1078, NULL, 3, '2021-08-21 23:24:24', '90.40911', '23.7435162', 'Flat#602, Dhaka District, BD', '2021-08-21 23:24:24', '2021-08-21 23:24:24'),
(1079, NULL, 2, '2021-08-21 23:24:31', '90.4226421', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:24:31', '2021-08-21 23:24:31'),
(1080, NULL, 3, '2021-08-21 23:24:35', '90.4091137', '23.7435084', 'Flat#602, Dhaka District, BD', '2021-08-21 23:24:35', '2021-08-21 23:24:35'),
(1081, NULL, 2, '2021-08-21 23:24:41', '90.4226468', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:24:41', '2021-08-21 23:24:41'),
(1082, NULL, 3, '2021-08-21 23:24:44', '90.4091117', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-21 23:24:44', '2021-08-21 23:24:44'),
(1083, NULL, 2, '2021-08-21 23:24:51', '90.4226456', '23.8581467', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:24:51', '2021-08-21 23:24:51'),
(1084, NULL, 3, '2021-08-21 23:24:54', '90.4091021', '23.7435111', 'Flat#602, Dhaka District, BD', '2021-08-21 23:24:54', '2021-08-21 23:24:54'),
(1085, NULL, 2, '2021-08-21 23:25:01', '90.4226405', '23.8581484', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:25:01', '2021-08-21 23:25:01'),
(1086, NULL, 3, '2021-08-21 23:25:05', '90.4091127', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 23:25:05', '2021-08-21 23:25:05'),
(1087, NULL, 2, '2021-08-21 23:25:11', '90.4226455', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:25:11', '2021-08-21 23:25:11'),
(1088, NULL, 3, '2021-08-21 23:25:15', '90.4091087', '23.7435158', 'Flat#602, Dhaka District, BD', '2021-08-21 23:25:15', '2021-08-21 23:25:15'),
(1089, NULL, 2, '2021-08-21 23:25:21', '90.4226468', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:25:21', '2021-08-21 23:25:21'),
(1090, NULL, 3, '2021-08-21 23:25:24', '90.4091053', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 23:25:24', '2021-08-21 23:25:24'),
(1091, NULL, 2, '2021-08-21 23:25:31', '90.4226464', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:25:31', '2021-08-21 23:25:31'),
(1092, NULL, 3, '2021-08-21 23:25:35', '90.4091076', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-21 23:25:35', '2021-08-21 23:25:35'),
(1093, NULL, 2, '2021-08-21 23:25:41', '90.4226443', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:25:41', '2021-08-21 23:25:41'),
(1094, NULL, 3, '2021-08-21 23:25:44', '90.4091139', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 23:25:44', '2021-08-21 23:25:44'),
(1095, NULL, 2, '2021-08-21 23:25:51', '90.4226465', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:25:51', '2021-08-21 23:25:51'),
(1096, NULL, 3, '2021-08-21 23:25:54', '90.4091135', '23.7435179', 'Flat#602, Dhaka District, BD', '2021-08-21 23:25:54', '2021-08-21 23:25:54'),
(1097, NULL, 2, '2021-08-21 23:26:01', '90.4226448', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:26:01', '2021-08-21 23:26:01'),
(1098, NULL, 3, '2021-08-21 23:26:04', '90.4091117', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 23:26:04', '2021-08-21 23:26:04'),
(1099, NULL, 2, '2021-08-21 23:26:11', '90.4226465', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:26:11', '2021-08-21 23:26:11'),
(1100, NULL, 3, '2021-08-21 23:26:15', '90.4091161', '23.7435061', 'Flat#602, Dhaka District, BD', '2021-08-21 23:26:15', '2021-08-21 23:26:15'),
(1101, NULL, 2, '2021-08-21 23:26:21', '90.4226452', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:26:21', '2021-08-21 23:26:21'),
(1102, NULL, 3, '2021-08-21 23:26:25', '90.4091112', '23.7435111', 'Flat#602, Dhaka District, BD', '2021-08-21 23:26:25', '2021-08-21 23:26:25'),
(1103, NULL, 2, '2021-08-21 23:26:31', '90.4226463', '23.8581454', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:26:31', '2021-08-21 23:26:31'),
(1104, NULL, 3, '2021-08-21 23:26:35', '90.409117', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 23:26:35', '2021-08-21 23:26:35'),
(1105, NULL, 2, '2021-08-21 23:26:41', '90.4226471', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:26:41', '2021-08-21 23:26:41'),
(1106, NULL, 3, '2021-08-21 23:26:44', '90.409101', '23.7435137', 'Flat#602, Dhaka District, BD', '2021-08-21 23:26:44', '2021-08-21 23:26:44'),
(1107, NULL, 2, '2021-08-21 23:26:51', '90.4226441', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:26:51', '2021-08-21 23:26:51'),
(1108, NULL, 3, '2021-08-21 23:26:54', '90.4091172', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 23:26:54', '2021-08-21 23:26:54'),
(1109, NULL, 2, '2021-08-21 23:27:01', '90.4226365', '23.85815', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:27:01', '2021-08-21 23:27:01'),
(1110, NULL, 3, '2021-08-21 23:27:03', '90.4091131', '23.7435085', 'Flat#602, Dhaka District, BD', '2021-08-21 23:27:03', '2021-08-21 23:27:03'),
(1111, NULL, 2, '2021-08-21 23:27:11', '90.4226527', '23.8581504', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:27:11', '2021-08-21 23:27:11'),
(1112, NULL, 3, '2021-08-21 23:27:15', '90.4091216', '23.7435091', 'Flat#602, Dhaka District, BD', '2021-08-21 23:27:15', '2021-08-21 23:27:15'),
(1113, NULL, 2, '2021-08-21 23:27:21', '90.4226464', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:27:21', '2021-08-21 23:27:21'),
(1114, NULL, 3, '2021-08-21 23:27:25', '90.4091223', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 23:27:25', '2021-08-21 23:27:25'),
(1115, NULL, 2, '2021-08-21 23:27:31', '90.4226416', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:27:31', '2021-08-21 23:27:31'),
(1116, NULL, 3, '2021-08-21 23:27:35', '90.4091201', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 23:27:35', '2021-08-21 23:27:35'),
(1117, NULL, 2, '2021-08-21 23:27:41', '90.422642', '23.8581498', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:27:41', '2021-08-21 23:27:41'),
(1118, NULL, 3, '2021-08-21 23:27:42', '90.4091243', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 23:27:42', '2021-08-21 23:27:42'),
(1119, NULL, 2, '2021-08-21 23:27:51', '90.4226394', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:27:51', '2021-08-21 23:27:51'),
(1120, NULL, 3, '2021-08-21 23:27:55', '90.4091105', '23.7435074', 'Flat#602, Dhaka District, BD', '2021-08-21 23:27:55', '2021-08-21 23:27:55'),
(1121, NULL, 2, '2021-08-21 23:28:01', '90.4226516', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:28:01', '2021-08-21 23:28:01'),
(1122, NULL, 3, '2021-08-21 23:28:05', '90.4091097', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 23:28:05', '2021-08-21 23:28:05'),
(1123, NULL, 2, '2021-08-21 23:28:11', '90.4226435', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:28:11', '2021-08-21 23:28:11'),
(1124, NULL, 3, '2021-08-21 23:28:15', '90.4091111', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 23:28:15', '2021-08-21 23:28:15'),
(1125, NULL, 2, '2021-08-21 23:28:21', '90.4226457', '23.8581535', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:28:21', '2021-08-21 23:28:21'),
(1126, NULL, 3, '2021-08-21 23:28:22', '90.4091197', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 23:28:22', '2021-08-21 23:28:22'),
(1127, NULL, 2, '2021-08-21 23:28:31', '90.4226417', '23.8581515', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:28:31', '2021-08-21 23:28:31'),
(1128, NULL, 3, '2021-08-21 23:28:35', '90.4091115', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-21 23:28:35', '2021-08-21 23:28:35'),
(1129, NULL, 2, '2021-08-21 23:28:41', '90.4226427', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:28:41', '2021-08-21 23:28:41'),
(1130, NULL, 3, '2021-08-21 23:28:45', '90.4091182', '23.7435068', 'Flat#602, Dhaka District, BD', '2021-08-21 23:28:45', '2021-08-21 23:28:45'),
(1131, NULL, 2, '2021-08-21 23:28:51', '90.4226484', '23.858141', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:28:51', '2021-08-21 23:28:51'),
(1132, NULL, 3, '2021-08-21 23:28:55', '90.4091162', '23.7435093', 'Flat#602, Dhaka District, BD', '2021-08-21 23:28:55', '2021-08-21 23:28:55'),
(1133, NULL, 2, '2021-08-21 23:29:01', '90.4226336', '23.8581512', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:29:01', '2021-08-21 23:29:01'),
(1134, NULL, 3, '2021-08-21 23:29:05', '90.4091196', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-21 23:29:05', '2021-08-21 23:29:05'),
(1135, NULL, 2, '2021-08-21 23:29:11', '90.4226363', '23.8581568', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:29:11', '2021-08-21 23:29:11'),
(1136, NULL, 3, '2021-08-21 23:29:15', '90.4091144', '23.7435091', 'Flat#602, Dhaka District, BD', '2021-08-21 23:29:15', '2021-08-21 23:29:15'),
(1137, NULL, 2, '2021-08-21 23:29:21', '90.4226424', '23.8581485', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:29:21', '2021-08-21 23:29:21'),
(1138, NULL, 3, '2021-08-21 23:29:25', '90.4091197', '23.7435081', 'Flat#602, Dhaka District, BD', '2021-08-21 23:29:25', '2021-08-21 23:29:25'),
(1139, NULL, 2, '2021-08-21 23:29:31', '90.4226396', '23.8581469', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:29:31', '2021-08-21 23:29:31'),
(1140, NULL, 3, '2021-08-21 23:29:35', '90.4091161', '23.7435115', 'Flat#602, Dhaka District, BD', '2021-08-21 23:29:35', '2021-08-21 23:29:35'),
(1141, NULL, 2, '2021-08-21 23:29:41', '90.4226449', '23.8581453', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:29:41', '2021-08-21 23:29:41'),
(1142, NULL, 3, '2021-08-21 23:29:45', '90.4091221', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 23:29:45', '2021-08-21 23:29:45'),
(1143, NULL, 2, '2021-08-21 23:29:51', '90.4226453', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:29:51', '2021-08-21 23:29:51'),
(1144, NULL, 3, '2021-08-21 23:29:55', '90.4091135', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:29:55', '2021-08-21 23:29:55'),
(1145, NULL, 2, '2021-08-21 23:30:01', '90.4226403', '23.8581474', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:30:01', '2021-08-21 23:30:01'),
(1146, NULL, 3, '2021-08-21 23:30:05', '90.4091211', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 23:30:05', '2021-08-21 23:30:05'),
(1147, NULL, 2, '2021-08-21 23:30:11', '90.4226524', '23.8581488', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:30:11', '2021-08-21 23:30:11'),
(1148, NULL, 3, '2021-08-21 23:30:15', '90.4091217', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-21 23:30:15', '2021-08-21 23:30:15'),
(1149, NULL, 2, '2021-08-21 23:30:21', '90.4226419', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:30:21', '2021-08-21 23:30:21'),
(1150, NULL, 3, '2021-08-21 23:30:25', '90.4091218', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 23:30:25', '2021-08-21 23:30:25'),
(1151, NULL, 2, '2021-08-21 23:30:31', '90.4226435', '23.8581419', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:30:31', '2021-08-21 23:30:31'),
(1152, NULL, 3, '2021-08-21 23:30:35', '90.4091195', '23.743507', 'Flat#602, Dhaka District, BD', '2021-08-21 23:30:35', '2021-08-21 23:30:35'),
(1153, NULL, 2, '2021-08-21 23:30:41', '90.4226407', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:30:41', '2021-08-21 23:30:41'),
(1154, NULL, 3, '2021-08-21 23:30:45', '90.4091206', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 23:30:45', '2021-08-21 23:30:45'),
(1155, NULL, 2, '2021-08-21 23:30:50', '90.4226444', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:30:50', '2021-08-21 23:30:50'),
(1156, NULL, 3, '2021-08-21 23:30:55', '90.4091138', '23.7435078', 'Flat#602, Dhaka District, BD', '2021-08-21 23:30:55', '2021-08-21 23:30:55'),
(1157, NULL, 2, '2021-08-21 23:31:01', '90.4226401', '23.8581463', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:31:01', '2021-08-21 23:31:01'),
(1158, NULL, 3, '2021-08-21 23:31:05', '90.4091167', '23.7435088', 'Flat#602, Dhaka District, BD', '2021-08-21 23:31:05', '2021-08-21 23:31:05'),
(1159, NULL, 2, '2021-08-21 23:31:11', '90.4226515', '23.8581551', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:31:11', '2021-08-21 23:31:11'),
(1160, NULL, 3, '2021-08-21 23:31:15', '90.4091087', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-21 23:31:15', '2021-08-21 23:31:15'),
(1161, NULL, 2, '2021-08-21 23:31:21', '90.4226424', '23.85815', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:31:21', '2021-08-21 23:31:21'),
(1162, NULL, 3, '2021-08-21 23:31:25', '90.4091146', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-21 23:31:25', '2021-08-21 23:31:25'),
(1163, NULL, 2, '2021-08-21 23:31:31', '90.4226431', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:31:31', '2021-08-21 23:31:31'),
(1164, NULL, 3, '2021-08-21 23:31:35', '90.4091132', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-21 23:31:35', '2021-08-21 23:31:35'),
(1165, NULL, 2, '2021-08-21 23:31:41', '90.4226468', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:31:41', '2021-08-21 23:31:41'),
(1166, NULL, 3, '2021-08-21 23:31:45', '90.4091151', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-21 23:31:45', '2021-08-21 23:31:45'),
(1167, NULL, 2, '2021-08-21 23:31:51', '90.4226405', '23.8581462', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:31:51', '2021-08-21 23:31:51'),
(1168, NULL, 3, '2021-08-21 23:31:55', '90.4091115', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-21 23:31:55', '2021-08-21 23:31:55'),
(1169, NULL, 2, '2021-08-21 23:32:01', '90.4226422', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:32:01', '2021-08-21 23:32:01'),
(1170, NULL, 3, '2021-08-21 23:32:05', '90.4091099', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-21 23:32:05', '2021-08-21 23:32:05'),
(1171, NULL, 2, '2021-08-21 23:32:11', '90.4226452', '23.8581516', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:32:11', '2021-08-21 23:32:11'),
(1172, NULL, 3, '2021-08-21 23:32:15', '90.4091204', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 23:32:15', '2021-08-21 23:32:15'),
(1173, NULL, 2, '2021-08-21 23:32:21', '90.4226415', '23.8581463', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:32:21', '2021-08-21 23:32:21'),
(1174, NULL, 3, '2021-08-21 23:32:25', '90.4091188', '23.7435083', 'Flat#602, Dhaka District, BD', '2021-08-21 23:32:25', '2021-08-21 23:32:25'),
(1175, NULL, 2, '2021-08-21 23:32:31', '90.4226478', '23.858155', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:32:31', '2021-08-21 23:32:31'),
(1176, NULL, 3, '2021-08-21 23:32:35', '90.4091151', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-21 23:32:35', '2021-08-21 23:32:35'),
(1177, NULL, 2, '2021-08-21 23:32:41', '90.4226431', '23.858139', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:32:41', '2021-08-21 23:32:41'),
(1178, NULL, 3, '2021-08-21 23:32:45', '90.4091184', '23.7435088', 'Flat#602, Dhaka District, BD', '2021-08-21 23:32:45', '2021-08-21 23:32:45'),
(1179, NULL, 2, '2021-08-21 23:32:51', '90.4226439', '23.8581461', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:32:51', '2021-08-21 23:32:51'),
(1180, NULL, 3, '2021-08-21 23:32:55', '90.4091165', '23.74351', 'Flat#602, Dhaka District, BD', '2021-08-21 23:32:55', '2021-08-21 23:32:55'),
(1181, NULL, 2, '2021-08-21 23:33:01', '90.4226411', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:33:01', '2021-08-21 23:33:01'),
(1182, NULL, 3, '2021-08-21 23:33:05', '90.4091196', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:33:05', '2021-08-21 23:33:05'),
(1183, NULL, 2, '2021-08-21 23:33:11', '90.4226413', '23.8581441', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:33:11', '2021-08-21 23:33:11'),
(1184, NULL, 3, '2021-08-21 23:33:15', '90.4091229', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-21 23:33:15', '2021-08-21 23:33:15'),
(1185, NULL, 2, '2021-08-21 23:33:21', '90.4226494', '23.8581463', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:33:21', '2021-08-21 23:33:21'),
(1186, NULL, 3, '2021-08-21 23:33:25', '90.40912', '23.743509', 'Flat#602, Dhaka District, BD', '2021-08-21 23:33:25', '2021-08-21 23:33:25'),
(1187, NULL, 2, '2021-08-21 23:33:31', '90.4226492', '23.8581567', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:33:31', '2021-08-21 23:33:31'),
(1188, NULL, 3, '2021-08-21 23:33:35', '90.4091227', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 23:33:35', '2021-08-21 23:33:35'),
(1189, NULL, 2, '2021-08-21 23:33:41', '90.4226413', '23.858147', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:33:41', '2021-08-21 23:33:41'),
(1190, NULL, 3, '2021-08-21 23:33:45', '90.4091201', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-21 23:33:45', '2021-08-21 23:33:45'),
(1191, NULL, 2, '2021-08-21 23:33:51', '90.4226442', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:33:51', '2021-08-21 23:33:51'),
(1192, NULL, 3, '2021-08-21 23:33:55', '90.4091246', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 23:33:55', '2021-08-21 23:33:55'),
(1193, NULL, 2, '2021-08-21 23:34:01', '90.4226387', '23.85815', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:34:01', '2021-08-21 23:34:01'),
(1194, NULL, 3, '2021-08-21 23:34:05', '90.4091165', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-21 23:34:05', '2021-08-21 23:34:05'),
(1195, NULL, 2, '2021-08-21 23:34:11', '90.4226358', '23.8581404', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:34:11', '2021-08-21 23:34:11'),
(1196, NULL, 3, '2021-08-21 23:34:15', '90.4091208', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:34:15', '2021-08-21 23:34:15'),
(1197, NULL, 2, '2021-08-21 23:34:21', '90.4226451', '23.8581391', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:34:21', '2021-08-21 23:34:21'),
(1198, NULL, 3, '2021-08-21 23:34:25', '90.4091151', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:34:25', '2021-08-21 23:34:25'),
(1199, NULL, 2, '2021-08-21 23:34:31', '90.4226469', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:34:31', '2021-08-21 23:34:31'),
(1200, NULL, 3, '2021-08-21 23:34:35', '90.4091147', '23.7435084', 'Flat#602, Dhaka District, BD', '2021-08-21 23:34:35', '2021-08-21 23:34:35'),
(1201, NULL, 2, '2021-08-21 23:34:41', '90.4226439', '23.8581467', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:34:41', '2021-08-21 23:34:41'),
(1202, NULL, 3, '2021-08-21 23:34:45', '90.4091164', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 23:34:45', '2021-08-21 23:34:45'),
(1203, NULL, 2, '2021-08-21 23:34:51', '90.4226399', '23.8581395', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:34:51', '2021-08-21 23:34:51'),
(1204, NULL, 3, '2021-08-21 23:34:55', '90.4091173', '23.7435088', 'Flat#602, Dhaka District, BD', '2021-08-21 23:34:55', '2021-08-21 23:34:55'),
(1205, NULL, 2, '2021-08-21 23:35:01', '90.422639', '23.8581379', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:35:01', '2021-08-21 23:35:01'),
(1206, NULL, 3, '2021-08-21 23:35:05', '90.4091188', '23.7435078', 'Flat#602, Dhaka District, BD', '2021-08-21 23:35:05', '2021-08-21 23:35:05'),
(1207, NULL, 2, '2021-08-21 23:35:11', '90.4226396', '23.8581467', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:35:11', '2021-08-21 23:35:11'),
(1208, NULL, 3, '2021-08-21 23:35:15', '90.4091206', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 23:35:15', '2021-08-21 23:35:15'),
(1209, NULL, 2, '2021-08-21 23:35:21', '90.422642', '23.8581458', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:35:21', '2021-08-21 23:35:21'),
(1210, NULL, 3, '2021-08-21 23:35:25', '90.4091221', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 23:35:25', '2021-08-21 23:35:25'),
(1211, NULL, 2, '2021-08-21 23:35:30', '90.4226464', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:35:30', '2021-08-21 23:35:30'),
(1212, NULL, 3, '2021-08-21 23:35:35', '90.409116', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 23:35:35', '2021-08-21 23:35:35'),
(1213, NULL, 2, '2021-08-21 23:35:41', '90.422641', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:35:41', '2021-08-21 23:35:41'),
(1214, NULL, 3, '2021-08-21 23:35:45', '90.4091212', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-21 23:35:45', '2021-08-21 23:35:45'),
(1215, NULL, 2, '2021-08-21 23:35:51', '90.4226469', '23.8581411', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:35:51', '2021-08-21 23:35:51'),
(1216, NULL, 3, '2021-08-21 23:35:55', '90.409122', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 23:35:55', '2021-08-21 23:35:55'),
(1217, NULL, 2, '2021-08-21 23:36:01', '90.4226409', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:36:01', '2021-08-21 23:36:01'),
(1218, NULL, 3, '2021-08-21 23:36:05', '90.4091244', '23.7435117', 'Flat#602, Dhaka District, BD', '2021-08-21 23:36:05', '2021-08-21 23:36:05'),
(1219, NULL, 2, '2021-08-21 23:36:11', '90.422644', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:36:11', '2021-08-21 23:36:11'),
(1220, NULL, 3, '2021-08-21 23:36:15', '90.4091237', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 23:36:15', '2021-08-21 23:36:15'),
(1221, NULL, 2, '2021-08-21 23:36:21', '90.4226431', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:36:21', '2021-08-21 23:36:21'),
(1222, NULL, 3, '2021-08-21 23:36:25', '90.4091182', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-21 23:36:25', '2021-08-21 23:36:25'),
(1223, NULL, 2, '2021-08-21 23:36:31', '90.4226404', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:36:31', '2021-08-21 23:36:31'),
(1224, NULL, 3, '2021-08-21 23:36:35', '90.4091138', '23.7435077', 'Flat#602, Dhaka District, BD', '2021-08-21 23:36:35', '2021-08-21 23:36:35'),
(1225, NULL, 2, '2021-08-21 23:36:41', '90.4226475', '23.858145', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:36:41', '2021-08-21 23:36:41'),
(1226, NULL, 3, '2021-08-21 23:36:45', '90.4091181', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-21 23:36:45', '2021-08-21 23:36:45'),
(1227, NULL, 2, '2021-08-21 23:36:51', '90.4226538', '23.8581409', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:36:51', '2021-08-21 23:36:51'),
(1228, NULL, 3, '2021-08-21 23:36:55', '90.4091233', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 23:36:55', '2021-08-21 23:36:55'),
(1229, NULL, 2, '2021-08-21 23:37:02', '90.4226408', '23.8581172', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:37:02', '2021-08-21 23:37:02'),
(1230, NULL, 3, '2021-08-21 23:37:05', '90.4091212', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:37:05', '2021-08-21 23:37:05'),
(1231, NULL, 2, '2021-08-21 23:37:11', '90.4226466', '23.8581354', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:37:11', '2021-08-21 23:37:11'),
(1232, NULL, 3, '2021-08-21 23:37:15', '90.4091192', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 23:37:15', '2021-08-21 23:37:15'),
(1233, NULL, 2, '2021-08-21 23:37:21', '90.4226562', '23.8581412', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:37:21', '2021-08-21 23:37:21'),
(1234, NULL, 3, '2021-08-21 23:37:25', '90.4091182', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 23:37:25', '2021-08-21 23:37:25'),
(1235, NULL, 2, '2021-08-21 23:37:31', '90.4226471', '23.8581419', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:37:31', '2021-08-21 23:37:31'),
(1236, NULL, 3, '2021-08-21 23:37:35', '90.4091159', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-21 23:37:35', '2021-08-21 23:37:35'),
(1237, NULL, 2, '2021-08-21 23:37:41', '90.4226512', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:37:41', '2021-08-21 23:37:41'),
(1238, NULL, 3, '2021-08-21 23:37:45', '90.4091154', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-21 23:37:45', '2021-08-21 23:37:45'),
(1239, NULL, 2, '2021-08-21 23:37:51', '90.4226472', '23.8581415', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:37:51', '2021-08-21 23:37:51'),
(1240, NULL, 3, '2021-08-21 23:37:55', '90.4091194', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 23:37:55', '2021-08-21 23:37:55'),
(1241, NULL, 2, '2021-08-21 23:38:01', '90.422644', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:38:01', '2021-08-21 23:38:01'),
(1242, NULL, 3, '2021-08-21 23:38:05', '90.4091116', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:38:05', '2021-08-21 23:38:05'),
(1243, NULL, 2, '2021-08-21 23:38:11', '90.4226364', '23.8581465', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:38:11', '2021-08-21 23:38:11'),
(1244, NULL, 3, '2021-08-21 23:38:15', '90.4091193', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-21 23:38:15', '2021-08-21 23:38:15'),
(1245, NULL, 2, '2021-08-21 23:38:21', '90.4226391', '23.8581399', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:38:21', '2021-08-21 23:38:21'),
(1246, NULL, 3, '2021-08-21 23:38:25', '90.4091134', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-21 23:38:25', '2021-08-21 23:38:25'),
(1247, NULL, 2, '2021-08-21 23:38:31', '90.4226339', '23.8581498', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:38:31', '2021-08-21 23:38:31'),
(1248, NULL, 3, '2021-08-21 23:38:35', '90.40912', '23.7435141', 'Flat#602, Dhaka District, BD', '2021-08-21 23:38:35', '2021-08-21 23:38:35'),
(1249, NULL, 2, '2021-08-21 23:38:41', '90.4226425', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:38:41', '2021-08-21 23:38:41'),
(1250, NULL, 3, '2021-08-21 23:38:45', '90.409119', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-21 23:38:45', '2021-08-21 23:38:45'),
(1251, NULL, 2, '2021-08-21 23:38:51', '90.4226445', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:38:51', '2021-08-21 23:38:51'),
(1252, NULL, 3, '2021-08-21 23:38:55', '90.4091232', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-21 23:38:55', '2021-08-21 23:38:55'),
(1253, NULL, 2, '2021-08-21 23:39:01', '90.422637', '23.8581481', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:39:01', '2021-08-21 23:39:01'),
(1254, NULL, 3, '2021-08-21 23:39:05', '90.4091221', '23.7435101', 'Flat#602, Dhaka District, BD', '2021-08-21 23:39:05', '2021-08-21 23:39:05'),
(1255, NULL, 2, '2021-08-21 23:39:11', '90.4226411', '23.8581453', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:39:11', '2021-08-21 23:39:11'),
(1256, NULL, 3, '2021-08-21 23:39:15', '90.4091188', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 23:39:15', '2021-08-21 23:39:15'),
(1257, NULL, 2, '2021-08-21 23:39:21', '90.4226566', '23.8581569', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:39:21', '2021-08-21 23:39:21'),
(1258, NULL, 3, '2021-08-21 23:39:25', '90.40912', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-21 23:39:25', '2021-08-21 23:39:25'),
(1259, NULL, 2, '2021-08-21 23:39:31', '90.4226477', '23.8581504', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:39:31', '2021-08-21 23:39:31'),
(1260, NULL, 3, '2021-08-21 23:39:35', '90.4091192', '23.7435075', 'Flat#602, Dhaka District, BD', '2021-08-21 23:39:35', '2021-08-21 23:39:35'),
(1261, NULL, 2, '2021-08-21 23:39:41', '90.4226328', '23.8581497', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:39:41', '2021-08-21 23:39:41'),
(1262, NULL, 3, '2021-08-21 23:39:45', '90.409116', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 23:39:45', '2021-08-21 23:39:45'),
(1263, NULL, 2, '2021-08-21 23:39:51', '90.4226433', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:39:51', '2021-08-21 23:39:51'),
(1264, NULL, 3, '2021-08-21 23:39:55', '90.4091204', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-21 23:39:55', '2021-08-21 23:39:55'),
(1265, NULL, 2, '2021-08-21 23:40:01', '90.4226498', '23.8581522', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:40:01', '2021-08-21 23:40:01'),
(1266, NULL, 3, '2021-08-21 23:40:05', '90.4091147', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-21 23:40:05', '2021-08-21 23:40:05'),
(1267, NULL, 2, '2021-08-21 23:40:11', '90.4226448', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:40:11', '2021-08-21 23:40:11'),
(1268, NULL, 3, '2021-08-21 23:40:15', '90.4091184', '23.743511', 'Flat#602, Dhaka District, BD', '2021-08-21 23:40:15', '2021-08-21 23:40:15'),
(1269, NULL, 2, '2021-08-21 23:40:21', '90.4226359', '23.8581537', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:40:21', '2021-08-21 23:40:21'),
(1270, NULL, 3, '2021-08-21 23:40:25', '90.4091218', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-21 23:40:25', '2021-08-21 23:40:25'),
(1271, NULL, 2, '2021-08-21 23:40:31', '90.4226382', '23.8581484', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:40:31', '2021-08-21 23:40:31'),
(1272, NULL, 3, '2021-08-21 23:40:35', '90.4091168', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-21 23:40:35', '2021-08-21 23:40:35'),
(1273, NULL, 2, '2021-08-21 23:40:41', '90.4226422', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:40:41', '2021-08-21 23:40:41'),
(1274, NULL, 3, '2021-08-21 23:40:45', '90.4091211', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-21 23:40:45', '2021-08-21 23:40:45'),
(1275, NULL, 2, '2021-08-21 23:40:51', '90.4226426', '23.8581511', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:40:51', '2021-08-21 23:40:51'),
(1276, NULL, 3, '2021-08-21 23:40:55', '90.4091216', '23.7435164', 'Flat#602, Dhaka District, BD', '2021-08-21 23:40:55', '2021-08-21 23:40:55'),
(1277, NULL, 2, '2021-08-21 23:41:01', '90.4226461', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:41:01', '2021-08-21 23:41:01'),
(1278, NULL, 3, '2021-08-21 23:41:05', '90.4091202', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 23:41:05', '2021-08-21 23:41:05'),
(1279, NULL, 2, '2021-08-21 23:41:11', '90.4226483', '23.8581393', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:41:11', '2021-08-21 23:41:11'),
(1280, NULL, 3, '2021-08-21 23:41:15', '90.4091242', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-21 23:41:15', '2021-08-21 23:41:15'),
(1281, NULL, 2, '2021-08-21 23:41:21', '90.4226393', '23.8581446', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:41:21', '2021-08-21 23:41:21'),
(1282, NULL, 3, '2021-08-21 23:41:25', '90.4091233', '23.7435111', 'Flat#602, Dhaka District, BD', '2021-08-21 23:41:25', '2021-08-21 23:41:25'),
(1283, NULL, 2, '2021-08-21 23:41:31', '90.4226428', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:41:31', '2021-08-21 23:41:31'),
(1284, NULL, 3, '2021-08-21 23:41:35', '90.4091223', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-21 23:41:35', '2021-08-21 23:41:35'),
(1285, NULL, 2, '2021-08-21 23:41:41', '90.4226461', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:41:41', '2021-08-21 23:41:41'),
(1286, NULL, 3, '2021-08-21 23:41:45', '90.40912', '23.7435102', 'Flat#602, Dhaka District, BD', '2021-08-21 23:41:45', '2021-08-21 23:41:45'),
(1287, NULL, 2, '2021-08-21 23:41:51', '90.4226453', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:41:51', '2021-08-21 23:41:51'),
(1288, NULL, 3, '2021-08-21 23:41:55', '90.409115', '23.7435094', 'Flat#602, Dhaka District, BD', '2021-08-21 23:41:55', '2021-08-21 23:41:55'),
(1289, NULL, 2, '2021-08-21 23:42:01', '90.4226471', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:42:01', '2021-08-21 23:42:01'),
(1290, NULL, 3, '2021-08-21 23:42:05', '90.4091224', '23.7435114', 'Flat#602, Dhaka District, BD', '2021-08-21 23:42:05', '2021-08-21 23:42:05'),
(1291, NULL, 2, '2021-08-21 23:42:11', '90.4226454', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:42:11', '2021-08-21 23:42:11'),
(1292, NULL, 3, '2021-08-21 23:42:15', '90.409123', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-21 23:42:15', '2021-08-21 23:42:15'),
(1293, NULL, 2, '2021-08-21 23:42:21', '90.4226443', '23.858146', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:42:21', '2021-08-21 23:42:21'),
(1294, NULL, 3, '2021-08-21 23:42:25', '90.4091164', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-21 23:42:25', '2021-08-21 23:42:25'),
(1295, NULL, 2, '2021-08-21 23:42:32', '90.422645', '23.8581499', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:42:32', '2021-08-21 23:42:32'),
(1296, NULL, 3, '2021-08-21 23:42:35', '90.4091178', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-21 23:42:35', '2021-08-21 23:42:35'),
(1297, NULL, 2, '2021-08-21 23:42:42', '90.4226435', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:42:42', '2021-08-21 23:42:42'),
(1298, NULL, 3, '2021-08-21 23:42:45', '90.4091194', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 23:42:45', '2021-08-21 23:42:45'),
(1299, NULL, 2, '2021-08-21 23:42:52', '90.422643', '23.8581469', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:42:52', '2021-08-21 23:42:52'),
(1300, NULL, 3, '2021-08-21 23:42:55', '90.4091207', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-21 23:42:55', '2021-08-21 23:42:55'),
(1301, NULL, 2, '2021-08-21 23:43:02', '90.4226433', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:43:02', '2021-08-21 23:43:02'),
(1302, NULL, 3, '2021-08-21 23:43:05', '90.4091173', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 23:43:05', '2021-08-21 23:43:05'),
(1303, NULL, 2, '2021-08-21 23:43:12', '90.4226471', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:43:12', '2021-08-21 23:43:12'),
(1304, NULL, 3, '2021-08-21 23:43:15', '90.4091136', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-21 23:43:15', '2021-08-21 23:43:15'),
(1305, NULL, 2, '2021-08-21 23:43:21', '90.422645', '23.85814', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:43:21', '2021-08-21 23:43:21'),
(1306, NULL, 3, '2021-08-21 23:43:25', '90.4091162', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-21 23:43:25', '2021-08-21 23:43:25'),
(1307, NULL, 2, '2021-08-21 23:43:31', '90.4226476', '23.8581246', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:43:31', '2021-08-21 23:43:31'),
(1308, NULL, 3, '2021-08-21 23:43:35', '90.4091203', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 23:43:35', '2021-08-21 23:43:35'),
(1309, NULL, 2, '2021-08-21 23:43:41', '90.4226422', '23.8581519', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:43:41', '2021-08-21 23:43:41'),
(1310, NULL, 3, '2021-08-21 23:43:45', '90.4091205', '23.7435111', 'Flat#602, Dhaka District, BD', '2021-08-21 23:43:45', '2021-08-21 23:43:45'),
(1311, NULL, 2, '2021-08-21 23:43:51', '90.4226448', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:43:51', '2021-08-21 23:43:51'),
(1312, NULL, 3, '2021-08-21 23:43:55', '90.40912', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-21 23:43:55', '2021-08-21 23:43:55'),
(1313, NULL, 2, '2021-08-21 23:44:01', '90.4226448', '23.8581403', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:44:01', '2021-08-21 23:44:01'),
(1314, NULL, 3, '2021-08-21 23:44:05', '90.4091196', '23.7435088', 'Flat#602, Dhaka District, BD', '2021-08-21 23:44:05', '2021-08-21 23:44:05'),
(1315, NULL, 2, '2021-08-21 23:44:11', '90.4226444', '23.858145', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:44:11', '2021-08-21 23:44:11'),
(1316, NULL, 3, '2021-08-21 23:44:15', '90.4091121', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-21 23:44:15', '2021-08-21 23:44:15'),
(1317, NULL, 2, '2021-08-21 23:44:21', '90.4226492', '23.8581408', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:44:21', '2021-08-21 23:44:21'),
(1318, NULL, 3, '2021-08-21 23:44:25', '90.4091202', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-21 23:44:25', '2021-08-21 23:44:25'),
(1319, NULL, 2, '2021-08-21 23:44:31', '90.4226455', '23.8581399', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:44:31', '2021-08-21 23:44:31'),
(1320, NULL, 3, '2021-08-21 23:44:35', '90.4091232', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-21 23:44:35', '2021-08-21 23:44:35'),
(1321, NULL, 2, '2021-08-21 23:44:41', '90.4226572', '23.8581703', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:44:41', '2021-08-21 23:44:41'),
(1322, NULL, 3, '2021-08-21 23:44:45', '90.4091168', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-21 23:44:45', '2021-08-21 23:44:45'),
(1323, NULL, 2, '2021-08-21 23:44:51', '90.4226459', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:44:51', '2021-08-21 23:44:51'),
(1324, NULL, 3, '2021-08-21 23:44:55', '90.4091173', '23.74351', 'Flat#602, Dhaka District, BD', '2021-08-21 23:44:55', '2021-08-21 23:44:55'),
(1325, NULL, 2, '2021-08-21 23:45:01', '90.4226467', '23.8581388', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:45:01', '2021-08-21 23:45:01'),
(1326, NULL, 3, '2021-08-21 23:45:05', '90.4091183', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-21 23:45:05', '2021-08-21 23:45:05'),
(1327, NULL, 2, '2021-08-21 23:45:11', '90.4226435', '23.85815', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:45:11', '2021-08-21 23:45:11'),
(1328, NULL, 3, '2021-08-21 23:45:15', '90.4091218', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:45:15', '2021-08-21 23:45:15'),
(1329, NULL, 2, '2021-08-21 23:45:21', '90.4226508', '23.8581524', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:45:21', '2021-08-21 23:45:21'),
(1330, NULL, 3, '2021-08-21 23:45:24', '90.4091193', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-21 23:45:24', '2021-08-21 23:45:24'),
(1331, NULL, 2, '2021-08-21 23:45:31', '90.4226565', '23.8581581', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:45:31', '2021-08-21 23:45:31'),
(1332, NULL, 3, '2021-08-21 23:45:34', '90.4091126', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-21 23:45:34', '2021-08-21 23:45:34'),
(1333, NULL, 2, '2021-08-21 23:45:41', '90.4226421', '23.8581476', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:45:41', '2021-08-21 23:45:41'),
(1334, NULL, 2, '2021-08-21 23:45:51', '90.4226419', '23.8581466', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:45:51', '2021-08-21 23:45:51'),
(1335, NULL, 2, '2021-08-21 23:46:01', '90.4226449', '23.8581401', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:46:01', '2021-08-21 23:46:01'),
(1336, NULL, 2, '2021-08-21 23:46:11', '90.4226454', '23.8581468', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:46:11', '2021-08-21 23:46:11'),
(1337, NULL, 2, '2021-08-21 23:46:21', '90.4226471', '23.8581422', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:46:21', '2021-08-21 23:46:21'),
(1338, NULL, 2, '2021-08-21 23:46:31', '90.4226443', '23.8581471', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:46:31', '2021-08-21 23:46:31'),
(1339, NULL, 2, '2021-08-21 23:46:41', '90.4226479', '23.8581445', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:46:41', '2021-08-21 23:46:41'),
(1340, NULL, 2, '2021-08-21 23:46:51', '90.4226456', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:46:51', '2021-08-21 23:46:51'),
(1341, NULL, 2, '2021-08-21 23:47:01', '90.4226452', '23.8581453', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:47:01', '2021-08-21 23:47:01'),
(1342, NULL, 2, '2021-08-21 23:47:11', '90.422645', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:47:11', '2021-08-21 23:47:11'),
(1343, NULL, 2, '2021-08-21 23:47:21', '90.4226587', '23.8581583', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:47:21', '2021-08-21 23:47:21'),
(1344, NULL, 2, '2021-08-21 23:47:31', '90.4226457', '23.8581558', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:47:31', '2021-08-21 23:47:31'),
(1345, NULL, 2, '2021-08-21 23:47:41', '90.4226343', '23.8581407', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:47:41', '2021-08-21 23:47:41'),
(1346, NULL, 2, '2021-08-21 23:47:51', '90.4226433', '23.8581501', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:47:51', '2021-08-21 23:47:51'),
(1347, NULL, 2, '2021-08-21 23:48:01', '90.422645', '23.8581468', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:48:01', '2021-08-21 23:48:01'),
(1348, NULL, 2, '2021-08-21 23:48:11', '90.4226395', '23.8581738', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:48:11', '2021-08-21 23:48:11'),
(1349, NULL, 2, '2021-08-21 23:48:21', '90.4226367', '23.8581485', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:48:21', '2021-08-21 23:48:21'),
(1350, NULL, 2, '2021-08-21 23:48:31', '90.422651', '23.8581542', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:48:31', '2021-08-21 23:48:31'),
(1351, NULL, 2, '2021-08-21 23:48:41', '90.422638', '23.8581529', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:48:41', '2021-08-21 23:48:41'),
(1352, NULL, 2, '2021-08-21 23:48:51', '90.4226304', '23.8581474', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:48:51', '2021-08-21 23:48:51'),
(1353, NULL, 2, '2021-08-21 23:49:01', '90.4226424', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:49:01', '2021-08-21 23:49:01'),
(1354, NULL, 2, '2021-08-21 23:49:11', '90.422645', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:49:11', '2021-08-21 23:49:11'),
(1355, NULL, 2, '2021-08-21 23:49:21', '90.422641', '23.8581498', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:49:21', '2021-08-21 23:49:21'),
(1356, NULL, 2, '2021-08-21 23:49:31', '90.4226432', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:49:31', '2021-08-21 23:49:31'),
(1357, NULL, 2, '2021-08-21 23:49:41', '90.4226448', '23.8581474', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:49:41', '2021-08-21 23:49:41'),
(1358, NULL, 2, '2021-08-21 23:49:51', '90.4226401', '23.8581495', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:49:51', '2021-08-21 23:49:51'),
(1359, NULL, 2, '2021-08-21 23:50:01', '90.4226443', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:50:01', '2021-08-21 23:50:01'),
(1360, NULL, 2, '2021-08-21 23:50:11', '90.4226414', '23.8581477', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:50:11', '2021-08-21 23:50:11'),
(1361, NULL, 2, '2021-08-21 23:50:21', '90.4226443', '23.8581484', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:50:21', '2021-08-21 23:50:21'),
(1362, NULL, 2, '2021-08-21 23:50:31', '90.4226432', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:50:31', '2021-08-21 23:50:31'),
(1363, NULL, 2, '2021-08-21 23:50:41', '90.4226461', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:50:41', '2021-08-21 23:50:41'),
(1364, NULL, 2, '2021-08-21 23:50:51', '90.4226466', '23.8581429', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:50:51', '2021-08-21 23:50:51'),
(1365, NULL, 2, '2021-08-21 23:51:01', '90.4226456', '23.8581415', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:51:01', '2021-08-21 23:51:01'),
(1366, NULL, 2, '2021-08-21 23:51:11', '90.4226454', '23.8581401', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:51:11', '2021-08-21 23:51:11'),
(1367, NULL, 2, '2021-08-21 23:51:21', '90.4226492', '23.858134', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:51:21', '2021-08-21 23:51:21');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1368, NULL, 2, '2021-08-21 23:51:31', '90.4226468', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:51:31', '2021-08-21 23:51:31'),
(1369, NULL, 2, '2021-08-21 23:51:41', '90.422645', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:51:41', '2021-08-21 23:51:41'),
(1370, NULL, 2, '2021-08-21 23:51:51', '90.4226432', '23.8581477', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:51:51', '2021-08-21 23:51:51'),
(1371, NULL, 2, '2021-08-21 23:52:02', '90.4226441', '23.858146', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:52:02', '2021-08-21 23:52:02'),
(1372, NULL, 2, '2021-08-21 23:52:11', '90.4226453', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:52:11', '2021-08-21 23:52:11'),
(1373, NULL, 2, '2021-08-21 23:52:21', '90.4226453', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:52:21', '2021-08-21 23:52:21'),
(1374, NULL, 2, '2021-08-21 23:52:31', '90.4226445', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:52:31', '2021-08-21 23:52:31'),
(1375, NULL, 2, '2021-08-21 23:52:41', '90.422645', '23.8581379', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:52:41', '2021-08-21 23:52:41'),
(1376, NULL, 2, '2021-08-21 23:52:51', '90.4226442', '23.8581398', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:52:51', '2021-08-21 23:52:51'),
(1377, NULL, 2, '2021-08-21 23:53:01', '90.4226454', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:53:01', '2021-08-21 23:53:01'),
(1378, NULL, 2, '2021-08-21 23:53:11', '90.4226454', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:53:11', '2021-08-21 23:53:11'),
(1379, NULL, 2, '2021-08-21 23:53:21', '90.4226451', '23.8581415', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:53:21', '2021-08-21 23:53:21'),
(1380, NULL, 2, '2021-08-21 23:53:31', '90.4226443', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:53:31', '2021-08-21 23:53:31'),
(1381, NULL, 2, '2021-08-21 23:53:41', '90.422635', '23.858131', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:53:41', '2021-08-21 23:53:41'),
(1382, NULL, 2, '2021-08-21 23:53:51', '90.4226439', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:53:51', '2021-08-21 23:53:51'),
(1383, NULL, 2, '2021-08-21 23:54:01', '90.4226458', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:54:01', '2021-08-21 23:54:01'),
(1384, NULL, 2, '2021-08-21 23:54:11', '90.4226448', '23.8581464', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:54:11', '2021-08-21 23:54:11'),
(1385, NULL, 2, '2021-08-21 23:54:21', '90.4226449', '23.8581461', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:54:21', '2021-08-21 23:54:21'),
(1386, NULL, 2, '2021-08-21 23:54:31', '90.4226471', '23.8581412', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:54:31', '2021-08-21 23:54:31'),
(1387, NULL, 2, '2021-08-21 23:54:41', '90.4226466', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:54:41', '2021-08-21 23:54:41'),
(1388, NULL, 2, '2021-08-21 23:54:51', '90.4226465', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:54:51', '2021-08-21 23:54:51'),
(1389, NULL, 2, '2021-08-21 23:55:01', '90.4226438', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:55:01', '2021-08-21 23:55:01'),
(1390, NULL, 2, '2021-08-21 23:55:12', '90.4226385', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:55:12', '2021-08-21 23:55:12'),
(1391, NULL, 2, '2021-08-21 23:55:21', '90.4226414', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:55:21', '2021-08-21 23:55:21'),
(1392, NULL, 2, '2021-08-21 23:55:31', '90.422642', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:55:31', '2021-08-21 23:55:31'),
(1393, NULL, 2, '2021-08-21 23:55:41', '90.4226397', '23.8581473', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:55:41', '2021-08-21 23:55:41'),
(1394, NULL, 2, '2021-08-21 23:55:51', '90.4226457', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:55:51', '2021-08-21 23:55:51'),
(1395, NULL, 2, '2021-08-21 23:56:01', '90.4226428', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:56:01', '2021-08-21 23:56:01'),
(1396, NULL, 2, '2021-08-21 23:56:11', '90.422641', '23.8581446', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:56:11', '2021-08-21 23:56:11'),
(1397, NULL, 2, '2021-08-21 23:56:21', '90.4226451', '23.8581386', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:56:21', '2021-08-21 23:56:21'),
(1398, NULL, 2, '2021-08-21 23:56:31', '90.4226427', '23.8581494', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:56:31', '2021-08-21 23:56:31'),
(1399, NULL, 2, '2021-08-21 23:56:41', '90.422648', '23.8581412', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:56:41', '2021-08-21 23:56:41'),
(1400, NULL, 2, '2021-08-21 23:56:51', '90.4226464', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:56:51', '2021-08-21 23:56:51'),
(1401, NULL, 2, '2021-08-21 23:57:39', '90.422645', '23.8581408', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:57:39', '2021-08-21 23:57:39'),
(1402, NULL, 2, '2021-08-21 23:57:59', '90.4226436', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:57:59', '2021-08-21 23:57:59'),
(1403, NULL, 2, '2021-08-21 23:59:34', '90.4226465', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-21 23:59:34', '2021-08-21 23:59:34'),
(1404, NULL, 2, '2021-08-22 00:00:06', '90.4226432', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:00:06', '2021-08-22 00:00:06'),
(1405, NULL, 2, '2021-08-22 00:00:42', '90.4226564', '23.8581495', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:00:42', '2021-08-22 00:00:42'),
(1406, NULL, 2, '2021-08-22 00:00:52', '90.4226479', '23.8581433', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:00:52', '2021-08-22 00:00:52'),
(1407, NULL, 2, '2021-08-22 00:01:03', '90.4226411', '23.8581393', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:01:03', '2021-08-22 00:01:03'),
(1408, NULL, 2, '2021-08-22 00:01:12', '90.422644', '23.858147', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:01:12', '2021-08-22 00:01:12'),
(1409, NULL, 2, '2021-08-22 00:01:22', '90.4226453', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:01:22', '2021-08-22 00:01:22'),
(1410, NULL, 2, '2021-08-22 00:01:32', '90.4226465', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:01:32', '2021-08-22 00:01:32'),
(1411, NULL, 2, '2021-08-22 00:01:42', '90.4226451', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:01:42', '2021-08-22 00:01:42'),
(1412, NULL, 2, '2021-08-22 00:01:52', '90.4226476', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:01:52', '2021-08-22 00:01:52'),
(1413, NULL, 2, '2021-08-22 00:02:02', '90.4226485', '23.8581387', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:02:02', '2021-08-22 00:02:02'),
(1414, NULL, 2, '2021-08-22 00:02:12', '90.4226482', '23.8581392', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:02:12', '2021-08-22 00:02:12'),
(1415, NULL, 2, '2021-08-22 00:02:22', '90.4226468', '23.8581399', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:02:22', '2021-08-22 00:02:22'),
(1416, NULL, 2, '2021-08-22 00:02:32', '90.4226476', '23.8581402', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:02:32', '2021-08-22 00:02:32'),
(1417, NULL, 2, '2021-08-22 00:02:43', '90.4226404', '23.8581532', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:02:43', '2021-08-22 00:02:43'),
(1418, NULL, 2, '2021-08-22 00:02:53', '90.422649', '23.8581517', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:02:53', '2021-08-22 00:02:53'),
(1419, NULL, 2, '2021-08-22 00:03:03', '90.4226485', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:03:03', '2021-08-22 00:03:03'),
(1420, NULL, 2, '2021-08-22 00:03:13', '90.4226447', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:03:13', '2021-08-22 00:03:13'),
(1421, NULL, 2, '2021-08-22 00:03:33', '90.4226459', '23.8581474', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:03:33', '2021-08-22 00:03:33'),
(1422, NULL, 2, '2021-08-22 00:03:42', '90.4226395', '23.8581397', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:03:42', '2021-08-22 00:03:42'),
(1423, NULL, 2, '2021-08-22 00:04:03', '90.4226452', '23.858141', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:04:03', '2021-08-22 00:04:03'),
(1424, NULL, 2, '2021-08-22 00:04:13', '90.4226448', '23.8581402', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:04:13', '2021-08-22 00:04:13'),
(1425, NULL, 2, '2021-08-22 00:04:22', '90.4226413', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:04:22', '2021-08-22 00:04:22'),
(1426, NULL, 2, '2021-08-22 00:04:32', '90.4226504', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:04:32', '2021-08-22 00:04:32'),
(1427, NULL, 2, '2021-08-22 00:04:42', '90.4226475', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:04:42', '2021-08-22 00:04:42'),
(1428, NULL, 2, '2021-08-22 00:04:52', '90.4226463', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:04:52', '2021-08-22 00:04:52'),
(1429, NULL, 2, '2021-08-22 00:05:02', '90.4226456', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:05:02', '2021-08-22 00:05:02'),
(1430, NULL, 2, '2021-08-22 00:05:12', '90.4226436', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:05:12', '2021-08-22 00:05:12'),
(1431, NULL, 2, '2021-08-22 00:05:22', '90.4226451', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:05:22', '2021-08-22 00:05:22'),
(1432, NULL, 2, '2021-08-22 00:05:32', '90.4226448', '23.8581403', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:05:32', '2021-08-22 00:05:32'),
(1433, NULL, 2, '2021-08-22 00:05:42', '90.4226451', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:05:42', '2021-08-22 00:05:42'),
(1434, NULL, 2, '2021-08-22 00:05:52', '90.4226487', '23.8581515', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:05:52', '2021-08-22 00:05:52'),
(1435, NULL, 2, '2021-08-22 00:06:02', '90.4226462', '23.8581457', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:06:02', '2021-08-22 00:06:02'),
(1436, NULL, 2, '2021-08-22 00:06:12', '90.4226494', '23.8581365', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:06:12', '2021-08-22 00:06:12'),
(1437, NULL, 2, '2021-08-22 00:06:22', '90.4226442', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:06:22', '2021-08-22 00:06:22'),
(1438, NULL, 2, '2021-08-22 00:06:32', '90.4226449', '23.8581479', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:06:32', '2021-08-22 00:06:32'),
(1439, NULL, 2, '2021-08-22 00:06:56', '90.4226491', '23.8581412', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:06:56', '2021-08-22 00:06:56'),
(1440, NULL, 2, '2021-08-22 00:07:13', '90.4226502', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:07:13', '2021-08-22 00:07:13'),
(1441, NULL, 2, '2021-08-22 00:07:18', '90.4226451', '23.8581483', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:07:18', '2021-08-22 00:07:18'),
(1442, NULL, 2, '2021-08-22 00:07:43', '90.422642', '23.8581471', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:07:43', '2021-08-22 00:07:43'),
(1443, NULL, 2, '2021-08-22 00:07:53', '90.4226456', '23.8581396', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:07:53', '2021-08-22 00:07:53'),
(1444, NULL, 2, '2021-08-22 00:08:03', '90.4226421', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:08:03', '2021-08-22 00:08:03'),
(1445, NULL, 2, '2021-08-22 00:08:13', '90.4226435', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:08:13', '2021-08-22 00:08:13'),
(1446, NULL, 2, '2021-08-22 00:08:23', '90.4226513', '23.8581459', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:08:23', '2021-08-22 00:08:23'),
(1447, NULL, 2, '2021-08-22 00:08:33', '90.4226427', '23.8581499', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:08:33', '2021-08-22 00:08:33'),
(1448, NULL, 2, '2021-08-22 00:08:43', '90.4226462', '23.858146', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:08:43', '2021-08-22 00:08:43'),
(1449, NULL, 2, '2021-08-22 00:08:53', '90.4226463', '23.8581453', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:08:53', '2021-08-22 00:08:53'),
(1450, NULL, 2, '2021-08-22 00:09:03', '90.4226444', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:09:03', '2021-08-22 00:09:03'),
(1451, NULL, 2, '2021-08-22 00:09:13', '90.4226418', '23.8581366', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:09:13', '2021-08-22 00:09:13'),
(1452, NULL, 2, '2021-08-22 00:09:23', '90.4226422', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:09:23', '2021-08-22 00:09:23'),
(1453, NULL, 2, '2021-08-22 00:09:33', '90.4226521', '23.8581533', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:09:33', '2021-08-22 00:09:33'),
(1454, NULL, 2, '2021-08-22 00:09:43', '90.4226437', '23.8581465', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:09:43', '2021-08-22 00:09:43'),
(1455, NULL, 2, '2021-08-22 00:09:53', '90.4226444', '23.8581417', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:09:53', '2021-08-22 00:09:53'),
(1456, NULL, 2, '2021-08-22 00:10:03', '90.4226431', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:10:03', '2021-08-22 00:10:03'),
(1457, NULL, 2, '2021-08-22 00:10:13', '90.4226298', '23.8581551', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:10:13', '2021-08-22 00:10:13'),
(1458, NULL, 2, '2021-08-22 00:10:23', '90.4226388', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:10:23', '2021-08-22 00:10:23'),
(1459, NULL, 2, '2021-08-22 00:10:33', '90.4226395', '23.8581401', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:10:33', '2021-08-22 00:10:33'),
(1460, NULL, 2, '2021-08-22 00:10:43', '90.4226435', '23.8581529', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:10:43', '2021-08-22 00:10:43'),
(1461, NULL, 2, '2021-08-22 00:10:53', '90.4226457', '23.8581504', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:10:53', '2021-08-22 00:10:53'),
(1462, NULL, 2, '2021-08-22 00:11:03', '90.4226451', '23.8581447', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:11:03', '2021-08-22 00:11:03'),
(1463, NULL, 2, '2021-08-22 00:11:13', '90.4226379', '23.8581496', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:11:13', '2021-08-22 00:11:13'),
(1464, NULL, 2, '2021-08-22 00:11:21', '90.4226449', '23.8581388', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:11:21', '2021-08-22 00:11:21'),
(1465, NULL, 2, '2021-08-22 00:11:33', '90.4226404', '23.8581455', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:11:33', '2021-08-22 00:11:33'),
(1466, NULL, 2, '2021-08-22 00:11:43', '90.4226433', '23.8581489', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:11:43', '2021-08-22 00:11:43'),
(1467, NULL, 2, '2021-08-22 00:11:53', '90.4226415', '23.8581621', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:11:53', '2021-08-22 00:11:53'),
(1468, NULL, 2, '2021-08-22 00:12:03', '90.4226341', '23.8581334', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:12:03', '2021-08-22 00:12:03'),
(1469, NULL, 2, '2021-08-22 00:12:26', '90.4226447', '23.8581406', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:12:26', '2021-08-22 00:12:26'),
(1470, NULL, 2, '2021-08-22 00:13:38', '90.4226424', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:13:38', '2021-08-22 00:13:38'),
(1471, NULL, 2, '2021-08-22 00:14:49', '90.4226478', '23.8581423', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:14:49', '2021-08-22 00:14:49'),
(1472, NULL, 2, '2021-08-22 00:15:02', '90.4226464', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:15:02', '2021-08-22 00:15:02'),
(1473, NULL, 2, '2021-08-22 00:15:41', '90.4226414', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:15:41', '2021-08-22 00:15:41'),
(1474, NULL, 2, '2021-08-22 00:17:15', '90.4226491', '23.8581562', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:17:15', '2021-08-22 00:17:15'),
(1475, NULL, 2, '2021-08-22 00:17:25', '90.4226368', '23.858135', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:17:25', '2021-08-22 00:17:25'),
(1476, NULL, 2, '2021-08-22 00:17:35', '90.4226469', '23.858143', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:17:35', '2021-08-22 00:17:35'),
(1477, NULL, 2, '2021-08-22 00:17:45', '90.4226534', '23.8581512', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:17:45', '2021-08-22 00:17:45'),
(1478, NULL, 2, '2021-08-22 00:18:14', '90.4226402', '23.8581453', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:18:14', '2021-08-22 00:18:14'),
(1479, NULL, 2, '2021-08-22 00:18:25', '90.4226451', '23.8581455', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:18:25', '2021-08-22 00:18:25'),
(1480, NULL, 2, '2021-08-22 00:18:49', '90.4226458', '23.8581415', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:18:49', '2021-08-22 00:18:49'),
(1481, NULL, 2, '2021-08-22 00:19:28', '90.422645', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:19:28', '2021-08-22 00:19:28'),
(1482, NULL, 2, '2021-08-22 00:20:49', '90.4226467', '23.8581428', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:20:49', '2021-08-22 00:20:49'),
(1483, NULL, 2, '2021-08-22 00:20:59', '90.4226436', '23.8581452', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:20:59', '2021-08-22 00:20:59'),
(1484, NULL, 2, '2021-08-22 00:21:09', '90.4226444', '23.8581416', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:21:09', '2021-08-22 00:21:09'),
(1485, NULL, 2, '2021-08-22 00:21:19', '90.4226465', '23.8581424', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:21:19', '2021-08-22 00:21:19'),
(1486, NULL, 2, '2021-08-22 00:21:29', '90.4226468', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:21:29', '2021-08-22 00:21:29'),
(1487, NULL, 2, '2021-08-22 00:21:39', '90.4226452', '23.8581411', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:21:39', '2021-08-22 00:21:39'),
(1488, NULL, 2, '2021-08-22 00:21:49', '90.4226465', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:21:49', '2021-08-22 00:21:49'),
(1489, NULL, 2, '2021-08-22 00:21:59', '90.4226467', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:21:59', '2021-08-22 00:21:59'),
(1490, NULL, 2, '2021-08-22 00:22:09', '90.4226424', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:22:09', '2021-08-22 00:22:09'),
(1491, NULL, 2, '2021-08-22 00:22:19', '90.4226465', '23.8581426', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:22:19', '2021-08-22 00:22:19'),
(1492, NULL, 2, '2021-08-22 00:22:29', '90.4226479', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:22:29', '2021-08-22 00:22:29'),
(1493, NULL, 2, '2021-08-22 00:22:39', '90.4226473', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:22:39', '2021-08-22 00:22:39'),
(1494, NULL, 2, '2021-08-22 00:22:49', '90.4226467', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:22:49', '2021-08-22 00:22:49'),
(1495, NULL, 2, '2021-08-22 00:22:59', '90.4226468', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:22:59', '2021-08-22 00:22:59'),
(1496, NULL, 2, '2021-08-22 00:23:09', '90.4226457', '23.8581451', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:23:09', '2021-08-22 00:23:09'),
(1497, NULL, 2, '2021-08-22 00:23:19', '90.4226464', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:23:19', '2021-08-22 00:23:19'),
(1498, NULL, 2, '2021-08-22 00:23:29', '90.4226447', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:23:29', '2021-08-22 00:23:29'),
(1499, NULL, 2, '2021-08-22 00:23:39', '90.422645', '23.8581414', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:23:39', '2021-08-22 00:23:39'),
(1500, NULL, 2, '2021-08-22 00:23:49', '90.4226442', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:23:49', '2021-08-22 00:23:49'),
(1501, NULL, 2, '2021-08-22 00:23:59', '90.4226466', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:23:59', '2021-08-22 00:23:59'),
(1502, NULL, 2, '2021-08-22 00:24:09', '90.4226467', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:24:09', '2021-08-22 00:24:09'),
(1503, NULL, 2, '2021-08-22 00:24:19', '90.4226473', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:24:19', '2021-08-22 00:24:19'),
(1504, NULL, 2, '2021-08-22 00:24:29', '90.4226466', '23.8581441', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:24:29', '2021-08-22 00:24:29'),
(1505, NULL, 2, '2021-08-22 00:24:39', '90.4226461', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:24:39', '2021-08-22 00:24:39'),
(1506, NULL, 2, '2021-08-22 00:24:49', '90.422647', '23.8581432', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:24:49', '2021-08-22 00:24:49'),
(1507, NULL, 2, '2021-08-22 00:24:59', '90.4226471', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:24:59', '2021-08-22 00:24:59'),
(1508, NULL, 2, '2021-08-22 00:25:09', '90.4226472', '23.8581435', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:25:09', '2021-08-22 00:25:09'),
(1509, NULL, 2, '2021-08-22 00:25:19', '90.4226441', '23.8581431', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:25:19', '2021-08-22 00:25:19'),
(1510, NULL, 2, '2021-08-22 00:25:29', '90.4226464', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:25:29', '2021-08-22 00:25:29'),
(1511, NULL, 2, '2021-08-22 00:25:39', '90.4226471', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:25:39', '2021-08-22 00:25:39'),
(1512, NULL, 2, '2021-08-22 00:26:34', '90.4226431', '23.858144', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:26:34', '2021-08-22 00:26:34'),
(1513, NULL, 2, '2021-08-22 00:26:44', '90.4226468', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:26:44', '2021-08-22 00:26:44'),
(1514, NULL, 2, '2021-08-22 00:27:57', '90.4226403', '23.8581474', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:27:57', '2021-08-22 00:27:57'),
(1515, NULL, 2, '2021-08-22 00:29:08', '90.4226363', '23.8581389', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:29:08', '2021-08-22 00:29:08'),
(1516, NULL, 2, '2021-08-22 00:30:27', '90.4226391', '23.8581521', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:30:27', '2021-08-22 00:30:27'),
(1517, NULL, 2, '2021-08-22 00:34:15', '90.4226445', '23.8581539', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:34:15', '2021-08-22 00:34:15'),
(1518, NULL, 2, '2021-08-22 00:35:04', '90.4226426', '23.8581448', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:35:04', '2021-08-22 00:35:04'),
(1519, NULL, 2, '2021-08-22 00:36:56', '90.4226355', '23.8581595', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:36:56', '2021-08-22 00:36:56'),
(1520, NULL, 2, '2021-08-22 00:37:06', '90.4226402', '23.8581478', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:37:06', '2021-08-22 00:37:06'),
(1521, NULL, 2, '2021-08-22 00:37:16', '90.4226454', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:37:16', '2021-08-22 00:37:16'),
(1522, NULL, 2, '2021-08-22 00:37:26', '90.4226472', '23.8581434', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:37:26', '2021-08-22 00:37:26'),
(1523, NULL, 2, '2021-08-22 00:37:36', '90.4226472', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:37:36', '2021-08-22 00:37:36'),
(1524, NULL, 2, '2021-08-22 00:37:46', '90.4226471', '23.858142', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:37:46', '2021-08-22 00:37:46'),
(1525, NULL, 2, '2021-08-22 00:37:56', '90.4226464', '23.8581438', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:37:56', '2021-08-22 00:37:56'),
(1526, NULL, 2, '2021-08-22 00:38:06', '90.4226407', '23.8581459', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:38:06', '2021-08-22 00:38:06'),
(1527, NULL, 2, '2021-08-22 00:38:16', '90.4226491', '23.8581549', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:38:16', '2021-08-22 00:38:16'),
(1528, NULL, 2, '2021-08-22 00:38:26', '90.4226452', '23.8581478', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:38:26', '2021-08-22 00:38:26'),
(1529, NULL, 2, '2021-08-22 00:38:36', '90.4226443', '23.8581413', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:38:36', '2021-08-22 00:38:36'),
(1530, NULL, 2, '2021-08-22 00:38:46', '90.4226382', '23.858146', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:38:46', '2021-08-22 00:38:46'),
(1531, NULL, 2, '2021-08-22 00:38:56', '90.4226422', '23.8581453', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:38:56', '2021-08-22 00:38:56'),
(1532, NULL, 2, '2021-08-22 00:39:06', '90.4226468', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:39:06', '2021-08-22 00:39:06'),
(1533, NULL, 2, '2021-08-22 00:39:16', '90.4226449', '23.858145', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:39:16', '2021-08-22 00:39:16'),
(1534, NULL, 2, '2021-08-22 00:39:26', '90.4226431', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:39:26', '2021-08-22 00:39:26'),
(1535, NULL, 2, '2021-08-22 00:39:36', '90.4226472', '23.8581443', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:39:36', '2021-08-22 00:39:36'),
(1536, NULL, 2, '2021-08-22 00:39:46', '90.4226473', '23.8581442', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:39:46', '2021-08-22 00:39:46'),
(1537, NULL, 2, '2021-08-22 00:39:56', '90.4226471', '23.8581421', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:39:56', '2021-08-22 00:39:56'),
(1538, NULL, 2, '2021-08-22 00:40:06', '90.4226453', '23.8581418', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:40:06', '2021-08-22 00:40:06'),
(1539, NULL, 2, '2021-08-22 00:40:16', '90.4226465', '23.8581456', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:40:16', '2021-08-22 00:40:16'),
(1540, NULL, 2, '2021-08-22 00:40:26', '90.422648', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:40:26', '2021-08-22 00:40:26'),
(1541, NULL, 2, '2021-08-22 00:40:36', '90.4226468', '23.8581432', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:40:36', '2021-08-22 00:40:36'),
(1542, NULL, 2, '2021-08-22 00:40:46', '90.4226471', '23.8581437', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:40:46', '2021-08-22 00:40:46'),
(1543, NULL, 2, '2021-08-22 00:40:56', '90.4226472', '23.8581464', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:40:56', '2021-08-22 00:40:56'),
(1544, NULL, 2, '2021-08-22 00:41:06', '90.422647', '23.8581449', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:41:06', '2021-08-22 00:41:06'),
(1545, NULL, 2, '2021-08-22 00:41:16', '90.4226466', '23.8581425', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:41:16', '2021-08-22 00:41:16'),
(1546, NULL, 2, '2021-08-22 00:41:26', '90.4226448', '23.8581541', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:41:26', '2021-08-22 00:41:26'),
(1547, NULL, 2, '2021-08-22 00:41:36', '90.4226437', '23.8581486', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:41:36', '2021-08-22 00:41:36'),
(1548, NULL, 2, '2021-08-22 00:41:46', '90.422638', '23.8581499', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:41:46', '2021-08-22 00:41:46'),
(1549, NULL, 2, '2021-08-22 00:41:55', '90.4226452', '23.8581485', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:41:55', '2021-08-22 00:41:55'),
(1550, NULL, 2, '2021-08-22 00:42:06', '90.4226395', '23.8581444', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:42:06', '2021-08-22 00:42:06'),
(1551, NULL, 2, '2021-08-22 00:42:16', '90.4226366', '23.8581562', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:42:16', '2021-08-22 00:42:16'),
(1552, NULL, 2, '2021-08-22 00:42:26', '90.4226402', '23.8581455', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:42:26', '2021-08-22 00:42:26'),
(1553, NULL, 2, '2021-08-22 00:42:36', '90.4226341', '23.858153', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:42:36', '2021-08-22 00:42:36'),
(1554, NULL, 2, '2021-08-22 00:42:46', '90.4226369', '23.8581463', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:42:46', '2021-08-22 00:42:46'),
(1555, NULL, 2, '2021-08-22 00:42:56', '90.4226437', '23.8581427', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:42:56', '2021-08-22 00:42:56'),
(1556, NULL, 2, '2021-08-22 00:43:06', '90.422628', '23.8581477', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:43:06', '2021-08-22 00:43:06'),
(1557, NULL, 2, '2021-08-22 00:43:16', '90.4226387', '23.8581391', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:43:16', '2021-08-22 00:43:16'),
(1558, NULL, 2, '2021-08-22 00:43:43', '90.4226441', '23.8581436', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:43:43', '2021-08-22 00:43:43'),
(1559, NULL, 2, '2021-08-22 00:45:08', '90.4226425', '23.8581439', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:45:08', '2021-08-22 00:45:08'),
(1560, NULL, 2, '2021-08-22 00:45:24', '90.4226411', '23.8581504', 'Aainusbag Road, Dhaka District, BD', '2021-08-22 00:45:24', '2021-08-22 00:45:24'),
(1561, 100017, 3, '2021-08-22 01:17:20', '90.4091239', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-22 01:17:20', '2021-08-22 01:17:20'),
(1562, 100017, 3, '2021-08-22 01:17:33', '90.4091209', '23.7435086', 'Flat#602, Dhaka District, BD', '2021-08-22 01:17:33', '2021-08-22 01:17:33'),
(1563, 100017, 3, '2021-08-22 01:17:43', '90.4091183', '23.7435195', 'Flat#602, Dhaka District, BD', '2021-08-22 01:17:43', '2021-08-22 01:17:43'),
(1564, 100017, 3, '2021-08-22 01:17:53', '90.409121', '23.7435231', 'Flat#602, Dhaka District, BD', '2021-08-22 01:17:53', '2021-08-22 01:17:53'),
(1565, 100017, 3, '2021-08-22 01:18:03', '90.4091291', '23.7435199', 'Flat#602, Dhaka District, BD', '2021-08-22 01:18:03', '2021-08-22 01:18:03'),
(1566, 100017, 3, '2021-08-22 01:18:16', '90.4091276', '23.7435172', 'Flat#602, Dhaka District, BD', '2021-08-22 01:18:16', '2021-08-22 01:18:16'),
(1567, 100017, 3, '2021-08-22 01:18:22', '90.4091317', '23.7435208', 'Flat#602, Dhaka District, BD', '2021-08-22 01:18:22', '2021-08-22 01:18:22'),
(1568, 100017, 3, '2021-08-22 01:18:33', '90.4091161', '23.743517', 'Flat#602, Dhaka District, BD', '2021-08-22 01:18:33', '2021-08-22 01:18:33'),
(1569, 100017, 3, '2021-08-22 01:18:41', '90.4091377', '23.7435218', 'Flat#602, Dhaka District, BD', '2021-08-22 01:18:41', '2021-08-22 01:18:41'),
(1570, 100017, 3, '2021-08-22 01:18:53', '90.4091129', '23.743521', 'Flat#602, Dhaka District, BD', '2021-08-22 01:18:53', '2021-08-22 01:18:53'),
(1571, 100017, 3, '2021-08-22 01:19:04', '90.4091148', '23.7435153', 'Flat#602, Dhaka District, BD', '2021-08-22 01:19:04', '2021-08-22 01:19:04'),
(1572, 100017, 3, '2021-08-22 01:19:13', '90.4091204', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-22 01:19:13', '2021-08-22 01:19:13'),
(1573, 100017, 3, '2021-08-22 01:19:24', '90.4091364', '23.7435092', 'Flat#602, Dhaka District, BD', '2021-08-22 01:19:24', '2021-08-22 01:19:24'),
(1574, 100017, 3, '2021-08-22 01:19:34', '90.4091192', '23.7435123', 'Flat#602, Dhaka District, BD', '2021-08-22 01:19:34', '2021-08-22 01:19:34'),
(1575, 100017, 3, '2021-08-22 01:19:44', '90.4091179', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-22 01:19:44', '2021-08-22 01:19:44'),
(1576, 100017, 3, '2021-08-22 01:19:53', '90.4091219', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-22 01:19:53', '2021-08-22 01:19:53'),
(1577, 100017, 3, '2021-08-22 01:20:03', '90.4091213', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-22 01:20:03', '2021-08-22 01:20:03'),
(1578, 100017, 3, '2021-08-22 01:20:13', '90.4091151', '23.7435047', 'Flat#602, Dhaka District, BD', '2021-08-22 01:20:13', '2021-08-22 01:20:13'),
(1579, 100017, 3, '2021-08-22 01:20:23', '90.4091179', '23.7435104', 'Flat#602, Dhaka District, BD', '2021-08-22 01:20:23', '2021-08-22 01:20:23'),
(1580, 100017, 3, '2021-08-22 01:20:33', '90.4091274', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-22 01:20:33', '2021-08-22 01:20:33'),
(1581, 100017, 3, '2021-08-22 01:20:44', '90.4091175', '23.7435191', 'Flat#602, Dhaka District, BD', '2021-08-22 01:20:44', '2021-08-22 01:20:44'),
(1582, 100017, 3, '2021-08-22 01:20:54', '90.4091182', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-22 01:20:54', '2021-08-22 01:20:54'),
(1583, 100017, 3, '2021-08-22 01:21:03', '90.4091252', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-22 01:21:03', '2021-08-22 01:21:03'),
(1584, 100017, 3, '2021-08-22 01:21:13', '90.4091228', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-22 01:21:13', '2021-08-22 01:21:13'),
(1585, 100017, 3, '2021-08-22 01:21:24', '90.4091085', '23.7435194', 'Flat#602, Dhaka District, BD', '2021-08-22 01:21:24', '2021-08-22 01:21:24'),
(1586, 100017, 3, '2021-08-22 01:21:34', '90.4091116', '23.7435169', 'Flat#602, Dhaka District, BD', '2021-08-22 01:21:34', '2021-08-22 01:21:34'),
(1587, 100017, 3, '2021-08-22 01:21:43', '90.4091228', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-22 01:21:43', '2021-08-22 01:21:43'),
(1588, 100017, 3, '2021-08-22 01:21:53', '90.4091312', '23.7435177', 'Flat#602, Dhaka District, BD', '2021-08-22 01:21:53', '2021-08-22 01:21:53'),
(1589, 100017, 3, '2021-08-22 01:22:03', '90.4091119', '23.743516', 'Flat#602, Dhaka District, BD', '2021-08-22 01:22:03', '2021-08-22 01:22:03'),
(1590, 100017, 3, '2021-08-22 01:22:13', '90.4091177', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-22 01:22:13', '2021-08-22 01:22:13'),
(1591, 100017, 3, '2021-08-22 01:22:23', '90.4091243', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-22 01:22:23', '2021-08-22 01:22:23'),
(1592, 100017, 3, '2021-08-22 01:22:33', '90.4091223', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-22 01:22:33', '2021-08-22 01:22:33'),
(1593, 100017, 3, '2021-08-22 01:22:43', '90.4091192', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-22 01:22:43', '2021-08-22 01:22:43'),
(1594, 100017, 3, '2021-08-22 01:22:53', '90.4091224', '23.7435148', 'Flat#602, Dhaka District, BD', '2021-08-22 01:22:53', '2021-08-22 01:22:53'),
(1595, 100017, 3, '2021-08-22 01:23:03', '90.4091164', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-22 01:23:03', '2021-08-22 01:23:03'),
(1596, 100017, 3, '2021-08-22 01:23:13', '90.4091184', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-22 01:23:13', '2021-08-22 01:23:13'),
(1597, 100017, 3, '2021-08-22 01:23:23', '90.4091232', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-22 01:23:23', '2021-08-22 01:23:23'),
(1598, 100017, 3, '2021-08-22 01:23:34', '90.4091144', '23.7435153', 'Flat#602, Dhaka District, BD', '2021-08-22 01:23:34', '2021-08-22 01:23:34'),
(1599, 100017, 3, '2021-08-22 01:23:44', '90.4091204', '23.7435113', 'Flat#602, Dhaka District, BD', '2021-08-22 01:23:44', '2021-08-22 01:23:44'),
(1600, 100017, 3, '2021-08-22 01:23:57', '90.4091114', '23.7435086', 'Flat#602, Dhaka District, BD', '2021-08-22 01:23:57', '2021-08-22 01:23:57'),
(1601, 100017, 3, '2021-08-22 01:24:04', '90.4091213', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-22 01:24:04', '2021-08-22 01:24:04'),
(1602, 100017, 3, '2021-08-22 01:24:13', '90.4091067', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-22 01:24:13', '2021-08-22 01:24:13'),
(1603, 100017, 3, '2021-08-22 01:24:23', '90.4091213', '23.7435169', 'Flat#602, Dhaka District, BD', '2021-08-22 01:24:23', '2021-08-22 01:24:23'),
(1604, 100017, 3, '2021-08-22 01:24:33', '90.4091241', '23.7435079', 'Flat#602, Dhaka District, BD', '2021-08-22 01:24:33', '2021-08-22 01:24:33'),
(1605, 100017, 3, '2021-08-22 01:24:44', '90.4091207', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-22 01:24:44', '2021-08-22 01:24:44'),
(1606, 100017, 3, '2021-08-22 01:24:53', '90.4091085', '23.7435054', 'Flat#602, Dhaka District, BD', '2021-08-22 01:24:53', '2021-08-22 01:24:53'),
(1607, 100017, 3, '2021-08-22 01:25:03', '90.4091175', '23.7435196', 'Flat#602, Dhaka District, BD', '2021-08-22 01:25:03', '2021-08-22 01:25:03'),
(1608, 100017, 3, '2021-08-22 01:25:13', '90.4091116', '23.7435178', 'Flat#602, Dhaka District, BD', '2021-08-22 01:25:13', '2021-08-22 01:25:13'),
(1609, 100017, 3, '2021-08-22 01:25:23', '90.4091238', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-22 01:25:23', '2021-08-22 01:25:23'),
(1610, 100017, 3, '2021-08-22 01:25:33', '90.4091129', '23.7435084', 'Flat#602, Dhaka District, BD', '2021-08-22 01:25:33', '2021-08-22 01:25:33'),
(1611, 100017, 3, '2021-08-22 01:25:42', '90.4091172', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-22 01:25:42', '2021-08-22 01:25:42'),
(1612, 100017, 3, '2021-08-22 01:25:53', '90.4091217', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-22 01:25:53', '2021-08-22 01:25:53'),
(1613, 100017, 3, '2021-08-22 01:26:03', '90.4091119', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-22 01:26:03', '2021-08-22 01:26:03'),
(1614, 100017, 3, '2021-08-22 01:26:13', '90.4091252', '23.7435119', 'Flat#602, Dhaka District, BD', '2021-08-22 01:26:13', '2021-08-22 01:26:13'),
(1615, 100017, 3, '2021-08-22 01:26:23', '90.4091142', '23.7435074', 'Flat#602, Dhaka District, BD', '2021-08-22 01:26:23', '2021-08-22 01:26:23'),
(1616, 100017, 3, '2021-08-22 01:26:33', '90.4091213', '23.7435169', 'Flat#602, Dhaka District, BD', '2021-08-22 01:26:33', '2021-08-22 01:26:33'),
(1617, 100017, 3, '2021-08-22 01:26:43', '90.4091248', '23.7435128', 'Flat#602, Dhaka District, BD', '2021-08-22 01:26:43', '2021-08-22 01:26:43'),
(1618, 100017, 3, '2021-08-22 01:26:53', '90.4091202', '23.7435167', 'Flat#602, Dhaka District, BD', '2021-08-22 01:26:53', '2021-08-22 01:26:53'),
(1619, 100017, 3, '2021-08-22 01:27:03', '90.4091386', '23.7435212', 'Flat#602, Dhaka District, BD', '2021-08-22 01:27:03', '2021-08-22 01:27:03'),
(1620, 100017, 3, '2021-08-22 01:27:13', '90.4091327', '23.7435189', 'Flat#602, Dhaka District, BD', '2021-08-22 01:27:13', '2021-08-22 01:27:13'),
(1621, 100017, 3, '2021-08-22 01:27:32', '90.4091188', '23.7435202', 'Flat#602, Dhaka District, BD', '2021-08-22 01:27:32', '2021-08-22 01:27:32'),
(1622, 100017, 3, '2021-08-22 01:27:40', '90.4091197', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-22 01:27:40', '2021-08-22 01:27:40'),
(1623, 100017, 3, '2021-08-22 01:27:50', '90.4091065', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-22 01:27:50', '2021-08-22 01:27:50'),
(1624, 100017, 3, '2021-08-22 01:28:00', '90.4091372', '23.7435176', 'Flat#602, Dhaka District, BD', '2021-08-22 01:28:00', '2021-08-22 01:28:00'),
(1625, 100017, 3, '2021-08-22 01:28:12', '90.409098', '23.7435195', 'Flat#602, Dhaka District, BD', '2021-08-22 01:28:12', '2021-08-22 01:28:12'),
(1626, 100017, 3, '2021-08-22 01:28:22', '90.4091267', '23.7435172', 'Flat#602, Dhaka District, BD', '2021-08-22 01:28:22', '2021-08-22 01:28:22'),
(1627, 100017, 3, '2021-08-22 01:28:32', '90.4091276', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-22 01:28:32', '2021-08-22 01:28:32'),
(1628, 100017, 3, '2021-08-22 01:28:42', '90.4091242', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-22 01:28:42', '2021-08-22 01:28:42'),
(1629, 100017, 3, '2021-08-22 01:28:52', '90.4091289', '23.7435081', 'Flat#602, Dhaka District, BD', '2021-08-22 01:28:52', '2021-08-22 01:28:52'),
(1630, 100017, 3, '2021-08-22 01:29:05', '90.4091348', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-22 01:29:05', '2021-08-22 01:29:05'),
(1631, 100017, 3, '2021-08-22 01:29:14', '90.4091284', '23.7435161', 'Flat#602, Dhaka District, BD', '2021-08-22 01:29:14', '2021-08-22 01:29:14'),
(1632, 100017, 3, '2021-08-22 01:29:22', '90.4091298', '23.7435163', 'Flat#602, Dhaka District, BD', '2021-08-22 01:29:22', '2021-08-22 01:29:22'),
(1633, 100017, 3, '2021-08-22 01:29:32', '90.4091324', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-22 01:29:32', '2021-08-22 01:29:32'),
(1634, 100017, 3, '2021-08-22 01:29:42', '90.4091341', '23.7435262', 'Flat#602, Dhaka District, BD', '2021-08-22 01:29:42', '2021-08-22 01:29:42'),
(1635, 100017, 3, '2021-08-22 01:29:52', '90.4091202', '23.7435151', 'Flat#602, Dhaka District, BD', '2021-08-22 01:29:52', '2021-08-22 01:29:52'),
(1636, 100017, 3, '2021-08-22 01:30:03', '90.409116', '23.7435167', 'Flat#602, Dhaka District, BD', '2021-08-22 01:30:03', '2021-08-22 01:30:03'),
(1637, 100017, 3, '2021-08-22 01:30:12', '90.4091433', '23.7435271', 'Flat#602, Dhaka District, BD', '2021-08-22 01:30:12', '2021-08-22 01:30:12'),
(1638, 100017, 3, '2021-08-22 01:30:22', '90.4091433', '23.7435231', 'Flat#602, Dhaka District, BD', '2021-08-22 01:30:22', '2021-08-22 01:30:22'),
(1639, 100017, 3, '2021-08-22 01:30:32', '90.4091312', '23.7435196', 'Flat#602, Dhaka District, BD', '2021-08-22 01:30:32', '2021-08-22 01:30:32'),
(1640, 100017, 3, '2021-08-22 01:30:42', '90.4091204', '23.743522', 'Flat#602, Dhaka District, BD', '2021-08-22 01:30:42', '2021-08-22 01:30:42'),
(1641, 100017, 3, '2021-08-22 01:30:53', '90.4091241', '23.7435183', 'Flat#602, Dhaka District, BD', '2021-08-22 01:30:53', '2021-08-22 01:30:53'),
(1642, 100017, 3, '2021-08-22 01:31:02', '90.4091134', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-22 01:31:02', '2021-08-22 01:31:02'),
(1643, 100017, 3, '2021-08-22 01:31:12', '90.4091248', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-22 01:31:12', '2021-08-22 01:31:12'),
(1644, 100017, 3, '2021-08-22 01:31:22', '90.4091239', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-22 01:31:22', '2021-08-22 01:31:22'),
(1645, 100017, 3, '2021-08-22 01:31:33', '90.4091287', '23.743524', 'Flat#602, Dhaka District, BD', '2021-08-22 01:31:33', '2021-08-22 01:31:33'),
(1646, 100017, 3, '2021-08-22 01:31:42', '90.4091217', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-22 01:31:42', '2021-08-22 01:31:42'),
(1647, 100017, 3, '2021-08-22 01:31:52', '90.4091209', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-22 01:31:52', '2021-08-22 01:31:52'),
(1648, 100017, 3, '2021-08-22 01:32:02', '90.4091279', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-22 01:32:02', '2021-08-22 01:32:02'),
(1649, 100017, 3, '2021-08-22 01:32:12', '90.4091311', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-22 01:32:12', '2021-08-22 01:32:12'),
(1650, 100017, 3, '2021-08-22 01:32:22', '90.409122', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-22 01:32:22', '2021-08-22 01:32:22'),
(1651, 100017, 3, '2021-08-22 01:32:32', '90.4091172', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-22 01:32:32', '2021-08-22 01:32:32'),
(1652, 100017, 3, '2021-08-22 01:32:42', '90.4091209', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-22 01:32:42', '2021-08-22 01:32:42'),
(1653, 100017, 3, '2021-08-22 01:32:52', '90.4091206', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-22 01:32:52', '2021-08-22 01:32:52'),
(1654, 100017, 3, '2021-08-22 01:33:02', '90.409132', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-22 01:33:02', '2021-08-22 01:33:02'),
(1655, 100017, 3, '2021-08-22 01:33:12', '90.4091232', '23.7435162', 'Flat#602, Dhaka District, BD', '2021-08-22 01:33:12', '2021-08-22 01:33:12'),
(1656, 100017, 3, '2021-08-22 01:33:22', '90.4091191', '23.7435174', 'Flat#602, Dhaka District, BD', '2021-08-22 01:33:22', '2021-08-22 01:33:22'),
(1657, 100017, 3, '2021-08-22 01:33:32', '90.4091262', '23.7435112', 'Flat#602, Dhaka District, BD', '2021-08-22 01:33:32', '2021-08-22 01:33:32'),
(1658, 100017, 3, '2021-08-22 01:33:42', '90.4091225', '23.7435176', 'Flat#602, Dhaka District, BD', '2021-08-22 01:33:42', '2021-08-22 01:33:42'),
(1659, 100017, 3, '2021-08-22 01:33:52', '90.4091187', '23.7435212', 'Flat#602, Dhaka District, BD', '2021-08-22 01:33:52', '2021-08-22 01:33:52'),
(1660, 100017, 3, '2021-08-22 01:34:02', '90.4091112', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-22 01:34:02', '2021-08-22 01:34:02'),
(1661, 100017, 3, '2021-08-22 01:34:12', '90.4091207', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-22 01:34:12', '2021-08-22 01:34:12'),
(1662, 100017, 3, '2021-08-22 01:34:22', '90.4091171', '23.743511', 'Flat#602, Dhaka District, BD', '2021-08-22 01:34:22', '2021-08-22 01:34:22'),
(1663, 100017, 3, '2021-08-22 01:34:32', '90.4091239', '23.7435172', 'Flat#602, Dhaka District, BD', '2021-08-22 01:34:32', '2021-08-22 01:34:32'),
(1664, 100017, 3, '2021-08-22 01:34:42', '90.4091046', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-22 01:34:42', '2021-08-22 01:34:42'),
(1665, 100017, 3, '2021-08-22 01:34:52', '90.4091225', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-22 01:34:52', '2021-08-22 01:34:52'),
(1666, 100017, 3, '2021-08-22 01:35:02', '90.4091388', '23.7435213', 'Flat#602, Dhaka District, BD', '2021-08-22 01:35:02', '2021-08-22 01:35:02'),
(1667, 100017, 3, '2021-08-22 01:35:12', '90.4091298', '23.7435216', 'Flat#602, Dhaka District, BD', '2021-08-22 01:35:12', '2021-08-22 01:35:12'),
(1668, 100017, 3, '2021-08-22 01:35:22', '90.4091151', '23.7435044', 'Flat#602, Dhaka District, BD', '2021-08-22 01:35:22', '2021-08-22 01:35:22'),
(1669, 100017, 3, '2021-08-22 01:35:32', '90.4091136', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-22 01:35:32', '2021-08-22 01:35:32'),
(1670, 100017, 3, '2021-08-22 01:35:42', '90.4091257', '23.743512', 'Flat#602, Dhaka District, BD', '2021-08-22 01:35:42', '2021-08-22 01:35:42'),
(1671, 100017, 3, '2021-08-22 01:35:53', '90.4091132', '23.74351', 'Flat#602, Dhaka District, BD', '2021-08-22 01:35:53', '2021-08-22 01:35:53'),
(1672, 100017, 3, '2021-08-22 01:36:02', '90.409116', '23.7435079', 'Flat#602, Dhaka District, BD', '2021-08-22 01:36:02', '2021-08-22 01:36:02'),
(1673, 100017, 3, '2021-08-22 01:36:12', '90.4091169', '23.743519', 'Flat#602, Dhaka District, BD', '2021-08-22 01:36:12', '2021-08-22 01:36:12'),
(1674, 100017, 3, '2021-08-22 01:36:22', '90.4091338', '23.7435165', 'Flat#602, Dhaka District, BD', '2021-08-22 01:36:22', '2021-08-22 01:36:22'),
(1675, 100017, 3, '2021-08-22 01:36:32', '90.4091278', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-22 01:36:32', '2021-08-22 01:36:32'),
(1676, 100017, 3, '2021-08-22 01:36:42', '90.4091172', '23.7435209', 'Flat#602, Dhaka District, BD', '2021-08-22 01:36:42', '2021-08-22 01:36:42'),
(1677, 100017, 3, '2021-08-22 01:36:53', '90.4091153', '23.7435272', 'Flat#602, Dhaka District, BD', '2021-08-22 01:36:53', '2021-08-22 01:36:53'),
(1678, 100017, 3, '2021-08-22 01:37:02', '90.409127', '23.7435197', 'Flat#602, Dhaka District, BD', '2021-08-22 01:37:02', '2021-08-22 01:37:02'),
(1679, NULL, 4, '2021-08-22 01:37:04', '90.3454878', '23.763326', '38, Dhaka District, BD', '2021-08-22 01:37:04', '2021-08-22 01:37:04'),
(1680, NULL, 4, '2021-08-22 01:37:11', '90.3453852', '23.7632804', '38, Dhaka District, BD', '2021-08-22 01:37:11', '2021-08-22 01:37:11'),
(1681, 100017, 3, '2021-08-22 01:37:12', '90.4091221', '23.7435176', 'Flat#602, Dhaka District, BD', '2021-08-22 01:37:12', '2021-08-22 01:37:12'),
(1682, 100017, 3, '2021-08-22 01:37:22', '90.4091257', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-22 01:37:22', '2021-08-22 01:37:22'),
(1683, NULL, 4, '2021-08-22 01:37:24', '90.3455012', '23.7633445', '38, Dhaka District, BD', '2021-08-22 01:37:24', '2021-08-22 01:37:24'),
(1684, NULL, 4, '2021-08-22 01:37:31', '90.3454917', '23.7633179', '38, Dhaka District, BD', '2021-08-22 01:37:31', '2021-08-22 01:37:31'),
(1685, 100017, 3, '2021-08-22 01:37:32', '90.4091274', '23.7435186', 'Flat#602, Dhaka District, BD', '2021-08-22 01:37:32', '2021-08-22 01:37:32'),
(1686, 100017, 3, '2021-08-22 01:37:42', '90.409126', '23.7435188', 'Flat#602, Dhaka District, BD', '2021-08-22 01:37:42', '2021-08-22 01:37:42'),
(1687, 100023, 4, '2021-08-22 01:37:51', '90.3455127', '23.7633438', '38, Dhaka District, BD', '2021-08-22 01:37:51', '2021-08-22 01:37:51'),
(1688, 100017, 3, '2021-08-22 01:37:53', '90.4091517', '23.7435185', 'Flat#602, Dhaka District, BD', '2021-08-22 01:37:53', '2021-08-22 01:37:53'),
(1689, 100017, 3, '2021-08-22 01:38:02', '90.4091384', '23.743522', 'Flat#602, Dhaka District, BD', '2021-08-22 01:38:02', '2021-08-22 01:38:02'),
(1690, 100023, 4, '2021-08-22 01:38:05', '90.3455524', '23.7633709', '38, Dhaka District, BD', '2021-08-22 01:38:05', '2021-08-22 01:38:05'),
(1691, 100017, 3, '2021-08-22 01:38:12', '90.4091165', '23.7435196', 'Flat#602, Dhaka District, BD', '2021-08-22 01:38:12', '2021-08-22 01:38:12'),
(1692, 100023, 4, '2021-08-22 01:38:12', '90.3455373', '23.7633686', '38, Dhaka District, BD', '2021-08-22 01:38:12', '2021-08-22 01:38:12'),
(1693, 100017, 3, '2021-08-22 01:38:22', '90.4091295', '23.7435217', 'Flat#602, Dhaka District, BD', '2021-08-22 01:38:22', '2021-08-22 01:38:22'),
(1694, 100023, 4, '2021-08-22 01:38:25', '90.3455307', '23.7633716', '38, Dhaka District, BD', '2021-08-22 01:38:25', '2021-08-22 01:38:25'),
(1695, 100017, 3, '2021-08-22 01:38:32', '90.4091228', '23.7435203', 'Flat#602, Dhaka District, BD', '2021-08-22 01:38:32', '2021-08-22 01:38:32'),
(1696, 100023, 4, '2021-08-22 01:38:35', '90.3454763', '23.7633054', '38, Dhaka District, BD', '2021-08-22 01:38:35', '2021-08-22 01:38:35'),
(1697, 100017, 3, '2021-08-22 01:38:42', '90.4091262', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-22 01:38:42', '2021-08-22 01:38:42'),
(1698, 100023, 4, '2021-08-22 01:38:45', '90.3454952', '23.7633145', '38, Dhaka District, BD', '2021-08-22 01:38:45', '2021-08-22 01:38:45'),
(1699, 100017, 3, '2021-08-22 01:38:52', '90.4091271', '23.743508', 'Flat#602, Dhaka District, BD', '2021-08-22 01:38:52', '2021-08-22 01:38:52'),
(1700, NULL, 4, '2021-08-22 01:38:57', '90.3455116', '23.7633478', '38, Dhaka District, BD', '2021-08-22 01:38:57', '2021-08-22 01:38:57'),
(1701, 100017, 3, '2021-08-22 01:39:02', '90.4091261', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-22 01:39:02', '2021-08-22 01:39:02'),
(1702, NULL, 4, '2021-08-22 01:39:11', '90.3455221', '23.7633548', '38, Dhaka District, BD', '2021-08-22 01:39:11', '2021-08-22 01:39:11'),
(1703, 100017, 3, '2021-08-22 01:39:12', '90.4091174', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-22 01:39:12', '2021-08-22 01:39:12'),
(1704, NULL, 4, '2021-08-22 01:39:22', '90.3455251', '23.763347', '38, Dhaka District, BD', '2021-08-22 01:39:22', '2021-08-22 01:39:22');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1705, 100017, 3, '2021-08-22 01:39:22', '90.4091204', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-22 01:39:22', '2021-08-22 01:39:22'),
(1706, NULL, 4, '2021-08-22 01:39:30', '90.3454865', '23.7633109', '38, Dhaka District, BD', '2021-08-22 01:39:30', '2021-08-22 01:39:30'),
(1707, 100017, 3, '2021-08-22 01:39:32', '90.4091199', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-22 01:39:32', '2021-08-22 01:39:32'),
(1708, NULL, 4, '2021-08-22 01:39:41', '90.3454958', '23.7633363', '38, Dhaka District, BD', '2021-08-22 01:39:41', '2021-08-22 01:39:41'),
(1709, 100017, 3, '2021-08-22 01:39:42', '90.4091171', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-22 01:39:42', '2021-08-22 01:39:42'),
(1710, 100017, 3, '2021-08-22 01:39:52', '90.4091222', '23.7435138', 'Flat#602, Dhaka District, BD', '2021-08-22 01:39:52', '2021-08-22 01:39:52'),
(1711, 100017, 3, '2021-08-22 01:40:02', '90.4091227', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-22 01:40:02', '2021-08-22 01:40:02'),
(1712, NULL, 4, '2021-08-22 01:40:08', '90.3455407', '23.7633647', '38, Dhaka District, BD', '2021-08-22 01:40:08', '2021-08-22 01:40:08'),
(1713, 100017, 3, '2021-08-22 01:40:12', '90.4091322', '23.7435051', 'Flat#602, Dhaka District, BD', '2021-08-22 01:40:12', '2021-08-22 01:40:12'),
(1714, 100023, 4, '2021-08-22 01:40:16', '90.3455277', '23.763349', '38, Dhaka District, BD', '2021-08-22 01:40:16', '2021-08-22 01:40:16'),
(1715, 100017, 3, '2021-08-22 01:40:22', '90.4091239', '23.7435141', 'Flat#602, Dhaka District, BD', '2021-08-22 01:40:22', '2021-08-22 01:40:22'),
(1716, NULL, 4, '2021-08-22 01:40:30', '90.3455228', '23.7633364', '38, Dhaka District, BD', '2021-08-22 01:40:30', '2021-08-22 01:40:30'),
(1717, 100017, 3, '2021-08-22 01:40:32', '90.409122', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-22 01:40:32', '2021-08-22 01:40:32'),
(1718, 100017, 3, '2021-08-22 01:40:42', '90.409129', '23.7435169', 'Flat#602, Dhaka District, BD', '2021-08-22 01:40:42', '2021-08-22 01:40:42'),
(1719, NULL, 4, '2021-08-22 01:40:50', '90.3454839', '23.7633137', '38, Dhaka District, BD', '2021-08-22 01:40:50', '2021-08-22 01:40:50'),
(1720, 100017, 3, '2021-08-22 01:40:52', '90.4091229', '23.7435195', 'Flat#602, Dhaka District, BD', '2021-08-22 01:40:52', '2021-08-22 01:40:52'),
(1721, NULL, 4, '2021-08-22 01:41:00', '90.3454808', '23.7633055', '38, Dhaka District, BD', '2021-08-22 01:41:00', '2021-08-22 01:41:00'),
(1722, 100017, 3, '2021-08-22 01:41:02', '90.4091292', '23.7435178', 'Flat#602, Dhaka District, BD', '2021-08-22 01:41:02', '2021-08-22 01:41:02'),
(1723, 100017, 3, '2021-08-22 01:41:12', '90.4091184', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-22 01:41:12', '2021-08-22 01:41:12'),
(1724, NULL, 4, '2021-08-22 01:41:13', '90.3454663', '23.7633067', '38, Dhaka District, BD', '2021-08-22 01:41:13', '2021-08-22 01:41:13'),
(1725, NULL, 4, '2021-08-22 01:41:21', '90.3454993', '23.7633427', '38, Dhaka District, BD', '2021-08-22 01:41:21', '2021-08-22 01:41:21'),
(1726, 100017, 3, '2021-08-22 01:41:22', '90.4091256', '23.7435222', 'Flat#602, Dhaka District, BD', '2021-08-22 01:41:22', '2021-08-22 01:41:22'),
(1727, 100017, 3, '2021-08-22 01:41:32', '90.4091159', '23.7435173', 'Flat#602, Dhaka District, BD', '2021-08-22 01:41:32', '2021-08-22 01:41:32'),
(1728, NULL, 4, '2021-08-22 01:41:33', '90.3455342', '23.7633691', '38, Dhaka District, BD', '2021-08-22 01:41:33', '2021-08-22 01:41:33'),
(1729, NULL, 4, '2021-08-22 01:41:41', '90.3455376', '23.7633718', '38, Dhaka District, BD', '2021-08-22 01:41:41', '2021-08-22 01:41:41'),
(1730, 100017, 3, '2021-08-22 01:41:41', '90.4091291', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-22 01:41:41', '2021-08-22 01:41:41'),
(1731, 100017, 3, '2021-08-22 01:41:52', '90.4091168', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-22 01:41:52', '2021-08-22 01:41:52'),
(1732, NULL, 4, '2021-08-22 01:41:53', '90.3455367', '23.7633707', '38, Dhaka District, BD', '2021-08-22 01:41:53', '2021-08-22 01:41:53'),
(1733, NULL, 4, '2021-08-22 01:42:01', '90.3455195', '23.7633506', '38, Dhaka District, BD', '2021-08-22 01:42:01', '2021-08-22 01:42:01'),
(1734, 100017, 3, '2021-08-22 01:42:02', '90.409119', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-22 01:42:02', '2021-08-22 01:42:02'),
(1735, 100017, 3, '2021-08-22 01:42:12', '90.4091139', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-22 01:42:12', '2021-08-22 01:42:12'),
(1736, NULL, 4, '2021-08-22 01:42:13', '90.3455413', '23.7633705', '38, Dhaka District, BD', '2021-08-22 01:42:13', '2021-08-22 01:42:13'),
(1737, 100017, 3, '2021-08-22 01:42:22', '90.409121', '23.7435169', 'Flat#602, Dhaka District, BD', '2021-08-22 01:42:22', '2021-08-22 01:42:22'),
(1738, NULL, 4, '2021-08-22 01:42:23', '90.345527', '23.7633637', '38, Dhaka District, BD', '2021-08-22 01:42:23', '2021-08-22 01:42:23'),
(1739, 100017, 3, '2021-08-22 01:42:32', '90.4091079', '23.743513', 'Flat#602, Dhaka District, BD', '2021-08-22 01:42:32', '2021-08-22 01:42:32'),
(1740, NULL, 4, '2021-08-22 01:42:33', '90.3455431', '23.763378', '38, Dhaka District, BD', '2021-08-22 01:42:33', '2021-08-22 01:42:33'),
(1741, 100017, 3, '2021-08-22 01:42:42', '90.4091115', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-22 01:42:42', '2021-08-22 01:42:42'),
(1742, NULL, 4, '2021-08-22 01:42:43', '90.3455424', '23.7633701', '38, Dhaka District, BD', '2021-08-22 01:42:43', '2021-08-22 01:42:43'),
(1743, NULL, 4, '2021-08-22 01:42:51', '90.3455198', '23.7633626', '38, Dhaka District, BD', '2021-08-22 01:42:51', '2021-08-22 01:42:51'),
(1744, 100017, 3, '2021-08-22 01:42:52', '90.4091233', '23.7435146', 'Flat#602, Dhaka District, BD', '2021-08-22 01:42:52', '2021-08-22 01:42:52'),
(1745, 100017, 3, '2021-08-22 01:43:02', '90.4091246', '23.7435175', 'Flat#602, Dhaka District, BD', '2021-08-22 01:43:02', '2021-08-22 01:43:02'),
(1746, NULL, 4, '2021-08-22 01:43:03', '90.3455308', '23.7633707', '38, Dhaka District, BD', '2021-08-22 01:43:03', '2021-08-22 01:43:03'),
(1747, NULL, 4, '2021-08-22 01:43:11', '90.3455202', '23.7633555', '38, Dhaka District, BD', '2021-08-22 01:43:11', '2021-08-22 01:43:11'),
(1748, 100017, 3, '2021-08-22 01:43:12', '90.4091204', '23.7435098', 'Flat#602, Dhaka District, BD', '2021-08-22 01:43:12', '2021-08-22 01:43:12'),
(1749, 100017, 3, '2021-08-22 01:43:22', '90.4091198', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-22 01:43:22', '2021-08-22 01:43:22'),
(1750, NULL, 4, '2021-08-22 01:43:23', '90.3454907', '23.7633093', '38, Dhaka District, BD', '2021-08-22 01:43:23', '2021-08-22 01:43:23'),
(1751, NULL, 4, '2021-08-22 01:43:31', '90.3455125', '23.7633425', '38, Dhaka District, BD', '2021-08-22 01:43:31', '2021-08-22 01:43:31'),
(1752, 100017, 3, '2021-08-22 01:43:32', '90.4091199', '23.7435097', 'Flat#602, Dhaka District, BD', '2021-08-22 01:43:32', '2021-08-22 01:43:32'),
(1753, 100017, 3, '2021-08-22 01:43:42', '90.4091286', '23.7435186', 'Flat#602, Dhaka District, BD', '2021-08-22 01:43:42', '2021-08-22 01:43:42'),
(1754, NULL, 4, '2021-08-22 01:43:43', '90.3455439', '23.7633709', '38, Dhaka District, BD', '2021-08-22 01:43:43', '2021-08-22 01:43:43'),
(1755, 100017, 3, '2021-08-22 01:43:52', '90.409127', '23.7435175', 'Flat#602, Dhaka District, BD', '2021-08-22 01:43:52', '2021-08-22 01:43:52'),
(1756, NULL, 4, '2021-08-22 01:43:53', '90.3455006', '23.7633401', '38, Dhaka District, BD', '2021-08-22 01:43:53', '2021-08-22 01:43:53'),
(1757, NULL, 4, '2021-08-22 01:44:02', '90.3455249', '23.763362', '38, Dhaka District, BD', '2021-08-22 01:44:02', '2021-08-22 01:44:02'),
(1758, 100017, 3, '2021-08-22 01:44:02', '90.4091203', '23.743518', 'Flat#602, Dhaka District, BD', '2021-08-22 01:44:02', '2021-08-22 01:44:02'),
(1759, 100017, 3, '2021-08-22 01:44:12', '90.4091183', '23.7435166', 'Flat#602, Dhaka District, BD', '2021-08-22 01:44:12', '2021-08-22 01:44:12'),
(1760, NULL, 4, '2021-08-22 01:44:13', '90.3454758', '23.763303', '38, Dhaka District, BD', '2021-08-22 01:44:13', '2021-08-22 01:44:13'),
(1761, 100017, 3, '2021-08-22 01:44:22', '90.4091207', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-22 01:44:22', '2021-08-22 01:44:22'),
(1762, NULL, 4, '2021-08-22 01:44:23', '90.3455041', '23.7633228', '38, Dhaka District, BD', '2021-08-22 01:44:23', '2021-08-22 01:44:23'),
(1763, 100017, 3, '2021-08-22 01:44:32', '90.4091218', '23.7435155', 'Flat#602, Dhaka District, BD', '2021-08-22 01:44:32', '2021-08-22 01:44:32'),
(1764, NULL, 4, '2021-08-22 01:44:33', '90.3455293', '23.7633763', '38, Dhaka District, BD', '2021-08-22 01:44:33', '2021-08-22 01:44:33'),
(1765, NULL, 4, '2021-08-22 01:44:43', '90.3454865', '23.7633268', '38, Dhaka District, BD', '2021-08-22 01:44:43', '2021-08-22 01:44:43'),
(1766, 100017, 3, '2021-08-22 01:44:43', '90.4091114', '23.7435075', 'Flat#602, Dhaka District, BD', '2021-08-22 01:44:43', '2021-08-22 01:44:43'),
(1767, NULL, 4, '2021-08-22 01:44:51', '90.3454769', '23.7633017', '38, Dhaka District, BD', '2021-08-22 01:44:51', '2021-08-22 01:44:51'),
(1768, 100017, 3, '2021-08-22 01:44:52', '90.4091163', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-22 01:44:52', '2021-08-22 01:44:52'),
(1769, 100017, 3, '2021-08-22 01:45:02', '90.4091155', '23.7435174', 'Flat#602, Dhaka District, BD', '2021-08-22 01:45:02', '2021-08-22 01:45:02'),
(1770, NULL, 4, '2021-08-22 01:45:03', '90.3455237', '23.7633623', '38, Dhaka District, BD', '2021-08-22 01:45:03', '2021-08-22 01:45:03'),
(1771, 100017, 3, '2021-08-22 01:45:12', '90.4091237', '23.7435122', 'Flat#602, Dhaka District, BD', '2021-08-22 01:45:12', '2021-08-22 01:45:12'),
(1772, NULL, 4, '2021-08-22 01:45:13', '90.3455483', '23.7633618', '38, Dhaka District, BD', '2021-08-22 01:45:13', '2021-08-22 01:45:13'),
(1773, 100017, 3, '2021-08-22 01:45:22', '90.4091097', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-22 01:45:22', '2021-08-22 01:45:22'),
(1774, NULL, 4, '2021-08-22 01:45:23', '90.3455466', '23.763358', '38, Dhaka District, BD', '2021-08-22 01:45:23', '2021-08-22 01:45:23'),
(1775, 100017, 3, '2021-08-22 01:45:32', '90.4091188', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-22 01:45:32', '2021-08-22 01:45:32'),
(1776, NULL, 4, '2021-08-22 01:45:33', '90.345504', '23.7633221', '38, Dhaka District, BD', '2021-08-22 01:45:33', '2021-08-22 01:45:33'),
(1777, 100017, 3, '2021-08-22 01:45:42', '90.4091182', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-22 01:45:42', '2021-08-22 01:45:42'),
(1778, NULL, 4, '2021-08-22 01:45:43', '90.3454886', '23.7633013', '38, Dhaka District, BD', '2021-08-22 01:45:43', '2021-08-22 01:45:43'),
(1779, 100017, 3, '2021-08-22 01:45:52', '90.4091175', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-22 01:45:52', '2021-08-22 01:45:52'),
(1780, NULL, 4, '2021-08-22 01:45:53', '90.3454771', '23.7633026', '38, Dhaka District, BD', '2021-08-22 01:45:53', '2021-08-22 01:45:53'),
(1781, 100017, 3, '2021-08-22 01:46:02', '90.4091164', '23.7435145', 'Flat#602, Dhaka District, BD', '2021-08-22 01:46:02', '2021-08-22 01:46:02'),
(1782, NULL, 4, '2021-08-22 01:46:03', '90.3454703', '23.7632969', '38, Dhaka District, BD', '2021-08-22 01:46:03', '2021-08-22 01:46:03'),
(1783, 100017, 3, '2021-08-22 01:46:12', '90.4091198', '23.7435134', 'Flat#602, Dhaka District, BD', '2021-08-22 01:46:12', '2021-08-22 01:46:12'),
(1784, NULL, 4, '2021-08-22 01:46:13', '90.3455037', '23.763312', '38, Dhaka District, BD', '2021-08-22 01:46:13', '2021-08-22 01:46:13'),
(1785, NULL, 4, '2021-08-22 01:46:21', '90.3455145', '23.7633175', '38, Dhaka District, BD', '2021-08-22 01:46:21', '2021-08-22 01:46:21'),
(1786, 100017, 3, '2021-08-22 01:46:22', '90.4091162', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-22 01:46:22', '2021-08-22 01:46:22'),
(1787, 100017, 3, '2021-08-22 01:46:32', '90.4091178', '23.7435126', 'Flat#602, Dhaka District, BD', '2021-08-22 01:46:32', '2021-08-22 01:46:32'),
(1788, NULL, 4, '2021-08-22 01:46:33', '90.3455086', '23.7633387', '38, Dhaka District, BD', '2021-08-22 01:46:33', '2021-08-22 01:46:33'),
(1789, 100017, 3, '2021-08-22 01:46:42', '90.4091031', '23.7435086', 'Flat#602, Dhaka District, BD', '2021-08-22 01:46:42', '2021-08-22 01:46:42'),
(1790, NULL, 4, '2021-08-22 01:46:43', '90.345489', '23.7633135', '38, Dhaka District, BD', '2021-08-22 01:46:43', '2021-08-22 01:46:43'),
(1791, 100017, 3, '2021-08-22 01:46:52', '90.4091242', '23.7435092', 'Flat#602, Dhaka District, BD', '2021-08-22 01:46:52', '2021-08-22 01:46:52'),
(1792, NULL, 4, '2021-08-22 01:46:53', '90.3455117', '23.7633226', '38, Dhaka District, BD', '2021-08-22 01:46:53', '2021-08-22 01:46:53'),
(1793, NULL, 4, '2021-08-22 01:47:01', '90.3455008', '23.7633027', '38, Dhaka District, BD', '2021-08-22 01:47:01', '2021-08-22 01:47:01'),
(1794, 100017, 3, '2021-08-22 01:47:02', '90.4091205', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-22 01:47:02', '2021-08-22 01:47:02'),
(1795, 100017, 3, '2021-08-22 01:47:12', '90.4091186', '23.743511', 'Flat#602, Dhaka District, BD', '2021-08-22 01:47:12', '2021-08-22 01:47:12'),
(1796, NULL, 4, '2021-08-22 01:47:13', '90.3454668', '23.763297', '38, Dhaka District, BD', '2021-08-22 01:47:13', '2021-08-22 01:47:13'),
(1797, NULL, 4, '2021-08-22 01:47:21', '90.3455197', '23.7633503', '38, Dhaka District, BD', '2021-08-22 01:47:21', '2021-08-22 01:47:21'),
(1798, 100017, 3, '2021-08-22 01:47:22', '90.4091211', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-22 01:47:22', '2021-08-22 01:47:22'),
(1799, 100017, 3, '2021-08-22 01:47:32', '90.4091198', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-22 01:47:32', '2021-08-22 01:47:32'),
(1800, NULL, 4, '2021-08-22 01:47:33', '90.3455032', '23.7633431', '38, Dhaka District, BD', '2021-08-22 01:47:33', '2021-08-22 01:47:33'),
(1801, 100017, 3, '2021-08-22 01:47:42', '90.4091181', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-22 01:47:42', '2021-08-22 01:47:42'),
(1802, NULL, 4, '2021-08-22 01:47:43', '90.3455015', '23.7633397', '38, Dhaka District, BD', '2021-08-22 01:47:43', '2021-08-22 01:47:43'),
(1803, 100017, 3, '2021-08-22 01:47:52', '90.4091205', '23.743516', 'Flat#602, Dhaka District, BD', '2021-08-22 01:47:52', '2021-08-22 01:47:52'),
(1804, NULL, 4, '2021-08-22 01:47:54', '90.3454703', '23.7632959', '38, Dhaka District, BD', '2021-08-22 01:47:54', '2021-08-22 01:47:54'),
(1805, NULL, 4, '2021-08-22 01:48:01', '90.3454155', '23.7632433', '38, Dhaka District, BD', '2021-08-22 01:48:01', '2021-08-22 01:48:01'),
(1806, 100017, 3, '2021-08-22 01:48:02', '90.4091227', '23.7435167', 'Flat#602, Dhaka District, BD', '2021-08-22 01:48:02', '2021-08-22 01:48:02'),
(1807, 100017, 3, '2021-08-22 01:48:13', '90.409123', '23.7435168', 'Flat#602, Dhaka District, BD', '2021-08-22 01:48:13', '2021-08-22 01:48:13'),
(1808, NULL, 4, '2021-08-22 01:48:13', '90.3455149', '23.763356', '38, Dhaka District, BD', '2021-08-22 01:48:13', '2021-08-22 01:48:13'),
(1809, 100017, 3, '2021-08-22 01:48:22', '90.4091156', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-22 01:48:22', '2021-08-22 01:48:22'),
(1810, NULL, 4, '2021-08-22 01:48:23', '90.3453945', '23.7632717', '38, Dhaka District, BD', '2021-08-22 01:48:23', '2021-08-22 01:48:23'),
(1811, 100017, 3, '2021-08-22 01:48:32', '90.409122', '23.7435147', 'Flat#602, Dhaka District, BD', '2021-08-22 01:48:32', '2021-08-22 01:48:32'),
(1812, NULL, 4, '2021-08-22 01:48:33', '90.3454637', '23.7633084', '38, Dhaka District, BD', '2021-08-22 01:48:33', '2021-08-22 01:48:33'),
(1813, 100017, 3, '2021-08-22 01:48:43', '90.4091154', '23.7435157', 'Flat#602, Dhaka District, BD', '2021-08-22 01:48:43', '2021-08-22 01:48:43'),
(1814, NULL, 4, '2021-08-22 01:48:43', '90.3454893', '23.7633157', '38, Dhaka District, BD', '2021-08-22 01:48:43', '2021-08-22 01:48:43'),
(1815, 100017, 3, '2021-08-22 01:48:52', '90.409116', '23.7435131', 'Flat#602, Dhaka District, BD', '2021-08-22 01:48:52', '2021-08-22 01:48:52'),
(1816, NULL, 4, '2021-08-22 01:48:53', '90.3455021', '23.7633364', '38, Dhaka District, BD', '2021-08-22 01:48:53', '2021-08-22 01:48:53'),
(1817, 100017, 3, '2021-08-22 01:49:02', '90.4091224', '23.7435152', 'Flat#602, Dhaka District, BD', '2021-08-22 01:49:02', '2021-08-22 01:49:02'),
(1818, NULL, 4, '2021-08-22 01:49:03', '90.3454781', '23.7633092', '38, Dhaka District, BD', '2021-08-22 01:49:03', '2021-08-22 01:49:03'),
(1819, 100017, 3, '2021-08-22 01:49:12', '90.4091184', '23.7435105', 'Flat#602, Dhaka District, BD', '2021-08-22 01:49:12', '2021-08-22 01:49:12'),
(1820, NULL, 4, '2021-08-22 01:49:13', '90.3454544', '23.7633131', '38, Dhaka District, BD', '2021-08-22 01:49:13', '2021-08-22 01:49:13'),
(1821, 100017, 3, '2021-08-22 01:49:22', '90.4091179', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-22 01:49:22', '2021-08-22 01:49:22'),
(1822, NULL, 4, '2021-08-22 01:49:23', '90.3454976', '23.7633212', '38, Dhaka District, BD', '2021-08-22 01:49:23', '2021-08-22 01:49:23'),
(1823, 100017, 3, '2021-08-22 01:49:32', '90.4091149', '23.7435125', 'Flat#602, Dhaka District, BD', '2021-08-22 01:49:32', '2021-08-22 01:49:32'),
(1824, NULL, 4, '2021-08-22 01:49:33', '90.3454982', '23.7633193', '38, Dhaka District, BD', '2021-08-22 01:49:33', '2021-08-22 01:49:33'),
(1825, 100017, 3, '2021-08-22 01:49:42', '90.4091187', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-22 01:49:42', '2021-08-22 01:49:42'),
(1826, NULL, 4, '2021-08-22 01:49:43', '90.3454992', '23.7633198', '38, Dhaka District, BD', '2021-08-22 01:49:43', '2021-08-22 01:49:43'),
(1827, 100017, 3, '2021-08-22 01:49:52', '90.4091143', '23.7435116', 'Flat#602, Dhaka District, BD', '2021-08-22 01:49:52', '2021-08-22 01:49:52'),
(1828, NULL, 4, '2021-08-22 01:49:53', '90.3453461', '23.7632701', '38, Dhaka District, BD', '2021-08-22 01:49:53', '2021-08-22 01:49:53'),
(1829, 100017, 3, '2021-08-22 01:50:02', '90.4091028', '23.7435096', 'Flat#602, Dhaka District, BD', '2021-08-22 01:50:02', '2021-08-22 01:50:02'),
(1830, NULL, 4, '2021-08-22 01:50:03', '90.3454284', '23.7632736', '38, Dhaka District, BD', '2021-08-22 01:50:03', '2021-08-22 01:50:03'),
(1831, 100017, 3, '2021-08-22 01:50:12', '90.4091186', '23.7435099', 'Flat#602, Dhaka District, BD', '2021-08-22 01:50:12', '2021-08-22 01:50:12'),
(1832, NULL, 4, '2021-08-22 01:50:13', '90.3453672', '23.7632347', '38, Dhaka District, BD', '2021-08-22 01:50:13', '2021-08-22 01:50:13'),
(1833, 100017, 3, '2021-08-22 01:50:23', '90.4091183', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-22 01:50:23', '2021-08-22 01:50:23'),
(1834, NULL, 4, '2021-08-22 01:50:23', '90.345512', '23.7633623', '38, Dhaka District, BD', '2021-08-22 01:50:23', '2021-08-22 01:50:23'),
(1835, 100017, 3, '2021-08-22 01:50:32', '90.4091211', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-22 01:50:32', '2021-08-22 01:50:32'),
(1836, NULL, 4, '2021-08-22 01:50:33', '90.345471', '23.7632994', '38, Dhaka District, BD', '2021-08-22 01:50:33', '2021-08-22 01:50:33'),
(1837, 100017, 3, '2021-08-22 01:50:42', '90.4091207', '23.7435173', 'Flat#602, Dhaka District, BD', '2021-08-22 01:50:42', '2021-08-22 01:50:42'),
(1838, NULL, 4, '2021-08-22 01:50:43', '90.3454727', '23.7632916', '38, Dhaka District, BD', '2021-08-22 01:50:43', '2021-08-22 01:50:43'),
(1839, 100017, 3, '2021-08-22 01:50:52', '90.4091194', '23.7435168', 'Flat#602, Dhaka District, BD', '2021-08-22 01:50:52', '2021-08-22 01:50:52'),
(1840, NULL, 4, '2021-08-22 01:50:53', '90.3454344', '23.7632749', '38, Dhaka District, BD', '2021-08-22 01:50:53', '2021-08-22 01:50:53'),
(1841, 100017, 3, '2021-08-22 01:51:02', '90.4091157', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-22 01:51:02', '2021-08-22 01:51:02'),
(1842, NULL, 4, '2021-08-22 01:51:03', '90.3454702', '23.7633049', '38, Dhaka District, BD', '2021-08-22 01:51:03', '2021-08-22 01:51:03'),
(1843, 100017, 3, '2021-08-22 01:51:12', '90.4091034', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-22 01:51:12', '2021-08-22 01:51:12'),
(1844, NULL, 4, '2021-08-22 01:51:13', '90.3454465', '23.7632722', '38, Dhaka District, BD', '2021-08-22 01:51:13', '2021-08-22 01:51:13'),
(1845, 100017, 3, '2021-08-22 01:51:22', '90.409117', '23.7435153', 'Flat#602, Dhaka District, BD', '2021-08-22 01:51:22', '2021-08-22 01:51:22'),
(1846, NULL, 4, '2021-08-22 01:51:23', '90.3454815', '23.7632998', '38, Dhaka District, BD', '2021-08-22 01:51:23', '2021-08-22 01:51:23'),
(1847, NULL, 4, '2021-08-22 01:51:31', '90.3453843', '23.7632343', '38, Dhaka District, BD', '2021-08-22 01:51:31', '2021-08-22 01:51:31'),
(1848, 100017, 3, '2021-08-22 01:51:32', '90.4091011', '23.7435076', 'Flat#602, Dhaka District, BD', '2021-08-22 01:51:32', '2021-08-22 01:51:32'),
(1849, 100017, 3, '2021-08-22 01:51:42', '90.4091192', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-22 01:51:42', '2021-08-22 01:51:42'),
(1850, NULL, 4, '2021-08-22 01:51:43', '90.3454584', '23.7632955', '38, Dhaka District, BD', '2021-08-22 01:51:43', '2021-08-22 01:51:43'),
(1851, 100017, 3, '2021-08-22 01:51:52', '90.4091069', '23.7435143', 'Flat#602, Dhaka District, BD', '2021-08-22 01:51:52', '2021-08-22 01:51:52'),
(1852, NULL, 4, '2021-08-22 01:51:53', '90.3454898', '23.7633184', '38, Dhaka District, BD', '2021-08-22 01:51:53', '2021-08-22 01:51:53'),
(1853, 100017, 3, '2021-08-22 01:52:02', '90.4091193', '23.7435154', 'Flat#602, Dhaka District, BD', '2021-08-22 01:52:02', '2021-08-22 01:52:02'),
(1854, NULL, 4, '2021-08-22 01:52:03', '90.3454896', '23.7633138', '38, Dhaka District, BD', '2021-08-22 01:52:03', '2021-08-22 01:52:03'),
(1855, 100017, 3, '2021-08-22 01:52:12', '90.4091222', '23.7435169', 'Flat#602, Dhaka District, BD', '2021-08-22 01:52:12', '2021-08-22 01:52:12'),
(1856, NULL, 4, '2021-08-22 01:52:13', '90.3455445', '23.7633642', '38, Dhaka District, BD', '2021-08-22 01:52:13', '2021-08-22 01:52:13'),
(1857, 100017, 3, '2021-08-22 01:52:22', '90.4091228', '23.7435159', 'Flat#602, Dhaka District, BD', '2021-08-22 01:52:22', '2021-08-22 01:52:22'),
(1858, NULL, 4, '2021-08-22 01:52:23', '90.3453534', '23.7632188', '38, Dhaka District, BD', '2021-08-22 01:52:23', '2021-08-22 01:52:23'),
(1859, 100017, 3, '2021-08-22 01:52:32', '90.4091236', '23.743515', 'Flat#602, Dhaka District, BD', '2021-08-22 01:52:32', '2021-08-22 01:52:32'),
(1860, NULL, 4, '2021-08-22 01:52:33', '90.3453822', '23.7632287', '38, Dhaka District, BD', '2021-08-22 01:52:33', '2021-08-22 01:52:33'),
(1861, NULL, 4, '2021-08-22 01:52:41', '90.3454201', '23.7632648', '38, Dhaka District, BD', '2021-08-22 01:52:41', '2021-08-22 01:52:41'),
(1862, 100017, 3, '2021-08-22 01:52:42', '90.4091226', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-22 01:52:42', '2021-08-22 01:52:42'),
(1863, 100017, 3, '2021-08-22 01:52:52', '90.4091253', '23.7435162', 'Flat#602, Dhaka District, BD', '2021-08-22 01:52:52', '2021-08-22 01:52:52'),
(1864, NULL, 4, '2021-08-22 01:52:53', '90.3454807', '23.7633114', '38, Dhaka District, BD', '2021-08-22 01:52:53', '2021-08-22 01:52:53'),
(1865, 100017, 3, '2021-08-22 01:53:02', '90.4091233', '23.7435161', 'Flat#602, Dhaka District, BD', '2021-08-22 01:53:02', '2021-08-22 01:53:02'),
(1866, NULL, 4, '2021-08-22 01:53:03', '90.3454787', '23.7633155', '38, Dhaka District, BD', '2021-08-22 01:53:03', '2021-08-22 01:53:03'),
(1867, 100017, 3, '2021-08-22 01:53:12', '90.4091194', '23.7435118', 'Flat#602, Dhaka District, BD', '2021-08-22 01:53:12', '2021-08-22 01:53:12'),
(1868, NULL, 4, '2021-08-22 01:53:13', '90.3455105', '23.7633523', '38, Dhaka District, BD', '2021-08-22 01:53:13', '2021-08-22 01:53:13'),
(1869, 100017, 3, '2021-08-22 01:53:22', '90.4091237', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-22 01:53:22', '2021-08-22 01:53:22'),
(1870, NULL, 4, '2021-08-22 01:53:23', '90.3455014', '23.763324', '38, Dhaka District, BD', '2021-08-22 01:53:23', '2021-08-22 01:53:23'),
(1871, 100017, 3, '2021-08-22 01:53:32', '90.4091183', '23.7435132', 'Flat#602, Dhaka District, BD', '2021-08-22 01:53:32', '2021-08-22 01:53:32'),
(1872, NULL, 4, '2021-08-22 01:53:33', '90.3455247', '23.7633579', '38, Dhaka District, BD', '2021-08-22 01:53:33', '2021-08-22 01:53:33'),
(1873, 100017, 3, '2021-08-22 01:53:42', '90.4091219', '23.7435156', 'Flat#602, Dhaka District, BD', '2021-08-22 01:53:42', '2021-08-22 01:53:42'),
(1874, NULL, 4, '2021-08-22 01:53:43', '90.3455182', '23.7633539', '38, Dhaka District, BD', '2021-08-22 01:53:43', '2021-08-22 01:53:43'),
(1875, 100017, 3, '2021-08-22 01:53:52', '90.4091201', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-22 01:53:52', '2021-08-22 01:53:52'),
(1876, NULL, 4, '2021-08-22 01:53:53', '90.3455279', '23.7633619', '38, Dhaka District, BD', '2021-08-22 01:53:53', '2021-08-22 01:53:53'),
(1877, 100017, 3, '2021-08-22 01:54:02', '90.4091231', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-22 01:54:02', '2021-08-22 01:54:02'),
(1878, NULL, 4, '2021-08-22 01:54:03', '90.3454902', '23.7633138', '38, Dhaka District, BD', '2021-08-22 01:54:03', '2021-08-22 01:54:03'),
(1879, 100017, 3, '2021-08-22 01:54:12', '90.4091247', '23.7435127', 'Flat#602, Dhaka District, BD', '2021-08-22 01:54:12', '2021-08-22 01:54:12'),
(1880, NULL, 4, '2021-08-22 01:54:13', '90.3454313', '23.7632552', '38, Dhaka District, BD', '2021-08-22 01:54:13', '2021-08-22 01:54:13'),
(1881, 100017, 3, '2021-08-22 01:54:22', '90.4091229', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-22 01:54:22', '2021-08-22 01:54:22'),
(1882, NULL, 4, '2021-08-22 01:54:23', '90.3454813', '23.7633059', '38, Dhaka District, BD', '2021-08-22 01:54:23', '2021-08-22 01:54:23'),
(1883, 100017, 3, '2021-08-22 01:54:32', '90.4091187', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-22 01:54:32', '2021-08-22 01:54:32'),
(1884, NULL, 4, '2021-08-22 01:54:33', '90.3454739', '23.7633135', '38, Dhaka District, BD', '2021-08-22 01:54:33', '2021-08-22 01:54:33'),
(1885, 100017, 3, '2021-08-22 01:54:42', '90.4091197', '23.7435121', 'Flat#602, Dhaka District, BD', '2021-08-22 01:54:42', '2021-08-22 01:54:42'),
(1886, NULL, 4, '2021-08-22 01:54:43', '90.3454768', '23.7633111', '38, Dhaka District, BD', '2021-08-22 01:54:43', '2021-08-22 01:54:43'),
(1887, 100017, 3, '2021-08-22 01:54:52', '90.4091235', '23.7435139', 'Flat#602, Dhaka District, BD', '2021-08-22 01:54:52', '2021-08-22 01:54:52'),
(1888, NULL, 4, '2021-08-22 01:54:53', '90.3454921', '23.7633353', '38, Dhaka District, BD', '2021-08-22 01:54:53', '2021-08-22 01:54:53'),
(1889, 100017, 3, '2021-08-22 01:55:02', '90.4091231', '23.7435153', 'Flat#602, Dhaka District, BD', '2021-08-22 01:55:02', '2021-08-22 01:55:02'),
(1890, NULL, 4, '2021-08-22 01:55:03', '90.3454858', '23.7633242', '38, Dhaka District, BD', '2021-08-22 01:55:03', '2021-08-22 01:55:03'),
(1891, 100017, 3, '2021-08-22 01:55:12', '90.4091208', '23.7435129', 'Flat#602, Dhaka District, BD', '2021-08-22 01:55:12', '2021-08-22 01:55:12'),
(1892, NULL, 4, '2021-08-22 01:55:13', '90.3453942', '23.7632518', '38, Dhaka District, BD', '2021-08-22 01:55:13', '2021-08-22 01:55:13'),
(1893, 100017, 3, '2021-08-22 01:55:22', '90.4091259', '23.7435183', 'Flat#602, Dhaka District, BD', '2021-08-22 01:55:22', '2021-08-22 01:55:22'),
(1894, NULL, 4, '2021-08-22 01:55:23', '90.3454477', '23.7632824', '38, Dhaka District, BD', '2021-08-22 01:55:23', '2021-08-22 01:55:23'),
(1895, 100017, 3, '2021-08-22 01:55:32', '90.4091215', '23.7435136', 'Flat#602, Dhaka District, BD', '2021-08-22 01:55:32', '2021-08-22 01:55:32'),
(1896, NULL, 4, '2021-08-22 01:55:33', '90.3454641', '23.763321', '38, Dhaka District, BD', '2021-08-22 01:55:33', '2021-08-22 01:55:33'),
(1897, 100017, 3, '2021-08-22 01:55:42', '90.4091132', '23.7435135', 'Flat#602, Dhaka District, BD', '2021-08-22 01:55:42', '2021-08-22 01:55:42'),
(1898, NULL, 4, '2021-08-22 01:55:43', '90.3454559', '23.7633091', '38, Dhaka District, BD', '2021-08-22 01:55:43', '2021-08-22 01:55:43'),
(1899, 100017, 3, '2021-08-22 01:55:52', '90.4091221', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-22 01:55:52', '2021-08-22 01:55:52'),
(1900, NULL, 4, '2021-08-22 01:55:53', '90.345469', '23.763299', '38, Dhaka District, BD', '2021-08-22 01:55:53', '2021-08-22 01:55:53'),
(1901, 100017, 3, '2021-08-22 01:56:02', '90.4091232', '23.7435133', 'Flat#602, Dhaka District, BD', '2021-08-22 01:56:02', '2021-08-22 01:56:02'),
(1902, NULL, 4, '2021-08-22 01:56:03', '90.3454604', '23.7632853', '38, Dhaka District, BD', '2021-08-22 01:56:03', '2021-08-22 01:56:03'),
(1903, 100017, 3, '2021-08-22 01:56:12', '90.4091232', '23.7435178', 'Flat#602, Dhaka District, BD', '2021-08-22 01:56:12', '2021-08-22 01:56:12'),
(1904, NULL, 4, '2021-08-22 01:56:13', '90.3454564', '23.763272', '38, Dhaka District, BD', '2021-08-22 01:56:13', '2021-08-22 01:56:13'),
(1905, 100017, 3, '2021-08-22 01:56:22', '90.409115', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-22 01:56:22', '2021-08-22 01:56:22'),
(1906, NULL, 4, '2021-08-22 01:56:23', '90.3454291', '23.763248', '38, Dhaka District, BD', '2021-08-22 01:56:23', '2021-08-22 01:56:23'),
(1907, 100017, 3, '2021-08-22 01:56:32', '90.409119', '23.7435103', 'Flat#602, Dhaka District, BD', '2021-08-22 01:56:32', '2021-08-22 01:56:32'),
(1908, NULL, 4, '2021-08-22 01:56:33', '90.3454721', '23.7633085', '38, Dhaka District, BD', '2021-08-22 01:56:33', '2021-08-22 01:56:33'),
(1909, 100017, 3, '2021-08-22 01:56:42', '90.4091257', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-22 01:56:42', '2021-08-22 01:56:42'),
(1910, NULL, 4, '2021-08-22 01:56:43', '90.3454796', '23.7633403', '38, Dhaka District, BD', '2021-08-22 01:56:43', '2021-08-22 01:56:43'),
(1911, 100017, 3, '2021-08-22 01:56:52', '90.4091295', '23.7435172', 'Flat#602, Dhaka District, BD', '2021-08-22 01:56:52', '2021-08-22 01:56:52'),
(1912, NULL, 4, '2021-08-22 01:56:53', '90.3454708', '23.7633009', '38, Dhaka District, BD', '2021-08-22 01:56:53', '2021-08-22 01:56:53'),
(1913, 100017, 3, '2021-08-22 01:57:02', '90.4091219', '23.7435107', 'Flat#602, Dhaka District, BD', '2021-08-22 01:57:02', '2021-08-22 01:57:02'),
(1914, NULL, 4, '2021-08-22 01:57:03', '90.3454807', '23.7633003', '38, Dhaka District, BD', '2021-08-22 01:57:03', '2021-08-22 01:57:03'),
(1915, 100017, 3, '2021-08-22 01:57:12', '90.4091217', '23.7435108', 'Flat#602, Dhaka District, BD', '2021-08-22 01:57:12', '2021-08-22 01:57:12'),
(1916, NULL, 4, '2021-08-22 01:57:13', '90.3454827', '23.7633143', '38, Dhaka District, BD', '2021-08-22 01:57:13', '2021-08-22 01:57:13'),
(1917, 100017, 3, '2021-08-22 01:57:22', '90.4091231', '23.7435142', 'Flat#602, Dhaka District, BD', '2021-08-22 01:57:22', '2021-08-22 01:57:22'),
(1918, NULL, 4, '2021-08-22 01:57:23', '90.3454698', '23.7633', '38, Dhaka District, BD', '2021-08-22 01:57:23', '2021-08-22 01:57:23'),
(1919, 100017, 3, '2021-08-22 01:57:32', '90.4091148', '23.7435106', 'Flat#602, Dhaka District, BD', '2021-08-22 01:57:32', '2021-08-22 01:57:32'),
(1920, NULL, 4, '2021-08-22 01:57:33', '90.3454796', '23.763307', '38, Dhaka District, BD', '2021-08-22 01:57:33', '2021-08-22 01:57:33'),
(1921, 100017, 3, '2021-08-22 01:57:42', '90.4091309', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-22 01:57:42', '2021-08-22 01:57:42'),
(1922, NULL, 4, '2021-08-22 01:57:43', '90.345485', '23.7633066', '38, Dhaka District, BD', '2021-08-22 01:57:43', '2021-08-22 01:57:43'),
(1923, 100017, 3, '2021-08-22 01:57:52', '90.4091264', '23.7435144', 'Flat#602, Dhaka District, BD', '2021-08-22 01:57:52', '2021-08-22 01:57:52'),
(1924, NULL, 4, '2021-08-22 01:57:53', '90.345483', '23.7633055', '38, Dhaka District, BD', '2021-08-22 01:57:53', '2021-08-22 01:57:53'),
(1925, NULL, 4, '2021-08-22 01:58:01', '90.3454749', '23.7633003', '38, Dhaka District, BD', '2021-08-22 01:58:01', '2021-08-22 01:58:01'),
(1926, 100017, 3, '2021-08-22 01:58:02', '90.409124', '23.7435171', 'Flat#602, Dhaka District, BD', '2021-08-22 01:58:02', '2021-08-22 01:58:02'),
(1927, 100017, 3, '2021-08-22 01:58:12', '90.4091176', '23.743514', 'Flat#602, Dhaka District, BD', '2021-08-22 01:58:12', '2021-08-22 01:58:12'),
(1928, NULL, 4, '2021-08-22 01:58:13', '90.3454884', '23.763316', '38, Dhaka District, BD', '2021-08-22 01:58:13', '2021-08-22 01:58:13'),
(1929, 100017, 3, '2021-08-22 01:58:22', '90.4091174', '23.7435095', 'Flat#602, Dhaka District, BD', '2021-08-22 01:58:22', '2021-08-22 01:58:22'),
(1930, NULL, 4, '2021-08-22 01:58:23', '90.3455445', '23.7633669', '38, Dhaka District, BD', '2021-08-22 01:58:23', '2021-08-22 01:58:23'),
(1931, 100017, 3, '2021-08-22 01:58:32', '90.4091054', '23.7435173', 'Flat#602, Dhaka District, BD', '2021-08-22 01:58:32', '2021-08-22 01:58:32'),
(1932, NULL, 4, '2021-08-22 01:58:33', '90.3454889', '23.7633148', '38, Dhaka District, BD', '2021-08-22 01:58:33', '2021-08-22 01:58:33'),
(1933, 100017, 3, '2021-08-22 01:58:42', '90.4091009', '23.7435087', 'Flat#602, Dhaka District, BD', '2021-08-22 01:58:42', '2021-08-22 01:58:42'),
(1934, NULL, 4, '2021-08-22 01:58:43', '90.3454813', '23.7633057', '38, Dhaka District, BD', '2021-08-22 01:58:43', '2021-08-22 01:58:43'),
(1935, 100017, 3, '2021-08-22 01:58:52', '90.4091064', '23.7435109', 'Flat#602, Dhaka District, BD', '2021-08-22 01:58:52', '2021-08-22 01:58:52'),
(1936, NULL, 4, '2021-08-22 01:58:53', '90.345472', '23.763297', '38, Dhaka District, BD', '2021-08-22 01:58:53', '2021-08-22 01:58:53'),
(1937, 100017, 3, '2021-08-22 01:59:02', '90.409116', '23.743521', 'Flat#602, Dhaka District, BD', '2021-08-22 01:59:02', '2021-08-22 01:59:02'),
(1938, NULL, 4, '2021-08-22 01:59:03', '90.3454678', '23.7633016', '38, Dhaka District, BD', '2021-08-22 01:59:03', '2021-08-22 01:59:03'),
(1939, 100017, 3, '2021-08-22 01:59:13', '90.4091102', '23.7435195', 'Flat#602, Dhaka District, BD', '2021-08-22 01:59:13', '2021-08-22 01:59:13'),
(1940, NULL, 4, '2021-08-22 01:59:13', '90.3454691', '23.763301', '38, Dhaka District, BD', '2021-08-22 01:59:13', '2021-08-22 01:59:13'),
(1941, 100017, 3, '2021-08-22 01:59:22', '90.4091158', '23.7435267', 'Flat#602, Dhaka District, BD', '2021-08-22 01:59:22', '2021-08-22 01:59:22'),
(1942, NULL, 4, '2021-08-22 01:59:23', '90.3454769', '23.7633046', '38, Dhaka District, BD', '2021-08-22 01:59:23', '2021-08-22 01:59:23'),
(1943, 100017, 3, '2021-08-22 01:59:32', '90.4090966', '23.7435149', 'Flat#602, Dhaka District, BD', '2021-08-22 01:59:32', '2021-08-22 01:59:32'),
(1944, NULL, 4, '2021-08-22 01:59:33', '90.3454688', '23.7632985', '38, Dhaka District, BD', '2021-08-22 01:59:33', '2021-08-22 01:59:33'),
(1945, 100017, 3, '2021-08-22 01:59:42', '90.4091077', '23.7435124', 'Flat#602, Dhaka District, BD', '2021-08-22 01:59:42', '2021-08-22 01:59:42'),
(1946, NULL, 4, '2021-08-22 01:59:43', '90.3454763', '23.7633038', '38, Dhaka District, BD', '2021-08-22 01:59:43', '2021-08-22 01:59:43'),
(1947, NULL, 4, '2021-08-22 01:59:53', '90.3454941', '23.7633278', '38, Dhaka District, BD', '2021-08-22 01:59:53', '2021-08-22 01:59:53'),
(1948, NULL, 4, '2021-08-22 02:00:03', '90.345478', '23.7633134', '38, Dhaka District, BD', '2021-08-22 02:00:03', '2021-08-22 02:00:03'),
(1949, NULL, 4, '2021-08-22 02:00:13', '90.3454844', '23.7633149', '38, Dhaka District, BD', '2021-08-22 02:00:13', '2021-08-22 02:00:13'),
(1950, NULL, 4, '2021-08-22 02:00:23', '90.3454767', '23.7633212', '38, Dhaka District, BD', '2021-08-22 02:00:23', '2021-08-22 02:00:23'),
(1951, NULL, 4, '2021-08-22 02:00:33', '90.3454207', '23.7633097', '38, Dhaka District, BD', '2021-08-22 02:00:33', '2021-08-22 02:00:33'),
(1952, NULL, 4, '2021-08-22 02:00:43', '90.3455131', '23.7633452', '38, Dhaka District, BD', '2021-08-22 02:00:43', '2021-08-22 02:00:43'),
(1953, NULL, 4, '2021-08-22 02:00:53', '90.345531', '23.763365', '38, Dhaka District, BD', '2021-08-22 02:00:53', '2021-08-22 02:00:53'),
(1954, NULL, 4, '2021-08-22 02:01:03', '90.3455266', '23.7633601', '38, Dhaka District, BD', '2021-08-22 02:01:03', '2021-08-22 02:01:03'),
(1955, NULL, 4, '2021-08-22 02:01:13', '90.3454837', '23.7633233', '38, Dhaka District, BD', '2021-08-22 02:01:13', '2021-08-22 02:01:13'),
(1956, NULL, 4, '2021-08-22 02:01:23', '90.3455327', '23.7633477', '38, Dhaka District, BD', '2021-08-22 02:01:23', '2021-08-22 02:01:23'),
(1957, NULL, 4, '2021-08-22 02:01:33', '90.3455147', '23.7633262', '38, Dhaka District, BD', '2021-08-22 02:01:33', '2021-08-22 02:01:33'),
(1958, NULL, 4, '2021-08-22 02:01:43', '90.3454844', '23.7633121', '38, Dhaka District, BD', '2021-08-22 02:01:43', '2021-08-22 02:01:43'),
(1959, NULL, 4, '2021-08-22 02:01:53', '90.3455332', '23.7633669', '38, Dhaka District, BD', '2021-08-22 02:01:53', '2021-08-22 02:01:53'),
(1960, NULL, 4, '2021-08-22 02:02:03', '90.3453972', '23.7633179', '38, Dhaka District, BD', '2021-08-22 02:02:03', '2021-08-22 02:02:03'),
(1961, NULL, 4, '2021-08-22 02:02:13', '90.3455015', '23.763362', '38, Dhaka District, BD', '2021-08-22 02:02:13', '2021-08-22 02:02:13'),
(1962, NULL, 4, '2021-08-22 02:02:23', '90.3455291', '23.7633765', '38, Dhaka District, BD', '2021-08-22 02:02:23', '2021-08-22 02:02:23'),
(1963, NULL, 4, '2021-08-22 02:02:33', '90.3455374', '23.763374', '38, Dhaka District, BD', '2021-08-22 02:02:33', '2021-08-22 02:02:33'),
(1964, NULL, 4, '2021-08-22 02:02:43', '90.3455378', '23.7633745', '38, Dhaka District, BD', '2021-08-22 02:02:43', '2021-08-22 02:02:43'),
(1965, NULL, 4, '2021-08-22 02:02:53', '90.3455369', '23.7633616', '38, Dhaka District, BD', '2021-08-22 02:02:53', '2021-08-22 02:02:53'),
(1966, NULL, 4, '2021-08-22 02:03:03', '90.3455278', '23.7633701', '38, Dhaka District, BD', '2021-08-22 02:03:03', '2021-08-22 02:03:03'),
(1967, NULL, 4, '2021-08-22 02:03:13', '90.3455446', '23.7633447', '38, Dhaka District, BD', '2021-08-22 02:03:13', '2021-08-22 02:03:13'),
(1968, NULL, 4, '2021-08-22 02:03:23', '90.3455316', '23.7633571', '38, Dhaka District, BD', '2021-08-22 02:03:23', '2021-08-22 02:03:23'),
(1969, NULL, 4, '2021-08-22 02:03:33', '90.3454606', '23.7632869', '38, Dhaka District, BD', '2021-08-22 02:03:33', '2021-08-22 02:03:33'),
(1970, NULL, 4, '2021-08-22 02:03:43', '90.3455215', '23.7633706', '38, Dhaka District, BD', '2021-08-22 02:03:43', '2021-08-22 02:03:43'),
(1971, NULL, 4, '2021-08-22 02:03:53', '90.3455007', '23.763335', '38, Dhaka District, BD', '2021-08-22 02:03:53', '2021-08-22 02:03:53'),
(1972, NULL, 4, '2021-08-22 02:04:03', '90.3454854', '23.763316', '38, Dhaka District, BD', '2021-08-22 02:04:03', '2021-08-22 02:04:03'),
(1973, NULL, 4, '2021-08-22 02:04:13', '90.3455226', '23.763371', '38, Dhaka District, BD', '2021-08-22 02:04:13', '2021-08-22 02:04:13'),
(1974, NULL, 4, '2021-08-22 02:04:23', '90.3455317', '23.7633713', '38, Dhaka District, BD', '2021-08-22 02:04:23', '2021-08-22 02:04:23'),
(1975, NULL, 4, '2021-08-22 02:04:33', '90.3454687', '23.7633242', '38, Dhaka District, BD', '2021-08-22 02:04:33', '2021-08-22 02:04:33'),
(1976, NULL, 4, '2021-08-22 02:04:43', '90.3455154', '23.7633351', '38, Dhaka District, BD', '2021-08-22 02:04:43', '2021-08-22 02:04:43'),
(1977, NULL, 4, '2021-08-22 02:04:53', '90.3454866', '23.7633114', '38, Dhaka District, BD', '2021-08-22 02:04:53', '2021-08-22 02:04:53'),
(1978, NULL, 4, '2021-08-22 02:05:03', '90.345474', '23.7633081', '38, Dhaka District, BD', '2021-08-22 02:05:03', '2021-08-22 02:05:03'),
(1979, NULL, 4, '2021-08-22 02:05:13', '90.3452946', '23.7632874', '38, Dhaka District, BD', '2021-08-22 02:05:13', '2021-08-22 02:05:13'),
(1980, NULL, 4, '2021-08-22 02:05:23', '90.3454546', '23.7633006', '38, Dhaka District, BD', '2021-08-22 02:05:23', '2021-08-22 02:05:23'),
(1981, NULL, 4, '2021-08-22 02:05:33', '90.3455565', '23.7633525', '38, Dhaka District, BD', '2021-08-22 02:05:33', '2021-08-22 02:05:33'),
(1982, NULL, 4, '2021-08-22 02:05:43', '90.3454815', '23.7633046', '38, Dhaka District, BD', '2021-08-22 02:05:43', '2021-08-22 02:05:43'),
(1983, NULL, 4, '2021-08-22 02:05:51', '90.3454767', '23.763315', '38, Dhaka District, BD', '2021-08-22 02:05:51', '2021-08-22 02:05:51'),
(1984, NULL, 4, '2021-08-22 02:06:03', '90.3454739', '23.7633118', '38, Dhaka District, BD', '2021-08-22 02:06:03', '2021-08-22 02:06:03'),
(1985, NULL, 4, '2021-08-22 02:06:13', '90.3455246', '23.7633826', '38, Dhaka District, BD', '2021-08-22 02:06:13', '2021-08-22 02:06:13'),
(1986, NULL, 4, '2021-08-22 02:06:21', '90.3455454', '23.7633756', '38, Dhaka District, BD', '2021-08-22 02:06:21', '2021-08-22 02:06:21'),
(1987, NULL, 4, '2021-08-22 02:06:33', '90.3454668', '23.7632797', '38, Dhaka District, BD', '2021-08-22 02:06:33', '2021-08-22 02:06:33'),
(1988, NULL, 4, '2021-08-22 02:06:43', '90.345541', '23.7633177', '38, Dhaka District, BD', '2021-08-22 02:06:43', '2021-08-22 02:06:43'),
(1989, NULL, 4, '2021-08-22 02:06:53', '90.3455489', '23.7633657', '38, Dhaka District, BD', '2021-08-22 02:06:53', '2021-08-22 02:06:53'),
(1990, NULL, 4, '2021-08-22 02:07:03', '90.34532', '23.7633221', '38, Dhaka District, BD', '2021-08-22 02:07:03', '2021-08-22 02:07:03'),
(1991, NULL, 4, '2021-08-22 02:07:13', '90.3454968', '23.7633642', '38, Dhaka District, BD', '2021-08-22 02:07:13', '2021-08-22 02:07:13'),
(1992, NULL, 4, '2021-08-22 02:07:23', '90.3455303', '23.7633598', '38, Dhaka District, BD', '2021-08-22 02:07:23', '2021-08-22 02:07:23'),
(1993, NULL, 4, '2021-08-22 02:07:33', '90.3454779', '23.763307', '38, Dhaka District, BD', '2021-08-22 02:07:33', '2021-08-22 02:07:33'),
(1994, NULL, 4, '2021-08-22 02:07:43', '90.3454735', '23.7633001', '38, Dhaka District, BD', '2021-08-22 02:07:43', '2021-08-22 02:07:43'),
(1995, NULL, 4, '2021-08-22 02:07:53', '90.3455171', '23.7633582', '38, Dhaka District, BD', '2021-08-22 02:07:53', '2021-08-22 02:07:53'),
(1996, NULL, 4, '2021-08-22 02:08:03', '90.3455381', '23.7633757', '38, Dhaka District, BD', '2021-08-22 02:08:03', '2021-08-22 02:08:03'),
(1997, NULL, 4, '2021-08-22 02:08:13', '90.3455554', '23.7633576', '38, Dhaka District, BD', '2021-08-22 02:08:13', '2021-08-22 02:08:13'),
(1998, NULL, 4, '2021-08-22 02:08:21', '90.3452856', '23.7632903', '38, Dhaka District, BD', '2021-08-22 02:08:21', '2021-08-22 02:08:21'),
(1999, NULL, 4, '2021-08-22 02:08:33', '90.3454666', '23.7633257', '38, Dhaka District, BD', '2021-08-22 02:08:33', '2021-08-22 02:08:33'),
(2000, NULL, 4, '2021-08-22 02:08:43', '90.3454977', '23.7633241', '38, Dhaka District, BD', '2021-08-22 02:08:43', '2021-08-22 02:08:43'),
(2001, NULL, 4, '2021-08-22 02:08:53', '90.3453995', '23.7632537', '38, Dhaka District, BD', '2021-08-22 02:08:53', '2021-08-22 02:08:53'),
(2002, NULL, 4, '2021-08-22 02:09:03', '90.3454306', '23.7632853', '38, Dhaka District, BD', '2021-08-22 02:09:03', '2021-08-22 02:09:03'),
(2003, NULL, 4, '2021-08-22 02:09:13', '90.3454485', '23.763299', '38, Dhaka District, BD', '2021-08-22 02:09:13', '2021-08-22 02:09:13'),
(2004, NULL, 4, '2021-08-22 02:09:23', '90.3454986', '23.7633319', '38, Dhaka District, BD', '2021-08-22 02:09:23', '2021-08-22 02:09:23'),
(2005, NULL, 4, '2021-08-22 02:09:33', '90.3455111', '23.7633499', '38, Dhaka District, BD', '2021-08-22 02:09:33', '2021-08-22 02:09:33'),
(2006, NULL, 4, '2021-08-22 02:09:43', '90.3454629', '23.7633124', '38, Dhaka District, BD', '2021-08-22 02:09:43', '2021-08-22 02:09:43'),
(2007, NULL, 4, '2021-08-22 02:09:53', '90.3454359', '23.7632925', '38, Dhaka District, BD', '2021-08-22 02:09:53', '2021-08-22 02:09:53'),
(2008, NULL, 4, '2021-08-22 02:10:03', '90.3455139', '23.7633602', '38, Dhaka District, BD', '2021-08-22 02:10:03', '2021-08-22 02:10:03'),
(2009, NULL, 4, '2021-08-22 02:10:13', '90.3455215', '23.7633649', '38, Dhaka District, BD', '2021-08-22 02:10:13', '2021-08-22 02:10:13'),
(2010, NULL, 4, '2021-08-22 02:10:23', '90.3454964', '23.7633323', '38, Dhaka District, BD', '2021-08-22 02:10:23', '2021-08-22 02:10:23'),
(2011, NULL, 4, '2021-08-22 02:10:33', '90.3455342', '23.7633483', '38, Dhaka District, BD', '2021-08-22 02:10:33', '2021-08-22 02:10:33'),
(2012, NULL, 4, '2021-08-22 02:10:43', '90.3455198', '23.7633633', '38, Dhaka District, BD', '2021-08-22 02:10:43', '2021-08-22 02:10:43'),
(2013, NULL, 4, '2021-08-22 02:10:52', '90.3455314', '23.7633611', '38, Dhaka District, BD', '2021-08-22 02:10:52', '2021-08-22 02:10:52'),
(2014, NULL, 4, '2021-08-22 02:11:03', '90.3455637', '23.7633331', '38, Dhaka District, BD', '2021-08-22 02:11:03', '2021-08-22 02:11:03'),
(2015, NULL, 4, '2021-08-22 02:11:13', '90.3455345', '23.7633652', '38, Dhaka District, BD', '2021-08-22 02:11:13', '2021-08-22 02:11:13'),
(2016, NULL, 4, '2021-08-22 02:11:23', '90.3454845', '23.763311', '38, Dhaka District, BD', '2021-08-22 02:11:23', '2021-08-22 02:11:23'),
(2017, NULL, 4, '2021-08-22 02:11:33', '90.3454994', '23.7633511', '38, Dhaka District, BD', '2021-08-22 02:11:33', '2021-08-22 02:11:33'),
(2018, NULL, 4, '2021-08-22 02:11:43', '90.3455076', '23.7633501', '38, Dhaka District, BD', '2021-08-22 02:11:43', '2021-08-22 02:11:43'),
(2019, NULL, 4, '2021-08-22 02:11:53', '90.3455204', '23.7633342', '38, Dhaka District, BD', '2021-08-22 02:11:53', '2021-08-22 02:11:53'),
(2020, NULL, 4, '2021-08-22 02:12:03', '90.3454804', '23.7633029', '38, Dhaka District, BD', '2021-08-22 02:12:03', '2021-08-22 02:12:03'),
(2021, NULL, 4, '2021-08-22 02:12:14', '90.3455308', '23.7633489', '38, Dhaka District, BD', '2021-08-22 02:12:14', '2021-08-22 02:12:14'),
(2022, NULL, 4, '2021-08-22 02:12:21', '90.3455005', '23.7633269', '38, Dhaka District, BD', '2021-08-22 02:12:21', '2021-08-22 02:12:21'),
(2023, NULL, 4, '2021-08-22 02:12:33', '90.3454767', '23.763322', '38, Dhaka District, BD', '2021-08-22 02:12:33', '2021-08-22 02:12:33'),
(2024, NULL, 4, '2021-08-22 02:12:43', '90.3454842', '23.7633208', '38, Dhaka District, BD', '2021-08-22 02:12:43', '2021-08-22 02:12:43'),
(2025, NULL, 4, '2021-08-22 02:12:53', '90.3455246', '23.7633576', '38, Dhaka District, BD', '2021-08-22 02:12:53', '2021-08-22 02:12:53'),
(2026, NULL, 4, '2021-08-22 02:13:03', '90.3455245', '23.7633508', '38, Dhaka District, BD', '2021-08-22 02:13:03', '2021-08-22 02:13:03'),
(2027, NULL, 4, '2021-08-22 02:13:13', '90.3455298', '23.7633596', '38, Dhaka District, BD', '2021-08-22 02:13:13', '2021-08-22 02:13:13'),
(2028, NULL, 4, '2021-08-22 02:13:23', '90.3455129', '23.7633516', '38, Dhaka District, BD', '2021-08-22 02:13:23', '2021-08-22 02:13:23'),
(2029, NULL, 4, '2021-08-22 02:13:33', '90.3454183', '23.7632856', '38, Dhaka District, BD', '2021-08-22 02:13:33', '2021-08-22 02:13:33'),
(2030, NULL, 4, '2021-08-22 02:13:43', '90.3454714', '23.7633195', '38, Dhaka District, BD', '2021-08-22 02:13:43', '2021-08-22 02:13:43'),
(2031, NULL, 4, '2021-08-22 02:13:53', '90.3454751', '23.7633186', '38, Dhaka District, BD', '2021-08-22 02:13:53', '2021-08-22 02:13:53'),
(2032, NULL, 4, '2021-08-22 02:14:03', '90.3454934', '23.7633313', '38, Dhaka District, BD', '2021-08-22 02:14:03', '2021-08-22 02:14:03'),
(2033, NULL, 4, '2021-08-22 02:14:13', '90.3455048', '23.7633489', '38, Dhaka District, BD', '2021-08-22 02:14:13', '2021-08-22 02:14:13'),
(2034, NULL, 4, '2021-08-22 02:14:21', '90.3454819', '23.7633267', '38, Dhaka District, BD', '2021-08-22 02:14:21', '2021-08-22 02:14:21'),
(2035, NULL, 4, '2021-08-22 02:14:33', '90.3454388', '23.763279', '38, Dhaka District, BD', '2021-08-22 02:14:33', '2021-08-22 02:14:33'),
(2036, NULL, 4, '2021-08-22 02:14:43', '90.3454073', '23.7632385', '38, Dhaka District, BD', '2021-08-22 02:14:43', '2021-08-22 02:14:43'),
(2037, NULL, 4, '2021-08-22 02:14:53', '90.3454954', '23.7633307', '38, Dhaka District, BD', '2021-08-22 02:14:53', '2021-08-22 02:14:53'),
(2038, NULL, 4, '2021-08-22 02:15:03', '90.3455222', '23.7633732', '38, Dhaka District, BD', '2021-08-22 02:15:03', '2021-08-22 02:15:03'),
(2039, NULL, 4, '2021-08-22 02:15:13', '90.3453197', '23.763201', '38, Dhaka District, BD', '2021-08-22 02:15:13', '2021-08-22 02:15:13'),
(2040, NULL, 4, '2021-08-22 02:15:23', '90.3452283', '23.7632824', '38, Dhaka District, BD', '2021-08-22 02:15:23', '2021-08-22 02:15:23'),
(2041, NULL, 4, '2021-08-22 02:15:33', '90.3454763', '23.7633232', '38, Dhaka District, BD', '2021-08-22 02:15:33', '2021-08-22 02:15:33'),
(2042, NULL, 4, '2021-08-22 02:15:43', '90.3455088', '23.763337', '38, Dhaka District, BD', '2021-08-22 02:15:43', '2021-08-22 02:15:43'),
(2043, NULL, 4, '2021-08-22 02:15:53', '90.3454973', '23.7633259', '38, Dhaka District, BD', '2021-08-22 02:15:53', '2021-08-22 02:15:53'),
(2044, NULL, 4, '2021-08-22 02:16:03', '90.3455081', '23.7633397', '38, Dhaka District, BD', '2021-08-22 02:16:03', '2021-08-22 02:16:03'),
(2045, NULL, 4, '2021-08-22 02:16:13', '90.3455115', '23.7633385', '38, Dhaka District, BD', '2021-08-22 02:16:13', '2021-08-22 02:16:13'),
(2046, NULL, 4, '2021-08-22 02:16:23', '90.3454615', '23.7632968', '38, Dhaka District, BD', '2021-08-22 02:16:23', '2021-08-22 02:16:23'),
(2047, NULL, 4, '2021-08-22 02:16:33', '90.3454882', '23.7633196', '38, Dhaka District, BD', '2021-08-22 02:16:33', '2021-08-22 02:16:33'),
(2048, NULL, 4, '2021-08-22 02:16:43', '90.3454887', '23.7633282', '38, Dhaka District, BD', '2021-08-22 02:16:43', '2021-08-22 02:16:43'),
(2049, NULL, 4, '2021-08-22 02:16:53', '90.3454814', '23.7633091', '38, Dhaka District, BD', '2021-08-22 02:16:53', '2021-08-22 02:16:53'),
(2050, NULL, 4, '2021-08-22 02:17:03', '90.3454579', '23.7633082', '38, Dhaka District, BD', '2021-08-22 02:17:03', '2021-08-22 02:17:03'),
(2051, NULL, 4, '2021-08-22 02:17:13', '90.3454731', '23.7633302', '38, Dhaka District, BD', '2021-08-22 02:17:13', '2021-08-22 02:17:13'),
(2052, NULL, 4, '2021-08-22 02:17:23', '90.3455122', '23.7633529', '38, Dhaka District, BD', '2021-08-22 02:17:23', '2021-08-22 02:17:23'),
(2053, NULL, 4, '2021-08-22 02:17:33', '90.3455327', '23.7633555', '38, Dhaka District, BD', '2021-08-22 02:17:33', '2021-08-22 02:17:33'),
(2054, NULL, 4, '2021-08-22 02:17:43', '90.3455281', '23.7633559', '38, Dhaka District, BD', '2021-08-22 02:17:43', '2021-08-22 02:17:43'),
(2055, NULL, 4, '2021-08-22 02:17:53', '90.3454951', '23.7633347', '38, Dhaka District, BD', '2021-08-22 02:17:53', '2021-08-22 02:17:53'),
(2056, NULL, 4, '2021-08-22 02:18:03', '90.3455215', '23.7633665', '38, Dhaka District, BD', '2021-08-22 02:18:03', '2021-08-22 02:18:03'),
(2057, NULL, 4, '2021-08-22 02:18:13', '90.3455356', '23.7633447', '38, Dhaka District, BD', '2021-08-22 02:18:13', '2021-08-22 02:18:13'),
(2058, NULL, 4, '2021-08-22 02:18:23', '90.345481', '23.7633172', '38, Dhaka District, BD', '2021-08-22 02:18:23', '2021-08-22 02:18:23');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2059, NULL, 4, '2021-08-22 02:18:33', '90.3454715', '23.7633009', '38, Dhaka District, BD', '2021-08-22 02:18:33', '2021-08-22 02:18:33'),
(2060, NULL, 4, '2021-08-22 02:18:43', '90.3454995', '23.7633069', '38, Dhaka District, BD', '2021-08-22 02:18:43', '2021-08-22 02:18:43'),
(2061, NULL, 4, '2021-08-22 02:18:53', '90.3455096', '23.7633594', '38, Dhaka District, BD', '2021-08-22 02:18:53', '2021-08-22 02:18:53'),
(2062, NULL, 4, '2021-08-22 02:19:03', '90.3454915', '23.7633404', '38, Dhaka District, BD', '2021-08-22 02:19:03', '2021-08-22 02:19:03'),
(2063, NULL, 4, '2021-08-22 02:19:13', '90.3455118', '23.7633473', '38, Dhaka District, BD', '2021-08-22 02:19:13', '2021-08-22 02:19:13'),
(2064, NULL, 4, '2021-08-22 02:19:23', '90.3455296', '23.7633698', '38, Dhaka District, BD', '2021-08-22 02:19:23', '2021-08-22 02:19:23'),
(2065, NULL, 4, '2021-08-22 02:19:33', '90.3455568', '23.7633764', '38, Dhaka District, BD', '2021-08-22 02:19:33', '2021-08-22 02:19:33'),
(2066, NULL, 4, '2021-08-22 02:19:43', '90.3454115', '23.7632335', '38, Dhaka District, BD', '2021-08-22 02:19:43', '2021-08-22 02:19:43'),
(2067, NULL, 4, '2021-08-22 02:19:51', '90.3454408', '23.7632706', '38, Dhaka District, BD', '2021-08-22 02:19:51', '2021-08-22 02:19:51'),
(2068, NULL, 4, '2021-08-22 02:20:03', '90.3454865', '23.7632894', '38, Dhaka District, BD', '2021-08-22 02:20:03', '2021-08-22 02:20:03'),
(2069, NULL, 4, '2021-08-22 02:20:11', '90.3455119', '23.7633121', '38, Dhaka District, BD', '2021-08-22 02:20:11', '2021-08-22 02:20:11'),
(2070, NULL, 4, '2021-08-22 02:20:23', '90.345491', '23.7633402', '38, Dhaka District, BD', '2021-08-22 02:20:23', '2021-08-22 02:20:23'),
(2071, NULL, 4, '2021-08-22 02:20:33', '90.3454636', '23.7633196', '38, Dhaka District, BD', '2021-08-22 02:20:33', '2021-08-22 02:20:33'),
(2072, NULL, 4, '2021-08-22 02:20:43', '90.3453814', '23.7632688', '38, Dhaka District, BD', '2021-08-22 02:20:43', '2021-08-22 02:20:43'),
(2073, NULL, 4, '2021-08-22 02:20:53', '90.3454473', '23.7633138', '38, Dhaka District, BD', '2021-08-22 02:20:53', '2021-08-22 02:20:53'),
(2074, NULL, 4, '2021-08-22 02:21:03', '90.3454712', '23.7633153', '38, Dhaka District, BD', '2021-08-22 02:21:03', '2021-08-22 02:21:03'),
(2075, NULL, 4, '2021-08-22 02:21:13', '90.3453914', '23.7632876', '38, Dhaka District, BD', '2021-08-22 02:21:13', '2021-08-22 02:21:13'),
(2076, NULL, 4, '2021-08-22 02:21:21', '90.3454543', '23.7633093', '38, Dhaka District, BD', '2021-08-22 02:21:21', '2021-08-22 02:21:21'),
(2077, NULL, 4, '2021-08-22 02:21:33', '90.3454595', '23.7633159', '38, Dhaka District, BD', '2021-08-22 02:21:33', '2021-08-22 02:21:33'),
(2078, NULL, 4, '2021-08-22 02:21:43', '90.3454463', '23.7632854', '38, Dhaka District, BD', '2021-08-22 02:21:43', '2021-08-22 02:21:43'),
(2079, NULL, 4, '2021-08-22 02:21:53', '90.3454372', '23.7632758', '38, Dhaka District, BD', '2021-08-22 02:21:53', '2021-08-22 02:21:53'),
(2080, NULL, 4, '2021-08-22 02:22:03', '90.3454741', '23.7633025', '38, Dhaka District, BD', '2021-08-22 02:22:03', '2021-08-22 02:22:03'),
(2081, NULL, 4, '2021-08-22 02:22:11', '90.3454383', '23.7632555', '38, Dhaka District, BD', '2021-08-22 02:22:11', '2021-08-22 02:22:11'),
(2082, NULL, 4, '2021-08-22 02:22:23', '90.3453645', '23.7632463', '38, Dhaka District, BD', '2021-08-22 02:22:23', '2021-08-22 02:22:23'),
(2083, NULL, 4, '2021-08-22 02:22:34', '90.3454461', '23.7633215', '38, Dhaka District, BD', '2021-08-22 02:22:34', '2021-08-22 02:22:34'),
(2084, NULL, 4, '2021-08-22 02:22:41', '90.3453268', '23.7632303', '38, Dhaka District, BD', '2021-08-22 02:22:41', '2021-08-22 02:22:41'),
(2085, NULL, 4, '2021-08-22 02:22:53', '90.3455212', '23.7633533', '38, Dhaka District, BD', '2021-08-22 02:22:53', '2021-08-22 02:22:53'),
(2086, NULL, 4, '2021-08-22 02:23:03', '90.3454906', '23.7633095', '38, Dhaka District, BD', '2021-08-22 02:23:03', '2021-08-22 02:23:03'),
(2087, NULL, 4, '2021-08-22 02:23:13', '90.3454653', '23.7632831', '38, Dhaka District, BD', '2021-08-22 02:23:13', '2021-08-22 02:23:13'),
(2088, NULL, 4, '2021-08-22 02:23:23', '90.3454405', '23.7632895', '38, Dhaka District, BD', '2021-08-22 02:23:23', '2021-08-22 02:23:23'),
(2089, NULL, 4, '2021-08-22 02:23:33', '90.3455211', '23.7633328', '38, Dhaka District, BD', '2021-08-22 02:23:33', '2021-08-22 02:23:33'),
(2090, NULL, 4, '2021-08-22 02:23:43', '90.3454705', '23.7632946', '38, Dhaka District, BD', '2021-08-22 02:23:43', '2021-08-22 02:23:43'),
(2091, NULL, 4, '2021-08-22 02:23:53', '90.3455172', '23.7633656', '38, Dhaka District, BD', '2021-08-22 02:23:53', '2021-08-22 02:23:53'),
(2092, NULL, 4, '2021-08-22 02:24:03', '90.3454907', '23.7633365', '38, Dhaka District, BD', '2021-08-22 02:24:03', '2021-08-22 02:24:03'),
(2093, NULL, 4, '2021-08-22 02:24:13', '90.3454781', '23.7633154', '38, Dhaka District, BD', '2021-08-22 02:24:13', '2021-08-22 02:24:13'),
(2094, NULL, 4, '2021-08-22 02:24:23', '90.3455162', '23.7633466', '38, Dhaka District, BD', '2021-08-22 02:24:23', '2021-08-22 02:24:23'),
(2095, NULL, 4, '2021-08-22 02:24:33', '90.3454598', '23.7632872', '38, Dhaka District, BD', '2021-08-22 02:24:33', '2021-08-22 02:24:33'),
(2096, NULL, 4, '2021-08-22 02:24:43', '90.3454329', '23.7632485', '38, Dhaka District, BD', '2021-08-22 02:24:43', '2021-08-22 02:24:43'),
(2097, NULL, 4, '2021-08-22 02:24:53', '90.3454842', '23.7633354', '38, Dhaka District, BD', '2021-08-22 02:24:53', '2021-08-22 02:24:53'),
(2098, NULL, 4, '2021-08-22 02:25:03', '90.3455277', '23.7633757', '38, Dhaka District, BD', '2021-08-22 02:25:03', '2021-08-22 02:25:03'),
(2099, NULL, 4, '2021-08-22 02:25:13', '90.345495', '23.7633148', '38, Dhaka District, BD', '2021-08-22 02:25:13', '2021-08-22 02:25:13'),
(2100, NULL, 4, '2021-08-22 02:25:23', '90.3455138', '23.7633499', '38, Dhaka District, BD', '2021-08-22 02:25:23', '2021-08-22 02:25:23'),
(2101, NULL, 4, '2021-08-22 02:25:33', '90.3454897', '23.7633206', '38, Dhaka District, BD', '2021-08-22 02:25:33', '2021-08-22 02:25:33'),
(2102, NULL, 4, '2021-08-22 02:25:43', '90.3455436', '23.7633364', '38, Dhaka District, BD', '2021-08-22 02:25:43', '2021-08-22 02:25:43'),
(2103, NULL, 4, '2021-08-22 02:25:53', '90.3455122', '23.7633262', '38, Dhaka District, BD', '2021-08-22 02:25:53', '2021-08-22 02:25:53'),
(2104, NULL, 4, '2021-08-22 02:26:03', '90.3455232', '23.7633507', '38, Dhaka District, BD', '2021-08-22 02:26:03', '2021-08-22 02:26:03'),
(2105, NULL, 4, '2021-08-22 02:26:13', '90.3455243', '23.763367', '38, Dhaka District, BD', '2021-08-22 02:26:13', '2021-08-22 02:26:13'),
(2106, NULL, 4, '2021-08-22 02:26:23', '90.345497', '23.7633078', '38, Dhaka District, BD', '2021-08-22 02:26:23', '2021-08-22 02:26:23'),
(2107, NULL, 4, '2021-08-22 02:26:33', '90.3455006', '23.7633238', '38, Dhaka District, BD', '2021-08-22 02:26:33', '2021-08-22 02:26:33'),
(2108, NULL, 4, '2021-08-22 02:26:41', '90.3455391', '23.7633599', '38, Dhaka District, BD', '2021-08-22 02:26:41', '2021-08-22 02:26:41'),
(2109, NULL, 4, '2021-08-22 02:26:53', '90.3455379', '23.7633688', '38, Dhaka District, BD', '2021-08-22 02:26:53', '2021-08-22 02:26:53'),
(2110, NULL, 4, '2021-08-22 02:27:03', '90.3455334', '23.7633671', '38, Dhaka District, BD', '2021-08-22 02:27:03', '2021-08-22 02:27:03'),
(2111, NULL, 4, '2021-08-22 02:27:13', '90.3455232', '23.7633612', '38, Dhaka District, BD', '2021-08-22 02:27:13', '2021-08-22 02:27:13'),
(2112, NULL, 4, '2021-08-22 02:27:23', '90.3455057', '23.7633615', '38, Dhaka District, BD', '2021-08-22 02:27:23', '2021-08-22 02:27:23'),
(2113, NULL, 4, '2021-08-22 02:27:33', '90.3455387', '23.7633644', '38, Dhaka District, BD', '2021-08-22 02:27:33', '2021-08-22 02:27:33'),
(2114, NULL, 4, '2021-08-22 02:27:43', '90.3454783', '23.7633106', '38, Dhaka District, BD', '2021-08-22 02:27:43', '2021-08-22 02:27:43'),
(2115, NULL, 4, '2021-08-22 02:27:53', '90.345518', '23.7633538', '38, Dhaka District, BD', '2021-08-22 02:27:53', '2021-08-22 02:27:53'),
(2116, NULL, 4, '2021-08-22 02:28:01', '90.345522', '23.7633635', '38, Dhaka District, BD', '2021-08-22 02:28:01', '2021-08-22 02:28:01'),
(2117, NULL, 4, '2021-08-22 02:28:13', '90.345484', '23.7633273', '38, Dhaka District, BD', '2021-08-22 02:28:13', '2021-08-22 02:28:13'),
(2118, NULL, 4, '2021-08-22 02:28:21', '90.3454564', '23.7633136', '38, Dhaka District, BD', '2021-08-22 02:28:21', '2021-08-22 02:28:21'),
(2119, NULL, 4, '2021-08-22 02:28:33', '90.345458', '23.7632734', '38, Dhaka District, BD', '2021-08-22 02:28:33', '2021-08-22 02:28:33'),
(2120, NULL, 4, '2021-08-22 02:28:43', '90.345494', '23.7633344', '38, Dhaka District, BD', '2021-08-22 02:28:43', '2021-08-22 02:28:43'),
(2121, NULL, 4, '2021-08-22 02:28:53', '90.3454166', '23.7632471', '38, Dhaka District, BD', '2021-08-22 02:28:53', '2021-08-22 02:28:53'),
(2122, NULL, 4, '2021-08-22 02:29:03', '90.345488', '23.7633128', '38, Dhaka District, BD', '2021-08-22 02:29:03', '2021-08-22 02:29:03'),
(2123, NULL, 4, '2021-08-22 02:29:13', '90.3454861', '23.7632909', '38, Dhaka District, BD', '2021-08-22 02:29:13', '2021-08-22 02:29:13'),
(2124, NULL, 4, '2021-08-22 02:29:23', '90.3454549', '23.7632767', '38, Dhaka District, BD', '2021-08-22 02:29:23', '2021-08-22 02:29:23'),
(2125, NULL, 4, '2021-08-22 02:29:33', '90.3454535', '23.763272', '38, Dhaka District, BD', '2021-08-22 02:29:33', '2021-08-22 02:29:33'),
(2126, NULL, 4, '2021-08-22 02:29:44', '90.345451', '23.7632923', '38, Dhaka District, BD', '2021-08-22 02:29:44', '2021-08-22 02:29:44'),
(2127, NULL, 4, '2021-08-22 02:29:51', '90.3455189', '23.7633388', '38, Dhaka District, BD', '2021-08-22 02:29:51', '2021-08-22 02:29:51'),
(2128, NULL, 4, '2021-08-22 02:30:03', '90.3455459', '23.7633623', '38, Dhaka District, BD', '2021-08-22 02:30:03', '2021-08-22 02:30:03'),
(2129, NULL, 4, '2021-08-22 02:30:13', '90.3455308', '23.7633698', '38, Dhaka District, BD', '2021-08-22 02:30:13', '2021-08-22 02:30:13'),
(2130, NULL, 4, '2021-08-22 02:30:23', '90.345536', '23.7633699', '38, Dhaka District, BD', '2021-08-22 02:30:23', '2021-08-22 02:30:23'),
(2131, NULL, 4, '2021-08-22 02:30:31', '90.3455298', '23.7633658', '38, Dhaka District, BD', '2021-08-22 02:30:31', '2021-08-22 02:30:31'),
(2132, NULL, 4, '2021-08-22 02:30:43', '90.3455184', '23.7633515', '38, Dhaka District, BD', '2021-08-22 02:30:43', '2021-08-22 02:30:43'),
(2133, NULL, 4, '2021-08-22 02:30:53', '90.3455228', '23.7633736', '38, Dhaka District, BD', '2021-08-22 02:30:53', '2021-08-22 02:30:53'),
(2134, NULL, 4, '2021-08-22 02:31:03', '90.3455238', '23.7633693', '38, Dhaka District, BD', '2021-08-22 02:31:03', '2021-08-22 02:31:03'),
(2135, NULL, 4, '2021-08-22 02:31:13', '90.345497', '23.763337', '38, Dhaka District, BD', '2021-08-22 02:31:13', '2021-08-22 02:31:13'),
(2136, NULL, 4, '2021-08-22 02:31:23', '90.3454911', '23.7633302', '38, Dhaka District, BD', '2021-08-22 02:31:23', '2021-08-22 02:31:23'),
(2137, NULL, 4, '2021-08-22 02:31:33', '90.3455178', '23.7633294', '38, Dhaka District, BD', '2021-08-22 02:31:33', '2021-08-22 02:31:33'),
(2138, NULL, 4, '2021-08-22 02:31:43', '90.3454952', '23.7633473', '38, Dhaka District, BD', '2021-08-22 02:31:43', '2021-08-22 02:31:43'),
(2139, NULL, 4, '2021-08-22 02:31:53', '90.3455127', '23.7633806', '38, Dhaka District, BD', '2021-08-22 02:31:53', '2021-08-22 02:31:53'),
(2140, NULL, 4, '2021-08-22 02:32:03', '90.3454964', '23.7633202', '38, Dhaka District, BD', '2021-08-22 02:32:03', '2021-08-22 02:32:03'),
(2141, NULL, 4, '2021-08-22 02:32:13', '90.3454824', '23.7633262', '38, Dhaka District, BD', '2021-08-22 02:32:13', '2021-08-22 02:32:13'),
(2142, NULL, 4, '2021-08-22 02:32:23', '90.345473', '23.7633225', '38, Dhaka District, BD', '2021-08-22 02:32:23', '2021-08-22 02:32:23'),
(2143, NULL, 4, '2021-08-22 02:32:33', '90.3454725', '23.7633156', '38, Dhaka District, BD', '2021-08-22 02:32:33', '2021-08-22 02:32:33'),
(2144, NULL, 4, '2021-08-22 02:32:43', '90.3454829', '23.7633238', '38, Dhaka District, BD', '2021-08-22 02:32:43', '2021-08-22 02:32:43'),
(2145, NULL, 4, '2021-08-22 02:32:53', '90.3454766', '23.7633287', '38, Dhaka District, BD', '2021-08-22 02:32:53', '2021-08-22 02:32:53'),
(2146, NULL, 4, '2021-08-22 02:33:03', '90.3454778', '23.7633279', '38, Dhaka District, BD', '2021-08-22 02:33:03', '2021-08-22 02:33:03'),
(2147, NULL, 4, '2021-08-22 02:33:11', '90.3454568', '23.7633226', '38, Dhaka District, BD', '2021-08-22 02:33:11', '2021-08-22 02:33:11'),
(2148, NULL, 4, '2021-08-22 02:33:23', '90.3454581', '23.7632942', '38, Dhaka District, BD', '2021-08-22 02:33:23', '2021-08-22 02:33:23'),
(2149, NULL, 4, '2021-08-22 02:33:31', '90.3455113', '23.7633507', '38, Dhaka District, BD', '2021-08-22 02:33:31', '2021-08-22 02:33:31'),
(2150, NULL, 4, '2021-08-22 02:33:43', '90.3454909', '23.7633246', '38, Dhaka District, BD', '2021-08-22 02:33:43', '2021-08-22 02:33:43'),
(2151, NULL, 4, '2021-08-22 02:33:53', '90.345502', '23.7633742', '38, Dhaka District, BD', '2021-08-22 02:33:53', '2021-08-22 02:33:53'),
(2152, NULL, 4, '2021-08-22 02:34:03', '90.345509', '23.7633473', '38, Dhaka District, BD', '2021-08-22 02:34:03', '2021-08-22 02:34:03'),
(2153, NULL, 4, '2021-08-22 02:34:13', '90.345527', '23.7633378', '38, Dhaka District, BD', '2021-08-22 02:34:13', '2021-08-22 02:34:13'),
(2154, NULL, 4, '2021-08-22 02:34:23', '90.3454917', '23.7633387', '38, Dhaka District, BD', '2021-08-22 02:34:23', '2021-08-22 02:34:23'),
(2155, NULL, 4, '2021-08-22 02:34:33', '90.3455027', '23.7633326', '38, Dhaka District, BD', '2021-08-22 02:34:33', '2021-08-22 02:34:33'),
(2156, NULL, 4, '2021-08-22 02:34:43', '90.345519', '23.7633285', '38, Dhaka District, BD', '2021-08-22 02:34:43', '2021-08-22 02:34:43'),
(2157, NULL, 4, '2021-08-22 02:34:53', '90.3455364', '23.7633334', '38, Dhaka District, BD', '2021-08-22 02:34:53', '2021-08-22 02:34:53'),
(2158, NULL, 4, '2021-08-22 02:35:03', '90.3454293', '23.7632558', '38, Dhaka District, BD', '2021-08-22 02:35:03', '2021-08-22 02:35:03'),
(2159, NULL, 4, '2021-08-22 02:35:13', '90.3454835', '23.7633062', '38, Dhaka District, BD', '2021-08-22 02:35:13', '2021-08-22 02:35:13'),
(2160, NULL, 4, '2021-08-22 02:35:23', '90.3454981', '23.7633214', '38, Dhaka District, BD', '2021-08-22 02:35:23', '2021-08-22 02:35:23'),
(2161, NULL, 4, '2021-08-22 02:35:33', '90.3455464', '23.7633261', '38, Dhaka District, BD', '2021-08-22 02:35:33', '2021-08-22 02:35:33'),
(2162, NULL, 4, '2021-08-22 02:35:43', '90.3453729', '23.7632552', '38, Dhaka District, BD', '2021-08-22 02:35:43', '2021-08-22 02:35:43'),
(2163, NULL, 4, '2021-08-22 02:35:51', '90.3454731', '23.7633236', '38, Dhaka District, BD', '2021-08-22 02:35:51', '2021-08-22 02:35:51'),
(2164, NULL, 4, '2021-08-22 02:36:03', '90.3454632', '23.7632842', '38, Dhaka District, BD', '2021-08-22 02:36:03', '2021-08-22 02:36:03'),
(2165, NULL, 4, '2021-08-22 02:36:13', '90.3454991', '23.7633198', '38, Dhaka District, BD', '2021-08-22 02:36:13', '2021-08-22 02:36:13'),
(2166, NULL, 4, '2021-08-22 02:36:23', '90.3454802', '23.7632997', '38, Dhaka District, BD', '2021-08-22 02:36:23', '2021-08-22 02:36:23'),
(2167, NULL, 4, '2021-08-22 02:36:33', '90.3454705', '23.7632974', '38, Dhaka District, BD', '2021-08-22 02:36:33', '2021-08-22 02:36:33'),
(2168, NULL, 4, '2021-08-22 02:36:43', '90.3454751', '23.7633205', '38, Dhaka District, BD', '2021-08-22 02:36:43', '2021-08-22 02:36:43'),
(2169, NULL, 4, '2021-08-22 02:36:53', '90.3454234', '23.7632554', '38, Dhaka District, BD', '2021-08-22 02:36:53', '2021-08-22 02:36:53'),
(2170, NULL, 4, '2021-08-22 02:37:03', '90.3454773', '23.7632994', '38, Dhaka District, BD', '2021-08-22 02:37:03', '2021-08-22 02:37:03'),
(2171, NULL, 4, '2021-08-22 02:37:13', '90.3454978', '23.7633094', '38, Dhaka District, BD', '2021-08-22 02:37:13', '2021-08-22 02:37:13'),
(2172, NULL, 4, '2021-08-22 02:37:23', '90.3454828', '23.7633207', '38, Dhaka District, BD', '2021-08-22 02:37:23', '2021-08-22 02:37:23'),
(2173, NULL, 4, '2021-08-22 02:37:33', '90.345486', '23.7633215', '38, Dhaka District, BD', '2021-08-22 02:37:33', '2021-08-22 02:37:33'),
(2174, NULL, 4, '2021-08-22 02:37:43', '90.345507', '23.7633395', '38, Dhaka District, BD', '2021-08-22 02:37:43', '2021-08-22 02:37:43'),
(2175, NULL, 4, '2021-08-22 02:37:53', '90.3455083', '23.7633372', '38, Dhaka District, BD', '2021-08-22 02:37:53', '2021-08-22 02:37:53'),
(2176, NULL, 4, '2021-08-22 02:38:03', '90.3454826', '23.7633331', '38, Dhaka District, BD', '2021-08-22 02:38:03', '2021-08-22 02:38:03'),
(2177, NULL, 4, '2021-08-22 02:38:13', '90.3454819', '23.7633355', '38, Dhaka District, BD', '2021-08-22 02:38:13', '2021-08-22 02:38:13'),
(2178, NULL, 4, '2021-08-22 02:38:21', '90.3454961', '23.7633262', '38, Dhaka District, BD', '2021-08-22 02:38:21', '2021-08-22 02:38:21'),
(2179, NULL, 4, '2021-08-22 02:38:33', '90.3454739', '23.7633052', '38, Dhaka District, BD', '2021-08-22 02:38:33', '2021-08-22 02:38:33'),
(2180, NULL, 4, '2021-08-22 02:38:43', '90.3455007', '23.7633352', '38, Dhaka District, BD', '2021-08-22 02:38:43', '2021-08-22 02:38:43'),
(2181, NULL, 4, '2021-08-22 02:38:53', '90.3455105', '23.7633549', '38, Dhaka District, BD', '2021-08-22 02:38:53', '2021-08-22 02:38:53'),
(2182, NULL, 4, '2021-08-22 02:39:03', '90.3454772', '23.7633263', '38, Dhaka District, BD', '2021-08-22 02:39:03', '2021-08-22 02:39:03'),
(2183, NULL, 4, '2021-08-22 02:39:13', '90.3454765', '23.7633322', '38, Dhaka District, BD', '2021-08-22 02:39:13', '2021-08-22 02:39:13'),
(2184, NULL, 4, '2021-08-22 02:39:23', '90.3455029', '23.7633148', '38, Dhaka District, BD', '2021-08-22 02:39:23', '2021-08-22 02:39:23'),
(2185, NULL, 4, '2021-08-22 02:39:33', '90.3455239', '23.7633541', '38, Dhaka District, BD', '2021-08-22 02:39:33', '2021-08-22 02:39:33'),
(2186, NULL, 4, '2021-08-22 02:39:43', '90.3454747', '23.7633113', '38, Dhaka District, BD', '2021-08-22 02:39:43', '2021-08-22 02:39:43'),
(2187, NULL, 4, '2021-08-22 02:39:53', '90.3454699', '23.7632954', '38, Dhaka District, BD', '2021-08-22 02:39:53', '2021-08-22 02:39:53'),
(2188, NULL, 4, '2021-08-22 02:40:03', '90.3454573', '23.7632901', '38, Dhaka District, BD', '2021-08-22 02:40:03', '2021-08-22 02:40:03'),
(2189, NULL, 4, '2021-08-22 02:40:13', '90.3454564', '23.7632867', '38, Dhaka District, BD', '2021-08-22 02:40:13', '2021-08-22 02:40:13'),
(2190, NULL, 4, '2021-08-22 02:40:23', '90.345473', '23.7632947', '38, Dhaka District, BD', '2021-08-22 02:40:23', '2021-08-22 02:40:23'),
(2191, NULL, 4, '2021-08-22 02:40:33', '90.345344', '23.7632411', '38, Dhaka District, BD', '2021-08-22 02:40:33', '2021-08-22 02:40:33'),
(2192, NULL, 4, '2021-08-22 02:40:43', '90.3454557', '23.763291', '38, Dhaka District, BD', '2021-08-22 02:40:43', '2021-08-22 02:40:43'),
(2193, NULL, 4, '2021-08-22 02:40:53', '90.3454977', '23.7633138', '38, Dhaka District, BD', '2021-08-22 02:40:53', '2021-08-22 02:40:53'),
(2194, NULL, 4, '2021-08-22 02:41:01', '90.3454814', '23.7633256', '38, Dhaka District, BD', '2021-08-22 02:41:01', '2021-08-22 02:41:01'),
(2195, NULL, 4, '2021-08-22 02:41:13', '90.3454847', '23.7633084', '38, Dhaka District, BD', '2021-08-22 02:41:13', '2021-08-22 02:41:13'),
(2196, NULL, 4, '2021-08-22 02:41:23', '90.3454599', '23.763286', '38, Dhaka District, BD', '2021-08-22 02:41:23', '2021-08-22 02:41:23'),
(2197, NULL, 4, '2021-08-22 02:41:31', '90.3453942', '23.7632661', '38, Dhaka District, BD', '2021-08-22 02:41:31', '2021-08-22 02:41:31'),
(2198, NULL, 4, '2021-08-22 02:41:43', '90.3454581', '23.7633051', '38, Dhaka District, BD', '2021-08-22 02:41:43', '2021-08-22 02:41:43'),
(2199, NULL, 4, '2021-08-22 02:41:53', '90.3454556', '23.763295', '38, Dhaka District, BD', '2021-08-22 02:41:53', '2021-08-22 02:41:53'),
(2200, NULL, 4, '2021-08-22 02:42:03', '90.3454768', '23.7632894', '38, Dhaka District, BD', '2021-08-22 02:42:03', '2021-08-22 02:42:03'),
(2201, NULL, 4, '2021-08-22 02:42:13', '90.3454657', '23.7633161', '38, Dhaka District, BD', '2021-08-22 02:42:13', '2021-08-22 02:42:13'),
(2202, NULL, 4, '2021-08-22 02:42:22', '90.345474', '23.7633095', '38, Dhaka District, BD', '2021-08-22 02:42:22', '2021-08-22 02:42:22'),
(2203, NULL, 4, '2021-08-22 02:42:33', '90.3454769', '23.7633028', '38, Dhaka District, BD', '2021-08-22 02:42:33', '2021-08-22 02:42:33'),
(2204, NULL, 4, '2021-08-22 02:42:43', '90.3454489', '23.7632724', '38, Dhaka District, BD', '2021-08-22 02:42:43', '2021-08-22 02:42:43'),
(2205, NULL, 4, '2021-08-22 02:42:53', '90.3454986', '23.7632843', '38, Dhaka District, BD', '2021-08-22 02:42:53', '2021-08-22 02:42:53'),
(2206, NULL, 4, '2021-08-22 02:43:03', '90.3454504', '23.7632613', '38, Dhaka District, BD', '2021-08-22 02:43:03', '2021-08-22 02:43:03'),
(2207, NULL, 4, '2021-08-22 02:43:13', '90.3454742', '23.7632996', '38, Dhaka District, BD', '2021-08-22 02:43:13', '2021-08-22 02:43:13'),
(2208, NULL, 4, '2021-08-22 02:43:23', '90.3455066', '23.7633095', '38, Dhaka District, BD', '2021-08-22 02:43:23', '2021-08-22 02:43:23'),
(2209, NULL, 4, '2021-08-22 02:43:33', '90.3455067', '23.7633053', '38, Dhaka District, BD', '2021-08-22 02:43:33', '2021-08-22 02:43:33'),
(2210, NULL, 4, '2021-08-22 02:43:41', '90.3454936', '23.7633231', '38, Dhaka District, BD', '2021-08-22 02:43:41', '2021-08-22 02:43:41'),
(2211, NULL, 4, '2021-08-22 02:43:53', '90.3455064', '23.7633332', '38, Dhaka District, BD', '2021-08-22 02:43:53', '2021-08-22 02:43:53'),
(2212, NULL, 4, '2021-08-22 02:44:03', '90.3454821', '23.7633092', '38, Dhaka District, BD', '2021-08-22 02:44:03', '2021-08-22 02:44:03'),
(2213, NULL, 4, '2021-08-22 02:44:13', '90.3454663', '23.7633013', '38, Dhaka District, BD', '2021-08-22 02:44:13', '2021-08-22 02:44:13'),
(2214, NULL, 4, '2021-08-22 02:44:23', '90.3454711', '23.7632715', '38, Dhaka District, BD', '2021-08-22 02:44:23', '2021-08-22 02:44:23'),
(2215, NULL, 4, '2021-08-22 02:44:33', '90.3455103', '23.7633867', '38, Dhaka District, BD', '2021-08-22 02:44:33', '2021-08-22 02:44:33'),
(2216, NULL, 4, '2021-08-22 02:44:43', '90.3454959', '23.7633254', '38, Dhaka District, BD', '2021-08-22 02:44:43', '2021-08-22 02:44:43'),
(2217, NULL, 4, '2021-08-22 02:44:51', '90.3455288', '23.7633624', '38, Dhaka District, BD', '2021-08-22 02:44:51', '2021-08-22 02:44:51'),
(2218, NULL, 4, '2021-08-22 02:45:03', '90.345521', '23.7633609', '38, Dhaka District, BD', '2021-08-22 02:45:03', '2021-08-22 02:45:03'),
(2219, NULL, 4, '2021-08-22 02:45:13', '90.345528', '23.7633397', '38, Dhaka District, BD', '2021-08-22 02:45:13', '2021-08-22 02:45:13'),
(2220, NULL, 4, '2021-08-22 02:45:23', '90.3455099', '23.763342', '38, Dhaka District, BD', '2021-08-22 02:45:23', '2021-08-22 02:45:23'),
(2221, NULL, 4, '2021-08-22 02:45:33', '90.3454824', '23.7633064', '38, Dhaka District, BD', '2021-08-22 02:45:33', '2021-08-22 02:45:33'),
(2222, NULL, 4, '2021-08-22 02:45:43', '90.3455237', '23.7633724', '38, Dhaka District, BD', '2021-08-22 02:45:43', '2021-08-22 02:45:43'),
(2223, NULL, 4, '2021-08-22 02:45:53', '90.3455157', '23.7633554', '38, Dhaka District, BD', '2021-08-22 02:45:53', '2021-08-22 02:45:53'),
(2224, NULL, 4, '2021-08-22 02:46:03', '90.3455267', '23.7633727', '38, Dhaka District, BD', '2021-08-22 02:46:03', '2021-08-22 02:46:03'),
(2225, NULL, 4, '2021-08-22 02:46:13', '90.3455176', '23.7633519', '38, Dhaka District, BD', '2021-08-22 02:46:13', '2021-08-22 02:46:13'),
(2226, NULL, 4, '2021-08-22 02:46:23', '90.3454739', '23.7633077', '38, Dhaka District, BD', '2021-08-22 02:46:23', '2021-08-22 02:46:23'),
(2227, NULL, 4, '2021-08-22 02:46:33', '90.345464', '23.7632941', '38, Dhaka District, BD', '2021-08-22 02:46:33', '2021-08-22 02:46:33'),
(2228, NULL, 4, '2021-08-22 02:46:43', '90.3454814', '23.7633115', '38, Dhaka District, BD', '2021-08-22 02:46:43', '2021-08-22 02:46:43'),
(2229, NULL, 4, '2021-08-22 02:46:53', '90.3454867', '23.7633096', '38, Dhaka District, BD', '2021-08-22 02:46:53', '2021-08-22 02:46:53'),
(2230, NULL, 4, '2021-08-22 02:47:03', '90.3455452', '23.7633637', '38, Dhaka District, BD', '2021-08-22 02:47:03', '2021-08-22 02:47:03'),
(2231, NULL, 4, '2021-08-22 02:47:13', '90.3455347', '23.7633729', '38, Dhaka District, BD', '2021-08-22 02:47:13', '2021-08-22 02:47:13'),
(2232, NULL, 4, '2021-08-22 02:47:23', '90.3454889', '23.7633163', '38, Dhaka District, BD', '2021-08-22 02:47:23', '2021-08-22 02:47:23'),
(2233, NULL, 4, '2021-08-22 02:47:33', '90.3455072', '23.7633458', '38, Dhaka District, BD', '2021-08-22 02:47:33', '2021-08-22 02:47:33'),
(2234, NULL, 4, '2021-08-22 02:47:43', '90.3455058', '23.7633477', '38, Dhaka District, BD', '2021-08-22 02:47:43', '2021-08-22 02:47:43'),
(2235, NULL, 4, '2021-08-22 02:47:53', '90.3455098', '23.7633631', '38, Dhaka District, BD', '2021-08-22 02:47:53', '2021-08-22 02:47:53'),
(2236, NULL, 4, '2021-08-22 02:48:03', '90.3455453', '23.7633787', '38, Dhaka District, BD', '2021-08-22 02:48:03', '2021-08-22 02:48:03'),
(2237, NULL, 4, '2021-08-22 02:48:13', '90.3454926', '23.763323', '38, Dhaka District, BD', '2021-08-22 02:48:13', '2021-08-22 02:48:13'),
(2238, NULL, 4, '2021-08-22 02:48:23', '90.345551', '23.7633503', '38, Dhaka District, BD', '2021-08-22 02:48:23', '2021-08-22 02:48:23'),
(2239, NULL, 4, '2021-08-22 02:48:33', '90.3455215', '23.763375', '38, Dhaka District, BD', '2021-08-22 02:48:33', '2021-08-22 02:48:33'),
(2240, NULL, 4, '2021-08-22 02:48:43', '90.3455256', '23.7633519', '38, Dhaka District, BD', '2021-08-22 02:48:43', '2021-08-22 02:48:43'),
(2241, NULL, 4, '2021-08-22 02:48:51', '90.3455071', '23.7633242', '38, Dhaka District, BD', '2021-08-22 02:48:51', '2021-08-22 02:48:51'),
(2242, NULL, 4, '2021-08-22 02:49:03', '90.3455348', '23.7633663', '38, Dhaka District, BD', '2021-08-22 02:49:03', '2021-08-22 02:49:03'),
(2243, NULL, 4, '2021-08-22 02:49:13', '90.3455428', '23.7633505', '38, Dhaka District, BD', '2021-08-22 02:49:13', '2021-08-22 02:49:13'),
(2244, NULL, 4, '2021-08-22 02:49:23', '90.3454926', '23.7633158', '38, Dhaka District, BD', '2021-08-22 02:49:23', '2021-08-22 02:49:23'),
(2245, NULL, 4, '2021-08-22 02:49:33', '90.345535', '23.7633662', '38, Dhaka District, BD', '2021-08-22 02:49:33', '2021-08-22 02:49:33'),
(2246, NULL, 4, '2021-08-22 02:49:41', '90.3455341', '23.7633556', '38, Dhaka District, BD', '2021-08-22 02:49:41', '2021-08-22 02:49:41'),
(2247, NULL, 4, '2021-08-22 02:49:53', '90.3455293', '23.7633613', '38, Dhaka District, BD', '2021-08-22 02:49:53', '2021-08-22 02:49:53'),
(2248, NULL, 4, '2021-08-22 02:50:00', '90.3454667', '23.7633044', '38, Dhaka District, BD', '2021-08-22 02:50:00', '2021-08-22 02:50:00'),
(2249, NULL, 4, '2021-08-22 02:50:13', '90.3454765', '23.7633097', '38, Dhaka District, BD', '2021-08-22 02:50:13', '2021-08-22 02:50:13'),
(2250, NULL, 4, '2021-08-22 02:50:23', '90.3453963', '23.763218', '38, Dhaka District, BD', '2021-08-22 02:50:23', '2021-08-22 02:50:23'),
(2251, NULL, 4, '2021-08-22 03:16:45', '90.3454831', '23.7633225', '38, Dhaka District, BD', '2021-08-22 03:16:45', '2021-08-22 03:16:45'),
(2252, NULL, 7, '2021-08-23 02:57:59', '9.8766372', '37.2818542', 'Bizerte, Bizerte Nord, TN', '2021-08-23 02:57:59', '2021-08-23 02:57:59'),
(2253, NULL, 7, '2021-08-23 02:58:05', '9.8766243', '37.2817248', 'Bizerte, Bizerte Nord, TN', '2021-08-23 02:58:05', '2021-08-23 02:58:05'),
(2254, NULL, 7, '2021-08-23 02:58:25', '9.8767151', '37.2817113', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:58:25', '2021-08-23 02:58:25'),
(2255, 100037, 7, '2021-08-23 02:58:42', '9.8767211', '37.2816332', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:58:42', '2021-08-23 02:58:42'),
(2256, 100037, 7, '2021-08-23 02:58:50', '9.8768172', '37.2816592', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:58:50', '2021-08-23 02:58:50'),
(2257, 100037, 7, '2021-08-23 02:59:01', '9.8768691', '37.2816757', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:59:01', '2021-08-23 02:59:01'),
(2258, 100037, 7, '2021-08-23 02:59:10', '9.8768499', '37.2816661', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:59:10', '2021-08-23 02:59:10'),
(2259, 100037, 7, '2021-08-23 02:59:26', '9.8769479', '37.2815881', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:59:26', '2021-08-23 02:59:26'),
(2260, 100037, 7, '2021-08-23 02:59:35', '9.8769354', '37.2816505', '7VJG+MQM, Bizerte North, TN', '2021-08-23 02:59:35', '2021-08-23 02:59:35'),
(2261, 100037, 7, '2021-08-23 02:59:44', '9.8766326', '37.2817149', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:59:44', '2021-08-23 02:59:44'),
(2262, 100037, 7, '2021-08-23 02:59:55', '9.8768057', '37.2816751', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 02:59:55', '2021-08-23 02:59:55'),
(2263, 100037, 7, '2021-08-23 03:00:07', '9.8768481', '37.2817065', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:00:07', '2021-08-23 03:00:07'),
(2264, 100037, 7, '2021-08-23 03:01:27', '9.8766249', '37.2816329', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:01:27', '2021-08-23 03:01:27'),
(2265, 100037, 7, '2021-08-23 03:01:32', '9.8766407', '37.2816944', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:01:32', '2021-08-23 03:01:32'),
(2266, 100037, 7, '2021-08-23 03:01:36', '9.8766245', '37.2816912', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:01:36', '2021-08-23 03:01:36'),
(2267, 100037, 7, '2021-08-23 03:01:45', '9.8766619', '37.2816763', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:01:45', '2021-08-23 03:01:45'),
(2268, 100037, 7, '2021-08-23 03:01:55', '9.8768888', '37.2816379', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:01:55', '2021-08-23 03:01:55'),
(2269, NULL, 7, '2021-08-23 03:02:05', '9.8769474', '37.2816221', '7VJG+MQM, Bizerte North, TN', '2021-08-23 03:02:05', '2021-08-23 03:02:05'),
(2270, NULL, 7, '2021-08-23 03:02:06', '9.8769086', '37.2817692', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:02:06', '2021-08-23 03:02:06'),
(2271, 100037, 7, '2021-08-23 03:02:38', '9.8769208', '37.2816731', '7VJG+MQM, Bizerte North, TN', '2021-08-23 03:02:38', '2021-08-23 03:02:38'),
(2272, 100037, 7, '2021-08-23 03:02:49', '9.8768982', '37.2816791', 'Boulevard Habib Bougatfa, Bizerte North, TN', '2021-08-23 03:02:49', '2021-08-23 03:02:49'),
(2273, 100037, 7, '2021-08-23 03:02:58', '9.8769073', '37.2816937', '7VJG+MQM, Bizerte North, TN', '2021-08-23 03:02:58', '2021-08-23 03:02:58'),
(2274, 100033, 2, '2021-10-17 00:19:49', '90.4226175', '23.8581247', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:19:49', '2021-10-17 00:19:49'),
(2275, NULL, 2, '2021-10-17 00:21:06', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:21:06', '2021-10-17 00:21:06'),
(2276, NULL, 2, '2021-10-17 00:21:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:21:12', '2021-10-17 00:21:12'),
(2277, NULL, 2, '2021-10-17 00:21:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:21:22', '2021-10-17 00:21:22'),
(2278, NULL, 2, '2021-10-17 00:21:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:21:32', '2021-10-17 00:21:32'),
(2279, NULL, 2, '2021-10-17 00:21:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:21:42', '2021-10-17 00:21:42'),
(2280, NULL, 2, '2021-10-17 00:21:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:21:52', '2021-10-17 00:21:52'),
(2281, NULL, 2, '2021-10-17 00:22:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:22:02', '2021-10-17 00:22:02'),
(2282, NULL, 2, '2021-10-17 00:22:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:22:12', '2021-10-17 00:22:12'),
(2283, NULL, 2, '2021-10-17 00:22:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:22:22', '2021-10-17 00:22:22'),
(2284, NULL, 2, '2021-10-17 00:22:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:22:32', '2021-10-17 00:22:32'),
(2285, NULL, 2, '2021-10-17 00:22:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:22:42', '2021-10-17 00:22:42'),
(2286, NULL, 2, '2021-10-17 00:22:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:22:52', '2021-10-17 00:22:52'),
(2287, NULL, 2, '2021-10-17 00:23:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:23:02', '2021-10-17 00:23:02'),
(2288, NULL, 2, '2021-10-17 00:23:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:23:12', '2021-10-17 00:23:12'),
(2289, NULL, 2, '2021-10-17 00:23:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:23:22', '2021-10-17 00:23:22'),
(2290, NULL, 2, '2021-10-17 00:23:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:23:32', '2021-10-17 00:23:32'),
(2291, NULL, 2, '2021-10-17 00:23:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:23:42', '2021-10-17 00:23:42'),
(2292, NULL, 2, '2021-10-17 00:23:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:23:52', '2021-10-17 00:23:52'),
(2293, NULL, 2, '2021-10-17 00:24:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:24:02', '2021-10-17 00:24:02'),
(2294, NULL, 2, '2021-10-17 00:24:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:24:12', '2021-10-17 00:24:12'),
(2295, NULL, 2, '2021-10-17 00:24:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:24:22', '2021-10-17 00:24:22'),
(2296, NULL, 2, '2021-10-17 00:24:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:24:32', '2021-10-17 00:24:32'),
(2297, NULL, 2, '2021-10-17 00:24:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:24:42', '2021-10-17 00:24:42'),
(2298, NULL, 2, '2021-10-17 00:24:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:24:52', '2021-10-17 00:24:52'),
(2299, NULL, 2, '2021-10-17 00:25:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:25:02', '2021-10-17 00:25:02'),
(2300, NULL, 2, '2021-10-17 00:25:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:25:12', '2021-10-17 00:25:12'),
(2301, NULL, 2, '2021-10-17 00:25:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:25:22', '2021-10-17 00:25:22'),
(2302, NULL, 2, '2021-10-17 00:25:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:25:32', '2021-10-17 00:25:32'),
(2303, NULL, 2, '2021-10-17 00:25:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:25:42', '2021-10-17 00:25:42'),
(2304, NULL, 2, '2021-10-17 00:25:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:25:52', '2021-10-17 00:25:52'),
(2305, NULL, 2, '2021-10-17 00:26:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:26:02', '2021-10-17 00:26:02'),
(2306, NULL, 2, '2021-10-17 00:26:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:26:12', '2021-10-17 00:26:12'),
(2307, NULL, 2, '2021-10-17 00:26:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:26:22', '2021-10-17 00:26:22'),
(2308, NULL, 2, '2021-10-17 00:26:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:26:32', '2021-10-17 00:26:32'),
(2309, NULL, 2, '2021-10-17 00:26:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:26:42', '2021-10-17 00:26:42'),
(2310, NULL, 2, '2021-10-17 00:26:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:26:52', '2021-10-17 00:26:52'),
(2311, NULL, 2, '2021-10-17 00:27:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:27:02', '2021-10-17 00:27:02'),
(2312, NULL, 2, '2021-10-17 00:27:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:27:12', '2021-10-17 00:27:12'),
(2313, NULL, 2, '2021-10-17 00:27:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:27:22', '2021-10-17 00:27:22'),
(2314, NULL, 2, '2021-10-17 00:27:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:27:32', '2021-10-17 00:27:32'),
(2315, NULL, 2, '2021-10-17 00:27:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:27:42', '2021-10-17 00:27:42'),
(2316, NULL, 2, '2021-10-17 00:27:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:27:52', '2021-10-17 00:27:52'),
(2317, NULL, 2, '2021-10-17 00:28:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:28:02', '2021-10-17 00:28:02'),
(2318, NULL, 2, '2021-10-17 00:28:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:28:12', '2021-10-17 00:28:12'),
(2319, NULL, 2, '2021-10-17 00:28:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:28:22', '2021-10-17 00:28:22'),
(2320, NULL, 2, '2021-10-17 00:28:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:28:32', '2021-10-17 00:28:32'),
(2321, NULL, 2, '2021-10-17 00:28:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:28:42', '2021-10-17 00:28:42'),
(2322, NULL, 2, '2021-10-17 00:28:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:28:52', '2021-10-17 00:28:52'),
(2323, NULL, 2, '2021-10-17 00:29:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:29:02', '2021-10-17 00:29:02'),
(2324, NULL, 2, '2021-10-17 00:29:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:29:12', '2021-10-17 00:29:12'),
(2325, NULL, 2, '2021-10-17 00:29:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:29:22', '2021-10-17 00:29:22'),
(2326, NULL, 2, '2021-10-17 00:29:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:29:32', '2021-10-17 00:29:32'),
(2327, NULL, 2, '2021-10-17 00:29:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:29:42', '2021-10-17 00:29:42'),
(2328, NULL, 2, '2021-10-17 00:29:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:29:52', '2021-10-17 00:29:52'),
(2329, NULL, 2, '2021-10-17 00:30:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:30:02', '2021-10-17 00:30:02'),
(2330, NULL, 2, '2021-10-17 00:30:12', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:30:12', '2021-10-17 00:30:12'),
(2331, NULL, 2, '2021-10-17 00:30:22', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:30:22', '2021-10-17 00:30:22'),
(2332, NULL, 2, '2021-10-17 00:30:32', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:30:32', '2021-10-17 00:30:32'),
(2333, NULL, 2, '2021-10-17 00:30:42', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:30:42', '2021-10-17 00:30:42'),
(2334, NULL, 2, '2021-10-17 00:30:52', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:30:52', '2021-10-17 00:30:52'),
(2335, NULL, 2, '2021-10-17 00:31:02', '90.4226152', '23.8581276', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:31:02', '2021-10-17 00:31:02'),
(2336, NULL, 2, '2021-10-17 00:43:56', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:43:56', '2021-10-17 00:43:56'),
(2337, NULL, 2, '2021-10-17 00:43:58', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:43:58', '2021-10-17 00:43:58'),
(2338, NULL, 2, '2021-10-17 00:44:08', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:44:08', '2021-10-17 00:44:08'),
(2339, NULL, 2, '2021-10-17 00:44:18', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:44:18', '2021-10-17 00:44:18'),
(2340, NULL, 2, '2021-10-17 00:44:28', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:44:28', '2021-10-17 00:44:28'),
(2341, NULL, 2, '2021-10-17 00:44:38', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:44:38', '2021-10-17 00:44:38'),
(2342, NULL, 2, '2021-10-17 00:44:48', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:44:48', '2021-10-17 00:44:48'),
(2343, NULL, 2, '2021-10-17 00:44:58', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:44:58', '2021-10-17 00:44:58'),
(2344, NULL, 2, '2021-10-17 00:45:08', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:45:08', '2021-10-17 00:45:08'),
(2345, NULL, 2, '2021-10-17 00:45:18', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:45:18', '2021-10-17 00:45:18'),
(2346, NULL, 2, '2021-10-17 00:45:28', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:45:28', '2021-10-17 00:45:28'),
(2347, NULL, 2, '2021-10-17 00:45:46', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:45:46', '2021-10-17 00:45:46'),
(2348, NULL, 2, '2021-10-17 00:45:56', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:45:56', '2021-10-17 00:45:56'),
(2349, 100045, 2, '2021-10-17 00:46:08', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:46:08', '2021-10-17 00:46:08'),
(2350, 100045, 2, '2021-10-17 00:46:18', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:46:18', '2021-10-17 00:46:18'),
(2351, 100045, 2, '2021-10-17 00:46:29', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:46:29', '2021-10-17 00:46:29'),
(2352, NULL, 2, '2021-10-17 00:46:38', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:46:38', '2021-10-17 00:46:38'),
(2353, NULL, 2, '2021-10-17 00:46:48', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:46:48', '2021-10-17 00:46:48'),
(2354, NULL, 2, '2021-10-17 00:46:59', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:46:59', '2021-10-17 00:46:59'),
(2355, 100045, 2, '2021-10-17 00:47:22', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:47:22', '2021-10-17 00:47:22'),
(2356, NULL, 2, '2021-10-17 00:47:38', '90.4226194', '23.8581261', 'Aainusbag Road, Dhaka District, BD', '2021-10-17 00:47:38', '2021-10-17 00:47:38'),
(2357, NULL, 7, '2021-10-17 15:34:30', '67.027179', '24.9115145', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:34:30', '2021-10-17 15:34:30'),
(2358, NULL, 7, '2021-10-17 15:34:37', '67.027179', '24.9115145', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:34:37', '2021-10-17 15:34:37'),
(2359, NULL, 7, '2021-10-17 15:39:19', '67.0271731', '24.9115091', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:39:19', '2021-10-17 15:39:19'),
(2360, NULL, 7, '2021-10-17 15:39:29', '67.0271731', '24.9115091', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:39:29', '2021-10-17 15:39:29'),
(2361, NULL, 7, '2021-10-17 15:41:23', '67.0271731', '24.9115091', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:41:23', '2021-10-17 15:41:23'),
(2362, NULL, 7, '2021-10-17 15:41:33', '67.0271731', '24.9115091', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:41:33', '2021-10-17 15:41:33'),
(2363, NULL, 7, '2021-10-17 15:41:43', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:41:43', '2021-10-17 15:41:43'),
(2364, NULL, 7, '2021-10-17 15:41:53', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:41:53', '2021-10-17 15:41:53'),
(2365, NULL, 7, '2021-10-17 15:42:03', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:42:03', '2021-10-17 15:42:03'),
(2366, NULL, 7, '2021-10-17 15:42:13', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:42:13', '2021-10-17 15:42:13'),
(2367, NULL, 7, '2021-10-17 15:42:23', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:42:23', '2021-10-17 15:42:23'),
(2368, NULL, 7, '2021-10-17 15:42:33', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:42:33', '2021-10-17 15:42:33'),
(2369, NULL, 7, '2021-10-17 15:42:43', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:42:43', '2021-10-17 15:42:43'),
(2370, NULL, 7, '2021-10-17 15:46:47', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:46:47', '2021-10-17 15:46:47'),
(2371, NULL, 7, '2021-10-17 15:46:57', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:46:57', '2021-10-17 15:46:57'),
(2372, NULL, 7, '2021-10-17 15:47:07', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:47:07', '2021-10-17 15:47:07'),
(2373, NULL, 7, '2021-10-17 15:48:50', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:48:50', '2021-10-17 15:48:50'),
(2374, NULL, 7, '2021-10-17 15:48:50', '67.0271809', '24.9115027', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:48:50', '2021-10-17 15:48:50'),
(2375, NULL, 7, '2021-10-17 15:49:00', '67.027158', '24.9115073', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:49:00', '2021-10-17 15:49:00'),
(2376, NULL, 7, '2021-10-17 15:52:19', '67.027158', '24.9115073', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:52:19', '2021-10-17 15:52:19'),
(2377, NULL, 7, '2021-10-17 15:52:19', '67.027158', '24.9115073', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:52:19', '2021-10-17 15:52:19'),
(2378, NULL, 7, '2021-10-17 15:52:31', '67.0270932', '24.9114949', 'Plot F 7/8, Karachi City, PK', '2021-10-17 15:52:31', '2021-10-17 15:52:31'),
(2379, NULL, 7, '2021-10-17 15:53:18', '67.027155', '24.9115065', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:53:18', '2021-10-17 15:53:18'),
(2380, NULL, 7, '2021-10-17 15:53:28', '67.027155', '24.9115065', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:53:28', '2021-10-17 15:53:28'),
(2381, NULL, 7, '2021-10-17 15:53:37', '67.027155', '24.9115065', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:53:37', '2021-10-17 15:53:37'),
(2382, NULL, 7, '2021-10-17 15:53:47', '67.027155', '24.9115065', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:53:47', '2021-10-17 15:53:47'),
(2383, NULL, 7, '2021-10-17 15:53:57', '67.027155', '24.9115065', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:53:57', '2021-10-17 15:53:57'),
(2384, NULL, 7, '2021-10-17 15:54:22', '67.027155', '24.9115065', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:54:22', '2021-10-17 15:54:22'),
(2385, NULL, 7, '2021-10-17 15:54:32', '67.027153', '24.9115061', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:54:32', '2021-10-17 15:54:32'),
(2386, NULL, 7, '2021-10-17 15:54:42', '67.027153', '24.9115061', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:54:42', '2021-10-17 15:54:42'),
(2387, NULL, 7, '2021-10-17 15:54:52', '67.027153', '24.9115061', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:54:52', '2021-10-17 15:54:52'),
(2388, NULL, 7, '2021-10-17 15:55:06', '67.027153', '24.9115061', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:55:06', '2021-10-17 15:55:06'),
(2389, NULL, 7, '2021-10-17 15:55:12', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:55:12', '2021-10-17 15:55:12'),
(2390, 100017, 3, '2021-10-17 15:56:12', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:56:12', '2021-10-17 15:56:12'),
(2391, 100017, 3, '2021-10-17 15:56:22', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:56:22', '2021-10-17 15:56:22'),
(2392, 100017, 3, '2021-10-17 15:56:32', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:56:32', '2021-10-17 15:56:32'),
(2393, 100017, 3, '2021-10-17 15:56:42', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:56:42', '2021-10-17 15:56:42'),
(2394, 100017, 3, '2021-10-17 15:56:52', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:56:52', '2021-10-17 15:56:52'),
(2395, 100017, 3, '2021-10-17 15:57:06', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 15:57:06', '2021-10-17 15:57:06'),
(2396, 100017, 3, '2021-10-17 16:01:43', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 16:01:43', '2021-10-17 16:01:43'),
(2397, 100017, 3, '2021-10-17 16:01:53', '67.0271394', '24.9114921', 'Plot F 7/7, Karachi City, PK', '2021-10-17 16:01:53', '2021-10-17 16:01:53'),
(2398, NULL, 7, '2021-11-15 15:54:27', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 15:54:27', '2021-11-15 15:54:27'),
(2399, NULL, 7, '2021-11-15 15:54:37', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 15:54:37', '2021-11-15 15:54:37'),
(2400, NULL, 7, '2021-11-15 15:55:41', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 15:55:41', '2021-11-15 15:55:41'),
(2401, NULL, 7, '2021-11-15 15:57:24', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 15:57:24', '2021-11-15 15:57:24'),
(2402, NULL, 7, '2021-11-15 15:59:28', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 15:59:28', '2021-11-15 15:59:28'),
(2403, NULL, 7, '2021-11-15 16:00:50', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:00:50', '2021-11-15 16:00:50'),
(2404, NULL, 7, '2021-11-15 16:03:20', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:03:20', '2021-11-15 16:03:20'),
(2405, 100052, 7, '2021-11-15 16:03:43', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:03:43', '2021-11-15 16:03:43'),
(2406, 100052, 7, '2021-11-15 16:03:53', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:03:53', '2021-11-15 16:03:53'),
(2407, 100052, 7, '2021-11-15 16:04:03', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:04:03', '2021-11-15 16:04:03');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2408, 100052, 7, '2021-11-15 16:04:13', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:04:13', '2021-11-15 16:04:13'),
(2409, 100052, 7, '2021-11-15 16:04:23', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:04:23', '2021-11-15 16:04:23'),
(2410, 100052, 7, '2021-11-15 16:04:33', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:04:33', '2021-11-15 16:04:33'),
(2411, 100052, 7, '2021-11-15 16:04:43', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:04:43', '2021-11-15 16:04:43'),
(2412, 100052, 7, '2021-11-15 16:04:53', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:04:53', '2021-11-15 16:04:53'),
(2413, 100052, 7, '2021-11-15 16:05:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:05:22', '2021-11-15 16:05:22'),
(2414, 100052, 7, '2021-11-15 16:05:55', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:05:55', '2021-11-15 16:05:55'),
(2415, 100052, 7, '2021-11-15 16:06:47', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:06:47', '2021-11-15 16:06:47'),
(2416, 100052, 7, '2021-11-15 16:07:23', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:07:23', '2021-11-15 16:07:23'),
(2417, 100052, 7, '2021-11-15 16:07:50', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:07:50', '2021-11-15 16:07:50'),
(2418, 100052, 7, '2021-11-15 16:08:18', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:08:18', '2021-11-15 16:08:18'),
(2419, 100052, 7, '2021-11-15 16:08:35', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:08:35', '2021-11-15 16:08:35'),
(2420, 100052, 7, '2021-11-15 16:08:45', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:08:45', '2021-11-15 16:08:45'),
(2421, 100052, 7, '2021-11-15 16:08:55', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:08:55', '2021-11-15 16:08:55'),
(2422, 100052, 7, '2021-11-15 16:09:05', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:09:05', '2021-11-15 16:09:05'),
(2423, 100052, 7, '2021-11-15 16:09:15', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:09:15', '2021-11-15 16:09:15'),
(2424, 100052, 7, '2021-11-15 16:09:25', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:09:25', '2021-11-15 16:09:25'),
(2425, 100052, 7, '2021-11-15 16:09:35', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:09:35', '2021-11-15 16:09:35'),
(2426, 100052, 7, '2021-11-15 16:09:45', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:09:45', '2021-11-15 16:09:45'),
(2427, 100052, 7, '2021-11-15 16:10:03', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:10:03', '2021-11-15 16:10:03'),
(2428, 100052, 7, '2021-11-15 16:10:05', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:10:05', '2021-11-15 16:10:05'),
(2429, 100052, 7, '2021-11-15 16:10:19', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:10:19', '2021-11-15 16:10:19'),
(2430, 100052, 7, '2021-11-15 16:10:30', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:10:30', '2021-11-15 16:10:30'),
(2431, 100052, 7, '2021-11-15 16:10:39', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:10:39', '2021-11-15 16:10:39'),
(2432, 100052, 7, '2021-11-15 16:11:10', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:11:10', '2021-11-15 16:11:10'),
(2433, 100052, 7, '2021-11-15 16:11:19', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:11:19', '2021-11-15 16:11:19'),
(2434, 100052, 7, '2021-11-15 16:11:29', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:11:29', '2021-11-15 16:11:29'),
(2435, 100052, 7, '2021-11-15 16:12:52', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:12:52', '2021-11-15 16:12:52'),
(2436, 100052, 7, '2021-11-15 16:13:02', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:13:02', '2021-11-15 16:13:02'),
(2437, 100052, 7, '2021-11-15 16:13:12', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:13:12', '2021-11-15 16:13:12'),
(2438, 100052, 7, '2021-11-15 16:13:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:13:22', '2021-11-15 16:13:22'),
(2439, 100052, 7, '2021-11-15 16:13:32', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:13:32', '2021-11-15 16:13:32'),
(2440, 100052, 7, '2021-11-15 16:13:42', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:13:42', '2021-11-15 16:13:42'),
(2441, 100052, 7, '2021-11-15 16:13:52', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:13:52', '2021-11-15 16:13:52'),
(2442, 100052, 7, '2021-11-15 16:14:02', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:14:02', '2021-11-15 16:14:02'),
(2443, 100052, 7, '2021-11-15 16:14:33', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:14:33', '2021-11-15 16:14:33'),
(2444, 100052, 7, '2021-11-15 16:14:42', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:14:42', '2021-11-15 16:14:42'),
(2445, 100052, 7, '2021-11-15 16:14:52', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:14:52', '2021-11-15 16:14:52'),
(2446, 100052, 7, '2021-11-15 16:15:02', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:15:02', '2021-11-15 16:15:02'),
(2447, 100052, 7, '2021-11-15 16:15:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:15:22', '2021-11-15 16:15:22'),
(2448, 100052, 7, '2021-11-15 16:15:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:15:22', '2021-11-15 16:15:22'),
(2449, 100052, 7, '2021-11-15 16:15:32', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:15:32', '2021-11-15 16:15:32'),
(2450, 100052, 7, '2021-11-15 16:15:42', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:15:42', '2021-11-15 16:15:42'),
(2451, 100052, 7, '2021-11-15 16:15:52', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:15:52', '2021-11-15 16:15:52'),
(2452, 100052, 7, '2021-11-15 16:16:02', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:16:02', '2021-11-15 16:16:02'),
(2453, 100052, 7, '2021-11-15 16:16:12', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:16:12', '2021-11-15 16:16:12'),
(2454, 100052, 7, '2021-11-15 16:16:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:16:22', '2021-11-15 16:16:22'),
(2455, 100052, 7, '2021-11-15 16:16:45', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:16:45', '2021-11-15 16:16:45'),
(2456, 100052, 7, '2021-11-15 16:16:55', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:16:55', '2021-11-15 16:16:55'),
(2457, 100052, 7, '2021-11-15 16:17:05', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:17:05', '2021-11-15 16:17:05'),
(2458, 100052, 7, '2021-11-15 16:17:18', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:17:18', '2021-11-15 16:17:18'),
(2459, 100052, 7, '2021-11-15 16:17:25', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:17:25', '2021-11-15 16:17:25'),
(2460, 100052, 7, '2021-11-15 16:17:35', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:17:35', '2021-11-15 16:17:35'),
(2461, 100052, 7, '2021-11-15 16:17:45', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:17:45', '2021-11-15 16:17:45'),
(2462, 100052, 7, '2021-11-15 16:18:04', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:18:04', '2021-11-15 16:18:04'),
(2463, 100052, 7, '2021-11-15 16:18:14', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:18:14', '2021-11-15 16:18:14'),
(2464, 100052, 7, '2021-11-15 16:18:24', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:18:24', '2021-11-15 16:18:24'),
(2465, 100052, 7, '2021-11-15 16:18:34', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:18:34', '2021-11-15 16:18:34'),
(2466, 100052, 7, '2021-11-15 16:18:44', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:18:44', '2021-11-15 16:18:44'),
(2467, 100052, 7, '2021-11-15 16:18:54', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:18:54', '2021-11-15 16:18:54'),
(2468, 100052, 7, '2021-11-15 16:19:04', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:19:04', '2021-11-15 16:19:04'),
(2469, 100052, 7, '2021-11-15 16:19:14', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:19:14', '2021-11-15 16:19:14'),
(2470, 100052, 7, '2021-11-15 16:19:24', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:19:24', '2021-11-15 16:19:24'),
(2471, 100052, 7, '2021-11-15 16:19:44', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:19:44', '2021-11-15 16:19:44'),
(2472, 100052, 7, '2021-11-15 16:20:02', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:20:02', '2021-11-15 16:20:02'),
(2473, 100052, 7, '2021-11-15 16:20:12', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:20:12', '2021-11-15 16:20:12'),
(2474, 100052, 7, '2021-11-15 16:20:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:20:22', '2021-11-15 16:20:22'),
(2475, 100052, 7, '2021-11-15 16:20:32', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:20:32', '2021-11-15 16:20:32'),
(2476, 100052, 7, '2021-11-15 16:20:42', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:20:42', '2021-11-15 16:20:42'),
(2477, 100052, 7, '2021-11-15 16:21:13', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:21:13', '2021-11-15 16:21:13'),
(2478, 100052, 7, '2021-11-15 16:21:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:21:22', '2021-11-15 16:21:22'),
(2479, 100052, 7, '2021-11-15 16:21:32', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:21:32', '2021-11-15 16:21:32'),
(2480, 100052, 7, '2021-11-15 16:21:42', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:21:42', '2021-11-15 16:21:42'),
(2481, 100052, 7, '2021-11-15 16:22:13', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:22:13', '2021-11-15 16:22:13'),
(2482, 100052, 7, '2021-11-15 16:22:22', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:22:22', '2021-11-15 16:22:22'),
(2483, 100052, 7, '2021-11-15 16:22:32', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:22:32', '2021-11-15 16:22:32'),
(2484, 100052, 7, '2021-11-15 16:22:42', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:22:42', '2021-11-15 16:22:42'),
(2485, 100052, 7, '2021-11-15 16:22:52', '105.1378888', '11.5274311', 'Lvea Em, Lvea Em, KH', '2021-11-15 16:22:52', '2021-11-15 16:22:52'),
(2486, 100066, 1, '2022-01-11 13:39:16', '90.3700554', '23.837606', '667, Dhaka District, BD', '2022-01-11 13:39:16', '2022-01-11 13:39:16'),
(2487, 100066, 1, '2022-01-11 13:39:33', '90.3700608', '23.8376117', '667, Dhaka District, BD', '2022-01-11 13:39:33', '2022-01-11 13:39:33'),
(2488, 100066, 1, '2022-01-11 13:39:43', '90.3700519', '23.8376103', '667, Dhaka District, BD', '2022-01-11 13:39:43', '2022-01-11 13:39:43'),
(2489, 100066, 1, '2022-01-11 13:39:54', '90.3700558', '23.8376094', '667, Dhaka District, BD', '2022-01-11 13:39:54', '2022-01-11 13:39:54'),
(2490, 100066, 1, '2022-01-11 13:40:04', '90.3700502', '23.8376105', '667, Dhaka District, BD', '2022-01-11 13:40:04', '2022-01-11 13:40:04'),
(2491, 100066, 1, '2022-01-11 13:40:14', '90.3700575', '23.83761', '667, Dhaka District, BD', '2022-01-11 13:40:14', '2022-01-11 13:40:14'),
(2492, NULL, 1, '2022-01-11 13:40:24', '90.3700553', '23.8376098', '667, Dhaka District, BD', '2022-01-11 13:40:24', '2022-01-11 13:40:24'),
(2493, 100066, 1, '2022-01-11 13:40:39', '90.3700542', '23.8376111', '667, Dhaka District, BD', '2022-01-11 13:40:39', '2022-01-11 13:40:39'),
(2494, NULL, 1, '2022-01-11 13:40:54', '90.3700508', '23.8376116', '667, Dhaka District, BD', '2022-01-11 13:40:54', '2022-01-11 13:40:54'),
(2495, NULL, 1, '2022-01-11 13:41:05', '90.3700549', '23.8376082', '667, Dhaka District, BD', '2022-01-11 13:41:05', '2022-01-11 13:41:05'),
(2496, NULL, 1, '2022-01-11 13:41:14', '90.3700514', '23.8376096', '667, Dhaka District, BD', '2022-01-11 13:41:14', '2022-01-11 13:41:14'),
(2497, NULL, 1, '2022-01-11 13:41:25', '90.3701121', '23.8375842', '667, Dhaka District, BD', '2022-01-11 13:41:25', '2022-01-11 13:41:25'),
(2498, NULL, 1, '2022-01-11 13:41:34', '90.3700618', '23.8376081', '667, Dhaka District, BD', '2022-01-11 13:41:34', '2022-01-11 13:41:34'),
(2499, NULL, 1, '2022-01-11 13:41:44', '90.3700514', '23.8376085', '667, Dhaka District, BD', '2022-01-11 13:41:44', '2022-01-11 13:41:44'),
(2500, NULL, 1, '2022-01-11 13:41:55', '90.3700538', '23.8376136', '667, Dhaka District, BD', '2022-01-11 13:41:55', '2022-01-11 13:41:55'),
(2501, NULL, 1, '2022-01-11 13:42:04', '90.3700534', '23.8376111', '667, Dhaka District, BD', '2022-01-11 13:42:04', '2022-01-11 13:42:04'),
(2502, NULL, 1, '2022-01-11 13:42:14', '90.3700537', '23.8376065', '667, Dhaka District, BD', '2022-01-11 13:42:14', '2022-01-11 13:42:14'),
(2503, NULL, 1, '2022-01-11 13:42:25', '90.3700514', '23.83761', '667, Dhaka District, BD', '2022-01-11 13:42:25', '2022-01-11 13:42:25'),
(2504, NULL, 1, '2022-01-11 13:42:34', '90.3700514', '23.8376102', '667, Dhaka District, BD', '2022-01-11 13:42:34', '2022-01-11 13:42:34'),
(2505, NULL, 1, '2022-01-11 13:42:44', '90.3700471', '23.8376129', '667, Dhaka District, BD', '2022-01-11 13:42:44', '2022-01-11 13:42:44'),
(2506, NULL, 1, '2022-01-11 13:42:54', '90.3700557', '23.8376061', '667, Dhaka District, BD', '2022-01-11 13:42:54', '2022-01-11 13:42:54'),
(2507, NULL, 1, '2022-01-11 13:43:04', '90.37005', '23.8376139', '667, Dhaka District, BD', '2022-01-11 13:43:04', '2022-01-11 13:43:04'),
(2508, NULL, 1, '2022-01-11 13:43:14', '90.3700564', '23.8376118', '667, Dhaka District, BD', '2022-01-11 13:43:14', '2022-01-11 13:43:14'),
(2509, NULL, 1, '2022-01-11 13:43:24', '90.3700514', '23.8376143', '667, Dhaka District, BD', '2022-01-11 13:43:24', '2022-01-11 13:43:24'),
(2510, NULL, 1, '2022-01-11 13:43:34', '90.3700541', '23.8376088', '667, Dhaka District, BD', '2022-01-11 13:43:34', '2022-01-11 13:43:34'),
(2511, NULL, 1, '2022-01-11 13:43:44', '90.370053', '23.8376087', '667, Dhaka District, BD', '2022-01-11 13:43:44', '2022-01-11 13:43:44'),
(2512, NULL, 1, '2022-01-11 13:43:55', '90.3700513', '23.8376122', '667, Dhaka District, BD', '2022-01-11 13:43:55', '2022-01-11 13:43:55'),
(2513, NULL, 9, '2022-01-11 13:44:20', '90.3700528', '23.8376069', '667, Dhaka District, BD', '2022-01-11 13:44:20', '2022-01-11 13:44:20'),
(2514, 100067, 9, '2022-01-11 13:44:32', '90.3700511', '23.8376102', '667, Dhaka District, BD', '2022-01-11 13:44:32', '2022-01-11 13:44:32'),
(2515, 100067, 9, '2022-01-11 13:44:43', '90.3700524', '23.8376102', '667, Dhaka District, BD', '2022-01-11 13:44:43', '2022-01-11 13:44:43'),
(2516, NULL, 9, '2022-01-11 13:44:53', '90.3700528', '23.8376118', '667, Dhaka District, BD', '2022-01-11 13:44:53', '2022-01-11 13:44:53'),
(2517, NULL, 9, '2022-01-11 13:45:03', '90.3700561', '23.8376139', '667, Dhaka District, BD', '2022-01-11 13:45:03', '2022-01-11 13:45:03'),
(2518, NULL, 9, '2022-01-11 13:45:13', '90.3700533', '23.8376072', '667, Dhaka District, BD', '2022-01-11 13:45:13', '2022-01-11 13:45:13'),
(2519, NULL, 9, '2022-01-11 13:45:23', '90.3700522', '23.8376132', '667, Dhaka District, BD', '2022-01-11 13:45:23', '2022-01-11 13:45:23'),
(2520, NULL, 9, '2022-01-11 13:45:33', '90.370059', '23.8376096', '667, Dhaka District, BD', '2022-01-11 13:45:33', '2022-01-11 13:45:33'),
(2521, NULL, 9, '2022-01-11 13:45:43', '90.3700559', '23.8376112', '667, Dhaka District, BD', '2022-01-11 13:45:43', '2022-01-11 13:45:43'),
(2522, NULL, 9, '2022-01-11 13:45:53', '90.3700483', '23.8376125', '667, Dhaka District, BD', '2022-01-11 13:45:53', '2022-01-11 13:45:53'),
(2523, NULL, 9, '2022-01-11 13:46:03', '90.3700518', '23.8376122', '667, Dhaka District, BD', '2022-01-11 13:46:03', '2022-01-11 13:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_man_wallets`
--

INSERT INTO `delivery_man_wallets` (`id`, `delivery_man_id`, `collected_cash`, `created_at`, `updated_at`, `total_earning`, `total_withdrawn`, `pending_withdraw`) VALUES
(1, 1, 2039.26, '2021-08-21 20:20:32', '2022-01-11 13:40:42', 4506.18, 0.00, 0.00),
(2, 2, 360.68, '2021-08-21 23:15:03', '2021-10-17 00:19:51', 0.00, 0.00, 0.00),
(3, 4, 5534.08, '2021-08-22 01:38:54', '2021-08-22 09:24:42', 5817.14, 0.00, 0.00),
(4, 7, 99.75, '2021-08-23 03:03:01', '2021-08-23 03:03:01', 14171.77, 0.00, 0.00),
(5, 5, 13357.07, '2022-01-20 18:22:27', '2022-01-20 18:25:32', 7411.57, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `earning` tinyint(1) NOT NULL DEFAULT 1,
  `current_orders` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `auth_token`, `fcm_token`, `zone_id`, `created_at`, `updated_at`, `status`, `active`, `earning`, `current_orders`, `type`, `restaurant_id`, `application_status`) VALUES
(1, 'Ashek', 'Elahe', '+8801879762951', 'Ashek1221@gmail.com', '7t67r65798y', 'passport', '[]', '2021-08-21-61210509986a7.png', '$2y$10$0qveeDH6vT/Xhyli7DbJfOznz.9.dfmldA9VdrIO9pQ5NbA0a/.le', '42ngq2bQZX0cV77DYnaMgHN8DGCMC9Rtjk6q8lSTVPvnjIYtDxLixTB0gaQB6wgj6i9prANdSZ2LfidFolXaFfAsueszOkBrp1pTdqE97W6lx2ifKdAlDKI4', '@', 1, '2021-08-21 19:52:09', '2022-01-11 13:44:01', 1, 1, 1, 0, 'zone_wise', NULL, 'approved'),
(2, 'Md', 'Aziz', '+8801975758279', 'azizsarkerarc@gmail.com', '1234567', 'restaurant_id', '[\"2021-08-21-61211ffb4be79.png\"]', '2021-08-21-61211ffb4ac79.png', '$2y$10$uDa41SMoEL6aEss8RlSIUOV1tX6DtWaDBqJkG6I6URz1my/ns4oKG', 'CZaoB5Srq6RBUcRydjKO77HeknN4nqYjGzSs9n5iBQvymkxADRF9VHL86VKyNA5YqduVNxbzWgRrF8wIOhs2wkH4DkUipWnCErYLsl9IfRN4d1R6VEoKzNR1', 'eW431CbCR9a1jll3wp3MJM:APA91bGfDWIqKz7myOp0HS_zE9gx3nLrQl8pecWFInKTVnTBRIILC-61ZdIvFRUMrl9NTKy3160_V493Xgl3AhPJDH_iUfwY6LqOyebwEVPZYVOozYhBsdJcWOhgkjT6wu_wjxr9jlpP', 1, '2021-08-21 21:47:07', '2021-10-17 00:47:27', 1, 1, 0, 0, 'zone_wise', NULL, 'approved'),
(3, 'Mr.', 'Karim', '+8801729002129', 'karim@gmail.com', 'dh12645', 'passport', '[\"2021-08-21-61212021712e4.png\"]', '2021-08-21-6121202170757.png', '$2y$10$eZIJT7X04vw2W6FO01m/G.jT9dBTWQ5oAfh24E8iMYHX7MXjaCKou', 'SivSWaNT1XsLKE1ysIt5DRhqZNXaOHHk0BazeWIXSmbQGA6yYxT4Tmk8cdcPyuHlqqPaRoWRr2fkFdX5suxBoH2MnF6mkbKMa2JexOnap6HzSoGYY3KqYdx3', 'dH0LaQRcTaSvMT8nUDpIQW:APA91bGa67PF7IJAk91pqCXr-bL0fP1SOfQURZkckFO28wF__F3lKjf-7MNf0X15l1QIOtruLKilsGFB03Ti4ZmgBLz0F5OKZ7USpDwumyuLRGi5-WMH68R-yzvjX3Dacquocp2Ep3_y', 1, '2021-08-21 21:47:45', '2021-10-17 16:01:32', 1, 1, 1, 1, 'zone_wise', NULL, 'approved'),
(4, 'MD SULTAN', 'MAHAMUD', '+8801723019985', 'sunnysultan1640@gmail.com', '12345678', 'driving_license', '[\"2021-08-22-6121555b38388.png\"]', '2021-08-22-6121555b375aa.png', '$2y$10$tklpzAXzexS9vbVJ5dy1Iu537nVdMOl5Ilj2RgDf/djrOsWUnfGTC', 'GcswOxjqXXpb95cQ06a8EQyAyAGsnc4Ig75BKIwiqZifo2Gw76Keg8TsiOFKcU6AgvKOGqrABwIIAyZ0LYXvyXSmXTLyZ53OwcGaSxbNwYY4fpFzSTlIDYtD', 'fMMMpO27R9G7tyaqobL20L:APA91bFLg6nnoGFsIunWbit6z4pBfdHutWe1L5kwjvdHE2l4VZSXTYNR-KhGthuIo7C6drzVzsCnPhlJPWwb17KSyXrupiv1W8z3FKuUoNggCRX-soucBgCuKR_a5MPJ22V10y7Ueziw', 1, '2021-08-22 01:34:51', '2021-08-22 09:24:42', 1, 1, 1, 0, 'zone_wise', NULL, 'approved'),
(5, 'Demo Delivery', 'Man', '+8801700990099', 'demo@demo.com', '12345', 'nid', '[\"2021-08-22-61216cfbcb28d.png\"]', '2021-08-22-61216cfbca3a6.png', '$2y$10$RDrj9PvYTYDVpoAdVUYVm.UFyDDMBHvU09lflcyMelPmEyQmsVP7.', 'b8MdDJbetO4yXngWniTV1idzaJZuzBnGblZQC14oJJHNs6zn97ARVmMMvYPMbIp6pHyJqXH8fLybg5PbGBa2zXjem1ZMIEgmt0RPWQOHucJHFfvNb2Qr4Z9h', 'fMMMpO27R9G7tyaqobL20L:APA91bFLg6nnoGFsIunWbit6z4pBfdHutWe1L5kwjvdHE2l4VZSXTYNR-KhGthuIo7C6drzVzsCnPhlJPWwb17KSyXrupiv1W8z3FKuUoNggCRX-soucBgCuKR_a5MPJ22V10y7Ueziw', 1, '2021-08-22 03:15:39', '2022-01-20 18:22:27', 1, 1, 1, 0, 'zone_wise', NULL, 'approved'),
(7, 'Mahmah', 'Hamham', '+21620357951', 'mah@gmail.com', 'Hg13684', 'passport', '[]', '2021-11-15-61922dbf6aca0.png', '$2y$10$TJfVjFGQNbOLt5RcRx5cyunxzq0acTG1cuDMElZlbIc5C7VQJS8PC', 'z6FwJzbGgTCz6u93eizWPcFLwbuY1G5zKlG6O9r19u4o5meshDl9tGTo8xSPiJw0ZaYANZW6rEvZHgkvjvt02mW1ZrDB4MzKENfMXdWjffTuzNS6Pn1n3I6h', 'fP84jekWRrKC8KcZ8YeC5F:APA91bHGr9T8mTzjZXz7rIFIdGtaV3AL3s8grARQDqsm65_7MYSSXq2oN1CJmfii-xCbQlegQ3z3bAKLsLq_MLmWUc85d_-Ho7b849vkSKqky4_ZzXVnLP9QkvcAkEO6eJdg9kDtvDF5', 1, '2021-08-23 02:56:37', '2021-11-15 16:16:28', 1, 1, 1, 2, 'zone_wise', NULL, 'approved'),
(8, 'parvej', '123', '+8801712251697', 'parvej@gmail.com', '12345678', 'passport', '[]', '2021-10-17-616b1b6fdf50c.png', '$2y$10$FLcNC6PtRg6w9ixOn5WpYuB2vtSoodAiBYMW3fTZm/673c/tWUvSq', 'nPFN0qHlR5eJrJlu79JoxqqU7mvi3za8jOIgKfixsl8GRIJuuEZIqvQLVwDABxVsa6Apqig4rRJiVFyRhY0ye37fu7SRUaLOCbnt4ST4B26mJlHbbj4bCAe7', 'e-e1UhC9TgukNajkNDqKPS:APA91bFUcdeh4jjMI0vpOUUAzUMEskm1nTLzjOtLqQC_Vyab-NR-oqnEYFmZigmw-cVxI7kO0vLe-6RJxfLvTg_AoXC5bi8JwbLZ-ltf9gV3-j9hBjkhYbOLOAyjNBYpds5YCrS34j8-', 3, '2021-10-17 00:35:27', '2022-01-20 18:14:41', 1, 1, 1, 0, 'zone_wise', NULL, 'approved'),
(9, 'Ashek', 'Elahe', '+8801879762952', 'ashek@gmail.com', 'jhwegykwe', 'passport', '[]', '2022-01-11-61dd353b3ac6a.png', '$2y$10$1RgOunexB.N5Mt.3Efl71emCCmKtZlmTpTxeOMwxHvAaxTRJdTT.q', '17lfAXw1XuOWTExXT4V9Yjl39I6SVDiHcvzE49lnvBCynjCEa67AkFrZXBwz2am8FLM6JsthVng319wE86YGCQq6H9roGQUUE6GR26SuNrvrPBdQ3ltuO3eE', 'f1pDZku3RQaliO3R-eLry-:APA91bEAC-t8gnP67Nw4pofdMNAJrQiIegXco_Wjm6FgtPZjMkLLe1eJuG8e0t3H787OjQATB1WSdtCqdmrNOj4tkWK4BarpvtFnOG50Ghv_5Cte7H40Tp1dyK7UD-Dsiy9c5G8-bLSW', NULL, '2022-01-11 13:43:55', '2022-01-11 13:54:34', 1, 0, 0, 0, 'restaurant_wise', 2, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `start_date`, `end_date`, `start_time`, `end_time`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, '2021-08-20', '2023-02-21', '00:00:00', '23:59:00', 150.00, 100.00, 15.00, 'percent', 2, NULL, NULL),
(2, '2021-12-05', '2021-12-31', '00:00:00', '23:59:00', 1000.00, 500.00, 15.00, 'percent', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `d_m_reviews`
--

INSERT INTO `d_m_reviews` (`id`, `delivery_man_id`, `user_id`, `order_id`, `comment`, `attachment`, `rating`, `created_at`, `updated_at`, `status`) VALUES
(1, 4, 15, 100032, 'cool', '[]', 5, '2021-08-22 09:25:25', '2021-08-22 09:25:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_roles`
--

INSERT INTO `employee_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(2, 'Manager', '[\"food\",\"order\",\"restaurant_setup\",\"addon\",\"wallet\",\"bank_info\",\"employee\",\"my_shop\",\"custom_role\",\"campaign\",\"reviews\",\"pos\"]', 1, '2022-01-20 18:41:33', '2022-01-20 18:41:37', 2);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`) VALUES
(1, 'Mutton Biriyani', 'This mutton biryani recipe has layers of mutton and saffron-milk-infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon, cloves, jaiphal, and javitri along with chilies, rose water, kewda, and saffron cooked with succulent mutton pieces.', '2021-08-21-611ff39525320.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[{\"type\":\"1:3\",\"price\":250},{\"type\":\"1:5\",\"price\":420}]', '[]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"1:3\",\" 1:5\"]}]', 250.00, 0.00, 'percent', 10.00, 'percent', '00:03:00', '23:56:00', 0, 1, 1, '2021-08-21 00:25:25', '2021-08-22 02:35:45', 0),
(2, 'Hyderabadi Mutton Biriyani', 'Hyderabadi Biryani is characteristically distinct. The aroma, taste, tender meat, the Zaffran, everything gives it a distinguished appearance. ... Yoghurt makes the meat tender, lemon tangy, fried onions add a crispy sweet taste, and Hyderabadi spices make it hot.', '2021-08-21-612007ca5affc.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 20.00, 'amount', '00:01:00', '23:59:00', 0, 1, 1, '2021-08-21 01:51:38', '2021-08-22 02:35:15', 0),
(3, 'Burger Combo', 'A combo Burger.', '2021-08-21-6120ad6b86273.png', 24, '[{\"id\":\"5\",\"position\":1},{\"id\":\"24\",\"position\":2}]', '[{\"type\":\"Small\",\"price\":80},{\"type\":\"Big\",\"price\":120}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Big\"]}]', 80.00, 0.00, 'percent', 0.00, 'percent', '00:01:00', '23:59:00', 0, 1, 4, '2021-08-21 13:38:19', '2021-08-21 13:54:22', 1),
(4, 'Crispy Burger', 'A Crispy chicken burger with delicious cheese.', '2021-08-21-6120b0748f79c.png', 25, '[{\"id\":\"5\",\"position\":1},{\"id\":\"25\",\"position\":2}]', '[{\"type\":\"S\",\"price\":180},{\"type\":\"M\",\"price\":210},{\"type\":\"L\",\"price\":240}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"M\",\"L\"]}]', 180.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '23:59:00', 0, 1, 4, '2021-08-21 13:51:16', '2021-08-21 13:51:16', 0),
(5, 'Toll House Meal', 'Made better with some cookie baking tips and tricks I’ve learned over the years! What does that mean, exactly? Sure, you can go ahead and make the original Toll House chocolate chip cookie recipe and make some *pretty good* cookies.', '2021-08-21-6120b1f136c8d.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 40.00, 0.00, 'percent', 0.00, 'percent', '00:01:00', '23:56:00', 0, 1, 5, '2021-08-21 13:57:37', '2021-08-22 02:40:04', 0),
(6, 'Chicago Pizza', 'Chicago pizza, also commonly referred to as deep-dish pizza, gets its name from the city it was invented in. During early 1900.', '2021-08-21-6120bb67e9382.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"8inches\",\"price\":150},{\"type\":\"12inches\",\"price\":200},{\"type\":\"16inches\",\"price\":250}]', '[\"6\",\"7\",\"8\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"8 inches\",\"12 inches\",\"16 inches\"]}]', 150.00, 0.00, 'percent', 10.00, 'amount', '11:00:00', '20:15:00', 0, 1, 14, '2021-08-21 14:37:59', '2021-08-21 14:37:59', 0),
(7, 'Baked Breaded Chicken', 'Baked Breaded Chicken is a mid-week dinner dream. Juicy, tender chicken, covered with a golden crunchy, delicious outer coating of bread crumbs.', '2021-08-21-6120c504a9cab.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[{\"type\":\"2pcs\",\"price\":200},{\"type\":\"4pcs\",\"price\":350},{\"type\":\"6pcs\",\"price\":500}]', '[\"7\",\"8\"]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"2pcs\",\"4pcs\",\"6pcs\"]}]', 200.00, 0.00, 'percent', 10.00, 'percent', '11:17:00', '18:18:00', 0, 1, 14, '2021-08-21 15:19:00', '2021-08-21 15:19:00', 0),
(8, 'Chicken Tikka Masala', 'THIS FULL-FLAVORED DISH IS CREAMY AND SAVORY AT THE SAME TIME. THE RICHNESS OF THE CURRY PASTE IS BALANCED OUT PERFECTLY BY THE ZESTY GARLIC AND CREAMY YOGURT AND CREAM.', '2021-08-21-6120c8252fbe6.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[]', '[]', '[]', 7.00, 0.00, 'percent', 0.00, 'percent', '02:00:00', '12:20:00', 0, 1, 12, '2021-08-21 15:32:21', '2021-08-21 15:32:21', 0),
(10, 'Lemon Pastry', 'The pastry is a dough of flour, water, and shortening (solid fats, including butter or lard) that may be savory.', '2021-08-21-6120c9b936fcc.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 110.00, 0.00, 'percent', 0.00, 'percent', '02:37:00', '18:37:00', 0, 1, 1, '2021-08-21 15:39:05', '2021-08-21 15:39:05', 0),
(11, 'Log Ice Cream', 'This ice cream Yule log recipe is a must for simple and tasty Christmas celebrations!', '2021-08-21-6120cb42cb674.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[{\"type\":\"275ml\",\"price\":275},{\"type\":\"400ml\",\"price\":400},{\"type\":\"650ml\",\"price\":550}]', '[]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"275ml\",\"400ml\",\"650ml\"]}]', 275.00, 0.00, 'percent', 5.00, 'percent', '05:42:00', '19:42:00', 0, 1, 1, '2021-08-21 15:45:38', '2021-08-21 15:45:38', 0),
(12, 'Masala poori', 'GARLIC CHICKEN TIKKA PURI Chicken tikka and garlic mixed in a special paste with a puri.', '2021-08-21-6120cbd7cd675.png', 7, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 2.00, 0.00, 'percent', 5.00, 'percent', '00:10:00', '23:30:00', 0, 1, 2, '2021-08-21 15:48:07', '2021-08-21 15:48:07', 0),
(13, 'Sliced Bread', 'Sliced bread is a loaf of bread that has been pre-sliced with a machine and packaged for convenience, as opposed to the consumer cutting it', '2021-08-21-6120cc4a897b1.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[{\"type\":\"small\",\"price\":30},{\"type\":\"medium\",\"price\":40},{\"type\":\"large\",\"price\":49.97999999999999687361196265555918216705322265625}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\"medium\",\"large\"]}]', 30.00, 0.00, 'percent', 0.00, 'percent', '03:49:00', '16:49:00', 0, 1, 1, '2021-08-21 15:50:02', '2021-08-21 15:50:02', 0),
(14, 'CROISSANTS', 'Croissants are perfect just as they are, but if you’d like to dress them up a little bit, they can be spread with all sorts of yummy toppings.', '2021-08-21-6120ccf4496ea.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[{\"type\":\"small\",\"price\":50},{\"type\":\"medium\",\"price\":70},{\"type\":\"large\",\"price\":90}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}]', 50.00, 0.00, 'percent', 5.00, 'percent', '00:02:00', '23:57:00', 0, 1, 1, '2021-08-21 15:52:52', '2021-08-22 02:36:24', 0),
(15, 'Pepperoni Pizza', 'Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper', '2021-08-21-6120cd73cd49c.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":399},{\"type\":\"Medium\",\"price\":435},{\"type\":\"Large\",\"price\":550}]', '[\"16\",\"17\",\"18\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\",\"Large\"]}]', 399.00, 0.00, 'percent', 49.00, 'amount', '01:30:00', '09:30:00', 0, 1, 13, '2021-08-21 15:54:59', '2021-08-21 15:54:59', 0),
(16, 'Doughnut', 'A doughnut or donut is a type of leavened fried dough.It is popular in many countries and is prepared in various forms.', '2021-08-21-6120cda9b9b27.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[{\"type\":\"small\",\"price\":60},{\"type\":\"meduim\",\"price\":80},{\"type\":\"large\",\"price\":100}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" meduim\",\" large\"]}]', 60.00, 0.00, 'percent', 0.00, 'percent', '00:02:00', '23:57:00', 0, 1, 1, '2021-08-21 15:55:53', '2021-08-22 02:37:45', 0),
(17, 'Chocolate Sprinkle Donuts', 'Chocolate sprinkle donuts make the most fun breakfast treat and they’re easy to whip up since they’re baked instead of fried!', '2021-08-21-6120ce51dd6f2.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[{\"type\":\"small\",\"price\":120},{\"type\":\"medium\",\"price\":170},{\"type\":\"large\",\"price\":220}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\"medium\",\"large\"]}]', 120.00, 0.00, 'percent', 0.00, 'percent', '02:58:00', '14:58:00', 0, 1, 1, '2021-08-21 15:58:41', '2021-08-21 15:58:41', 0),
(19, 'Chicken Coconut Soup', 'Known as Tom Kha Ghai, this coconut soup is one we are always craving. The creamy coconut paired with ginger and lime gives this soup it\'s unique and delicious flavor.', '2021-08-21-6120cf263b7e2.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 5.00, 'percent', '00:01:00', '23:57:00', 0, 1, 1, '2021-08-21 16:02:14', '2021-08-22 02:37:13', 0),
(20, 'Samosa', 'Fried or baked pastry with a savory filling like spiced potatoes, onions, peas, chicken and other meats, or lentils.', '2021-08-21-6120cf63b006e.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 2.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '20:30:00', 0, 1, 1, '2021-08-21 16:03:15', '2021-08-21 16:03:15', 0),
(21, 'COCONUT CURRY NOODLE SOUP', 'This Thai inspired Coconut Curry Noodle Soup is loaded with vegetables and made with a creamy coconut red curry broth and pad Thai rice noodles', '2021-08-21-6120cfe8bbc1f.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 170.00, 0.00, 'percent', 0.00, 'percent', '06:04:00', '18:04:00', 0, 1, 1, '2021-08-21 16:05:28', '2021-08-21 16:05:28', 0),
(22, 'Cheese Pizza', 'It should be no shocker that a classic is the statistical favorite. Cheese pizza is one of the most popular choices', '2021-08-21-6120cff2202de.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Medium\",\"price\":299},{\"type\":\"Large\",\"price\":477}]', '[\"17\",\"18\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Medium\",\"Large\"]}]', 299.00, 0.00, 'percent', 0.00, 'percent', '02:00:00', '08:00:00', 0, 1, 13, '2021-08-21 16:05:38', '2021-08-21 16:05:38', 0),
(23, 'Spicy Thai Basil Chicken', 'The sauce actually acts as a glaze as the chicken mixture cooks over high heat. The recipe works best if you chop or grind your own chicken and have all ingredients prepped before you start cooking.', '2021-08-21-6120d12310b48.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 5.00, 'percent', '01:09:00', '19:09:00', 0, 1, 1, '2021-08-21 16:10:43', '2021-08-21 16:10:43', 0),
(24, 'Meat Pizza', 'If you’re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.', '2021-08-21-6120d1396d3d8.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":310},{\"type\":\"Medium\",\"price\":400}]', '[\"18\",\"20\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\"]}]', 310.00, 0.00, 'percent', 11.00, 'percent', '03:30:00', '08:30:00', 0, 1, 13, '2021-08-21 16:11:05', '2021-08-21 16:11:05', 0),
(25, 'Vegan Tofu Tikka Masala', 'Non-dairy version of India\'s most popular curry. Our vegan version is full of robust tomato, toasted cumin, and bright lemon, and enriched with a touch of coconut cream.', '2021-08-21-6120d165c4bb5.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[]', '[]', '[]', 20.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '13:25:00', 0, 1, 7, '2021-08-21 16:11:49', '2021-08-21 16:11:49', 0),
(26, 'BBQ Chicken Pizza', 'If you love BBQ chicken and you love pizza, why not put them together? This has long been a cult favorite of sports fans and college kids', '2021-08-21-6120d1f57eb77.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":210},{\"type\":\"Large\",\"price\":450}]', '[\"16\",\"19\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}]', 210.00, 0.00, 'percent', 39.00, 'amount', '02:15:00', '07:15:00', 0, 1, 13, '2021-08-21 16:14:13', '2021-08-21 16:14:13', 0),
(27, 'Indian Tofu Curry', 'A soy-based meat substitute seems like an ideal addition to Indian cuisine. Soybeans grow in many parts of India so it\'s not a problem of climate or terrain', '2021-08-21-6120d2a9b9ef3.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 7.00, 'percent', '00:10:00', '13:25:00', 0, 1, 7, '2021-08-21 16:17:13', '2021-08-21 16:17:13', 0),
(28, 'FRIED RICE', 'This Chinese-inspired fried rice recipe is my absolute fave. It’s quick and easy to make, customizable with any of your favorite mix-ins, and so irresistibly delicious.', '2021-08-21-6120d2bbcd93d.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[{\"type\":\"half\",\"price\":180},{\"type\":\"quater\",\"price\":240},{\"type\":\"full\",\"price\":350}]', '[]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"half\",\"quater\",\"full\"]}]', 240.00, 0.00, 'percent', 10.00, 'percent', '11:20:00', '20:16:00', 0, 1, 8, '2021-08-21 16:17:31', '2021-08-21 16:17:31', 0),
(29, 'THAI RED CURRY NOODLE SOUP', 'It’s so cozy, it’s so comforting, and it’s so fragrant with all the cilantro, basil and lime juice. Although I always add a little bit of extra lime juice to my bowl for that extra zesty kick!', '2021-08-21-6120d38c83375.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 90.00, 0.00, 'percent', 0.00, 'percent', '11:40:00', '21:20:00', 0, 1, 8, '2021-08-21 16:21:00', '2021-08-21 16:21:00', 0),
(30, 'BBQ Chicken Pizza', 'If you love BBQ chicken and you love pizza, why not put them together? This has long been a cult favorite of sports fans and college kids.', '2021-08-21-6120d392925d3.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":230},{\"type\":\"Medium\",\"price\":325},{\"type\":\"Large\",\"price\":470}]', '[\"6\",\"8\",\"26\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\",\"Large\"]}]', 230.00, 0.00, 'percent', 0.00, 'percent', '10:30:00', '22:30:00', 0, 1, 14, '2021-08-21 16:21:06', '2021-08-21 16:21:06', 0),
(31, 'Pepperoni Pizza', 'Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper', '2021-08-21-6120d43bcc2ad.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Medium\",\"price\":360},{\"type\":\"Large\",\"price\":620}]', '[\"6\",\"7\",\"9\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Medium\",\"Large\"]}]', 360.00, 0.00, 'percent', 15.00, 'percent', '11:00:00', '19:00:00', 0, 1, 14, '2021-08-21 16:23:55', '2021-08-21 16:23:55', 0),
(32, 'Spicy Thai Green Papaya Salad', 'n a medium non-reactive mixing or salad bowl, combine the papayas, carrots, mint leaves and chopped cilantro.', '2021-08-21-6120d502c3fda.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 10.00, 'percent', '12:26:00', '21:26:00', 0, 1, 8, '2021-08-21 16:27:14', '2021-08-21 16:27:14', 0),
(33, 'Margherita Pizza', 'Deceptively simple, the Margherita pizza is made with basil, fresh mozzarella, and tomatoes.', '2021-08-21-6120d55a3fc61.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":199},{\"type\":\"Medium\",\"price\":325}]', '[\"6\",\"26\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\"]}]', 199.00, 0.00, 'percent', 0.00, 'percent', '12:00:00', '22:00:00', 0, 1, 14, '2021-08-21 16:28:42', '2021-08-21 16:28:42', 0),
(34, 'Spicy Shrimp Soup', 'Spicy Shrimp Soup is a copycat recipe from our favorite Ecuadorian restaurant. Spicy, garlicky, and comforting, you will eat bowl after bowl of this easy soup recipe!', '2021-08-21-6120d5edc1f54.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[{\"type\":\"small\",\"price\":250},{\"type\":\"medium\",\"price\":350},{\"type\":\"large\",\"price\":450}]', '[]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"small\",\"medium\",\"large\"]}]', 250.00, 0.00, 'percent', 10.00, 'percent', '04:30:00', '16:30:00', 0, 1, 11, '2021-08-21 16:31:09', '2021-08-21 16:31:09', 0),
(35, 'Thai Stir Fried Noodles', 'The popular Thai stir-fried noodles are straight from the streets of Thailand are made at home! While Pad Thai is sweeter and nuttier, balanced with a touch of sour and a wonderful chargrilled flavor which you can create at home!', '2021-08-21-6120d677c1c7b.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 120.00, 0.00, 'percent', 0.00, 'percent', '06:32:00', '20:32:00', 0, 1, 11, '2021-08-21 16:33:27', '2022-01-20 18:07:04', 2),
(36, 'Biryani', 'A mixed rice dish originating among the Muslims of the Indian subcontinent. It is made with Indian spices, rice, and meat usually that of chicken, goat, lamb, prawn, fish, and sometimes, in addition, eggs or vegetables such as potatoes in certain regional varieties.', '2021-08-21-6120d6ac5111e.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[]', '[]', '[]', '[]', 75.00, 0.00, 'percent', 10.00, 'percent', '00:30:00', '13:00:00', 0, 1, 7, '2021-08-21 16:34:20', '2021-08-21 16:34:20', 0),
(37, 'Buffalo Pizza', 'This Buffalo chicken pizza recipe is A MUST for all Buffalo lovers', '2021-08-21-6120d6c510166.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Medium\",\"price\":280},{\"type\":\"Large\",\"price\":430}]', '[\"6\",\"8\",\"25\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Medium\",\"Large\"]}]', 280.00, 0.00, 'percent', 45.00, 'amount', '10:00:00', '18:00:00', 0, 1, 14, '2021-08-21 16:34:45', '2021-08-21 16:34:45', 0),
(38, 'Linguine Pasta', 'Long, thin, flat linguine noodles fall somewhere between the thickness of fettuccine and spaghetti', '2021-08-21-6120d74188e55.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"11\",\"25\"]', '[]', '[]', 195.00, 0.00, 'percent', 0.00, 'percent', '15:00:00', '23:00:00', 0, 1, 14, '2021-08-21 16:36:49', '2021-08-21 16:36:49', 0),
(39, 'Cheese Pizza', 'Yearning for a cheesy delight? Then we have an easy cheese pizza recipe to add soul to your weekend binging!', '2021-08-21-6120d7be4e72b.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[{\"type\":\"10inch\",\"price\":220},{\"type\":\"12inch\",\"price\":260},{\"type\":\"14inch\",\"price\":279.970000000000027284841053187847137451171875}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"10inch\",\"12inch\",\"14inch\"]}]', 220.00, 0.00, 'percent', 10.00, 'percent', '18:36:00', '21:36:00', 0, 1, 10, '2021-08-21 16:38:54', '2021-08-21 16:38:54', 0),
(40, 'Chole Kulche', 'One of the best Indian snacks cum breakfast options out there is Chole kulche! Originated from the Punjab region, this dish is loved all over the country and is now making its way in the west too.', '2021-08-21-6120d821bbef1.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 130.00, 0.00, 'percent', 0.00, 'percent', '18:40:00', '21:40:00', 0, 1, 10, '2021-08-21 16:40:33', '2021-08-21 16:40:33', 0),
(41, 'Fusilli Pasta', 'Fusilli gives any dish an unexpected twist with its spiral shape', '2021-08-21-6120d82e9a806.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"11\"]', '[]', '[]', 250.00, 0.00, 'percent', 20.00, 'percent', '10:00:00', '18:00:00', 0, 1, 14, '2021-08-21 16:40:46', '2021-08-21 16:40:46', 0),
(42, 'MASALA FISH FRY IN OIL', 'This Masala fish fry is made with an oil marinade. The masalas are mixed in oil and that I think is a game changer. The fish gets seasoned well and turns out super flavorful.', '2021-08-21-6120d8a6eed20.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 60.00, 0.00, 'percent', 0.00, 'percent', '18:42:00', '21:42:00', 0, 1, 10, '2021-08-21 16:42:46', '2021-08-21 16:42:46', 0),
(43, 'Steamed rice /chicken curry', 'Chicken drumsticks, basmati rice, brown vinegar, buttermilk, onions, ginger', '2021-08-21-6120d8af14e47.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[]', '[]', '[]', 35.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '13:15:00', 0, 1, 7, '2021-08-21 16:42:55', '2021-08-21 16:42:55', 0),
(44, 'Penne Pasta', 'Penne is a classic pasta type and pantry staple.', '2021-08-21-6120d8f31563b.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '19:00:00', 0, 1, 14, '2021-08-21 16:44:03', '2021-08-21 16:44:03', 0),
(45, 'Fettuccine Pasta', 'Flat, ribbon-like shape of fettuccine makes it a sturdy pasta that can hold up to a variety of sauces', '2021-08-21-6120d9be15172.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"11\",\"25\"]', '[]', '[]', 230.00, 0.00, 'percent', 30.00, 'amount', '10:00:00', '16:00:00', 0, 1, 14, '2021-08-21 16:47:26', '2021-08-21 17:52:25', 0),
(46, 'Supreme Pizza', 'When you can’t decide which toppings to get, it’s time for the supreme pizza.', '2021-08-21-6120db00b7352.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Medium\",\"price\":300},{\"type\":\"Large\",\"price\":499}]', '[\"17\",\"18\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Medium\",\"Large\"]}]', 300.00, 0.00, 'percent', 33.00, 'amount', '03:00:00', '09:00:00', 0, 1, 13, '2021-08-21 16:52:48', '2021-08-21 16:52:48', 0),
(47, 'Hawaiian Pizza', 'Pineapple might not be the first thing that comes to mind when you think pizza.', '2021-08-21-6120dc06c58cc.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":229},{\"type\":\"Large\",\"price\":440}]', '[\"17\",\"18\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}]', 229.00, 0.00, 'percent', 9.00, 'percent', '01:00:00', '10:00:00', 0, 1, 13, '2021-08-21 16:57:10', '2021-08-21 16:57:10', 0),
(48, 'Paneer Tikka Masala', 'Paneer tikka masala is an Indian dish of marinated paneer cheese served in a spiced gravy. It is a vegetarian alternative to chicken tikka masala.', '2021-08-21-6120dcc6e012c.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[\"12\"]', '[]', '[]', 35.00, 0.00, 'percent', 5.00, 'percent', '00:15:00', '20:15:00', 0, 1, 1, '2021-08-21 17:00:22', '2021-08-21 17:00:22', 0),
(49, 'Fish Fry', 'we have shallow fried the fish slices to make it healthy and flavored it with tomato ketchup for an extra taste. You can make this as a side dish with your everyday meals.', '2021-08-21-6120de88ecdf4.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 60.00, 0.00, 'percent', 0.00, 'percent', '18:07:00', '21:07:00', 0, 1, 10, '2021-08-21 17:07:52', '2021-08-21 17:07:52', 0),
(50, 'BBQ chicken Noodles', 'BBQ chicken noodles is one of the most favorite noddles.', '2021-08-21-6120df191fc99.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[\"27\"]', '[]', '[]', 210.00, 0.00, 'percent', 0.00, 'percent', '17:00:00', '23:00:00', 0, 1, 10, '2021-08-21 17:10:17', '2021-08-21 17:10:17', 0),
(51, 'Chicken and Mushroom Noodles', 'Chicken and garlicky mushrooms pair perfectly and it\'s so yummy.', '2021-08-21-6120e08d98c2a.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[\"28\"]', '[]', '[]', 200.00, 0.00, 'percent', 19.00, 'percent', '18:00:00', '22:15:00', 0, 1, 10, '2021-08-21 17:16:29', '2021-08-21 17:16:29', 0),
(52, 'French Fries', 'French fries, chips, finger chips, or French-fried potatoes are batonnet or allumette-cut deep-fried potatoes, originating from either Belgium or France.', '2021-08-21-6120e0be5e830.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 50.00, 0.00, 'percent', 0.00, 'percent', '18:15:00', '21:15:00', 0, 1, 11, '2021-08-21 17:17:18', '2021-08-21 17:17:18', 0),
(53, 'Grilled BBQ Steak', 'Try our Grilled BBQ Steak for a sweet and spicy dish. Combine tangy BBQ sauce, orange marmalade and cinnamon to give our Grilled BBQ Steak some kick.', '2021-08-21-6120e14e324c6.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 180.00, 0.00, 'percent', 0.00, 'percent', '18:18:00', '21:18:00', 0, 1, 11, '2021-08-21 17:19:42', '2021-08-21 17:19:42', 0),
(54, 'Fry Noodles', 'Fried noodles are common throughout East Asia, Southeast Asia and South Asia.', '2021-08-21-6120e1a9b4dc6.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[\"29\"]', '[]', '[]', 225.00, 0.00, 'percent', 25.00, 'amount', '19:00:00', '22:00:00', 0, 1, 10, '2021-08-21 17:21:13', '2021-08-21 17:21:13', 0),
(55, 'Mushroom noodles', 'Mushroom Noodles recipe is made with the goodness of sliced mushrooms and fresh noodles which can be relished by many. It tastes best when had with tomato sauce or any other sauce.', '2021-08-21-6120e2b1507bb.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[\"27\",\"28\",\"29\"]', '[]', '[]', 270.00, 0.00, 'percent', 20.00, 'amount', '17:30:00', '22:30:00', 0, 1, 10, '2021-08-21 17:25:37', '2022-01-20 18:25:32', 1),
(56, 'Idli', 'Idli or idly are a type of savoury rice cake, originating from the Indian subcontinent, popular as breakfast foods in Southern India and in Sri Lanka.', '2021-08-21-6120e3a81ad40.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '00:18:00', '23:56:00', 0, 1, 2, '2021-08-21 17:29:44', '2021-08-22 02:34:01', 0),
(57, 'Steak Kebabs', 'Steak Kebabs are the one of the tastiest summertime dinners! These are layered with juicy tender pieces of flavorful, marinated beef and colorful quartet of tender veggies. An exciting recipe the whole family can agree on!', '2021-08-21-6120e44ea58c5.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 0.00, 'percent', '06:31:00', '17:31:00', 0, 1, 2, '2021-08-21 17:32:30', '2021-08-21 17:32:30', 0),
(58, 'Steak Kebabs', 'Steak Kebabs are the one of the tastiest summertime dinners! These are layered with juicy tender pieces of flavorful, marinated beef and colorful quartet of tender veggies. An exciting recipe the whole family can agree on!', '2021-08-21-6120e4523fa9d.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 0.00, 'percent', '00:31:00', '23:35:00', 0, 1, 2, '2021-08-21 17:32:34', '2021-10-17 00:44:54', 1),
(59, 'FRIED RICE', 'This Chinese-inspired fried rice recipe is my absolute fave. It’s quick and easy to make, customizable with any of your favorite mix-ins, and so irresistibly delicious.', '2021-08-21-6120e4dcd5194.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[{\"type\":\"half\",\"price\":120},{\"type\":\"quater\",\"price\":150},{\"type\":\"full\",\"price\":199.960000000000007958078640513122081756591796875}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"half\",\"quater\",\"full\"]}]', 120.00, 0.00, 'percent', 0.00, 'percent', '05:33:00', '18:33:00', 0, 1, 2, '2021-08-21 17:34:52', '2021-08-21 17:34:52', 0),
(60, 'Bihari kabab', 'A Pakistani BBQ delicacy, Bihari Kabab are thin strips of beef marinated in a spicy homemade masala and finished off with coal smoke.', '2021-08-21-6120e529c9361.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[]', '[]', '[]', 25.00, 0.00, 'percent', 5.00, 'percent', '10:10:00', '22:30:00', 0, 1, 8, '2021-08-21 17:36:09', '2021-08-21 17:36:09', 0),
(61, 'Pepperoni Pizza', 'Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper', '2021-08-21-6120eb4af0745.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":310},{\"type\":\"Medium\",\"price\":425},{\"type\":\"Large\",\"price\":550}]', '[\"2\",\"31\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\" Medium\",\" Large\"]}]', 310.00, 0.00, 'percent', 10.00, 'amount', '00:15:00', '23:45:00', 0, 1, 2, '2021-08-21 17:36:58', '2021-10-17 00:45:03', 1),
(62, 'Thai Fried Rice', 'An authentic recipe for Thai fried rice – just like you get in Thailand and at Thai restaurants! Make this with shrimp/prawns, chicken or any protein you wish.', '2021-08-21-6120e5955e1d1.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[{\"type\":\"Half\",\"price\":1},{\"type\":\"Quater\",\"price\":1},{\"type\":\"Full\",\"price\":1}]', '[]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"Half\",\"Quater\",\"Full\"]}]', 160.00, 0.00, 'percent', 0.00, 'percent', '05:37:00', '21:37:00', 0, 1, 2, '2021-08-21 17:37:57', '2021-08-21 17:37:57', 0),
(63, 'Grill Kebab', 'The kebab is made of finely ground mince goat meat with spices and then charcoal grilled on a skewer.', '2021-08-21-6120e5c5e5437.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[]', '[]', '[]', 35.00, 0.00, 'percent', 0.00, 'percent', '10:10:00', '22:25:00', 0, 1, 8, '2021-08-21 17:38:45', '2021-08-21 17:38:45', 0),
(64, 'Cheese Pizza', 'It should be no shocker that a classic is the statistical favorite. Cheese pizza is one of the most popular choices', '2021-08-21-6120e61452e2b.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":250},{\"type\":\"Medium\",\"price\":350}]', '[\"31\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\" Medium\"]}]', 250.00, 0.00, 'percent', 7.00, 'percent', '00:01:00', '23:57:00', 0, 1, 2, '2021-08-21 17:40:04', '2021-08-22 02:32:40', 1),
(65, 'Boti Kebab', 'Boti kebab is a variety of Indian kebab consisting of chunks of meat (lamb, mutton, chicken, or beef) that are soaked in a mixture of yogurt, garlic, ginger, chilis, papaya, and spices such as garam masala, chili powder, and cumin.', '2021-08-21-6120e65da6c63.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[]', '[]', '[]', 15.00, 0.00, 'percent', 5.00, 'percent', '10:15:00', '22:30:00', 0, 1, 8, '2021-08-21 17:41:17', '2021-08-21 17:41:17', 0),
(66, 'Chicken Shawarma', 'Robust and flavorful easy Chicken Shawarma at home! Beats takeout any day of the week, and is perfect for work or school lunch. Plus, my creamy white garlic sauce for Chicken Shawarma adds a bright creamy tang.', '2021-08-21-6120e6767300f.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[{\"type\":\"big\",\"price\":210},{\"type\":\"normal\",\"price\":310},{\"type\":\"medium\",\"price\":410}]', '[\"2\",\"30\",\"32\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"big\",\"normal\",\"medium\"]}]', 210.00, 0.00, 'percent', 12.00, 'percent', '05:40:00', '20:40:00', 0, 1, 2, '2021-08-21 17:41:42', '2021-08-21 17:41:42', 0),
(67, 'Meat Pizza', 'If you’re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.', '2021-08-21-6120e6dadf410.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":400},{\"type\":\"Large\",\"price\":750}]', '[\"31\",\"34\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}]', 400.00, 0.00, 'percent', 30.00, 'amount', '02:00:00', '22:00:00', 0, 1, 2, '2021-08-21 17:43:22', '2021-08-21 22:46:14', 1),
(68, 'grilled lemon herb mediterranean chicken salad', 'This Grilled Lemon Herb Mediterranean Chicken Salad recipe is as close to perfect as you can get! Full of Mediterranean flavours: olives, tomatoes, cucumber, avocados, and chicken for a complete meal in a salad bowl!', '2021-08-21-6120e72547646.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[{\"type\":\"lagre\",\"price\":420},{\"type\":\"medium\",\"price\":320},{\"type\":\"standard\",\"price\":220}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"lagre\",\" medium\",\" standard\"]}]', 320.00, 0.00, 'percent', 0.00, 'percent', '00:02:00', '23:46:00', 0, 1, 2, '2021-08-21 17:44:37', '2021-08-22 02:31:57', 0),
(69, 'Medu Vada', 'Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.', '2021-08-21-6120e7a4b7b2a.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 95.00, 0.00, 'percent', 0.00, 'percent', '00:01:00', '23:57:00', 0, 1, 2, '2021-08-21 17:46:44', '2022-01-11 13:45:07', 4),
(70, 'Linguine Pasta', 'Long, thin, flat linguine noodles fall somewhere between the thickness of fettuccine and spaghetti', '2021-08-21-6120eacfb8fc3.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"36\"]', '[]', '[]', 199.00, 0.00, 'percent', 0.00, 'percent', '11:30:00', '20:00:00', 0, 1, 6, '2021-08-21 17:47:58', '2021-08-21 18:00:15', 0),
(71, 'Fusilli Pasta', 'Fusilli gives any dish an unexpected twist with its spiral shape', '2021-08-21-6120eab9a0ba5.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"36\",\"38\"]', '[]', '[]', 185.00, 0.00, 'percent', 15.00, 'amount', '10:45:00', '21:45:00', 0, 1, 6, '2021-08-21 17:50:11', '2021-08-21 17:59:53', 0),
(72, 'Fettuccine Pasta', 'Flat, ribbon-like shape of fettuccine makes it a sturdy pasta that can hold up to a variety of sauces', '2021-08-21-6120eaa2bf3ce.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[]', '[]', '[]', 215.00, 0.00, 'percent', 5.00, 'percent', '14:00:00', '20:00:00', 0, 1, 6, '2021-08-21 17:54:12', '2021-08-21 17:59:30', 0),
(73, 'BBQ chicken Noodles', 'BBQ chicken noodles is one of the most favorite noddles.', '2021-08-21-6120ea82cdbb1.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 0.00, 'percent', '12:30:00', '18:30:00', 0, 1, 6, '2021-08-21 17:58:58', '2021-08-21 17:58:58', 0),
(74, 'Grilled Eggplant kebab', 'Eggplant kebabs are marinated and grilled, tucked into a pita, and smothered with a tangy garlic sauce and assorted veggies.', '2021-08-21-6120ec75be180.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[\"24\"]', '[]', '[]', 46.00, 0.00, 'percent', 7.00, 'percent', '10:10:00', '22:15:00', 0, 1, 8, '2021-08-21 18:07:17', '2021-08-21 18:07:17', 0),
(75, 'Shish kebab', 'Shish kebab, dish of small pieces of lamb threaded on a skewer and cooked over an open fire.', '2021-08-21-6120ed8894c1e.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[\"37\",\"38\"]', '[]', '[]', 76.00, 0.00, 'percent', 0.00, 'percent', '10:30:00', '22:15:00', 0, 1, 6, '2021-08-21 18:11:52', '2021-08-21 18:11:52', 0),
(76, 'Garlic Noodles', 'Garlic noodles are an irresistible combination of garlic and carbs', '2021-08-21-6120ed8f3e3ee.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[\"15\"]', '[]', '[]', 220.00, 0.00, 'percent', 20.00, 'amount', '00:10:00', '18:10:00', 0, 1, 1, '2021-08-21 18:11:59', '2021-08-21 18:11:59', 0),
(77, 'Veggie noodles', 'Healthy and tasty', '2021-08-21-6120ee59cafaa.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[\"15\"]', '[]', '[]', 170.00, 0.00, 'percent', 0.00, 'percent', '02:45:00', '20:59:00', 0, 1, 1, '2021-08-21 18:15:21', '2021-08-21 18:15:21', 0),
(78, 'Chicken Tikka', 'Chicken tikka is a chicken dish originating in the Indian subcontinent; the dish is popular among Muslims of India, Bangladesh and Pakistan.', '2021-08-21-6120ee939f91d.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[\"37\",\"38\"]', '[]', '[]', 25.00, 0.00, 'percent', 5.00, 'percent', '10:15:00', '22:25:00', 0, 1, 6, '2021-08-21 18:16:19', '2021-08-21 18:16:19', 0),
(79, 'Grilled Kebab', 'The kebab is made of finely ground mince chicken with spices and then charcoal grilled on a skewer.', '2021-08-21-6120ef5098eda.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[\"37\",\"38\"]', '[]', '[]', 25.00, 0.00, 'percent', 0.00, 'percent', '10:15:00', '22:25:00', 0, 1, 6, '2021-08-21 18:19:28', '2021-08-21 18:19:28', 0),
(80, 'Urfa Kebab', 'Urfa Kebab is another famous Kebab variety of Turkish cuisine. It may be considered as the sibling of Adana Kebab. Even if they look very similar on the grill, there is one important difference between these two kebab varieties.', '2021-08-21-6120f0008a2f8.png', 12, '[{\"id\":\"12\",\"position\":1}]', '[]', '[\"37\",\"38\"]', '[]', '[]', 86.00, 0.00, 'percent', 7.00, 'percent', '10:30:00', '22:00:00', 0, 1, 6, '2021-08-21 18:22:24', '2021-08-21 18:22:24', 0),
(81, 'Fettuccine Pasta', 'Flat, ribbon-like shape of fettuccine makes it a sturdy pasta that can hold up to a variety of sauces', '2021-08-21-6120f010b0f31.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"39\"]', '[]', '[]', 150.00, 0.00, 'percent', 0.00, 'percent', '11:11:00', '19:45:00', 0, 1, 3, '2021-08-21 18:22:40', '2021-08-21 18:22:40', 0),
(82, 'Penne Pasta', 'Penne is a classic pasta type and pantry staple.', '2021-08-21-6120f09f6ba50.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[]', '[]', '[]', 165.00, 0.00, 'percent', 14.00, 'percent', '13:30:00', '22:30:00', 0, 1, 3, '2021-08-21 18:25:03', '2021-08-21 18:25:03', 0),
(83, 'Fusilli Pasta', 'Fusilli gives any dish an unexpected twist with its spiral shape', '2021-08-21-6120f11b44d1f.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[]', '[\"39\"]', '[]', '[]', 179.00, 0.00, 'percent', 29.00, 'amount', '15:00:00', '23:00:00', 0, 1, 3, '2021-08-21 18:27:07', '2021-08-21 18:27:07', 0),
(84, 'Elote', 'Elote is made with corn on the cob, slathered with mayonnaise, seasoned with chili powder and fresh lime juice, sprinkled all over with salty Cotija cheese and cilantro.', '2021-08-21-6120f917333f1.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 3.00, 'percent', '00:30:00', '23:35:00', 0, 1, 5, '2021-08-21 18:28:52', '2021-08-21 19:01:11', 0),
(85, 'Veggie Chili Tacos', 'Sweet potato, green beans, sour cream, eggplant, cannellini beans', '2021-08-21-6120f4251a2bf.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 25.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:15:00', 0, 1, 5, '2021-08-21 18:31:58', '2021-08-21 18:40:05', 0),
(86, 'Meat Chili Tacos', 'Kidney beans, ground beef, sour cream, taco seasoning, tomato', '2021-08-21-6120f407f01c2.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 5.00, 'percent', '00:30:00', '23:15:00', 0, 1, 5, '2021-08-21 18:34:35', '2021-08-21 18:39:35', 0),
(87, 'BEEF Burger', 'The classic burger is an all-time BBQ favorite! This super-easy homemade beef burger recipe gives you delicious patties, packed with onions and herbs for extra flavor.', '2021-08-21-6120f3c043f10.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"small\",\"price\":160},{\"type\":\"large\",\"price\":180},{\"type\":\"medium\",\"price\":240}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" large\",\" medium\"]}]', 160.00, 0.00, 'percent', 10.00, 'percent', '00:14:00', '23:58:00', 0, 1, 4, '2021-08-21 18:38:24', '2021-08-22 02:44:47', 0),
(88, 'Chicken Cheese Blast Burger', 'Prepared with Double chicken patty with molten cheddar cheese inside, 2x sausage slices, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f45806f3d.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"small\",\"price\":160},{\"type\":\"large\",\"price\":260},{\"type\":\"medium\",\"price\":200}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" large\",\" medium\"]}]', 160.00, 0.00, 'percent', 10.00, 'percent', '11:40:00', '21:40:00', 0, 1, 4, '2021-08-21 18:40:56', '2021-08-21 19:08:19', 0),
(89, 'Chicken Cheese Burger', 'Prepared with 1x single chicken patty, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f4c2d5003.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"big\",\"price\":160},{\"type\":\"medium\",\"price\":140},{\"type\":\"small\",\"price\":120}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"big\",\" medium\",\" small\"]}]', 120.00, 0.00, 'percent', 5.00, 'percent', '00:10:00', '23:57:00', 0, 1, 4, '2021-08-21 18:42:42', '2021-08-22 02:44:21', 0),
(90, 'Chicken & Bacon Bite Burger', 'Prepared with 1x single chicken patty, 2x beef bacon slice, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f5279c4a8.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"big\",\"price\":310},{\"type\":\"medium\",\"price\":260},{\"type\":\"small\",\"price\":210}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"big\",\" medium\",\" small\"]}]', 210.00, 0.00, 'percent', 5.00, 'percent', '11:43:00', '21:44:00', 0, 1, 4, '2021-08-21 18:44:23', '2021-08-21 19:07:45', 0),
(91, 'Mushroom Chicken Burger', 'Prepared with 1x single chicken patty, caramelized mushrooms, bbq sauce, 1x cheddar cheese slice, our secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f7addf1a5.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"small\",\"price\":200},{\"type\":\"medium\",\"price\":250},{\"type\":\"large\",\"price\":300}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}]', 200.00, 0.00, 'percent', 10.00, 'percent', '00:07:00', '23:56:00', 0, 1, 4, '2021-08-21 18:55:09', '2021-08-22 02:43:53', 0),
(92, 'Smokey BBQ Chicken Burger', 'Prepared with 1x single chicken patty, bbq sauce, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f976c7ee6.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"standard\",\"price\":180},{\"type\":\"medium\",\"price\":220},{\"type\":\"large\",\"price\":280}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"standard\",\" medium\",\" large\"]}]', 180.00, 0.00, 'percent', 0.00, 'percent', '11:02:00', '21:02:00', 0, 1, 4, '2021-08-21 19:02:46', '2021-08-21 19:07:16', 0),
(93, 'Chicken Sausage Delight Burger', 'Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120fa10d06f2.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[{\"type\":\"small\",\"price\":230},{\"type\":\"medium\",\"price\":260},{\"type\":\"large\",\"price\":280}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}]', 230.00, 0.00, 'percent', 10.00, 'percent', '00:04:00', '23:56:00', 0, 1, 4, '2021-08-21 19:05:20', '2021-08-22 02:43:28', 0),
(94, 'Enchiladas', 'An enchilada is a corn tortilla rolled around a filling and covered with a savory sauce. Originally from Mexican cuisine, enchiladas can be filled with various ingredients, including meats, cheese, beans, potatoes, vegetables, or combinations.', '2021-08-21-6120fa76e8fbd.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 54.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-08-21 19:07:02', '2021-08-21 19:07:02', 0),
(95, 'Enchiladas Rancheras', 'Enchiladas rancheras is a traditional Mexican dish where stove-top cooked enchiladas are drenched in ranchera sauce.', '2021-08-21-6120fb6a2b6fc.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 46.00, 0.00, 'percent', 5.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-08-21 19:11:06', '2021-08-21 19:11:06', 0),
(96, 'Enchiladas mineras', 'Enchiladas mineras are traditional Mexican enchiladas hailing from Guanajuato, a mining town where the women took this dish to their husbands at the end of their work hours. These enchiladas are traditionally filled with onions, cheese, and a stew-like combination of carrots and potatoes.', '2021-08-21-6120fbf4533db.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 37.00, 0.00, 'percent', 7.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-08-21 19:13:24', '2021-08-21 19:13:24', 0),
(97, 'Entomatadas', 'Entomatada is a Mexican specialty dish made by drenching a filled, wrapped, and fried corn tortilla in tomato sauce. The sauce consists of tomatoes, onions, and seasonings such as salt, garlic, and oregano, while the tortillas are usually filled with shredded chicken, refried beans, cheese, or chunks of beef.', '2021-08-21-6120fc79e1009.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 32.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-08-21 19:15:37', '2021-08-21 19:15:37', 0),
(98, 'Chicken Biryani', 'One of the most royal delicacies that you can enjoy on any occasion or festival, Chicken Biryani is the epitome of a one-pot meal. Well, no one can resist the sight of the aromatic and delicious Chicken Biryani.', '2021-08-21-6120fce13dcde.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[{\"type\":\"half\",\"price\":120},{\"type\":\"full\",\"price\":200}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"half\",\"full\"]}]', 120.00, 0.00, 'percent', 0.00, 'percent', '11:16:00', '21:16:00', 0, 1, 3, '2021-08-21 19:17:21', '2021-08-21 19:17:21', 0),
(99, 'Chicken dum biryani', 'Crave Biryani every now and then? Then, here\'s a quick and easy recipe to satiate your cravings. It is such a versatile dish that various kinds of biryanis can be prepared using different vegetables and meats.', '2021-08-21-6120fd6758fb1.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[{\"type\":\"half\",\"price\":130},{\"type\":\"full\",\"price\":180}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"half\",\"full\"]}]', 130.00, 0.00, 'percent', 0.00, 'percent', '11:18:00', '20:18:00', 0, 1, 3, '2021-08-21 19:19:35', '2021-08-21 19:19:35', 0),
(100, 'Enchiladas Potosinas', 'Enchilada Potosina is a unique enchilada variety from San Luis Potosí in Mexico, prepared by adding ancho peppers in the corn dough, filling it with cheese, closing the dough just like an empanada, and frying the concoction in hot oil until golden-brown in color.', '2021-08-21-6120fd6b22f36.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 22.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:25:00', 0, 1, 5, '2021-08-21 19:19:39', '2021-08-21 19:19:39', 0),
(101, 'Spicy Enchiladas Potosinas', 'Enchilada Potosina is a unique enchilada variety from San Luis Potosí in Mexico, prepared by adding ancho peppers in the corn dough, filling it with cheese, closing the dough just like an empanada, and frying the concoction in hot oil until golden-brown in color.', '2021-08-21-6120fd9c4a003.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 22.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:25:00', 0, 1, 5, '2021-08-21 19:20:28', '2021-08-21 19:20:28', 0),
(102, 'Hyderabadi biryani', 'Hyderabadi biryani, also known as Hyderabadi dum biryani, is a style of biryani from Hyderabad.', '2021-08-21-6120fdda6e5cf.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[{\"type\":\"half\",\"price\":160},{\"type\":\"full\",\"price\":220}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"half\",\"full\"]}]', 160.00, 0.00, 'percent', 10.00, 'percent', '13:20:00', '20:20:00', 0, 1, 3, '2021-08-21 19:21:30', '2021-08-21 19:21:30', 0),
(103, 'Mutton Biryani', 'This mutton biryani recipe has layers of mutton and saffron-milk infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon.', '2021-08-21-6120fe4ca3d61.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[{\"type\":\"half\",\"price\":180},{\"type\":\"full\",\"price\":240}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"half\",\"full\"]}]', 180.00, 0.00, 'percent', 0.00, 'percent', '13:22:00', '19:22:00', 0, 1, 3, '2021-08-21 19:23:24', '2021-08-21 19:23:24', 0),
(104, 'Chili Crab', 'Chili crab was created in Singapore in the 1950s by Cher Yam Tian. After experimenting in her kitchen for family and friends, her crabs became a hit, and her family opened their first restaurant.', '2021-08-21-6120ff22e2563.png', 7, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 170.00, 0.00, 'percent', 10.00, 'percent', '01:26:00', '13:26:00', 0, 1, 7, '2021-08-21 19:26:58', '2021-08-21 19:26:58', 0),
(105, 'Massaman Curry', 'It’s made without store-bought Massaman curry paste, which can be difficult to find, utilizing red curry paste instead!', '2021-08-21-6120ff8ce1555.png', 7, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 230.00, 0.00, 'percent', 20.00, 'amount', '02:28:00', '10:28:00', 0, 1, 7, '2021-08-21 19:28:44', '2021-08-21 19:28:44', 0),
(106, 'Butter Cake', 'A butter cake is a cake in which one of the main ingredients is butter. Butter cake is baked with basic ingredients: butter, sugar, eggs, flour,', '2021-08-21-6120ffa5143e6.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 110.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:30:00', 0, 1, 11, '2021-08-21 19:29:09', '2021-08-21 19:29:09', 0),
(107, 'Chicken Momos', 'A popular street food among the youngsters these days, momos are undoubtedly one of the easy snack.', '2021-08-21-6120fff017c47.png', 7, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 340.00, 0.00, 'percent', 12.00, 'percent', '03:29:00', '11:29:00', 0, 1, 7, '2021-08-21 19:30:24', '2021-08-21 19:30:24', 0),
(108, 'Veg Momos', 'Momos are popular street food in northern parts of India. These are also known as Dim Sum and are basically dumplings made from flour with a savory stuffing.', '2021-08-21-6121008b3c074.png', 7, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 320.00, 0.00, 'percent', 0.00, 'percent', '03:31:00', '14:31:00', 0, 1, 7, '2021-08-21 19:32:59', '2021-08-22 09:24:42', 1),
(109, 'Cake', 'A form of bread or bread-like food. In its current forms, it is usually a sweet baked dessert. In its oldest forms, cakes were usually fried breads or cheesecakes.', '2021-08-21-612100a9cf3fc.png', 29, '[{\"id\":\"8\",\"position\":1},{\"id\":\"29\",\"position\":2}]', '[]', '[]', '[]', '[]', 10.00, 0.00, 'percent', 3.00, 'percent', '00:30:00', '20:45:00', 0, 1, 1, '2021-08-21 19:33:29', '2021-08-21 19:33:29', 0);
INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`) VALUES
(110, 'Sponge Cake', 'Sponge cake is a light cake made with egg whites, flour and sugar, sometimes leavened with baking powder', '2021-08-21-612100b8c4862.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 5.00, 'percent', '03:30:00', '18:30:00', 0, 1, 11, '2021-08-21 19:33:44', '2021-08-21 19:33:44', 0),
(111, 'Chiffon Cake', 'A chiffon cake is a very light cake made with vegetable oil, eggs, sugar, flour, baking powder, and flavorings', '2021-08-21-61210154420e3.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 30.00, 'amount', '06:00:00', '22:00:00', 0, 1, 11, '2021-08-21 19:36:20', '2021-08-21 19:36:20', 0),
(112, 'Chocolate Cupcake', 'Moist and fluffy at the same time with a tender crumb.', '2021-08-21-61210171ac92a.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 18.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:45:00', 0, 1, 11, '2021-08-21 19:36:49', '2021-10-17 00:47:27', 1),
(113, 'Spicy Crab', 'Chilli crab is a Singaporean seafood dish. Mud crabs are commonly used and are stir-fried in a semi-thick, sweet and savoury tomato-and-chilli-based sauce.', '2021-08-21-612101a10f3a2.png', 7, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 430.00, 0.00, 'percent', 20.00, 'percent', '01:36:00', '13:36:00', 0, 1, 7, '2021-08-21 19:37:37', '2021-08-21 19:37:37', 0),
(114, 'Molten chocolate cake', 'Molten chocolate cake is a popular dessert that combines the elements of a chocolate cake and a soufflé.', '2021-08-21-612101dd482e7.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 22.00, 0.00, 'percent', 2.00, 'percent', '00:30:00', '23:45:00', 0, 1, 11, '2021-08-21 19:38:37', '2021-08-21 19:39:30', 0),
(115, 'Peanut Butter Molten Cake', 'Creamy peanut butter, dark chocolate, unsweetened cocoa', '2021-08-21-6121046fc721d.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 17.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:45:00', 0, 1, 11, '2021-08-21 19:49:35', '2021-08-21 19:49:35', 0),
(116, 'Arabica Coffee', 'Coffea arabica, also known as the Arabian coffee, \"coffee shrub of Arabia\", \"mountain coffee\" or \"arabica coffee\", is a species of Coffea.', '2021-08-21-6121049ee508e.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[{\"type\":\"Small\",\"price\":220},{\"type\":\"Medium\",\"price\":270},{\"type\":\"Large\",\"price\":330}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\",\"Large\"]}]', 220.00, 0.00, 'percent', 0.00, 'percent', '04:00:00', '16:00:00', 0, 1, 11, '2021-08-21 19:50:22', '2021-08-21 19:50:22', 0),
(117, 'Lemon Juice', 'According to World\'s Healthiest Foods, a quarter cup of lemon juice contains 31 percent of the recommended daily intake of vitamin C and 3 percent of folate and 2 percent of potassium', '2021-08-21-6121056197410.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', '05:00:00', '17:00:00', 0, 1, 11, '2021-08-21 19:53:37', '2021-08-21 19:53:37', 0),
(118, 'Toll House Pie', 'Ice cream, brown sugar, deep dish pie, butter, eggs', '2021-08-21-6121056f7c691.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 14.00, 0.00, 'percent', 3.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-08-21 19:53:51', '2021-08-21 19:53:51', 0),
(119, 'COOKIE DOUGH BROWNIES', 'Brown sugar, dark chocolate chips, unsweetened cocoa', '2021-08-21-61210650628f7.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 14.00, 0.00, 'percent', 3.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-08-21 19:57:36', '2021-08-21 19:57:36', 0),
(120, 'Hazelnut semifreddo', 'Hazelnuts are used in baking and desserts, confectionery to make praline, and also used in combination with chocolate for chocolate truffles and products such as chocolate bars, hazelnut cocoa spread such as Nutella, and Frangelico liqueur.', '2021-08-21-6121073d44b4a.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 14.00, 0.00, 'percent', 3.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-08-21 20:01:33', '2021-08-22 01:40:28', 2),
(121, 'MAPO TOFU', 'Mapo Tofu consists of tofu set in a spicy sauce, typically a thin, oily, and bright red suspension, based on douban and douchi, along with minced meat, traditionally beef.', '2021-08-21-61210747e03f2.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 340.00, 0.00, 'percent', 30.00, 'amount', '00:29:00', '23:51:00', 0, 1, 5, '2021-08-21 20:01:43', '2021-08-22 02:41:13', 0),
(122, 'Meringue', 'Meringue is a type of dessert or candy, often associated with Swiss, French, Polish and Italian cuisines, traditionally made from whipped egg whites and sugar, and occasionally an acidic ingredient such as lemon, vinegar, or cream of tartar.', '2021-08-21-61210796c7cdc.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-08-21 20:03:02', '2021-08-21 20:03:02', 0),
(123, 'KUNG PAO CHICKEN', 'Kung Pao chicken, also transcribed Gong Bao or Kung Po, is a spicy, stir-fried Chinese dish made with cubes of chicken, peanuts, vegetables, and chili peppers.', '2021-08-21-612107f2cd8c7.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 470.00, 0.00, 'percent', 10.00, 'percent', '08:00:00', '20:00:00', 0, 1, 5, '2021-08-21 20:04:34', '2021-08-21 20:04:34', 0),
(124, 'BAOZI', 'Baozi, or bao, is a type of yeast-leavened filled bun in various Chinese cuisines. There are many variations in fillings and preparations, though the buns are most often steamed', '2021-08-21-612108516b458.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 300.00, 0.00, 'percent', 17.00, 'percent', '00:01:00', '23:57:00', 0, 1, 5, '2021-08-21 20:06:09', '2021-08-22 02:40:53', 0),
(125, 'Green Juice', 'Green juice is extracted from green vegetables like kale, spinach, and celery. Some green juices may also include fruit.', '2021-08-21-612109d666c4d.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 175.00, 0.00, 'percent', 0.00, 'percent', '03:00:00', '09:00:00', 0, 1, 13, '2021-08-21 20:11:22', '2021-08-21 20:12:38', 0),
(126, 'Orange Juice', 'Orange Juice is good for health.', '2021-08-21-61210a8a6650a.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 190.00, 0.00, 'percent', 25.00, 'percent', '03:30:00', '07:30:00', 0, 1, 13, '2021-08-21 20:14:44', '2021-08-21 20:15:38', 0),
(127, 'Stawberry Cake', 'Strawberry cake is a cake that uses strawberry as a primary ingredient.', '2021-08-21-61210b55b24e9.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 145.00, 0.00, 'percent', 20.00, 'amount', '07:00:00', '10:00:00', 0, 1, 13, '2021-08-21 20:19:01', '2021-08-21 20:19:01', 0),
(128, 'Ramen', 'Ramen is a Japanese noodle soup. It consists of Chinese-style wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso', '2021-08-21-61210c8b6348e.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[\"27\"]', '[]', '[]', 290.00, 0.00, 'percent', 15.00, 'amount', '17:00:00', '23:00:00', 0, 1, 10, '2021-08-21 20:24:11', '2022-01-20 18:25:32', 2),
(129, 'Burrito', 'A burrito is a dish in Mexican and Tex-Mex cuisine that took form in California cuisine, consisting of a flour tortilla wrapped into a sealed cylindrical shape around various ingredients.', '2021-08-21-61210d9b0a87a.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[\"4\",\"5\"]', '[]', '[]', 20.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-08-21 20:28:43', '2021-08-21 20:28:43', 0),
(130, 'Chicken chowmein', 'Chow mein are Chinese stir-fried noodles with vegetables and sometimes meat or tofu; the name is a romanization of the Taishanese chāu-mèn.', '2021-08-21-61210d9e246a1.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[\"40\"]', '[]', '[]', 185.00, 0.00, 'percent', 15.00, 'amount', '05:00:00', '11:00:00', 0, 1, 12, '2021-08-21 20:28:46', '2021-08-21 20:28:46', 0),
(131, 'Cheese sandwich', 'A cheese sandwich is a sandwich made with cheese on bread. Typically semi-hard cheeses are used for the filling, such as Cheddar, Red Leicester, or Double Gloucester.', '2021-08-21-61210de1ef62b.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[\"3\",\"4\",\"5\"]', '[]', '[]', 27.00, 0.00, 'percent', 5.00, 'percent', '00:01:00', '23:59:00', 0, 1, 9, '2021-08-21 20:29:53', '2021-08-21 20:29:53', 0),
(132, 'Peking duck', 'Peking duck is a dish from Beijing (Peking) that has been prepared since the Imperial era.', '2021-08-21-61210e0eaa5cb.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 399.00, 0.00, 'percent', 19.00, 'percent', '04:00:00', '13:00:00', 0, 1, 12, '2021-08-21 20:30:38', '2021-08-21 20:30:38', 0),
(133, 'Chicken Roll', 'Chicken Roll is a delectable North Indian recipe made using all purpose flour, stir-fried chicken, yoghurt and a variety of vegetables rolled into paranthas.', '2021-08-21-61210e505f125.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-08-21 20:31:44', '2021-08-21 20:31:44', 0),
(134, 'CHAR SIU', 'Char siu is a popular way to flavor and prepare barbecued pork in Cantonese cuisine', '2021-08-21-61210e78cec97.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[\"40\"]', '[]', '[]', 400.00, 0.00, 'percent', 40.00, 'amount', '06:00:00', '12:00:00', 0, 1, 12, '2021-08-21 20:32:24', '2021-08-21 20:32:24', 0),
(135, 'Dark Fried Chicken Roll', 'Chicken Roll is a delectable North Indian recipe made using all purpose flour, stir-fried chicken, yoghurt and a variety of vegetables rolled into paranthas.', '2021-08-21-61210e8e799b4.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[\"3\",\"4\",\"5\"]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-08-21 20:32:46', '2021-08-21 20:32:46', 0),
(136, 'Ham sandwich', 'The ham sandwich is a common type of sandwich. The bread may be fresh or toasted, and it can be made with a variety of toppings including cheese and vegetables like lettuce, tomato, onion or pickle slices.', '2021-08-21-61210ef7bccc6.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[\"4\"]', '[]', '[]', 25.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-08-21 20:34:31', '2021-08-21 20:34:31', 0),
(137, 'Chinese chicken and rice porridge congee', 'Chinese chicken and rice porridge congee is a type of rice porridge or gruel eaten in Asian countries.', '2021-08-21-61210f150ff5a.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 485.00, 0.00, 'percent', 15.00, 'percent', '05:30:00', '11:30:00', 0, 1, 12, '2021-08-21 20:35:01', '2021-08-21 20:35:01', 0),
(138, 'Sandwich', 'A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.', '2021-08-21-61210f51ee379.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 15.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-08-21 20:36:01', '2021-08-21 20:36:01', 0),
(139, 'Cheesy Sandwich', 'A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.', '2021-08-21-6121100d50344.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[\"3\",\"4\"]', '[]', '[]', 20.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:50:00', 0, 1, 9, '2021-08-21 20:39:09', '2021-08-21 20:39:09', 0),
(140, 'Melted chocolate sliced cake', 'This chocolate cake is the perfect cake to pair with a glass of milk.', '2021-08-21-6121100e9a3c4.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 149.99, 0.00, 'percent', 0.00, 'percent', '02:55:00', '19:15:00', 0, 1, 9, '2021-08-21 20:39:10', '2021-08-21 20:39:10', 0),
(141, 'Veggie Spring Rolls', 'Spring roll wrappers, cake, cabbage, soy sauce, bell pepper', '2021-08-21-612110d0124a1.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[\"4\",\"5\"]', '[]', '[]', 13.00, 0.00, 'percent', 0.00, 'percent', '00:15:00', '23:30:00', 0, 1, 9, '2021-08-21 20:42:24', '2021-08-21 20:42:24', 0),
(142, 'Vegan Chow Mein', 'VeganChow Mein is a delicious Asian side dish or dinner.', '2021-08-21-6121114665a9d.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[\"21\",\"24\"]', '[]', '[]', 235.00, 0.00, 'percent', 20.00, 'amount', '14:00:00', '22:00:00', 0, 1, 8, '2021-08-21 20:44:22', '2021-08-21 20:44:22', 0),
(143, 'Pizza Napoletana', 'Neapolitan pizza (Italian: pizza napoletana) also known as Naples-style pizza, is a style of pizza made with tomatoes and mozzarella cheese.', '2021-08-21-612111a36d109.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"9inch\",\"price\":46},{\"type\":\"12inch\",\"price\":54},{\"type\":\"17inch\",\"price\":67},{\"type\":\"22inch\",\"price\":72}]', '[\"3\",\"4\",\"5\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9inch\",\"12inch\",\"17inch\",\"22inch\"]}]', 46.00, 0.00, 'percent', 5.00, 'percent', '00:30:00', '23:15:00', 0, 1, 9, '2021-08-21 20:45:55', '2021-08-21 20:45:55', 0),
(144, 'Chocolate Cupcakes', 'Chocolate Cupcakes is a small cake designed to serve one person', '2021-08-21-6121138178d8a.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 205.00, 0.00, 'percent', 10.00, 'amount', '16:00:00', '23:00:00', 0, 1, 3, '2021-08-21 20:52:45', '2021-08-21 20:53:53', 0),
(145, 'Creampy Cake', 'A cream cake is a generic description of many varieties of cream-filled pastries', '2021-08-21-6121143eb8c39.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 130.00, 0.00, 'percent', 0.00, 'percent', '07:00:00', '13:00:00', 0, 1, 12, '2021-08-21 20:57:02', '2021-08-21 20:57:02', 0),
(146, 'Latte', 'Latte is a coffee drink of Italian origin made with espresso and steamed milk.', '2021-08-21-612114e8a1b4a.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 320.00, 0.00, 'percent', 0.00, 'percent', '03:45:00', '10:45:00', 0, 1, 12, '2021-08-21 20:59:52', '2021-08-21 20:59:52', 0),
(147, 'Cappuccino', 'A cappuccino is an espresso-based coffee drink that originated in Italy, and is simply prepared with steamed milk foam.', '2021-08-21-6121155d24947.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 0.00, 'percent', '07:00:00', '12:00:00', 0, 1, 12, '2021-08-21 21:01:49', '2021-08-21 21:01:49', 0),
(148, 'Pizza Siciliana', 'Sicilian pizza is pizza prepared in a manner that originated in Sicily, Italy. Sicilian pizza is also known as sfincione or focaccia with toppings.', '2021-08-21-6121157903b80.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"9inch\",\"price\":25},{\"type\":\"12inch\",\"price\":32},{\"type\":\"17inch\",\"price\":40},{\"type\":\"22inch\",\"price\":48}]', '[\"3\",\"4\",\"5\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9inch\",\"12inch\",\"17inch\",\"22inch\"]}]', 25.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:15:00', 0, 1, 9, '2021-08-21 21:02:17', '2021-08-21 21:02:17', 0),
(149, 'Pizza Margherita', 'Pizza Margherita is a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella cheese, fresh basil, salt, and extra-virgin olive oil.', '2021-08-21-6121199b40ead.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[{\"type\":\"9inch\",\"price\":45},{\"type\":\"12inch\",\"price\":55},{\"type\":\"17inch\",\"price\":60},{\"type\":\"22inch\",\"price\":68}]', '[\"3\",\"4\",\"5\"]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9inch\",\"12inch\",\"17inch\",\"22inch\"]}]', 45.00, 0.00, 'percent', 5.00, 'percent', '00:01:00', '23:59:00', 0, 1, 9, '2021-08-21 21:19:55', '2021-08-21 21:20:38', 0),
(150, 'Burger', 'Good', '2021-10-17-616b1ade191a3.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '02:20:00', 0, 1, 15, '2021-10-17 00:33:02', '2021-10-17 00:40:24', 0),
(151, 'Fry', 'Good', '2021-10-17-616b1d37be682.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[{\"type\":\"Medium\",\"price\":200},{\"type\":\"Large\",\"price\":300}]', '[]', '[1]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Medium\",\"Large\"]}]', 150.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '01:10:00', 0, 1, 15, '2021-10-17 00:43:03', '2021-10-17 00:43:03', 0),
(152, 'Nachos', NULL, '2021-12-05-61acb572a30a4.png', 38, '[{\"id\":\"37\",\"position\":1},{\"id\":\"38\",\"position\":2}]', '[]', '[]', '[]', '[]', 100.00, 0.00, 'percent', 10.00, 'percent', '00:01:00', '23:59:00', 0, 1, 1, '2021-12-05 18:49:54', '2021-12-05 18:49:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_campaigns`
--

INSERT INTO `item_campaigns` (`id`, `title`, `image`, `description`, `status`, `admin_id`, `start_date`, `end_date`, `start_time`, `end_time`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, 'Spicy Crab Early Food', '2021-08-21-612012a4962dd.png', 'Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star—sweet yet savoury, slightly spicy and supremely satisfying.', 1, 1, '2021-08-20', '2025-08-21', '00:01:00', '23:59:00', NULL, '[{\"id\":\"7\",\"position\":1}]', '[]', '[]', '[]', '[]', 400.00, 0.00, 'percent', 110.00, 'amount', 2, '2021-08-21 02:37:56', '2021-10-25 16:42:33'),
(3, 'Cheese Burger', '2021-08-21-612015c75d9f1.png', 'A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty. The cheese is usually added to the cooking hamburger patty shortly before serving, which allows the cheese to melt.', 1, 1, '2021-08-20', '2025-06-04', '02:50:00', '19:50:00', NULL, '[{\"id\":\"5\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 20.00, 'percent', 2, '2021-08-21 02:51:19', '2021-10-25 16:42:31'),
(4, 'Cappuccino Coffee', '2021-08-21-612017876dc92.png', 'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. From the coffee fruit, the seeds are separated to produce a stable, raw product.', 1, 1, '2021-08-20', '2025-08-27', '14:00:00', '22:00:00', NULL, '[{\"id\":\"9\",\"position\":1},{\"id\":\"34\",\"position\":2}]', '[]', '[]', '[]', '[]', 50.00, 0.00, 'percent', 10.00, 'amount', 2, '2021-08-21 02:58:47', '2021-10-25 16:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_05_081114_create_admins_table', 1),
(5, '2021_05_05_102600_create_attributes_table', 1),
(6, '2021_05_05_102742_create_categories_table', 1),
(7, '2021_05_06_102004_create_vendors_table', 1),
(8, '2021_05_06_153204_create_restaurants_table', 1),
(9, '2021_05_08_113436_create_add_ons_table', 2),
(47, '2021_05_08_123446_create_food_table', 10),
(48, '2021_05_08_141209_create_currencies_table', 10),
(49, '2021_05_09_050232_create_orders_table', 10),
(50, '2021_05_09_051907_create_reviews_table', 10),
(51, '2021_05_09_054237_create_order_details_table', 10),
(52, '2021_05_10_105324_create_mail_configs_table', 10),
(53, '2021_05_10_152713_create_business_settings_table', 10),
(54, '2021_05_11_111722_create_banners_table', 11),
(55, '2021_05_11_134442_create_coupons_table', 11),
(56, '2021_05_12_053344_create_conversations_table', 11),
(57, '2021_05_12_055454_create_delivery_men_table', 12),
(58, '2021_05_12_060138_create_d_m_reviews_table', 12),
(59, '2021_05_12_060527_create_track_deliverymen_table', 12),
(60, '2021_05_12_061345_create_email_verifications_table', 12),
(61, '2021_05_12_061454_create_delivery_histories_table', 12),
(62, '2021_05_12_061718_create_wishlists_table', 12),
(63, '2021_05_12_061924_create_notifications_table', 12),
(64, '2021_05_12_062152_create_customer_addresses_table', 12),
(68, '2021_05_12_062412_create_order_delivery_histories_table', 13),
(69, '2021_05_19_115112_create_zones_table', 13),
(70, '2021_05_19_120612_create_restaurant_zone_table', 13),
(71, '2021_06_07_103835_add_column_to_vendor_table', 14),
(73, '2021_06_07_112335_add_column_to_vendors_table', 15),
(74, '2021_06_08_162354_add_column_to_restaurants_table', 16),
(77, '2021_06_09_115719_add_column_to_add_ons_table', 17),
(78, '2021_06_10_091547_add_column_to_coupons_table', 18),
(79, '2021_06_12_070530_rename_banners_table', 19),
(80, '2021_06_12_091154_add_column_on_campaigns_table', 20),
(87, '2021_06_12_091848_create_item_campaigns_table', 21),
(92, '2021_06_13_155531_create_campaign_restaurant_table', 22),
(93, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 23),
(94, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 24),
(95, '2021_06_14_120713_create_new_banners_table', 25),
(96, '2021_06_15_103656_add_zone_id_column_to_banners_table', 26),
(97, '2021_06_16_110322_create_discounts_table', 27),
(100, '2021_06_17_150243_create_withdraw_requests_table', 28),
(103, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(104, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(105, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(106, '2016_06_01_000004_create_oauth_clients_table', 30),
(107, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(108, '2021_06_21_051135_add_delivery_charge_to_orders_table', 31),
(110, '2021_06_23_080009_add_role_id_to_admins_table', 32),
(111, '2021_06_27_140224_add_interest_column_to_users_table', 33),
(113, '2021_06_27_142558_change_column_to_restaurants_table', 34),
(114, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 35),
(115, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 36),
(118, '2021_06_29_134119_add_schedule_column_to_orders_table', 37),
(122, '2021_06_30_084854_add_cm_firebase_token_column_to_users_table', 38),
(123, '2021_06_30_133932_add_code_column_to_coupons_table', 39),
(127, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 40),
(129, '2021_07_04_142159_add_callback_column_to_orders_table', 41),
(131, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 42),
(133, '2021_07_05_162404_add_otp_to_orders_table', 43),
(134, '2021_07_13_133941_create_admin_roles_table', 44),
(135, '2021_07_14_074431_add_status_to_delivery_men_table', 45),
(136, '2021_07_14_104102_create_vendor_employees_table', 46),
(137, '2021_07_14_110011_create_employee_roles_table', 46),
(138, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 47),
(143, '2021_06_17_145949_create_wallets_table', 48),
(144, '2021_06_19_052600_create_admin_wallets_table', 48),
(145, '2021_07_19_103748_create_delivery_man_wallets_table', 48),
(146, '2021_07_19_105442_create_account_transactions_table', 48),
(147, '2021_07_19_110152_create_order_transactions_table', 48),
(148, '2021_07_19_134356_add_column_to_notifications_table', 49),
(149, '2021_07_25_125316_add_available_to_delivery_men_table', 50),
(150, '2021_07_25_154722_add_columns_to_restaurants_table', 51),
(151, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 52),
(152, '2021_07_31_140756_create_phone_verifications_table', 53),
(153, '2021_08_01_151717_add_column_to_order_transactions_table', 54),
(154, '2021_08_01_163520_add_column_to_admin_wallets_table', 54),
(155, '2021_08_02_141909_change_time_column_to_restaurants_table', 55),
(157, '2021_08_02_183356_add_tax_column_to_restaurants_table', 56),
(158, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 57),
(159, '2021_08_06_123001_add_address_column_to_orders_table', 58),
(160, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 58),
(161, '2021_08_08_112127_add_scheduled_column_on_orders_table', 59),
(162, '2021_08_08_203108_add_status_column_to_users_table', 60),
(163, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 61),
(164, '2021_08_12_112511_add_addons_column_to_order_details_table', 62),
(165, '2021_08_12_195346_add_zone_id_to_notifications_table', 63),
(166, '2021_08_14_110131_create_user_notifications_table', 63),
(167, '2021_08_14_175657_add_order_count_column_to_foods_table', 64),
(168, '2021_08_14_180044_add_order_count_column_to_users_table', 64),
(169, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 65),
(170, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 65),
(171, '2021_08_19_055839_create_provide_d_m_earnings_table', 65),
(172, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 65),
(173, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 65),
(174, '2021_08_21_162616_change_comission_column_to_restaurants_table', 66),
(175, '2021_06_17_054551_create_soft_credentials_table', 67),
(176, '2021_08_22_232507_add_failed_column_to_orders_table', 67),
(177, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 68),
(178, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 68),
(179, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 68),
(180, '2021_09_23_120332_change_available_column_to_delivery_men_table', 69),
(181, '2021_10_03_214536_add_active_column_to_restaurants_table', 70),
(182, '2021_10_04_123739_add_priority_column_to_categories_table', 70),
(183, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 70),
(184, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 70),
(185, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 70),
(186, '2021_10_11_215352_add_adjustment_column_to_orders_table', 70),
(187, '2021_10_24_184553_change_column_to_account_transactions_table', 71),
(188, '2021_10_24_185143_change_column_to_add_ons_table', 71),
(189, '2021_10_24_185525_change_column_to_admin_roles_table', 71),
(190, '2021_10_24_185831_change_column_to_admin_wallets_table', 71),
(191, '2021_10_24_190550_change_column_to_coupons_table', 71),
(192, '2021_10_24_190826_change_column_to_delivery_man_wallets_table', 71),
(193, '2021_10_24_191018_change_column_to_discounts_table', 71),
(194, '2021_10_24_191209_change_column_to_employee_roles_table', 71),
(195, '2021_10_24_191343_change_column_to_food_table', 71),
(196, '2021_10_24_191514_change_column_to_item_campaigns_table', 71),
(197, '2021_10_24_191626_change_column_to_orders_table', 71),
(198, '2021_10_24_191938_change_column_to_order_details_table', 71),
(199, '2021_10_24_192341_change_column_to_order_transactions_table', 71),
(200, '2021_10_24_192621_change_column_to_provide_d_m_earnings_table', 71),
(201, '2021_10_24_192820_change_column_type_to_restaurants_table', 71),
(202, '2021_10_24_192959_change_column_type_to_restaurant_wallets_table', 71),
(203, '2021_11_02_123115_add_delivery_time_column_to_restaurants_table', 71),
(204, '2021_11_02_170217_add_total_uses_column_to_coupons_table', 71),
(205, '2021_12_01_131746_add_status_column_to_reviews_table', 72),
(206, '2021_12_01_135115_add_status_column_to_d_m_reviews_table', 72),
(207, '2021_12_13_125126_rename_comlumn_set_menu_to_food_table', 73),
(208, '2021_12_13_132438_add_zone_id_column_to_admins_table', 73),
(209, '2021_12_18_174714_add_application_status_column_to_delivery_men_table', 73),
(210, '2021_12_20_185736_change_status_column_to_vendors_table', 73),
(211, '2021_12_22_114414_create_translations_table', 73),
(212, '2022_01_05_133920_add_sosial_data_column_to_users_table', 73),
(213, '2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table', 73),
(214, '2022_01_20_151449_add_restaurant_id_column_on_employee_roles_table', 74);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`, `tergat`, `zone_id`) VALUES
(1, 'Test Notification', 'This is a test notification', '2021-08-21-6121064109929.png', 1, '2021-08-21 19:57:21', '2021-08-21 19:57:21', 'deliveryman', NULL),
(2, 'Test Notification', 'This is a test notification to all zone', NULL, 1, '2021-08-21 19:58:21', '2021-08-21 19:58:21', 'deliveryman', NULL),
(3, 'Test Notification', 'This is a test notification to a zone', '2021-08-21-612106a7aefd7.png', 1, '2021-08-21 19:59:03', '2021-08-21 19:59:03', 'deliveryman', 1),
(4, 'Test Notification', 'This is test notification sent to all zone', NULL, 1, '2021-08-21 20:51:35', '2021-08-21 20:51:35', 'customer', NULL),
(5, 'Test Notification', 'This is test notification sent to a zone', NULL, 1, '2021-08-21 20:52:23', '2021-08-21 20:52:23', 'customer', 1),
(6, 'Test Notification', 'This is test notification', NULL, 1, '2021-08-21 20:53:34', '2021-08-21 20:53:34', 'customer', NULL),
(7, 'Test Notification', 'Test notify', NULL, 1, '2021-08-21 20:54:24', '2021-08-21 20:54:24', 'customer', NULL),
(8, 'Test Notification', 'jhvbhjbhjn', NULL, 1, '2021-08-21 20:55:46', '2021-08-21 20:55:46', 'customer', NULL),
(9, 'Hey There', 'Hello', NULL, 1, '2021-08-21 21:14:18', '2021-08-21 21:14:18', 'deliveryman', NULL),
(10, 'Test Notification', 'Hi', NULL, 1, '2021-08-21 21:15:10', '2021-08-21 21:15:10', 'deliveryman', NULL),
(11, 'Test by Sakeef', 'Test', NULL, 1, '2021-08-21 22:10:31', '2021-08-21 22:10:31', 'customer', NULL),
(12, 'Test', 'hfgf', NULL, 1, '2021-08-21 22:11:27', '2021-08-21 22:11:27', 'customer', NULL),
(13, 'kjjb', 'bhbh', NULL, 1, '2021-08-21 22:14:08', '2021-08-21 22:14:08', 'customer', 1),
(14, 'Test', 'jhghgv', NULL, 1, '2021-08-21 22:16:19', '2021-08-21 22:16:19', 'customer', NULL),
(15, 'jhhv', 'jhhvh', NULL, 1, '2021-08-21 22:18:10', '2021-08-21 22:18:10', 'customer', NULL),
(16, 'Test by Sakeef', 'test', NULL, 1, '2021-08-21 22:18:24', '2021-08-21 22:18:24', 'customer', NULL),
(17, 'Test', 'yfyfghfhg', NULL, 1, '2021-08-21 22:19:41', '2021-08-21 22:19:41', 'customer', NULL),
(18, 'Test by Sakeef', 'test', NULL, 1, '2021-08-21 22:20:17', '2021-08-21 22:20:17', 'customer', NULL),
(19, 'Test', 'hgfghvgh', NULL, 1, '2021-08-21 22:24:21', '2021-08-21 22:24:21', 'deliveryman', NULL),
(20, 'Test', 'fymfhjj', NULL, 1, '2021-08-21 22:33:50', '2021-11-15 15:20:31', 'customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('023ca3c59b072fb76e068d34a0c33604fa63b6a69d2cdb5debc5ea27e88419e33140946d08a5bcce', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:08:36', '2021-10-17 00:08:36', '2022-10-17 00:08:36'),
('044b60a6490d04cea5c65dfde8952faeeb3d05ca2e45ba1e5418170cbcc166c9f22deddb2a7b4078', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:01:48', '2022-01-11 13:01:48', '2023-01-11 13:01:48'),
('0b8d8d02d3dfdf7747a2b9ec0b9b3d91fb2748bfe1940e3c3215c00420a2db36e18a1516d193cbbf', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:43:52', '2021-08-21 21:43:52', '2022-08-21 21:43:52'),
('0b93decdc869ccc0af71533b3e495c79e3f12f8e062c9b4ba5b4dd42fa634d085209c4d52fcd04c3', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 15:55:11', '2021-10-17 15:55:11', '2022-10-17 15:55:11'),
('0d13a21cd76d70d54f3683aa0de8ef2d3f0dca1419e9eedfecc8853f3d09c27e61528023f4cdf466', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:39:40', '2021-10-17 00:39:40', '2022-10-17 00:39:40'),
('110f9469b3815d5344cd1d460347e17d9ccb40e730c738a1f94abac827028c7d1d8aee6a61e47bd8', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:17:18', '2022-01-11 14:17:18', '2023-01-11 14:17:18'),
('15a4c933d9f0645b6a4ee5739fe961bf8bdc821558a25e93cfd13fa9f9291f79188414b5a3e44f5e', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:39:46', '2021-10-17 00:39:46', '2022-10-17 00:39:46'),
('1aada5437ea14af05a155250cd1abaabee40bcb9f4d35edf6d8ef96bdfb04ed6f62a8e15c7594d8d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:29:31', '2022-01-11 12:29:31', '2023-01-11 12:29:31'),
('1b905c9cf244f4ed3d58b4eba6ae6736881d8175abc6ba60044cd28cbf27cf11a1a84e059c971047', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 08:52:21', '2021-08-22 08:52:21', '2022-08-22 08:52:21'),
('1c2410e6554e79dcc983e0403331d813e919bc03328781ecd61ed477648e145d54431fa28320df5e', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:18:08', '2022-01-11 14:18:08', '2023-01-11 14:18:08'),
('1f856facc3066a69bea79422da0e9aeb984e8b72ed8b9c7ce9e69254e312963e75987cc537ed2cbf', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:16:27', '2022-01-20 18:16:27', '2023-01-20 18:16:27'),
('21e840ba1317a972881214cbf6042405680658980149187fce65f473f9f32d9bc6de9949cba54776', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:52:14', '2021-08-21 21:52:14', '2022-08-21 21:52:14'),
('229640324d31c9630dc2d8ad34e74c8c7e9e7799d89f529940bb67c0dc90b4241ca02b6259e02299', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:33:16', '2022-01-11 12:33:16', '2023-01-11 12:33:16'),
('23e6f33b9e7b7186de91463898b3ddac698f8cd018f2a731de3ff99a1cc9f1f357eabd6128fa1c2b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:30:03', '2022-01-11 12:30:03', '2023-01-11 12:30:03'),
('2a6a1d09e39ec55ae28e24d2b6a1be172ecee6bc75a3b93bb223bfaac8b1532e7ea52b272f8edf4e', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:10:21', '2022-01-11 13:10:21', '2023-01-11 13:10:21'),
('2aae4d5f2c66df56edb17a80046aaaf1a1b4fd2afe8d5c2618900a24627149d106e6ab3f7e13b309', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:51:29', '2022-01-11 12:51:29', '2023-01-11 12:51:29'),
('2c2fbed1300b990730e1ebe269d0f8389d6475a9dfa5154136a2c399924fa5ad2e7bf18f184e86e4', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:02:13', '2022-01-11 14:02:13', '2023-01-11 14:02:13'),
('2d5bc506930432d51c88faa09cdf02dab3b2cc542017ba0c5c54b6c22242995531eb8e16d4bdd0b2', 31, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:34:36', '2022-01-11 12:34:36', '2023-01-11 12:34:36'),
('2dbf5364f97089c8286d83975841ad22e09e4b16cba4b93da015961797402d0496ea5574a7f673e3', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:27:21', '2021-08-21 22:27:21', '2022-08-21 22:27:21'),
('2de3b13e6c9b55189fd60d4b8904a873cd8bd81818829923dba943ef2aa67a45022f4d90f57d3694', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 13:38:51', '2021-08-21 13:38:51', '2022-08-21 13:38:51'),
('3ed43541ac9335c218dba0365d86edfae056c3d6be6088f110b541ac0d52d2a73f12583e4d87b4d6', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:08:09', '2022-01-11 13:08:09', '2023-01-11 13:08:09'),
('40f5a1845dac4c10ed6f42f65e2472daf3df8f0b2a618bc4dea6294a65199119249dbb04978e5f7f', 33, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:21:50', '2022-01-11 14:21:50', '2023-01-11 14:21:50'),
('41447a97a7013cad00175f13b4912db77f5f24cdc0438579d6e58020552d589cd8838d09441759e0', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:33:57', '2022-01-11 13:33:57', '2023-01-11 13:33:57'),
('41714c1275261f3d051bdbf56c754735a860586e341f912d781ec9b654c37d4d2ccc0a22f6db2056', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:29:42', '2022-01-11 13:29:42', '2023-01-11 13:29:42'),
('423df50d71b464b0cd68b2eadf67be4036035c8d426e0d0faebca7c58baffcb7596f8c2c865b301e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:24:19', '2022-01-11 12:24:19', '2023-01-11 12:24:19'),
('45d14cf392094872b4840ac1ef60a951b1ac3cf21afa40cfb4d8b4b82585afd5c60969532e75930b', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:24:47', '2022-01-20 18:24:47', '2023-01-20 18:24:47'),
('46a9ef40bead8ffd39a591b908a7380160b5ee5b50bdd4741393378049bbfa09c4dda7de0a0b78c1', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 14:07:38', '2021-08-21 14:07:38', '2022-08-21 14:07:38'),
('47f4b857f2d2ea93f10256116feff7d544304b4b5efd109767d222eb8c8bdd1e56d9174dd20af8c5', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:16:07', '2022-01-20 18:16:07', '2023-01-20 18:16:07'),
('4c88629a6afc254a25c713ecb00703e8313da8ad0fb01cb5618389c4e82f2f1058855b8ccebf21a8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:24:58', '2022-01-11 12:24:58', '2023-01-11 12:24:58'),
('4f9bf0e57db9fc243ddc96b8b8bbd342154dfed7ba620123b5b4b47a578a147d6b51a4152a752c52', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:53:00', '2021-08-21 22:53:00', '2022-08-21 22:53:00'),
('56024c1c6d053ceb7cc88145373f149c0a369f2af024671d2a1b5ef01d4480d6c6bffd5d1e5a18c4', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:38:08', '2021-10-17 00:38:08', '2022-10-17 00:38:08'),
('56de13654e840636117eb81d523564ec4f5bdb42548fa844d8ae5ee1eeaae19b520f08006340d8f0', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:13:48', '2022-01-20 18:13:48', '2023-01-20 18:13:48'),
('5a2ed697331792c74eb1f298981dc2627ce4f064ed4181c53f875964015f5fe4ac1ae88edb6a05f9', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 20:54:06', '2021-08-21 20:54:06', '2022-08-21 20:54:06'),
('5aed20e6b70d9293ce3e601f6f466c0c1666ad1503770a3cc1ad00c9b4520286c0f99942f36d5020', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-05 18:50:23', '2021-12-05 18:50:23', '2022-12-05 18:50:23'),
('5b46adddb3d72697bf906d02b0c79412ff3fa5b345a2a06fa7bf004b4fa54cbac1c45f215e26d6a4', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:15:38', '2021-08-21 22:15:38', '2022-08-21 22:15:38'),
('5b798f97bedd1de8fe8b46f4ae7be275dbb233c3f8a4edb3a568a63dbfded63bfd3ff1990251b775', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:37:16', '2021-08-21 22:37:16', '2022-08-21 22:37:16'),
('5c2a597e90b0854c163706fc0fc1590b3186fa81fa2f3106583c83083d69dde30f3432166b942f66', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 00:57:42', '2021-08-22 00:57:42', '2022-08-22 00:57:42'),
('6255bbdb522f05b6f1c4ce3ebf0c01b92a6d2e8e16f3bc26441329223d55bda8e22a7a23bfee7247', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:49:59', '2021-08-21 21:49:59', '2022-08-21 21:49:59'),
('63173bea42d423f9902b4096549a629c856840c559703c6a2cc4b22545b1999ceb63dc21e1ce9aff', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:17:55', '2022-01-11 14:17:55', '2023-01-11 14:17:55'),
('647e139eac5c84543a1b097d200dc2a8f0dec43063aa85f7aa38d09d2489bb44a2d6a2eae5e3d627', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:13:53', '2022-01-20 18:13:53', '2023-01-20 18:13:53'),
('655bf32d53dc8ab641d960b5128abf77c7ae2ba8733b93ec4e6a1ffc9876cf4435358e02a6d7d590', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:09:00', '2021-10-17 00:09:00', '2022-10-17 00:09:00'),
('659af847907494d1445ba9581d0b151dcbde857aafd477b96cbf34414ab28d8196b38a25b48dac64', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-15 16:14:40', '2021-11-15 16:14:40', '2022-11-15 16:14:40'),
('681a28a9c3803230235584da221a2b795a3061d3ec47e63d174e925f5d9bff664096cddcc47d29b8', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:38:13', '2021-10-17 00:38:13', '2022-10-17 00:38:13'),
('6843f740fce8de5299db8ac8a78aa24a7613455d468fc79efd56350af49b1cd41aa50bb2e31319b3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:30:27', '2022-01-11 12:30:27', '2023-01-11 12:30:27'),
('693b85dcb116b879aa2134abfa2e10a60e9c19b42ab4683a08ed60106172383bfbc9a3cc9ec7be78', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:59:03', '2022-01-11 12:59:03', '2023-01-11 12:59:03'),
('6b41934bdd28a6efb0679b78c95c042e1f33e8ba1759e37fb47ab6a97440c95a12eaf4997f16ed62', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:55:33', '2022-01-11 13:55:33', '2023-01-11 13:55:33'),
('6b5ecf3cb209d2ee5f8042cba05d34d0ce9d7fde91f440c7ebeeb619c34d458868c3f739ccd7538a', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:33:27', '2021-08-21 22:33:27', '2022-08-21 22:33:27'),
('6b94a860b4291446dee68e61be393c4e6287d0925e42ba5839ef42f6544f10b0c693fb46ab80b687', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:50:06', '2021-08-21 22:50:06', '2022-08-21 22:50:06'),
('6c43bb2a75783731f4bcca78543d5f99043797b01d1e992bb31949eb14aa6a3521fcddea4f2a04c6', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:08:39', '2022-01-11 12:08:39', '2023-01-11 12:08:39'),
('6e6d75c437c140aebefcee6cbfb6b965163fcaee59201daddfb77acb6f68b46f81e7a29b2fc5feaa', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 15:37:57', '2021-10-17 15:37:57', '2022-10-17 15:37:57'),
('6f0f7cb4ee8382210436ba075581c620f4ccc1e42a7dbf39642f7d64978ef4efddb8bd13069cdde4', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:04:01', '2022-01-20 18:04:01', '2023-01-20 18:04:01'),
('70540ab3c72beda25f1f62fd14d8f6e644becb0df1ea7f55bcdc54981a20c0e9cf4bd2fcd223caca', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:05:42', '2022-01-11 13:05:42', '2023-01-11 13:05:42'),
('74019d5668e7f182acbf65dcdfa21751463fb433a4830b7c972b8d4535ceed9327395b0fec0cbe8a', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-15 16:10:33', '2021-11-15 16:10:33', '2022-11-15 16:10:33'),
('7b5168baec4eb43a23f7583dd3e6648032fb6d33b9afda6dd490bd6acee813e6eb4f41c4fab88352', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 14:04:24', '2021-08-21 14:04:24', '2022-08-21 14:04:24'),
('7c3889068a359f7dc093256d6bf4723cbd8846d986abeb056a5afe6200cb2afe6a6036e7d789f284', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:42:13', '2021-10-17 00:42:13', '2022-10-17 00:42:13'),
('80a11e77bac86e65a5c3ea31281e73d80c70056e1dc9f11a9dfb25c71b044e9a1dfab452618e126f', 39, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:23:02', '2022-01-11 14:23:02', '2023-01-11 14:23:02'),
('8b8b0f39e40c9ce998d9ba95c9c21be929398ee547747ded5f37b9b50af194662049402168d460ac', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-19 22:32:01', '2021-08-19 22:32:01', '2022-08-19 22:32:01'),
('8ebc9c57d01dc55c5e32ce7c6cce0d2e323919c33c0d8516d261e51495501182eb9e20201deb019d', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-23 00:04:13', '2021-08-23 00:04:13', '2022-08-23 00:04:13'),
('8f0e0584255fdabeb37e73cf5163e00d2b7544242be96a548e9575eb789c1d81e8c1f9130037e8d6', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:25:59', '2021-08-21 22:25:59', '2022-08-21 22:25:59'),
('929d6d154d90c8975ca5b8d4536b78bad421cb4e4626e0f8d1d91c1193c92c93f8dcadcc8a7a1caf', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 02:46:03', '2021-08-22 02:46:03', '2022-08-22 02:46:03'),
('954fb6380a9e0a8822fa99c1325dd1ecebbc71d1012c34e3a789dc74e9c6556e0de19ecc1a4f8d73', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:40:29', '2021-08-21 21:40:29', '2022-08-21 21:40:29'),
('9587e99311c72535f9d92db4771a49d2e834b8a04a72c64b709a0358053430765fe1895e483d8446', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:50:30', '2022-01-11 12:50:30', '2023-01-11 12:50:30'),
('972653d1a429105338fba0de78571376b9b0b6b6f7b669f830f8a7fe86640dab54b02b708aa2cbcc', 43, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:18:18', '2022-01-20 18:18:18', '2023-01-20 18:18:18'),
('9a0916e0482aed0e62b54f56ddb212c2813cbc273e40ee153b0191139fd6dd30e87e0cd1dbb7599c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:46:04', '2022-01-11 12:46:04', '2023-01-11 12:46:04'),
('9c6364e24d6961277e99eea32f4625a8afdb68c375ac0667fa1ce525bb8073e6cdca29a46cc14b08', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:40:03', '2022-01-20 18:40:03', '2023-01-20 18:40:03'),
('9d906cc2e7d4d9827eaf29e4da6943b0bad04633cb346c7b9e87e46df59ed5ea6bb80df4617cfc27', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 14:02:47', '2021-08-21 14:02:47', '2022-08-21 14:02:47'),
('9db4434fa79442639fcd6507aa6c36ec7160e6329555c4f1e68f506519df9d91821e569489f74430', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:17:20', '2022-01-11 13:17:20', '2023-01-11 13:17:20'),
('9ebd4aea7656ede8d7a907fc13497955b765e13fa873cb19077b4e913f3b95dfc80f2f8d05d6d79e', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 23:58:14', '2021-08-22 23:58:14', '2022-08-22 23:58:14'),
('a2ae8b6df1c6d60eea28d63046fda8bb66cda58a693cb1fbcf9ed995e008f6554df983d12938f90a', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:39:03', '2021-08-21 22:39:03', '2022-08-21 22:39:03'),
('a43292c97883f84b2bbf5edba4e23ac78a9b70a8eddaac1feba09f3012d5e3112dda0f36fcca8db4', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:22:31', '2022-01-11 14:22:31', '2023-01-11 14:22:31'),
('a7a9bc0c83e07d54cf8a9f7258ed7d0df2246104c39c0054d43f66a852f480d40c1777e13d283bd4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:02:22', '2022-01-11 13:02:22', '2023-01-11 13:02:22'),
('a9bdfc3d8e8b295d3dcbbb67429c97e0bd776a4e27720cf89b5d325995b634ab2b9891800e29a713', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:12:24', '2022-01-11 12:12:24', '2023-01-11 12:12:24'),
('ad16d295bc7c802c83a8e8264fa96563cf7d4393b475ceb3175ef8844998ab375c560242dfa09176', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-15 15:37:35', '2021-11-15 15:37:35', '2022-11-15 15:37:35'),
('ad4a07ff77a86a13aca8ebad5b2d7776178b8f0535f4ec442d6b8ceeade9a21ccea098b71ba2132a', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 01:52:22', '2021-08-22 01:52:22', '2022-08-22 01:52:22'),
('ae72ea210d5a93d6679857887b050d054991b544d451645ed1ab17d839907886d78ded62711941fa', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-20 14:18:53', '2021-08-20 14:18:53', '2022-08-20 14:18:53'),
('aee72ff77720f9469631f2942261719795373b9eb294f5fea5912d99e33bc00cfc802fe53f3f681b', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:49:55', '2022-01-11 12:49:55', '2023-01-11 12:49:55'),
('b3dbd8eaecf617089ed5d69696171e797ff51954267626522cd8bca5bc00067960a29767ea761ac6', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:27:46', '2021-08-21 22:27:46', '2022-08-21 22:27:46'),
('b484ee8f9a6f4741f53051b93a48b2c8a0d959df960ecaed8acb71f400190d112abc0eba0377ab28', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 15:10:11', '2021-10-17 15:10:11', '2022-10-17 15:10:11'),
('b79a4f7d9dd66b4bb08f2db07975bd1b5a2f5c650e71051949f8eee54dfb1193219e45af7823fd84', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:38:37', '2021-08-21 21:38:37', '2022-08-21 21:38:37'),
('bb2cd3354f11d41e5b8791cbc5c1bd21e437fdd27702eb349b3c19d6e330fb5997ade03c5c88c8ec', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 10:01:13', '2021-08-22 10:01:13', '2022-08-22 10:01:13'),
('bc99112eb40740f7c95090a354a7b96f7b7a0ad87f5228bf84667c3a5538139335bf72cd96a641c3', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:53:19', '2022-01-11 13:53:19', '2023-01-11 13:53:19'),
('bf2e4b78f5521bf1828da246b5cc2b3c64c5f921aca70e3ad98010cdcbbb9fdce613f9b008a14330', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:47:01', '2022-01-11 12:47:01', '2023-01-11 12:47:01'),
('c2453a6517030b178385f5446f47445c2b702a0ea9e22aae5fc83ac9857c17b14de1aff2d5df0281', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 14:05:55', '2021-08-21 14:05:55', '2022-08-21 14:05:55'),
('c2a154723e08633014f12f41c5436a794f83a51ce4c628e5abe7a92e4d9ae59a3527b870654a4a1d', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:09:49', '2021-10-17 00:09:49', '2022-10-17 00:09:49'),
('c57ac29834b7ecff121e1069bcf02a7b31d9c000bc1ef3707d19ef0bde5738ec33b01ee237aaf35e', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 13:27:20', '2021-08-21 13:27:20', '2022-08-21 13:27:20'),
('c693c45cae79370a4f96b13ab7f7f28fdbd0448a839c29926e7bdc7ca81534f203620bd271b1ef08', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 00:19:47', '2021-10-17 00:19:47', '2022-10-17 00:19:47'),
('c89dcf114e83e45310d3ffd40815cf82ba8f21966e897827bcbb8171757795d1293ad066647787bc', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-15 16:14:24', '2021-11-15 16:14:24', '2022-11-15 16:14:24'),
('cbc2b22946f9ee7ccf832963139d44ebc90cd1b47774d832f0d4b149d2d9f76ec07b68d2c50a7cbc', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 20:49:56', '2021-08-21 20:49:56', '2022-08-21 20:49:56'),
('cc3d0fe054aab9cbd712df3aabb629953cf53608a2bf4c70b9e74161252ffbdc34d74cae93d4bf29', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 15:37:03', '2021-10-17 15:37:03', '2022-10-17 15:37:03'),
('cddf2b6b74d2622e5ba736fdd45563dc9b7bf2de0e5aafb908210e920eedc12a182eccdf0164c2ae', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:39:53', '2021-08-21 22:39:53', '2022-08-21 22:39:53'),
('ce09eebb3b0e9fffb141cc539fd69868ee6a65e28d542bec21274af721686b2bb022650ec2373fb4', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:17:08', '2022-01-20 18:17:08', '2023-01-20 18:17:08'),
('cf20f66a1eb30284f8f80188b5fc4e22e90ef912922c63cd133bdddb95d3f05ee3e6ecf3a0b1d429', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 14:15:42', '2022-01-11 14:15:42', '2023-01-11 14:15:42'),
('d27d37091db512ac11d9e3d3094c466b21c0428f82b24b7fd3d7a0612075504662673ee9e71de965', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:14:17', '2022-01-20 18:14:17', '2023-01-20 18:14:17'),
('d80ecf6ef5801c9dccf09e60ffb131879a36842cd5925bcd846c02eeae37e1b0f07c1ad4f646be8d', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:37:45', '2021-08-21 21:37:45', '2022-08-21 21:37:45'),
('d8e7a31178ec263b8def0c95f1efd8682386c8a509539fd8e5410e754f106c42db38b871b2988d5b', 13, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 02:09:31', '2021-08-22 02:09:31', '2022-08-22 02:09:31'),
('da3986cf53487710ff021d7b394ff231c7628fb382cb5951aec0f241e285bdfa5c2f5596b23040af', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 01:26:31', '2021-08-22 01:26:31', '2022-08-22 01:26:31'),
('db7e90ed4e8dee99348eb8866249747fd3356d6a6f4485e808954bda0d06209414d504fec8c9f710', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:21:54', '2021-08-21 22:21:54', '2022-08-21 22:21:54'),
('dd680d7280a92ed2c7a482ca40999f4d03194e1d79b1de7c7432fcad2d1f85b7c16af9419fcea7bc', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:38:59', '2021-08-21 22:38:59', '2022-08-21 22:38:59'),
('e01fb326eba4af2e07f5e3396836f8acd031b32eb82ae1965480b23a9ffea1b92a6e56093bf48d5f', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-05 18:46:02', '2021-12-05 18:46:02', '2022-12-05 18:46:02'),
('e0fec803e4701be490d35e620bd1b46dd6f2e115215f296dc22555c3a5d096aeeddab0266f01e1ef', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:18:02', '2021-08-21 22:18:02', '2022-08-21 22:18:02'),
('ea05b0290f63ebbf44913bf19bb31d76ad805d80a8fec2ebe86cd97830d060810a57d336de4ab2e7', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 21:59:36', '2021-08-21 21:59:36', '2022-08-21 21:59:36'),
('f003b0f52e33b9ccbaa512de3c07811a42812ea5dbe25e83828972ec25a743e7af065456d2909e5d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 12:19:50', '2022-01-11 12:19:50', '2023-01-11 12:19:50'),
('f797a82f4cb2f4b9c04f03336bfde2d2ad03b6afd3b18c6a6c3523dcafc2da7a9ec7c0235323c0b2', 33, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:11:08', '2022-01-11 13:11:08', '2023-01-11 13:11:08'),
('f7a698643c8b75889276ca77be419c04490fe5fb688cd2033a48abf4f369802d73d06e1b3a88d488', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-10-17 15:53:18', '2021-10-17 15:53:18', '2022-10-17 15:53:18'),
('f7fcc0694d8ea2d8a8675525eabb63555450dbb5037a675d24ac4140ccd64790d03d658b83f308df', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 13:37:39', '2022-01-11 13:37:39', '2023-01-11 13:37:39'),
('f8fb6655ace04f362e6d0f111fe418e48d01a76fc72326d1cfc0b0a2722055cd2ef8f0bacee161a5', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:13:02', '2021-08-21 22:13:02', '2022-08-21 22:13:02'),
('fde3ecedd5cc64e80dcd968eaec053ccf5369b3e9e289b38fcd6c4a7ea8f94d2a7d40708ac23ddcc', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:11:22', '2021-08-21 22:11:22', '2022-08-21 22:11:22'),
('fe88d34c47e8865a5ce7bf28eda5b9ff1f3c062c62eed5d5019a881f49f17f507df010447e76ae30', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-21 22:17:46', '2021-08-21 22:17:46', '2022-08-21 22:17:46'),
('feac826808c7dfc1bb5528fe48276689efce75d104c5bbfaa5876a8dc94de9869bd9bdf8ea1a25f9', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-22 19:03:32', '2021-08-22 19:03:32', '2022-08-22 19:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc', NULL, 'http://localhost', 1, 0, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, NULL, 'Laravel Password Grant Client', 'oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT', 'users', 'http://localhost', 0, 1, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-19 20:44:50', '2021-08-19 20:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_discount_amount` decimal(24,2) NOT NULL,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT 0.00,
  `edited` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `restaurant_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100001, 3, 244.80, 0.00, '', 'paid', 'delivered', 4.80, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2021-08-21 13:40:08', '2021-08-21 13:54:22', 0.00, '2021-08-21 13:40:08', NULL, '9674', '2021-08-21 13:40:08', NULL, '2021-08-21 13:53:47', '2021-08-21 13:53:53', '2021-08-21 13:54:14', '2021-08-21 13:54:18', '2021-08-21 13:54:22', NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3455135\",\"latitude\":\"23.7633532\"}', 0, 0.00, 4321.12, NULL, 0.00, 0),
(100002, 3, 558.80, 0.00, '', 'unpaid', 'confirmed', 50.80, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 1, '2021-08-21 13:58:06', '2021-08-21 14:00:35', 0.00, '2021-08-21 13:58:06', NULL, '5225', '2021-08-21 13:58:06', NULL, '2021-08-21 14:00:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3455135\",\"latitude\":\"23.7633532\"}', 0, 62.00, 4496.87, NULL, 0.00, 0),
(100003, 4, 143.00, 0.00, '', 'unpaid', 'pending', 13.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 1, '2021-08-21 14:03:25', '2021-08-21 15:29:14', 0.00, '2021-08-21 14:03:25', NULL, '2098', '2021-08-21 14:03:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Nipon Roy\",\"contact_person_number\":\"+8801747413273\",\"address_type\":\"others\",\"address\":\"\\u09a6\\u0983 \\u09ac\\u099f\\u09a4\\u09b2\\u09be \\u09b0\\u09cb\\u09a1 Dhaka  Bangladesh\",\"longitude\":\"90.4250581\",\"latitude\":\"23.8302362\"}', 0, 20.00, 4523.21, NULL, 0.00, 0),
(100004, 3, 4744.37, 0.00, '', 'unpaid', 'pending', 22.50, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 1, '2021-08-21 14:14:36', '2021-08-21 15:29:14', 4496.87, '2021-08-21 14:14:36', NULL, '7756', '2021-08-21 14:14:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454855\",\"latitude\":\"23.7633213\"}', 0, 25.00, 4496.87, NULL, 0.00, 0),
(100005, 3, 1939.51, 0.00, '', 'paid', 'delivered', 17.00, 'cash_on_delivery', NULL, NULL, 1, NULL, NULL, 'delivery', 1, 2, '2021-08-21 14:20:36', '2021-08-21 21:45:29', 1582.51, '2021-08-21 14:20:36', NULL, '6413', '2021-08-21 14:20:36', '2021-08-21 20:10:01', '2021-08-21 20:10:11', '2021-08-21 21:15:31', '2021-08-21 21:15:41', '2021-08-21 21:45:24', '2021-08-21 21:45:29', NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454855\",\"latitude\":\"23.7633213\"}', 0, 60.00, 1582.51, NULL, 0.00, 0),
(100006, 3, 2761.77, 0.00, '', 'unpaid', 'pending', 9.60, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 14, '2021-08-21 17:27:21', '2021-08-21 19:47:58', 2432.17, '2021-08-21 17:27:21', NULL, '3778', '2021-08-21 17:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454855\",\"latitude\":\"23.7633213\"}', 0, 20.00, 2432.17, NULL, 0.00, 0),
(100007, 3, 1682.24, 0.00, '', 'unpaid', 'pending', 4.75, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-08-21 21:38:48', '2021-08-21 21:46:08', 1582.49, '2021-08-21 21:38:48', NULL, '3963', '2021-08-21 21:38:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"Haji Dil Mohammad Avenue   Bangladesh\",\"longitude\":\"90.34538374659925\",\"latitude\":\"23.763406031237253\"}', 0, 0.00, 1582.49, NULL, 0.00, 0),
(100008, 9, 357.00, 0.00, '', 'paid', 'delivered', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 2, '2021-08-21 22:05:50', '2021-08-21 22:46:14', 0.00, '2021-08-22 09:01:00', NULL, '6714', '2021-08-21 22:05:50', NULL, '2021-08-21 22:09:18', '2021-08-21 22:45:16', '2021-08-21 22:45:28', NULL, '2021-08-21 22:46:14', NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454831\",\"latitude\":\"23.7633124\"}', 1, 60.00, 1582.51, NULL, 0.00, 0),
(100009, 9, 81.60, 0.00, '', 'unpaid', 'pending', 1.60, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2021-08-21 22:20:51', '2021-08-21 22:26:21', 0.00, '2021-08-21 22:20:51', NULL, '3217', '2021-08-21 22:20:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454952\",\"latitude\":\"23.763332\"}', 0, 0.00, 4321.11, NULL, 0.00, 0),
(100010, 9, 276.68, 0.00, '', 'paid', 'delivered', 13.18, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 2, '2021-08-21 22:22:15', '2021-10-17 00:45:03', 0.00, '2021-08-21 22:22:15', NULL, '1451', '2021-08-21 22:22:15', NULL, '2021-10-17 00:43:51', '2021-10-17 00:44:28', '2021-10-17 00:44:43', NULL, '2021-10-17 00:45:03', NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan Mahamud\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454849\",\"latitude\":\"23.7633212\"}', 0, 46.50, 1582.51, NULL, 0.00, 0),
(100011, 10, 9638.62, 0.00, '', 'paid', 'delivered', 513.00, 'cash_on_delivery', NULL, NULL, 5, NULL, NULL, 'delivery', 1, 10, '2021-08-21 22:30:24', '2022-01-20 18:25:32', 3995.62, '2021-08-22 17:31:00', NULL, '5871', '2021-08-21 22:30:24', '2022-01-20 18:16:46', '2022-01-20 18:17:20', '2022-01-20 18:17:59', '2022-01-20 18:18:09', '2022-01-20 18:19:31', '2022-01-20 18:25:32', NULL, NULL, NULL, '{\"contact_person_name\":\"Md Al Imrun Khandakar\",\"contact_person_number\":\"+8801759412381\",\"address_type\":\"others\",\"address\":\"P95G+FC7 Dhaka  Bangladesh\",\"longitude\":\"90.3756057\",\"latitude\":\"23.7089441\"}', 1, 330.00, 3995.62, NULL, 0.00, 0),
(100012, 10, 979.20, 0.00, '', 'unpaid', 'pending', 19.20, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2021-08-21 22:30:47', '2021-08-21 22:44:09', 0.00, '2021-08-22 10:01:00', NULL, '3379', '2021-08-21 22:30:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Md Al Imrun Khandakar\",\"contact_person_number\":\"+8801759412381\",\"address_type\":\"others\",\"address\":\"P95G+FC7 Dhaka  Bangladesh\",\"longitude\":\"90.3756057\",\"latitude\":\"23.7089441\"}', 1, 0.00, 4336.16, NULL, 0.00, 0),
(100013, 9, 224.25, 0.00, '', 'unpaid', 'pending', 29.25, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2021-08-21 22:37:38', '2021-08-21 22:44:09', 0.00, '2021-08-21 22:37:38', NULL, '3154', '2021-08-21 22:37:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan 0 Mahamud 1\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.345534\",\"latitude\":\"23.763376\"}', 0, 10.00, 57.15, NULL, 0.00, 0),
(100014, 9, 260.93, 0.00, '', 'paid', 'delivered', 12.43, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 2, '2021-08-21 22:51:46', '2021-08-21 23:15:03', 0.00, '2021-08-21 22:51:46', NULL, '6587', '2021-08-21 22:51:46', '2021-08-21 22:57:13', '2021-08-21 23:03:19', '2021-08-21 23:04:50', '2021-08-21 23:05:24', '2021-08-21 23:06:34', '2021-08-21 23:15:03', NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan 0 Mahamud 1\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.345534\",\"latitude\":\"23.763376\"}', 0, 37.50, 1582.52, NULL, 0.00, 0),
(100015, 12, 4741.58, 0.00, '', 'unpaid', 'pending', 20.90, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 1, '2021-08-22 01:11:33', '2021-08-22 01:32:50', 4511.68, '2021-08-22 01:11:33', NULL, '1099', '2021-08-22 01:11:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hasting\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 0, 11.00, 4511.68, NULL, 0.00, 0),
(100016, 12, 4393.20, 0.00, '', 'paid', 'confirmed', 7.00, 'ssl_commerz_payment', 'gAVhXl-971', NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2021-08-22 01:12:46', '2021-08-22 01:32:50', 4316.20, '2021-08-22 01:12:46', NULL, '7328', '2021-08-22 01:12:46', NULL, '2021-08-22 01:13:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hasting\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 0, 0.00, 4316.20, NULL, 0.00, 0),
(100017, 12, 4390.45, 0.00, '', 'paid', 'accepted', 6.75, 'stripe', 'L48g9J-787', NULL, 3, NULL, NULL, 'delivery', 1, 7, '2021-08-22 01:13:42', '2021-08-22 01:32:50', 4316.20, '2021-08-22 01:13:42', NULL, '1594', '2021-08-22 01:13:42', '2021-08-22 01:17:19', '2021-08-22 01:15:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hasting\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 0, 7.50, 4316.20, NULL, 0.00, 0),
(100018, 12, 4382.20, 0.00, '', 'unpaid', 'pending', 6.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2021-08-22 01:18:27', '2021-08-22 01:32:50', 4316.20, '2021-08-22 01:18:27', NULL, '7474', '2021-08-22 01:18:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hastings\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 0, 0.00, 4316.20, NULL, 0.00, 0),
(100019, 12, 127.35, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 9, '2021-08-22 01:22:20', '2021-08-22 01:32:50', 0.00, '2021-08-23 21:02:00', NULL, '4507', '2021-08-22 01:22:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hastings\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 1, 5.65, 254.51, NULL, 0.00, 0),
(100020, 12, 4297.88, 0.00, '', 'unpaid', 'pending', 27.50, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 10, '2021-08-22 01:26:25', '2021-08-22 01:32:50', 3995.38, '2021-08-23 17:31:00', NULL, '4384', '2021-08-22 01:26:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hastings\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 1, 15.00, 3995.38, NULL, 0.00, 0),
(100021, 9, 5250.37, 0.00, '', 'paid', 'confirmed', 68.50, 'ssl_commerz_payment', 'FR1rZd-926', NULL, NULL, NULL, NULL, 'delivery', 1, 1, '2021-08-22 01:27:13', '2021-08-22 01:32:50', 4496.87, '2021-08-22 01:27:13', NULL, '5890', '2021-08-22 01:27:13', NULL, '2021-08-22 01:27:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan 0 Mahamud 1\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454871\",\"latitude\":\"23.763319\"}', 0, 45.00, 4496.87, NULL, 0.00, 0),
(100022, 9, 23.10, 0.00, '', 'unpaid', 'pending', 1.10, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 5, '2021-08-22 01:31:58', '2021-08-22 01:32:50', 0.00, '2021-08-22 01:31:58', NULL, '4600', '2021-08-22 01:31:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan 0 Mahamud 1\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454871\",\"latitude\":\"23.763319\"}', 0, 0.00, 4753.56, NULL, 0.00, 0),
(100023, 9, 878.40, 0.00, '', 'paid', 'delivered', 13.04, 'cash_on_delivery', NULL, NULL, 4, NULL, NULL, 'delivery', 1, 11, '2021-08-22 01:32:36', '2021-08-22 01:40:28', 756.73, '2021-08-22 01:32:36', NULL, '2411', '2021-08-22 01:32:36', '2021-08-22 01:37:34', '2021-08-22 01:37:49', NULL, '2021-08-22 01:38:37', '2021-08-22 01:40:13', '2021-08-22 01:40:28', NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan 0 Mahamud 1\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"38 Dhaka 1207 Bangladesh\",\"longitude\":\"90.3454871\",\"latitude\":\"23.763319\"}', 0, 3.36, 756.73, NULL, 0.00, 0),
(100024, 12, 90.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 9, '2021-08-22 01:33:46', '2021-08-22 01:37:03', 0.00, '2021-08-23 04:32:00', NULL, '8925', '2021-08-22 01:33:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Spencer Hastings\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 1, 0.00, 254.51, NULL, 0.00, 0),
(100025, 12, 28358.75, 0.00, '', 'unpaid', 'canceled', 5671.75, 'cash_on_delivery', NULL, NULL, 5, NULL, NULL, 'delivery', 1, 13, '2021-08-22 01:34:51', '2022-01-20 18:19:07', 0.00, '2021-08-22 08:01:00', NULL, '1164', '2021-08-22 01:34:51', '2021-08-22 08:42:43', NULL, NULL, NULL, NULL, NULL, '2022-01-20 18:19:07', NULL, NULL, '{\"contact_person_name\":\"Spencer Hastings\",\"contact_person_number\":\"+8801673138205\",\"address_type\":\"others\",\"address\":\"Flat#602 Dhaka 1205 Bangladesh\",\"longitude\":\"90.4091212\",\"latitude\":\"23.7435144\"}', 1, 2215.00, 4831.66, NULL, 0.00, 0),
(100026, 13, 284.24, 0.00, '', 'unpaid', 'pending', 56.85, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 13, '2021-08-22 02:43:51', '2021-08-22 07:51:16', 0.00, '2021-08-22 02:43:51', NULL, '9409', '2021-08-22 02:43:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"sultan mahamud 2\",\"contact_person_number\":\"+8801723019986\",\"address_type\":\"others\",\"address\":\"4871 Einasleigh 4871 Australia\",\"longitude\":\"144.22157775610685\",\"latitude\":\"-18.53319343664354\"}', 0, 20.61, 12076.57, NULL, 0.00, 0),
(100027, 13, 99.75, 0.00, '', 'unpaid', 'pending', 4.75, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-08-22 02:44:12', '2021-08-22 07:48:32', 0.00, '2021-08-22 02:44:12', NULL, '3530', '2021-08-22 02:44:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"sultan mahamud 2\",\"contact_person_number\":\"+8801723019986\",\"address_type\":\"others\",\"address\":\"4871 Einasleigh 4871 Australia\",\"longitude\":\"144.22157775610685\",\"latitude\":\"-18.53319343664354\"}', 0, 0.00, 16098.76, NULL, 0.00, 0),
(100028, 4, 142.80, 0.00, '', 'paid', 'delivered', 6.80, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 2, '2021-08-22 03:48:11', '2021-10-17 00:44:54', 0.00, '2021-08-22 03:48:11', NULL, '1671', '2021-08-22 03:48:29', NULL, '2021-10-17 00:44:00', '2021-10-17 00:44:10', '2021-10-17 00:44:19', NULL, '2021-10-17 00:44:54', NULL, NULL, NULL, '{\"contact_person_name\":\"Nipon Roy\",\"contact_person_number\":\"+8801747413273\",\"address_type\":\"others\",\"address\":\"\\u09a6\\u0983 \\u09ac\\u099f\\u09a4\\u09b2\\u09be \\u09b0\\u09cb\\u09a1 Dhaka  Bangladesh\",\"longitude\":\"90.4250437\",\"latitude\":\"23.8302669\"}', 0, 24.00, 1575.93, NULL, 0.00, 0),
(100029, 14, 1542.50, 0.00, '', 'unpaid', 'canceled', 308.50, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 13, '2021-08-22 08:10:54', '2021-08-22 08:28:15', 0.00, '2021-08-22 08:10:54', NULL, '7563', '2021-08-22 08:10:54', NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-22 08:18:26', NULL, NULL, '{\"contact_person_name\":\"demo demo\",\"contact_person_number\":\"jkhjk\",\"address_type\":\"others\",\"address\":\"2 Dhaka  Bangladesh\",\"longitude\":\"90.35148739814758\",\"latitude\":\"23.76354646324285\"}', 0, 147.00, 4843.50, NULL, 0.00, 0),
(100030, 14, 4700.14, 0.00, '', 'unpaid', 'accepted', 18.47, 'digital_payment', NULL, NULL, 6, NULL, NULL, 'delivery', 1, 1, '2021-08-22 08:16:38', '2021-08-22 08:25:17', 4496.97, '2021-08-22 08:16:38', NULL, '5147', '2021-08-22 08:16:38', '2021-08-22 08:25:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"demo demo\",\"contact_person_number\":\"+21620123123\",\"address_type\":\"others\",\"address\":\"2 Dhaka  Bangladesh\",\"longitude\":\"90.35148739814758\",\"latitude\":\"23.76354646324285\"}', 0, 0.30, 4496.97, NULL, 0.00, 0),
(100031, 15, 4632.80, 0.00, '', 'unpaid', 'canceled', 29.92, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2021-08-22 09:20:03', '2021-08-22 09:22:30', 4303.68, '2021-08-22 09:20:03', NULL, '6294', '2021-08-22 09:20:03', NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-22 09:21:19', NULL, NULL, '{\"contact_person_name\":\"hello yes\",\"contact_person_number\":\"+21620555555\",\"address_type\":\"home\",\"address\":\"53 Dhaka  Bangladesh\",\"longitude\":\"90.35126108676195\",\"latitude\":\"23.76639123991971\"}', 0, 40.80, 4303.68, NULL, 0.00, 0),
(100032, 15, 4655.68, 0.00, '', 'paid', 'delivered', 32.00, 'cash_on_delivery', NULL, NULL, 4, NULL, NULL, 'delivery', 1, 7, '2021-08-22 09:22:16', '2021-08-22 09:24:42', 4303.68, '2021-08-22 09:22:16', NULL, '1878', '2021-08-22 09:22:16', '2021-08-22 09:22:55', NULL, NULL, '2021-08-22 09:24:02', '2021-08-22 09:24:27', '2021-08-22 09:24:42', NULL, NULL, NULL, '{\"contact_person_name\":\"hello yes\",\"contact_person_number\":\"+21620555555\",\"address_type\":\"home\",\"address\":\"53 Dhaka  Bangladesh\",\"longitude\":\"90.35126108676195\",\"latitude\":\"23.76639123991971\"}', 0, 0.00, 4303.68, NULL, 0.00, 0),
(100033, 15, 99.75, 0.00, '', 'paid', 'delivered', 4.75, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 2, '2021-08-22 09:27:20', '2021-10-17 00:19:51', 0.00, '2021-08-22 09:27:20', NULL, '4719', '2021-08-22 09:27:20', '2021-08-22 09:30:37', '2021-08-22 09:28:45', '2021-08-22 09:30:09', '2021-08-22 09:30:23', '2021-08-22 09:31:03', '2021-10-17 00:19:51', NULL, NULL, NULL, '{\"contact_person_name\":\"hello yes\",\"contact_person_number\":\"+21620555555\",\"address_type\":\"home\",\"address\":\"53 Dhaka  Bangladesh\",\"longitude\":\"90.35126108676195\",\"latitude\":\"23.76639123991971\"}', 0, 0.00, 1584.34, NULL, 0.00, 0),
(100034, 15, 10.67, 0.00, '', 'unpaid', 'pending', 0.97, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 1, '2021-08-22 10:04:54', '2021-08-22 23:40:45', 0.00, '2021-08-22 10:04:54', NULL, '3269', '2021-08-22 10:04:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"hello yes\",\"contact_person_number\":\"+21620555555\",\"address_type\":\"office\",\"address\":\"SS 127 km 59.000 Bortigiadas 07030 Italy\",\"longitude\":\"8.991410359740257\",\"latitude\":\"40.86096044586421\"}', 0, 0.30, 12945.92, NULL, 0.00, 0),
(100035, 9, 617.40, 0.00, '', 'unpaid', 'pending', 29.40, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-08-22 19:11:39', '2021-08-22 23:40:45', 0.00, '2021-08-22 19:11:39', NULL, '9398', '2021-08-22 19:11:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Sultan 0 Mahamud 1\",\"contact_person_number\":\"+8801723019985\",\"address_type\":\"others\",\"address\":\"Moradabad Moradabad 244926 India\",\"longitude\":\"78.94538920372725\",\"latitude\":\"28.697084694393855\"}', 0, 93.00, 1791.10, NULL, 0.00, 0),
(100036, 15, 2.10, 0.00, '', 'unpaid', 'pending', 0.10, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-08-23 02:36:23', '2021-08-23 03:00:18', 0.00, '2021-08-23 02:36:23', NULL, '8500', '2021-08-23 02:36:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"hello yes\",\"contact_person_number\":\"+21620555555\",\"address_type\":\"office\",\"address\":\"SS 127 km 59.000 Bortigiadas 07030 Italy\",\"longitude\":\"8.991410359740257\",\"latitude\":\"40.86096044586421\"}', 0, 0.00, 14171.77, NULL, 0.00, 0),
(100037, 15, 99.75, 0.00, '', 'paid', 'delivered', 4.75, 'cash_on_delivery', NULL, NULL, 7, NULL, NULL, 'delivery', 1, 2, '2021-08-23 02:58:13', '2021-08-23 03:03:01', 0.00, '2021-08-23 02:58:13', NULL, '7398', '2021-08-23 02:58:13', '2021-08-23 02:58:27', '2021-08-23 02:59:11', '2021-08-23 03:01:22', '2021-08-23 03:01:58', '2021-08-23 03:02:36', '2021-08-23 03:03:01', NULL, NULL, NULL, '{\"contact_person_name\":\"hello yes\",\"contact_person_number\":\"+21620555555\",\"address_type\":\"office\",\"address\":\"SS 127 km 59.000 Bortigiadas 07030 Italy\",\"longitude\":\"8.991410359740257\",\"latitude\":\"40.86096044586421\"}', 0, 0.00, 14171.77, NULL, 0.00, 0),
(100038, 7, 774.48, 0.00, '', 'unpaid', 'pending', 16.30, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 11, '2021-10-17 00:12:02', '2021-10-17 00:36:52', 622.38, '2021-10-17 00:12:02', NULL, '5285', '2021-10-17 00:12:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Md Aziz\",\"contact_person_number\":\"+8801975758279\",\"address_type\":\"others\",\"address\":\"Aainusbag Road Dhaka 1230 Bangladesh\",\"longitude\":\"90.4226173\",\"latitude\":\"23.8581271\"}', 0, 4.20, 622.38, NULL, 0.00, 0),
(100039, 17, 3802.73, 0.00, '', 'unpaid', 'pending', 3.33, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 1, '2021-10-17 00:16:00', '2021-10-17 00:36:52', 3766.16, '2021-10-17 00:16:00', NULL, '4212', '2021-10-17 00:16:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Pili 123\",\"contact_person_number\":\"+8801624343928\",\"address_type\":\"others\",\"address\":\"1no Dhaka 1215 Bangladesh\",\"longitude\":\"90.3934921\",\"latitude\":\"23.7561689\"}', 0, 1.75, 3766.16, NULL, 0.00, 0),
(100040, 17, 357.00, 0.00, '', 'unpaid', 'pending', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-10-17 00:17:46', '2021-10-17 00:36:52', 0.00, '2021-10-17 00:17:46', NULL, '4509', '2021-10-17 00:17:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Pili 123\",\"contact_person_number\":\"+8801624343928\",\"address_type\":\"others\",\"address\":\"1no Dhaka 1215 Bangladesh\",\"longitude\":\"90.3934921\",\"latitude\":\"23.7561689\"}', 0, 60.00, 1136.72, NULL, 0.00, 0),
(100041, 17, 99.75, 0.00, '', 'unpaid', 'pending', 4.75, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-10-17 00:18:00', '2021-10-17 00:36:52', 0.00, '2021-10-17 00:18:00', NULL, '6242', '2021-10-17 00:18:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Pili 123\",\"contact_person_number\":\"+8801624343928\",\"address_type\":\"others\",\"address\":\"1no Dhaka 1215 Bangladesh\",\"longitude\":\"90.3934921\",\"latitude\":\"23.7561689\"}', 0, 0.00, 1136.72, NULL, 0.00, 0),
(100042, 7, 912.15, 0.00, '', 'unpaid', 'pending', 31.05, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 11, '2021-10-17 00:30:50', '2021-10-17 00:36:52', 622.38, '2021-10-17 00:30:50', NULL, '1666', '2021-10-17 00:30:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Md Aziz\",\"contact_person_number\":\"+8801975758279\",\"address_type\":\"others\",\"address\":\"Aainusbag Road Dhaka 1230 Bangladesh\",\"longitude\":\"90.4226173\",\"latitude\":\"23.8581271\"}', 0, 5.28, 622.38, NULL, 0.00, 0),
(100043, 19, 254.36, 0.00, '', 'unpaid', 'pending', 12.11, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-10-17 00:40:40', '2021-10-17 00:41:06', 0.00, '2021-10-17 00:40:40', NULL, '5743', '2021-10-17 00:40:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Ali Mohamed\",\"contact_person_number\":\"+201015523902\",\"address_type\":\"others\",\"address\":\"21 D\\u00fcsseldorf 40217 Germany\",\"longitude\":\"6.7755862\",\"latitude\":\"51.2162275\"}', 0, 42.75, 14121.28, NULL, 0.00, 0),
(100044, 7, 835.32, 0.00, '', 'unpaid', 'pending', 22.81, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 11, '2021-10-17 00:40:55', '2021-10-17 00:41:06', 622.38, '2021-10-17 00:40:55', NULL, '8866', '2021-10-17 00:40:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Md Aziz\",\"contact_person_number\":\"+8801975758279\",\"address_type\":\"others\",\"address\":\"Aainusbag Road Dhaka 1230 Bangladesh\",\"longitude\":\"90.4226194\",\"latitude\":\"23.8581261\"}', 0, 5.88, 622.38, NULL, 0.00, 0),
(100045, 7, 904.62, 0.00, '', 'paid', 'delivered', 30.24, 'ssl_commerz_payment', 'GRtems-178', NULL, 2, NULL, NULL, 'delivery', 1, 11, '2021-10-17 00:41:23', '2021-10-17 00:47:27', 622.38, '2021-10-17 00:41:23', NULL, '6577', '2021-10-17 00:41:23', '2021-10-17 00:45:57', '2021-10-17 00:41:39', '2021-10-17 00:46:14', '2021-10-17 00:46:32', '2021-10-17 00:47:11', '2021-10-17 00:47:27', NULL, NULL, NULL, '{\"contact_person_name\":\"Md Aziz\",\"contact_person_number\":\"+8801975758279\",\"address_type\":\"others\",\"address\":\"Aainusbag Road Dhaka 1230 Bangladesh\",\"longitude\":\"90.4226194\",\"latitude\":\"23.8581261\"}', 0, 0.00, 622.38, '2021-10-17 00:41:27', 0.00, 0),
(100046, 20, 357.00, 0.00, '', 'paid', 'delivered', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 2, '2021-10-17 00:42:58', '2021-10-17 00:44:33', 0.00, '2021-10-17 00:42:58', NULL, '2936', '2021-10-17 00:42:58', NULL, '2021-10-17 00:43:42', '2021-10-17 00:43:51', '2021-10-17 00:44:09', NULL, '2021-10-17 00:44:26', NULL, NULL, NULL, '{\"contact_person_name\":\"Dejan \\u0110usi\\u0107\",\"contact_person_number\":\"+38163627543\",\"address_type\":\"home\",\"address\":\"Bulevar Kraljice MArije 54E, Kragujevac, Serbia\",\"longitude\":\"20.922200000000004\",\"latitude\":\"44.0177\"}', 0, 60.00, 12143.00, NULL, 0.00, 1),
(100047, 20, 390.50, 0.00, '', 'unpaid', 'pending', 35.50, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'take_away', 1, 1, '2021-10-17 00:45:53', '2021-10-17 00:47:17', 0.00, '2021-10-17 00:45:53', NULL, '6309', '2021-10-17 00:45:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Dejan \\u0110usi\\u0107\",\"contact_person_number\":\"+38163627543\",\"address_type\":\"home\",\"address\":\"Bulevar Kraljice MArije 54E, Kragujevac, Serbia\",\"longitude\":\"20.922200000000004\",\"latitude\":\"44.0177\"}', 0, 45.00, 11089.44, NULL, 0.00, 0),
(100048, 20, 855.75, 0.00, '', 'unpaid', 'pending', 40.75, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-10-17 00:46:45', '2021-10-17 00:47:05', 0.00, '2021-10-17 00:46:45', NULL, '9750', '2021-10-17 00:46:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Dejan \\u0110usi\\u0107\",\"contact_person_number\":\"+38163627543\",\"address_type\":\"home\",\"address\":\"Bulevar Kraljice MArije 54E, Kragujevac, Serbia\",\"longitude\":\"20.922200000000004\",\"latitude\":\"44.0177\"}', 0, 100.00, 12143.00, NULL, 0.00, 0),
(100049, 21, 357.00, 0.00, '', 'unpaid', 'pending', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-10-17 15:11:01', '2021-10-17 15:33:50', 0.00, '2021-10-17 15:11:01', NULL, '6464', '2021-10-17 15:11:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Qwa Qwa\",\"contact_person_number\":\"+919555856525\",\"address_type\":\"others\",\"address\":\"Proddatur Bypass Road Proddatur 516362 India\",\"longitude\":\"78.5634613\",\"latitude\":\"14.7406108\"}', 0, 60.00, 2687.13, NULL, 0.00, 0),
(100050, 22, 1028.16, 0.00, '', 'unpaid', 'pending', 20.16, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2021-10-17 15:38:44', '2021-10-17 15:40:16', 0.00, '2021-10-17 15:38:44', NULL, '3970', '2021-10-17 15:38:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Zubair Jamil\",\"contact_person_number\":\"+923422643265\",\"address_type\":\"others\",\"address\":\"Plot F 7\\/7 Karachi 74600 Pakistan\",\"longitude\":\"67.0271801\",\"latitude\":\"24.9114894\"}', 0, 112.00, 1442.25, NULL, 0.00, 0),
(100051, 22, 211.14, 0.00, '', 'unpaid', 'pending', 4.14, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2021-10-17 15:53:52', '2021-10-17 16:00:31', 0.00, '2021-10-17 15:53:52', NULL, '6411', '2021-10-17 15:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Zubair Jamil\",\"contact_person_number\":\"+923422643265\",\"address_type\":\"others\",\"address\":\"Block 3 Karachi 74600 Pakistan\",\"longitude\":\"67.02857997268438\",\"latitude\":\"24.913056527710786\"}', 0, 23.00, 1441.93, NULL, 0.00, 0),
(100052, 22, 1266.84, 0.00, '', 'unpaid', 'confirmed', 24.84, 'cash_on_delivery', NULL, NULL, 7, NULL, NULL, 'delivery', 1, 4, '2021-10-17 15:55:41', '2021-11-15 16:03:32', 0.00, '2021-10-17 15:55:41', NULL, '4102', '2021-10-17 15:55:41', '2021-11-15 16:03:26', '2021-11-15 16:03:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Zubair Jamil\",\"contact_person_number\":\"+923422643265\",\"address_type\":\"others\",\"address\":\"Plot F 7\\/7 Karachi 74600 Pakistan\",\"longitude\":\"67.0271801\",\"latitude\":\"24.9114894\"}', 0, 138.00, 1442.25, NULL, 0.00, 0),
(100053, 22, 99.75, 0.00, '', 'unpaid', 'accepted', 4.75, 'cash_on_delivery', NULL, NULL, 3, NULL, NULL, 'delivery', 1, 2, '2021-10-17 15:56:37', '2021-10-17 16:01:18', 0.00, '2021-10-17 15:56:37', NULL, '6927', '2021-10-17 15:56:37', '2021-10-17 16:01:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Zubair Jamil\",\"contact_person_number\":\"+923422643265\",\"address_type\":\"others\",\"address\":\"Plot F 7\\/7 Karachi 74600 Pakistan\",\"longitude\":\"67.0271801\",\"latitude\":\"24.9114894\"}', 0, 0.00, 3624.55, NULL, 0.00, 0),
(100054, 16, 4704.99, 0.00, '', 'unpaid', 'pending', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 1, '2021-11-15 16:15:20', '2021-12-05 18:47:08', 4517.99, '2021-11-15 16:15:20', NULL, '1747', '2021-11-15 16:15:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Pili 123\",\"contact_person_number\":\"+8801624343926\",\"address_type\":\"others\",\"address\":\"1no Dhaka 1215 Bangladesh\",\"longitude\":\"90.3935375\",\"latitude\":\"23.7562575\"}', 0, 0.00, 4517.99, NULL, 0.00, 0),
(100055, 25, 211.14, 0.00, '', 'unpaid', 'pending', 4.14, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2021-11-15 16:15:28', '2021-12-05 18:47:08', 0.00, '2021-11-15 16:15:28', NULL, '4701', '2021-11-15 16:15:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"king ratana\",\"contact_person_number\":\"+85592444160\",\"address_type\":\"others\",\"address\":\"Lvea Em   Cambodia\",\"longitude\":\"105.1378888\",\"latitude\":\"11.5274311\"}', 0, 23.00, 10482.80, NULL, 0.00, 0),
(100056, 16, 81.60, 0.00, '', 'unpaid', 'confirmed', 1.60, 'cash_on_delivery', NULL, NULL, 7, NULL, NULL, 'delivery', 1, 4, '2021-11-15 16:15:42', '2021-12-05 18:47:08', 0.00, '2021-11-15 16:15:42', NULL, '3981', '2021-11-15 16:15:42', '2021-11-15 16:16:28', '2021-11-15 16:16:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Pili 123\",\"contact_person_number\":\"+8801624343926\",\"address_type\":\"others\",\"address\":\"1no Dhaka 1215 Bangladesh\",\"longitude\":\"90.3935375\",\"latitude\":\"23.7562575\"}', 0, 0.00, 4384.81, NULL, 0.00, 0),
(100057, NULL, 84.79, 0.00, NULL, 'paid', 'delivered', 4.04, 'cash', NULL, NULL, NULL, NULL, NULL, 'pos', 1, 2, '2021-11-15 16:20:39', '2021-11-15 16:20:39', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14.25, 0.00, NULL, 0.00, 0),
(100058, NULL, 371.70, 0.00, NULL, 'paid', 'delivered', 17.70, 'cash', NULL, NULL, NULL, NULL, NULL, 'pos', 1, 2, '2021-11-15 16:21:01', '2021-11-15 16:21:01', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60.00, 0.00, NULL, 0.00, 0),
(100059, 25, 9482.62, 0.00, '', 'unpaid', 'pending', 12.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 14, '2021-11-15 16:22:32', '2021-12-05 18:47:08', 9070.62, '2021-11-15 16:22:32', NULL, '2336', '2021-11-15 16:22:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"king ratana\",\"contact_person_number\":\"+85592444160\",\"address_type\":\"others\",\"address\":\"Lvea Em   Cambodia\",\"longitude\":\"105.1378888\",\"latitude\":\"11.5274311\"}', 0, 50.00, 9070.62, NULL, 0.00, 0),
(100060, 26, 357.00, 0.00, '', 'unpaid', 'pending', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2021-12-05 18:46:42', '2021-12-05 18:47:09', 0.00, '2021-12-05 18:46:42', NULL, '1346', '2021-12-05 18:47:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Chinna Chinna\",\"contact_person_number\":\"+918143143790\",\"address_type\":\"others\",\"address\":\"Toll Gate Yanam 533464 India\",\"longitude\":\"82.202799\",\"latitude\":\"16.7304767\"}', 0, 60.00, 1970.79, NULL, 0.00, 0),
(100061, NULL, 459.64, 0.00, NULL, 'paid', 'delivered', 21.89, 'cash', NULL, NULL, NULL, NULL, NULL, 'pos', 1, 2, '2022-01-11 12:31:20', '2022-01-11 12:31:20', 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77.25, 0.00, NULL, 0.00, 0),
(100062, 29, 357.00, 0.00, '', 'unpaid', 'canceled', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2022-01-11 12:54:12', '2022-01-11 13:27:27', 0.00, '2022-01-11 12:54:12', NULL, '7234', '2022-01-11 12:54:12', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-11 12:55:17', NULL, NULL, '{\"contact_person_name\":\"Vijay Vijay\",\"contact_person_number\":\"+917002346789\",\"address_type\":\"others\",\"address\":\"C85M+FC Nandipulam, Kerala, India\",\"longitude\":\"76.3335874\",\"latitude\":\"10.4087315\"}', 0, 60.00, 5107.75, NULL, 0.00, 0),
(100063, 32, 357.00, 0.00, '', 'unpaid', 'canceled', 17.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2022-01-11 12:59:27', '2022-01-11 13:27:27', 0.00, '2022-01-11 12:59:27', NULL, '7682', '2022-01-11 12:59:27', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-11 13:00:08', NULL, NULL, '{\"contact_person_name\":\"V H\",\"contact_person_number\":\"+916437025100\",\"address_type\":\"others\",\"address\":\"C85M+FC Nandipulam, Kerala, India\",\"longitude\":\"76.3335863\",\"latitude\":\"10.4087318\"}', 0, 60.00, 5107.75, NULL, 0.00, 0),
(100064, 29, 81.60, 0.00, '', 'unpaid', 'canceled', 1.60, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2022-01-11 13:02:47', '2022-01-11 13:27:27', 0.00, '2022-01-11 13:02:47', NULL, '3013', '2022-01-11 13:02:47', NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-11 13:03:38', NULL, NULL, '{\"contact_person_name\":\"Vijay Vijay\",\"contact_person_number\":\"+917002346789\",\"address_type\":\"others\",\"address\":\"C85M+FC Nandipulam, Kerala, India\",\"longitude\":\"76.3335866\",\"latitude\":\"10.4087306\"}', 0, 0.00, 4732.05, NULL, 0.00, 0),
(100065, 27, 312.50, 0.00, '', 'unpaid', 'failed', 62.50, 'paypal', 'PAYID-MHOS3LQ6F44172466415934R', NULL, NULL, NULL, NULL, 'delivery', 1, 13, '2022-01-11 13:11:15', '2022-01-11 13:27:27', 0.00, '2022-01-12 07:01:00', NULL, '2009', '2022-01-11 13:11:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"V V\",\"contact_person_number\":\"+911234567890\",\"address_type\":\"others\",\"address\":\"C85M+GC Nandipulam, Kerala, India\",\"longitude\":\"76.3335466\",\"latitude\":\"10.408774\"}', 1, 40.00, 11529.13, '2022-01-11 13:11:42', 0.00, 0),
(100066, 5, 99.75, 0.00, '', 'paid', 'delivered', 4.75, 'cash_on_delivery', NULL, NULL, 1, NULL, NULL, 'delivery', 1, 2, '2022-01-11 13:38:32', '2022-01-11 13:40:42', 0.00, '2022-01-11 13:38:32', NULL, '2322', '2022-01-11 13:38:32', '2022-01-11 13:39:02', '2022-01-11 13:39:41', '2022-01-11 13:40:02', '2022-01-11 13:40:15', '2022-01-11 13:40:27', '2022-01-11 13:40:42', NULL, NULL, NULL, '{\"contact_person_name\":\"Ashek Elahe\",\"contact_person_number\":\"+8801879762951\",\"address_type\":\"others\",\"address\":\"667 Rd Number 10, Dhaka 1216, Bangladesh\",\"longitude\":\"90.37015919999999\",\"latitude\":\"23.837583999999993\"}', 0, 0.00, 1341.16, NULL, 0.00, 0),
(100067, 5, 99.75, 0.00, '', 'paid', 'delivered', 4.75, 'cash_on_delivery', NULL, NULL, 9, NULL, NULL, 'delivery', 1, 2, '2022-01-11 13:42:04', '2022-01-11 13:45:07', 0.00, '2022-01-11 13:42:04', NULL, '2023', '2022-01-11 13:42:04', '2022-01-11 13:44:31', '2022-01-11 13:44:22', '2022-01-11 13:44:41', '2022-01-11 13:44:50', NULL, '2022-01-11 13:45:07', NULL, NULL, NULL, '{\"contact_person_name\":\"Ashek Elahe\",\"contact_person_number\":\"+8801879762951\",\"address_type\":\"others\",\"address\":\"667 Rd Number 10, Dhaka 1216, Bangladesh\",\"longitude\":\"90.37015919999999\",\"latitude\":\"23.837583999999993\"}', 0, 0.00, 1341.16, NULL, 0.00, 0),
(100068, 5, 99.75, 0.00, '', 'paid', 'confirmed', 4.75, 'ssl_commerz_payment', 'V21NHp-273', NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2022-01-11 13:53:48', '2022-01-11 13:54:22', 0.00, '2022-01-11 13:53:48', 'https://stackfood.6amtech.com/order-successful?id=100068', '3601', '2022-01-11 13:53:48', NULL, '2022-01-11 13:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Ashek Elahe\",\"contact_person_number\":\"+8801879762951\",\"address_type\":\"others\",\"address\":\"Q972+VPF, Dhaka, Bangladesh\",\"longitude\":\"90.3514959774026\",\"latitude\":\"23.76469684059319\"}', 0, 0.00, 1329.69, '2022-01-11 13:53:56', 0.00, 0),
(100069, 37, 99.75, 0.00, '', 'unpaid', 'pending', 4.75, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2022-01-11 14:17:39', '2022-01-11 14:18:27', 0.00, '2022-01-11 14:17:39', NULL, '7818', '2022-01-11 14:17:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Asdfghj Asdfghj\",\"contact_person_number\":\"+919876543210\",\"address_type\":\"home\",\"address\":\"new colony deoria near gurudwara park\",\"longitude\":\"83.9127155765891\",\"latitude\":\"26.5276801931362\"}', 0, 0.00, 443.76, NULL, 0.00, 0),
(100070, 38, 99.75, 0.00, '', 'unpaid', 'pending', 4.75, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 2, '2022-01-11 14:23:22', '2022-01-11 14:23:32', 0.00, '2022-01-11 14:23:22', NULL, '1529', '2022-01-11 14:23:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Fatema Subarna\",\"contact_person_number\":\"+8801885576624\",\"address_type\":\"others\",\"address\":\"667 Rd Number 10, Dhaka 1216, Bangladesh\",\"longitude\":\"90.3700308\",\"latitude\":\"23.8376226\"}', 0, 0.00, 1341.13, NULL, 0.00, 0),
(100071, 40, 1967.10, 0.00, '', 'paid', 'delivered', 14.40, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 11, '2022-01-20 18:04:58', '2022-01-20 18:07:04', 1832.70, '2022-01-20 18:04:57', NULL, '8306', '2022-01-20 18:04:58', NULL, '2022-01-20 18:06:44', NULL, NULL, NULL, '2022-01-20 18:07:04', NULL, NULL, NULL, '{\"contact_person_name\":\"hahaS ASJBHDS\",\"contact_person_number\":\"+919029765478\",\"address_type\":\"others\",\"address\":\"5\\/789 Lucknow 226010 India\",\"longitude\":\"80.9979496\",\"latitude\":\"26.8472189\"}', 0, 0.00, 1832.70, NULL, 0.00, 0),
(100072, 38, 3718.45, 0.00, '', 'paid', 'delivered', 27.50, 'cash_on_delivery', NULL, NULL, 5, NULL, NULL, 'delivery', 1, 10, '2022-01-20 18:14:32', '2022-01-20 18:22:27', 3415.95, '2022-01-20 18:14:32', NULL, '8865', '2022-01-20 18:14:32', '2022-01-20 18:15:22', '2022-01-20 18:19:16', '2022-01-20 18:21:17', '2022-01-20 18:21:29', '2022-01-20 18:21:59', '2022-01-20 18:22:27', NULL, NULL, NULL, '{\"contact_person_name\":\"Fatema Subarna\",\"contact_person_number\":\"+8801885576624\",\"address_type\":\"others\",\"address\":\"Q972+VPF, Dhaka, Bangladesh\",\"longitude\":\"90.35110973930446\",\"latitude\":\"23.76469684059319\"}', 0, 15.00, 3415.95, NULL, 0.00, 0),
(100073, 43, 238.68, 0.00, '', 'unpaid', 'pending', 4.68, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 4, '2022-01-20 18:19:09', '2022-01-20 18:19:27', 0.00, '2022-01-20 18:19:09', NULL, '2630', '2022-01-20 18:19:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Leo Leonardo\",\"contact_person_number\":\"+40725042424\",\"address_type\":\"others\",\"address\":\"\\u0218oseaua Gheorghe Ionescu Sise\\u0219ti nr 236, Bucure\\u0219ti, Romania\",\"longitude\":\"26.0301256\",\"latitude\":\"44.5062866\"}', 0, 26.00, 12402.43, NULL, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `food_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_food` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 1.00,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `food_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(1, 3, 100001, 80.00, '{\"id\":3,\"name\":\"Burger Combo\",\"description\":\"A combo Burger.\",\"image\":\"2021-08-21-6120ad6b86273.png\",\"category_id\":24,\"category_ids\":[{\"id\":\"5\",\"position\":1},{\"id\":\"24\",\"position\":2}],\"variations\":[{\"type\":\"Small\",\"price\":80},{\"type\":\"Big\",\"price\":120}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Big\"]}],\"price\":80,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T07:38:19.000000Z\",\"updated_at\":\"2021-08-21T07:38:19.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Small\",\"price\":80}]', '[]', 0.00, 'discount_on_product', 3, 1.60, 'null', '2021-08-21 13:40:08', '2021-08-21 13:40:08', NULL, 0.00),
(2, 1, 100002, 420.00, '{\"id\":1,\"name\":\"Mutton Biriyani\",\"description\":\"This mutton biryani recipe has layers of mutton and saffron-milk-infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon, cloves, jaiphal, and javitri along with chilies, rose water, kewda, and saffron cooked with succulent mutton pieces.\",\"image\":\"2021-08-21-611ff39525320.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[{\"type\":\"1:3\",\"price\":250},{\"type\":\"1:5\",\"price\":420}],\"add_ons\":[],\"attributes\":[\"2\"],\"choice_options\":[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"1:3\",\"1:5\"]}],\"price\":250,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"10:30:00\",\"available_time_ends\":\"23:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-20T18:25:25.000000Z\",\"updated_at\":\"2021-08-20T18:25:25.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"1:5\",\"price\":420}]', '[]', 42.00, 'discount_on_product', 1, 42.00, 'null', '2021-08-21 13:58:06', '2021-08-21 13:58:06', NULL, 0.00),
(3, 2, 100002, 150.00, '{\"id\":2,\"name\":\"Hyderabadi Mutton Biriyani\",\"description\":\"Hyderabadi Biryani is characteristically distinct. The aroma, taste, tender meat, the Zaffran, everything gives it a distinguished appearance. ... Yoghurt makes the meat tender, lemon tangy, fried onions add a crispy sweet taste, and Hyderabadi spices make it hot.\",\"image\":\"2021-08-21-612007ca5affc.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":150,\"tax\":10,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"amount\",\"available_time_starts\":\"10:00:00\",\"available_time_ends\":\"16:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-20T19:51:38.000000Z\",\"updated_at\":\"2021-08-20T19:51:38.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 20.00, 'discount_on_product', 1, 15.00, 'null', '2021-08-21 13:58:06', '2021-08-21 13:58:06', NULL, 0.00),
(4, 2, 100003, 150.00, '{\"id\":2,\"name\":\"Hyderabadi Mutton Biriyani\",\"description\":\"Hyderabadi Biryani is characteristically distinct. The aroma, taste, tender meat, the Zaffran, everything gives it a distinguished appearance. ... Yoghurt makes the meat tender, lemon tangy, fried onions add a crispy sweet taste, and Hyderabadi spices make it hot.\",\"image\":\"2021-08-21-612007ca5affc.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":150,\"tax\":10,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"amount\",\"available_time_starts\":\"10:00:00\",\"available_time_ends\":\"16:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-20T19:51:38.000000Z\",\"updated_at\":\"2021-08-20T19:51:38.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 20.00, 'discount_on_product', 1, 15.00, 'null', '2021-08-21 14:03:25', '2021-08-21 14:03:25', NULL, 0.00),
(5, 1, 100004, 250.00, '{\"id\":1,\"name\":\"Mutton Biriyani\",\"description\":\"This mutton biryani recipe has layers of mutton and saffron-milk-infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon, cloves, jaiphal, and javitri along with chilies, rose water, kewda, and saffron cooked with succulent mutton pieces.\",\"image\":\"2021-08-21-611ff39525320.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[{\"type\":\"1:3\",\"price\":250},{\"type\":\"1:5\",\"price\":420}],\"add_ons\":[],\"attributes\":[\"2\"],\"choice_options\":[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"1:3\",\"1:5\"]}],\"price\":250,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"10:30:00\",\"available_time_ends\":\"23:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-20T18:25:25.000000Z\",\"updated_at\":\"2021-08-20T18:25:25.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"1:3\",\"price\":250}]', '[]', 25.00, 'discount_on_product', 1, 25.00, 'null', '2021-08-21 14:14:37', '2021-08-21 14:14:37', NULL, 0.00),
(6, NULL, 100005, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-08-20T20:37:56.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-08-21 14:20:36', '2021-08-21 14:20:36', 1, 0.00),
(7, 6, 100006, 150.00, '{\"id\":6,\"name\":\"Chicago Pizza\",\"description\":\"Chicago pizza, also commonly referred to as deep-dish pizza, gets its name from the city it was invented in. During early 1900.\",\"image\":\"2021-08-21-6120bb67e9382.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"8inches\",\"price\":150},{\"type\":\"12inches\",\"price\":200},{\"type\":\"16inches\",\"price\":250}],\"add_ons\":[{\"id\":6,\"name\":\"Cheese\",\"price\":10,\"created_at\":\"2021-08-21T08:29:48.000000Z\",\"updated_at\":\"2021-08-21T08:29:48.000000Z\",\"restaurant_id\":14,\"status\":1},{\"id\":7,\"name\":\"Extra Spice\",\"price\":5,\"created_at\":\"2021-08-21T08:30:01.000000Z\",\"updated_at\":\"2021-08-21T08:30:01.000000Z\",\"restaurant_id\":14,\"status\":1},{\"id\":8,\"name\":\"Extra Chicken\",\"price\":15,\"created_at\":\"2021-08-21T08:30:18.000000Z\",\"updated_at\":\"2021-08-21T08:30:18.000000Z\",\"restaurant_id\":14,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"8 inches\",\"12 inches\",\"16 inches\"]}],\"price\":150,\"tax\":3,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"amount\",\"available_time_starts\":\"11:00:00\",\"available_time_ends\":\"20:15:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":14,\"created_at\":\"2021-08-21T08:37:59.000000Z\",\"updated_at\":\"2021-08-21T08:37:59.000000Z\",\"order_count\":0,\"restaurant_name\":\"Italian Fast Food\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"8inches\",\"price\":150}]', '[{\"name\":\"Extra Spice\",\"price\":5,\"quantity\":2},{\"name\":\"Extra Chicken\",\"price\":15,\"quantity\":2}]', 10.00, 'discount_on_product', 2, 4.50, 'null', '2021-08-21 17:27:21', '2021-08-21 17:27:21', NULL, 40.00),
(8, 69, 100007, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"17:46:00\",\"available_time_ends\":\"21:46:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-08-21T11:46:44.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-08-21 21:38:49', '2021-08-21 21:38:49', NULL, 0.00),
(9, 67, 100008, 400.00, '{\"id\":67,\"name\":\"Meat Pizza\",\"description\":\"If you\\u2019re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.\",\"image\":\"2021-08-21-6120e6dadf410.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":400},{\"type\":\"Large\",\"price\":750}],\"add_ons\":[{\"id\":31,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T11:29:34.000000Z\",\"updated_at\":\"2021-08-21T11:29:34.000000Z\",\"restaurant_id\":2,\"status\":1},{\"id\":34,\"name\":\"Extra Meat\",\"price\":14,\"created_at\":\"2021-08-21T11:32:24.000000Z\",\"updated_at\":\"2021-08-21T11:32:24.000000Z\",\"restaurant_id\":2,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":30,\"discount_type\":\"amount\",\"available_time_starts\":\"02:00:00\",\"available_time_ends\":\"22:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:43:22.000000Z\",\"updated_at\":\"2021-08-21T11:43:22.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"09:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Small\",\"price\":400}]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-08-21 22:05:50', '2021-08-21 22:05:50', NULL, 0.00),
(10, 3, 100009, 80.00, '{\"id\":3,\"name\":\"Burger Combo\",\"description\":\"A combo Burger.\",\"image\":\"2021-08-21-6120ad6b86273.png\",\"category_id\":24,\"category_ids\":[{\"id\":\"5\",\"position\":1},{\"id\":\"24\",\"position\":2}],\"variations\":[{\"type\":\"Small\",\"price\":80},{\"type\":\"Big\",\"price\":120}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Big\"]}],\"price\":80,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T07:38:19.000000Z\",\"updated_at\":\"2021-08-21T07:54:22.000000Z\",\"order_count\":1,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":5,\"rating_count\":1}', '[{\"type\":\"Small\",\"price\":80}]', '[]', 0.00, 'discount_on_product', 1, 1.60, 'null', '2021-08-21 22:20:51', '2021-08-21 22:20:51', NULL, 0.00),
(11, 61, 100010, 310.00, '{\"id\":61,\"name\":\"Pepperoni Pizza\",\"description\":\"Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper\",\"image\":\"2021-08-21-6120eb4af0745.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":310},{\"type\":\"Medium\",\"price\":425},{\"type\":\"Large\",\"price\":550}],\"add_ons\":[{\"id\":2,\"name\":\"Cheese\",\"price\":15,\"created_at\":\"2021-08-21T08:19:43.000000Z\",\"updated_at\":\"2021-08-21T08:19:43.000000Z\",\"restaurant_id\":2,\"status\":1},{\"id\":31,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T11:29:34.000000Z\",\"updated_at\":\"2021-08-21T11:29:34.000000Z\",\"restaurant_id\":2,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\" Medium\",\" Large\"]}],\"price\":310,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"amount\",\"available_time_starts\":\"00:15:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:36:58.000000Z\",\"updated_at\":\"2021-08-21T12:02:18.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"09:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Small\",\"price\":310}]', '[]', 46.50, 'discount_on_product', 1, 15.50, 'null', '2021-08-21 22:22:15', '2021-08-21 22:22:15', NULL, 0.00),
(12, 55, 100011, 270.00, '{\"id\":55,\"name\":\"Mushroom noodles\",\"description\":\"Mushroom Noodles recipe is made with the goodness of sliced mushrooms and fresh noodles which can be relished by many. It tastes best when had with tomato sauce or any other sauce.\",\"image\":\"2021-08-21-6120e2b1507bb.png\",\"category_id\":14,\"category_ids\":[{\"id\":\"14\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":27,\"name\":\"Tomato Sauce\",\"price\":10,\"created_at\":\"2021-08-21T11:01:41.000000Z\",\"updated_at\":\"2021-08-21T11:03:37.000000Z\",\"restaurant_id\":10,\"status\":1},{\"id\":28,\"name\":\"Hot Sauce\",\"price\":12,\"created_at\":\"2021-08-21T11:03:52.000000Z\",\"updated_at\":\"2021-08-21T11:03:52.000000Z\",\"restaurant_id\":10,\"status\":1},{\"id\":29,\"name\":\"Taco Sauce\",\"price\":11,\"created_at\":\"2021-08-21T11:04:26.000000Z\",\"updated_at\":\"2021-08-21T11:04:26.000000Z\",\"restaurant_id\":10,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":270,\"tax\":10,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"amount\",\"available_time_starts\":\"17:30:00\",\"available_time_ends\":\"22:30:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":10,\"created_at\":\"2021-08-21T11:25:37.000000Z\",\"updated_at\":\"2021-08-21T11:55:35.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Lunch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"17:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[{\"name\":\"Tomato Sauce\",\"price\":10,\"quantity\":5},{\"name\":\"Hot Sauce\",\"price\":12,\"quantity\":4},{\"name\":\"Taco Sauce\",\"price\":11,\"quantity\":2}]', 20.00, 'discount_on_product', 9, 27.00, 'null', '2021-08-21 22:30:24', '2021-08-21 22:30:24', NULL, 120.00),
(13, 128, 100011, 290.00, '{\"id\":128,\"name\":\"Ramen\",\"description\":\"Ramen is a Japanese noodle soup. It consists of Chinese-style wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso\",\"image\":\"2021-08-21-61210c8b6348e.png\",\"category_id\":10,\"category_ids\":[{\"id\":\"10\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":27,\"name\":\"Tomato Sauce\",\"price\":10,\"created_at\":\"2021-08-21T11:01:41.000000Z\",\"updated_at\":\"2021-08-21T11:03:37.000000Z\",\"restaurant_id\":10,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":290,\"tax\":10,\"tax_type\":\"percent\",\"discount\":15,\"discount_type\":\"amount\",\"available_time_starts\":\"17:00:00\",\"available_time_ends\":\"23:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":10,\"created_at\":\"2021-08-21T14:24:11.000000Z\",\"updated_at\":\"2021-08-21T14:24:11.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Lunch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"17:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[{\"name\":\"Tomato Sauce\",\"price\":10,\"quantity\":1}]', 15.00, 'discount_on_product', 10, 29.00, 'null', '2021-08-21 22:30:24', '2021-08-21 22:30:24', NULL, 10.00),
(14, 3, 100012, 80.00, '{\"id\":3,\"name\":\"Burger Combo\",\"description\":\"A combo Burger.\",\"image\":\"2021-08-21-6120ad6b86273.png\",\"category_id\":24,\"category_ids\":[{\"id\":\"5\",\"position\":1},{\"id\":\"24\",\"position\":2}],\"variations\":[{\"type\":\"Small\",\"price\":80},{\"type\":\"Big\",\"price\":120}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Big\"]}],\"price\":80,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T07:38:19.000000Z\",\"updated_at\":\"2021-08-21T07:54:22.000000Z\",\"order_count\":1,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":5,\"rating_count\":1}', '[{\"type\":\"Small\",\"price\":80}]', '[]', 0.00, 'discount_on_product', 12, 1.60, 'null', '2021-08-21 22:30:47', '2021-08-21 22:30:47', NULL, 0.00),
(15, 144, 100013, 205.00, '{\"id\":144,\"name\":\"Chocolate Cupcakes\",\"description\":\"Chocolate Cupcakes is a small cake designed to serve one person\",\"image\":\"2021-08-21-6121138178d8a.png\",\"category_id\":8,\"category_ids\":[{\"id\":\"8\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":205,\"tax\":15,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"amount\",\"available_time_starts\":\"16:00:00\",\"available_time_ends\":\"23:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2021-08-21T14:52:45.000000Z\",\"updated_at\":\"2021-08-21T14:53:53.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheesy Restaurant\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 10.00, 'discount_on_product', 1, 30.75, 'null', '2021-08-21 22:37:38', '2021-08-21 22:37:38', NULL, 0.00),
(16, 64, 100014, 250.00, '{\"id\":64,\"name\":\"Cheese Pizza\",\"description\":\"It should be no shocker that a classic is the statistical favorite. Cheese pizza is one of the most popular choices\",\"image\":\"2021-08-21-6120e61452e2b.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":250},{\"type\":\"Medium\",\"price\":350}],\"add_ons\":[{\"id\":31,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T11:29:34.000000Z\",\"updated_at\":\"2021-08-21T11:29:34.000000Z\",\"restaurant_id\":2,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\"]}],\"price\":250,\"tax\":5,\"tax_type\":\"percent\",\"discount\":7,\"discount_type\":\"percent\",\"available_time_starts\":\"01:00:00\",\"available_time_ends\":\"23:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:40:04.000000Z\",\"updated_at\":\"2021-08-21T11:40:04.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"09:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Small\",\"price\":250}]', '[{\"name\":\"Pepsi\",\"price\":18,\"quantity\":2}]', 37.50, 'discount_on_product', 1, 12.50, 'null', '2021-08-21 22:51:46', '2021-08-21 22:51:46', NULL, 36.00),
(17, 19, 100015, 220.00, '{\"id\":19,\"name\":\"Chicken Coconut Soup\",\"description\":\"Known as Tom Kha Ghai, this coconut soup is one we are always craving. The creamy coconut paired with ginger and lime gives this soup it\'s unique and delicious flavor.\",\"image\":\"2021-08-21-6120cf263b7e2.png\",\"category_id\":19,\"category_ids\":[{\"id\":\"19\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":220,\"tax\":10,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"available_time_starts\":\"01:01:00\",\"available_time_ends\":\"18:01:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T10:02:14.000000Z\",\"updated_at\":\"2021-08-21T10:02:14.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 11.00, 'discount_on_product', 1, 22.00, 'null', '2021-08-22 01:11:33', '2021-08-22 01:11:33', NULL, 0.00),
(18, 43, 100016, 35.00, '{\"id\":43,\"name\":\"Steamed rice \\/chicken curry\",\"description\":\"Chicken drumsticks, basmati rice, brown vinegar, buttermilk, onions, ginger\",\"image\":\"2021-08-21-6120d8af14e47.png\",\"category_id\":13,\"category_ids\":[{\"id\":\"13\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":35,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"13:15:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2021-08-21T10:42:55.000000Z\",\"updated_at\":\"2021-08-21T10:42:55.000000Z\",\"order_count\":0,\"restaurant_name\":\"Vintage Kitchen\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"14:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 2, 3.50, 'null', '2021-08-22 01:12:46', '2021-08-22 01:12:46', NULL, 0.00),
(19, 36, 100017, 75.00, '{\"id\":36,\"name\":\"Biryani\",\"description\":\"A mixed rice dish originating among the Muslims of the Indian subcontinent. It is made with Indian spices, rice, and meat usually that of chicken, goat, lamb, prawn, fish, and sometimes, in addition, eggs or vegetables such as potatoes in certain regional varieties.\",\"image\":\"2021-08-21-6120d6ac5111e.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":75,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:30:00\",\"available_time_ends\":\"13:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2021-08-21T10:34:20.000000Z\",\"updated_at\":\"2021-08-21T10:34:20.000000Z\",\"order_count\":0,\"restaurant_name\":\"Vintage Kitchen\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"14:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 7.50, 'discount_on_product', 1, 7.50, 'null', '2021-08-22 01:13:42', '2021-08-22 01:13:42', NULL, 0.00),
(20, 25, 100018, 20.00, '{\"id\":25,\"name\":\"Vegan Tofu Tikka Masala\",\"description\":\"Non-dairy version of India\'s most popular curry. Our vegan version is full of robust tomato, toasted cumin, and bright lemon, and enriched with a touch of coconut cream.\",\"image\":\"2021-08-21-6120d165c4bb5.png\",\"category_id\":13,\"category_ids\":[{\"id\":\"13\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":20,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"13:25:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2021-08-21T10:11:49.000000Z\",\"updated_at\":\"2021-08-21T10:11:49.000000Z\",\"order_count\":0,\"restaurant_name\":\"Vintage Kitchen\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"14:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 3, 2.00, 'null', '2021-08-22 01:18:27', '2021-08-22 01:18:27', NULL, 0.00),
(21, 149, 100019, 45.00, '{\"id\":149,\"name\":\"Pizza Margherita\",\"description\":\"Pizza Margherita is a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella cheese, fresh basil, salt, and extra-virgin olive oil.\",\"image\":\"2021-08-21-6121199b40ead.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"9inch\",\"price\":45},{\"type\":\"12inch\",\"price\":55},{\"type\":\"17inch\",\"price\":60},{\"type\":\"22inch\",\"price\":68}],\"add_ons\":[{\"id\":3,\"name\":\"Cheese\",\"price\":15,\"created_at\":\"2021-08-21T08:20:33.000000Z\",\"updated_at\":\"2021-08-21T08:20:33.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":4,\"name\":\"Coke\",\"price\":10,\"created_at\":\"2021-08-21T08:21:51.000000Z\",\"updated_at\":\"2021-08-21T08:21:51.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":5,\"name\":\"Extra Spice\",\"price\":5,\"created_at\":\"2021-08-21T08:23:05.000000Z\",\"updated_at\":\"2021-08-21T08:23:05.000000Z\",\"restaurant_id\":9,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9inch\",\"12inch\",\"17inch\",\"22inch\"]}],\"price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":9,\"created_at\":\"2021-08-21T15:19:55.000000Z\",\"updated_at\":\"2021-08-21T15:20:38.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Takeaways\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"9inch\",\"price\":45}]', '[{\"name\":\"Extra Spice\",\"price\":5,\"quantity\":1}]', 2.25, 'discount_on_product', 1, 0.00, 'null', '2021-08-22 01:22:20', '2021-08-22 01:22:20', NULL, 5.00),
(22, 149, 100019, 68.00, '{\"id\":149,\"name\":\"Pizza Margherita\",\"description\":\"Pizza Margherita is a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella cheese, fresh basil, salt, and extra-virgin olive oil.\",\"image\":\"2021-08-21-6121199b40ead.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"9inch\",\"price\":45},{\"type\":\"12inch\",\"price\":55},{\"type\":\"17inch\",\"price\":60},{\"type\":\"22inch\",\"price\":68}],\"add_ons\":[{\"id\":3,\"name\":\"Cheese\",\"price\":15,\"created_at\":\"2021-08-21T08:20:33.000000Z\",\"updated_at\":\"2021-08-21T08:20:33.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":4,\"name\":\"Coke\",\"price\":10,\"created_at\":\"2021-08-21T08:21:51.000000Z\",\"updated_at\":\"2021-08-21T08:21:51.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":5,\"name\":\"Extra Spice\",\"price\":5,\"created_at\":\"2021-08-21T08:23:05.000000Z\",\"updated_at\":\"2021-08-21T08:23:05.000000Z\",\"restaurant_id\":9,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9inch\",\"12inch\",\"17inch\",\"22inch\"]}],\"price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":9,\"created_at\":\"2021-08-21T15:19:55.000000Z\",\"updated_at\":\"2021-08-21T15:20:38.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Takeaways\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"22inch\",\"price\":68}]', '[{\"name\":\"Cheese\",\"price\":15,\"quantity\":1}]', 3.40, 'discount_on_product', 1, 0.00, 'null', '2021-08-22 01:22:20', '2021-08-22 01:22:20', NULL, 15.00),
(23, 128, 100020, 290.00, '{\"id\":128,\"name\":\"Ramen\",\"description\":\"Ramen is a Japanese noodle soup. It consists of Chinese-style wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso\",\"image\":\"2021-08-21-61210c8b6348e.png\",\"category_id\":10,\"category_ids\":[{\"id\":\"10\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":27,\"name\":\"Tomato Sauce\",\"price\":10,\"created_at\":\"2021-08-21T11:01:41.000000Z\",\"updated_at\":\"2021-08-21T11:03:37.000000Z\",\"restaurant_id\":10,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":290,\"tax\":10,\"tax_type\":\"percent\",\"discount\":15,\"discount_type\":\"amount\",\"available_time_starts\":\"17:00:00\",\"available_time_ends\":\"23:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":10,\"created_at\":\"2021-08-21T14:24:11.000000Z\",\"updated_at\":\"2021-08-21T14:24:11.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Lunch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"17:00\",\"restaurant_closing_time\":\"23:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 15.00, 'discount_on_product', 1, 29.00, 'null', '2021-08-22 01:26:25', '2021-08-22 01:26:25', NULL, 0.00),
(24, 76, 100021, 220.00, '{\"id\":76,\"name\":\"Garlic Noodles\",\"description\":\"Garlic noodles are an irresistible combination of garlic and carbs\",\"image\":\"2021-08-21-6120ed8f3e3ee.png\",\"category_id\":14,\"category_ids\":[{\"id\":\"14\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":15,\"name\":\"sauce\",\"price\":5,\"created_at\":\"2021-08-21T09:27:55.000000Z\",\"updated_at\":\"2021-08-21T09:27:55.000000Z\",\"restaurant_id\":1,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":220,\"tax\":10,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"amount\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"18:10:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T12:11:59.000000Z\",\"updated_at\":\"2021-08-21T12:11:59.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[{\"name\":\"sauce\",\"price\":5,\"quantity\":2}]', 20.00, 'discount_on_product', 1, 22.00, 'null', '2021-08-22 01:27:13', '2021-08-22 01:27:13', NULL, 10.00),
(25, 23, 100021, 250.00, '{\"id\":23,\"name\":\"Spicy Thai Basil Chicken\",\"description\":\"The sauce actually acts as a glaze as the chicken mixture cooks over high heat. The recipe works best if you chop or grind your own chicken and have all ingredients prepped before you start cooking.\",\"image\":\"2021-08-21-6120d12310b48.png\",\"category_id\":19,\"category_ids\":[{\"id\":\"19\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":250,\"tax\":10,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"available_time_starts\":\"01:09:00\",\"available_time_ends\":\"19:09:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T10:10:43.000000Z\",\"updated_at\":\"2021-08-21T10:10:43.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"20:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 12.50, 'discount_on_product', 2, 25.00, 'null', '2021-08-22 01:27:13', '2021-08-22 01:27:13', NULL, 0.00),
(26, 101, 100022, 22.00, '{\"id\":101,\"name\":\"Spicy Enchiladas Potosinas\",\"description\":\"Enchilada Potosina is a unique enchilada variety from San Luis Potos\\u00ed in Mexico, prepared by adding ancho peppers in the corn dough, filling it with cheese, closing the dough just like an empanada, and frying the concoction in hot oil until golden-brown in color.\",\"image\":\"2021-08-21-6120fd9c4a003.png\",\"category_id\":15,\"category_ids\":[{\"id\":\"15\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":22,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:30:00\",\"available_time_ends\":\"23:25:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":5,\"created_at\":\"2021-08-21T13:20:28.000000Z\",\"updated_at\":\"2021-08-21T13:20:28.000000Z\",\"order_count\":0,\"restaurant_name\":\"Frying Nemo\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 1, 1.10, 'null', '2021-08-22 01:31:58', '2021-08-22 01:31:58', NULL, 0.00),
(27, 120, 100023, 14.00, '{\"id\":120,\"name\":\"Hazelnut semifreddo\",\"description\":\"Hazelnuts are used in baking and desserts, confectionery to make praline, and also used in combination with chocolate for chocolate truffles and products such as chocolate bars, hazelnut cocoa spread such as Nutella, and Frangelico liqueur.\",\"image\":\"2021-08-21-6121073d44b4a.png\",\"category_id\":11,\"category_ids\":[{\"id\":\"11\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":14,\"tax\":12,\"tax_type\":\"percent\",\"discount\":3,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":11,\"created_at\":\"2021-08-21T14:01:33.000000Z\",\"updated_at\":\"2021-08-21T14:01:33.000000Z\",\"order_count\":0,\"restaurant_name\":\"Redcliff Cafe\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.42, 'discount_on_product', 8, 1.68, 'null', '2021-08-22 01:32:36', '2021-08-22 01:32:36', NULL, 0.00),
(28, 139, 100024, 20.00, '{\"id\":139,\"name\":\"Cheesy Sandwich\",\"description\":\"A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.\",\"image\":\"2021-08-21-6121100d50344.png\",\"category_id\":11,\"category_ids\":[{\"id\":\"11\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":3,\"name\":\"Cheese\",\"price\":15,\"created_at\":\"2021-08-21T08:20:33.000000Z\",\"updated_at\":\"2021-08-21T08:20:33.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":4,\"name\":\"Coke\",\"price\":10,\"created_at\":\"2021-08-21T08:21:51.000000Z\",\"updated_at\":\"2021-08-21T08:21:51.000000Z\",\"restaurant_id\":9,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:50:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":9,\"created_at\":\"2021-08-21T14:39:09.000000Z\",\"updated_at\":\"2021-08-21T14:39:09.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Takeaways\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[{\"name\":\"Cheese\",\"price\":15,\"quantity\":1}]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2021-08-22 01:33:46', '2021-08-22 01:33:46', NULL, 15.00),
(29, 138, 100024, 15.00, '{\"id\":138,\"name\":\"Sandwich\",\"description\":\"A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.\",\"image\":\"2021-08-21-61210f51ee379.png\",\"category_id\":11,\"category_ids\":[{\"id\":\"11\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":15,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":9,\"created_at\":\"2021-08-21T14:36:01.000000Z\",\"updated_at\":\"2021-08-21T14:36:01.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Takeaways\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2021-08-22 01:33:46', '2021-08-22 01:33:46', NULL, 0.00),
(30, 135, 100024, 30.00, '{\"id\":135,\"name\":\"Dark Fried Chicken Roll\",\"description\":\"Chicken Roll is a delectable North Indian recipe made using all purpose flour, stir-fried chicken, yoghurt and a variety of vegetables rolled into paranthas.\",\"image\":\"2021-08-21-61210e8e799b4.png\",\"category_id\":11,\"category_ids\":[{\"id\":\"11\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":3,\"name\":\"Cheese\",\"price\":15,\"created_at\":\"2021-08-21T08:20:33.000000Z\",\"updated_at\":\"2021-08-21T08:20:33.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":4,\"name\":\"Coke\",\"price\":10,\"created_at\":\"2021-08-21T08:21:51.000000Z\",\"updated_at\":\"2021-08-21T08:21:51.000000Z\",\"restaurant_id\":9,\"status\":1},{\"id\":5,\"name\":\"Extra Spice\",\"price\":5,\"created_at\":\"2021-08-21T08:23:05.000000Z\",\"updated_at\":\"2021-08-21T08:23:05.000000Z\",\"restaurant_id\":9,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":30,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":9,\"created_at\":\"2021-08-21T14:32:46.000000Z\",\"updated_at\":\"2021-08-21T14:32:46.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Takeaways\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[{\"name\":\"Coke\",\"price\":10,\"quantity\":1}]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2021-08-22 01:33:46', '2021-08-22 01:33:46', NULL, 10.00),
(31, 47, 100025, 440.00, '{\"id\":47,\"name\":\"Hawaiian Pizza\",\"description\":\"Pineapple might not be the first thing that comes to mind when you think pizza.\",\"image\":\"2021-08-21-6120dc06c58cc.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":229},{\"type\":\"Large\",\"price\":440}],\"add_ons\":[{\"id\":17,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T09:41:30.000000Z\",\"updated_at\":\"2021-08-21T09:41:30.000000Z\",\"restaurant_id\":13,\"status\":1},{\"id\":18,\"name\":\"Extra Cheese\",\"price\":19,\"created_at\":\"2021-08-21T09:44:11.000000Z\",\"updated_at\":\"2021-08-21T09:44:11.000000Z\",\"restaurant_id\":13,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}],\"price\":229,\"tax\":25,\"tax_type\":\"percent\",\"discount\":9,\"discount_type\":\"percent\",\"available_time_starts\":\"01:00:00\",\"available_time_ends\":\"10:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":13,\"created_at\":\"2021-08-21T10:57:10.000000Z\",\"updated_at\":\"2021-08-21T10:57:10.000000Z\",\"order_count\":0,\"restaurant_name\":\"Pizza restaurant\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"01:00\",\"restaurant_closing_time\":\"10:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Large\",\"price\":440}]', '[{\"name\":\"Extra Cheese\",\"price\":19,\"quantity\":2}]', 39.60, 'discount_on_product', 25, 110.00, 'null', '2021-08-22 01:34:51', '2021-08-22 01:34:51', NULL, 38.00),
(32, 15, 100025, 550.00, '{\"id\":15,\"name\":\"Pepperoni Pizza\",\"description\":\"Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper\",\"image\":\"2021-08-21-6120cd73cd49c.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":399},{\"type\":\"Medium\",\"price\":435},{\"type\":\"Large\",\"price\":550}],\"add_ons\":[{\"id\":16,\"name\":\"Coke\",\"price\":15,\"created_at\":\"2021-08-21T09:41:15.000000Z\",\"updated_at\":\"2021-08-21T09:41:15.000000Z\",\"restaurant_id\":13,\"status\":1},{\"id\":17,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T09:41:30.000000Z\",\"updated_at\":\"2021-08-21T09:41:30.000000Z\",\"restaurant_id\":13,\"status\":1},{\"id\":18,\"name\":\"Extra Cheese\",\"price\":19,\"created_at\":\"2021-08-21T09:44:11.000000Z\",\"updated_at\":\"2021-08-21T09:44:11.000000Z\",\"restaurant_id\":13,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\",\"Large\"]}],\"price\":399,\"tax\":25,\"tax_type\":\"percent\",\"discount\":49,\"discount_type\":\"amount\",\"available_time_starts\":\"01:30:00\",\"available_time_ends\":\"09:30:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":13,\"created_at\":\"2021-08-21T09:54:59.000000Z\",\"updated_at\":\"2021-08-21T09:54:59.000000Z\",\"order_count\":0,\"restaurant_name\":\"Pizza restaurant\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"01:00\",\"restaurant_closing_time\":\"10:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Large\",\"price\":550}]', '[{\"name\":\"Extra Cheese\",\"price\":19,\"quantity\":6}]', 49.00, 'discount_on_product', 25, 137.50, 'null', '2021-08-22 01:34:51', '2021-08-22 01:34:51', NULL, 114.00),
(33, 47, 100026, 229.00, '{\"id\":47,\"name\":\"Hawaiian Pizza\",\"description\":\"Pineapple might not be the first thing that comes to mind when you think pizza.\",\"image\":\"2021-08-21-6120dc06c58cc.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":229},{\"type\":\"Large\",\"price\":440}],\"add_ons\":[{\"id\":17,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T09:41:30.000000Z\",\"updated_at\":\"2021-08-21T09:41:30.000000Z\",\"restaurant_id\":13,\"status\":1},{\"id\":18,\"name\":\"Extra Cheese\",\"price\":19,\"created_at\":\"2021-08-21T09:44:11.000000Z\",\"updated_at\":\"2021-08-21T09:44:11.000000Z\",\"restaurant_id\":13,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}],\"price\":229,\"tax\":25,\"tax_type\":\"percent\",\"discount\":9,\"discount_type\":\"percent\",\"available_time_starts\":\"01:00:00\",\"available_time_ends\":\"10:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":13,\"created_at\":\"2021-08-21T10:57:10.000000Z\",\"updated_at\":\"2021-08-21T10:57:10.000000Z\",\"order_count\":0,\"restaurant_name\":\"Pizza restaurant\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"01:00\",\"restaurant_closing_time\":\"10:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Small\",\"price\":229}]', '[{\"name\":\"Extra Cheese\",\"price\":19,\"quantity\":1}]', 20.61, 'discount_on_product', 1, 57.25, 'null', '2021-08-22 02:43:51', '2021-08-22 02:43:51', NULL, 19.00),
(34, 69, 100027, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-08-21T20:30:36.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-08-22 02:44:12', '2021-08-22 02:44:12', NULL, 0.00),
(35, 58, 100028, 160.00, '{\"id\":58,\"name\":\"Steak Kebabs\",\"description\":\"Steak Kebabs are the one of the tastiest summertime dinners! These are layered with juicy tender pieces of flavorful, marinated beef and colorful quartet of tender veggies. An exciting recipe the whole family can agree on!\",\"image\":\"2021-08-21-6120e4523fa9d.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":160,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:31:00\",\"available_time_ends\":\"23:35:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:32:34.000000Z\",\"updated_at\":\"2021-08-21T20:33:27.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 24.00, 'discount_on_product', 1, 8.00, 'null', '2021-08-22 03:48:11', '2021-08-22 03:48:11', NULL, 0.00),
(36, 15, 100029, 435.00, '{\"id\":15,\"name\":\"Pepperoni Pizza\",\"description\":\"Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper\",\"image\":\"2021-08-21-6120cd73cd49c.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":399},{\"type\":\"Medium\",\"price\":435},{\"type\":\"Large\",\"price\":550}],\"add_ons\":[{\"id\":16,\"name\":\"Coke\",\"price\":15,\"created_at\":\"2021-08-21T09:41:15.000000Z\",\"updated_at\":\"2021-08-21T09:41:15.000000Z\",\"restaurant_id\":13,\"status\":1},{\"id\":17,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T09:41:30.000000Z\",\"updated_at\":\"2021-08-21T09:41:30.000000Z\",\"restaurant_id\":13,\"status\":1},{\"id\":18,\"name\":\"Extra Cheese\",\"price\":19,\"created_at\":\"2021-08-21T09:44:11.000000Z\",\"updated_at\":\"2021-08-21T09:44:11.000000Z\",\"restaurant_id\":13,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Medium\",\"Large\"]}],\"price\":399,\"tax\":25,\"tax_type\":\"percent\",\"discount\":49,\"discount_type\":\"amount\",\"available_time_starts\":\"01:30:00\",\"available_time_ends\":\"09:30:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":13,\"created_at\":\"2021-08-21T09:54:59.000000Z\",\"updated_at\":\"2021-08-21T09:54:59.000000Z\",\"order_count\":0,\"restaurant_name\":\"Pizza restaurant\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"01:00\",\"restaurant_closing_time\":\"10:00\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"Medium\",\"price\":435}]', '[{\"name\":\"Extra Cheese\",\"price\":19,\"quantity\":4}]', 49.00, 'discount_on_product', 3, 108.75, 'null', '2021-08-22 08:10:54', '2021-08-22 08:10:54', NULL, 76.00),
(37, 109, 100030, 10.00, '{\"id\":109,\"name\":\"Cake\",\"description\":\"A form of bread or bread-like food. In its current forms, it is usually a sweet baked dessert. In its oldest forms, cakes were usually fried breads or cheesecakes.\",\"image\":\"2021-08-21-612100a9cf3fc.png\",\"category_id\":29,\"category_ids\":[{\"id\":\"8\",\"position\":1},{\"id\":\"29\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":10,\"tax\":10,\"tax_type\":\"percent\",\"discount\":3,\"discount_type\":\"percent\",\"available_time_starts\":\"00:30:00\",\"available_time_ends\":\"20:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T13:33:29.000000Z\",\"updated_at\":\"2021-08-21T13:33:29.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.30, 'discount_on_product', 1, 1.00, 'null', '2021-08-22 08:16:38', '2021-08-22 08:16:38', NULL, 0.00);
INSERT INTO `order_details` (`id`, `food_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(38, 77, 100030, 170.00, '{\"id\":77,\"name\":\"Veggie noodles\",\"description\":\"Healthy and tasty\",\"image\":\"2021-08-21-6120ee59cafaa.png\",\"category_id\":14,\"category_ids\":[{\"id\":\"14\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":15,\"name\":\"sauce\",\"price\":5,\"created_at\":\"2021-08-21T09:27:55.000000Z\",\"updated_at\":\"2021-08-21T09:27:55.000000Z\",\"restaurant_id\":1,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":170,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"02:45:00\",\"available_time_ends\":\"20:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T12:15:21.000000Z\",\"updated_at\":\"2021-08-21T12:15:21.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[{\"name\":\"sauce\",\"price\":5,\"quantity\":1}]', 0.00, 'discount_on_product', 1, 17.00, 'null', '2021-08-22 08:16:38', '2021-08-22 08:16:38', NULL, 5.00),
(39, 107, 100031, 340.00, '{\"id\":107,\"name\":\"Chicken Momos\",\"description\":\"A popular street food among the youngsters these days, momos are undoubtedly one of the easy snack.\",\"image\":\"2021-08-21-6120fff017c47.png\",\"category_id\":7,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":340,\"tax\":10,\"tax_type\":\"percent\",\"discount\":12,\"discount_type\":\"percent\",\"available_time_starts\":\"03:29:00\",\"available_time_ends\":\"11:29:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2021-08-21T13:30:24.000000Z\",\"updated_at\":\"2021-08-21T13:30:24.000000Z\",\"order_count\":0,\"restaurant_name\":\"Vintage Kitchen\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"14:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 40.80, 'discount_on_product', 1, 34.00, 'null', '2021-08-22 09:20:03', '2021-08-22 09:20:03', NULL, 0.00),
(40, 108, 100032, 320.00, '{\"id\":108,\"name\":\"Veg Momos\",\"description\":\"Momos are popular street food in northern parts of India. These are also known as Dim Sum and are basically dumplings made from flour with a savory stuffing.\",\"image\":\"2021-08-21-6121008b3c074.png\",\"category_id\":7,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":320,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"03:31:00\",\"available_time_ends\":\"14:31:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2021-08-21T13:32:59.000000Z\",\"updated_at\":\"2021-08-21T13:32:59.000000Z\",\"order_count\":0,\"restaurant_name\":\"Vintage Kitchen\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"14:00\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 1, 32.00, 'null', '2021-08-22 09:22:16', '2021-08-22 09:22:16', NULL, 0.00),
(41, 69, 100033, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-08-21T20:30:36.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-08-22 09:27:20', '2021-08-22 09:27:20', NULL, 0.00),
(42, 109, 100034, 10.00, '{\"id\":109,\"name\":\"Cake\",\"description\":\"A form of bread or bread-like food. In its current forms, it is usually a sweet baked dessert. In its oldest forms, cakes were usually fried breads or cheesecakes.\",\"image\":\"2021-08-21-612100a9cf3fc.png\",\"category_id\":29,\"category_ids\":[{\"id\":\"8\",\"position\":1},{\"id\":\"29\",\"position\":2}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":10,\"tax\":10,\"tax_type\":\"percent\",\"discount\":3,\"discount_type\":\"percent\",\"available_time_starts\":\"00:30:00\",\"available_time_ends\":\"20:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T13:33:29.000000Z\",\"updated_at\":\"2021-08-21T13:33:29.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.30, 'discount_on_product', 1, 1.00, 'null', '2021-08-22 10:04:54', '2021-08-22 10:04:54', NULL, 0.00),
(43, 66, 100035, 310.00, '{\"id\":66,\"name\":\"Chicken Shawarma\",\"description\":\"Robust and flavorful easy Chicken Shawarma at home! Beats takeout any day of the week, and is perfect for work or school lunch. Plus, my creamy white garlic sauce for Chicken Shawarma adds a bright creamy tang.\",\"image\":\"2021-08-21-6120e6767300f.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[{\"type\":\"big\",\"price\":210},{\"type\":\"normal\",\"price\":310},{\"type\":\"medium\",\"price\":410}],\"add_ons\":[{\"id\":2,\"name\":\"Cheese\",\"price\":15,\"created_at\":\"2021-08-21T08:19:43.000000Z\",\"updated_at\":\"2021-08-21T08:19:43.000000Z\",\"restaurant_id\":2,\"status\":1},{\"id\":30,\"name\":\"Coke\",\"price\":12,\"created_at\":\"2021-08-21T11:29:24.000000Z\",\"updated_at\":\"2021-08-21T11:29:24.000000Z\",\"restaurant_id\":2,\"status\":1},{\"id\":32,\"name\":\"Sauce\",\"price\":11,\"created_at\":\"2021-08-21T11:29:59.000000Z\",\"updated_at\":\"2021-08-21T11:29:59.000000Z\",\"restaurant_id\":2,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"big\",\"normal\",\"medium\"]}],\"price\":210,\"tax\":5,\"tax_type\":\"percent\",\"discount\":12,\"discount_type\":\"percent\",\"available_time_starts\":\"05:40:00\",\"available_time_ends\":\"20:40:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:41:42.000000Z\",\"updated_at\":\"2021-08-21T11:41:42.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"normal\",\"price\":310}]', '[{\"name\":\"Cheese\",\"price\":15,\"quantity\":1},{\"name\":\"Coke\",\"price\":12,\"quantity\":2},{\"name\":\"Sauce\",\"price\":11,\"quantity\":2}]', 46.50, 'discount_on_product', 2, 15.50, 'null', '2021-08-22 19:11:39', '2021-08-22 19:11:39', NULL, 61.00),
(44, 12, 100036, 2.00, '{\"id\":12,\"name\":\"Masala poori\",\"description\":\"GARLIC CHICKEN TIKKA PURI Chicken tikka and garlic mixed in a special paste with a puri.\",\"image\":\"2021-08-21-6120cbd7cd675.png\",\"category_id\":7,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":2,\"tax\":5,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:30:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T09:48:07.000000Z\",\"updated_at\":\"2021-08-21T09:48:07.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.30, 'discount_on_product', 1, 0.10, 'null', '2021-08-23 02:36:23', '2021-08-23 02:36:23', NULL, 0.00),
(45, 69, 100037, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-08-21T20:30:36.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-08-23 02:58:13', '2021-08-23 02:58:13', NULL, 0.00),
(46, 119, 100038, 14.00, '{\"id\":119,\"name\":\"COOKIE DOUGH BROWNIES\",\"description\":\"Brown sugar, dark chocolate chips, unsweetened cocoa\",\"image\":\"2021-08-21-61210650628f7.png\",\"category_id\":11,\"category_ids\":[{\"id\":\"11\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":14,\"tax\":12,\"tax_type\":\"percent\",\"discount\":3,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":11,\"created_at\":\"2021-08-21T13:57:36.000000Z\",\"updated_at\":\"2021-08-21T13:57:36.000000Z\",\"order_count\":0,\"restaurant_name\":\"Redcliff Cafe\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.42, 'discount_on_product', 10, 1.68, 'null', '2021-10-17 00:12:02', '2021-10-17 00:12:02', NULL, 0.00),
(47, 48, 100039, 35.00, '{\"id\":48,\"name\":\"Paneer Tikka Masala\",\"description\":\"Paneer tikka masala is an Indian dish of marinated paneer cheese served in a spiced gravy. It is a vegetarian alternative to chicken tikka masala.\",\"image\":\"2021-08-21-6120dcc6e012c.png\",\"category_id\":13,\"category_ids\":[{\"id\":\"13\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":12,\"name\":\"salad\",\"price\":10,\"created_at\":\"2021-08-21T09:27:11.000000Z\",\"updated_at\":\"2021-08-21T09:27:11.000000Z\",\"restaurant_id\":1,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":35,\"tax\":10,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"available_time_starts\":\"00:15:00\",\"available_time_ends\":\"20:15:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T11:00:22.000000Z\",\"updated_at\":\"2021-08-21T11:00:22.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 1.75, 'discount_on_product', 1, 3.50, 'null', '2021-10-17 00:16:00', '2021-10-17 00:16:00', NULL, 0.00),
(48, NULL, 100040, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-08-20T20:37:56.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-10-17 00:17:46', '2021-10-17 00:17:46', 1, 0.00),
(49, 69, 100041, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-08-22T21:03:01.000000Z\",\"order_count\":1,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-10-17 00:18:00', '2021-10-17 00:18:00', NULL, 0.00),
(50, 114, 100042, 22.00, '{\"id\":114,\"name\":\"Molten chocolate cake\",\"description\":\"Molten chocolate cake is a popular dessert that combines the elements of a chocolate cake and a souffl\\u00e9.\",\"image\":\"2021-08-21-612101dd482e7.png\",\"category_id\":8,\"category_ids\":[{\"id\":\"8\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":22,\"tax\":12,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"available_time_starts\":\"00:30:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":11,\"created_at\":\"2021-08-21T13:38:37.000000Z\",\"updated_at\":\"2021-08-21T13:39:30.000000Z\",\"order_count\":0,\"restaurant_name\":\"Redcliff Cafe\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.44, 'discount_on_product', 12, 2.64, 'null', '2021-10-17 00:30:50', '2021-10-17 00:30:50', NULL, 0.00),
(51, 69, 100043, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-10-16T18:19:51.000000Z\",\"order_count\":2,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 3, 4.75, 'null', '2021-10-17 00:40:40', '2021-10-17 00:40:40', NULL, 0.00),
(52, 118, 100044, 14.00, '{\"id\":118,\"name\":\"Toll House Pie\",\"description\":\"Ice cream, brown sugar, deep dish pie, butter, eggs\",\"image\":\"2021-08-21-6121056f7c691.png\",\"category_id\":8,\"category_ids\":[{\"id\":\"8\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":14,\"tax\":12,\"tax_type\":\"percent\",\"discount\":3,\"discount_type\":\"percent\",\"available_time_starts\":\"00:10:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":11,\"created_at\":\"2021-08-21T13:53:51.000000Z\",\"updated_at\":\"2021-08-21T13:53:51.000000Z\",\"order_count\":0,\"restaurant_name\":\"Redcliff Cafe\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.42, 'discount_on_product', 14, 1.68, 'null', '2021-10-17 00:40:55', '2021-10-17 00:40:55', NULL, 0.00),
(53, 112, 100045, 18.00, '{\"id\":112,\"name\":\"Chocolate Cupcake\",\"description\":\"Moist and fluffy at the same time with a tender crumb.\",\"image\":\"2021-08-21-61210171ac92a.png\",\"category_id\":8,\"category_ids\":[{\"id\":\"8\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":18,\"tax\":12,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:30:00\",\"available_time_ends\":\"23:45:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":11,\"created_at\":\"2021-08-21T13:36:49.000000Z\",\"updated_at\":\"2021-08-21T13:36:49.000000Z\",\"order_count\":0,\"restaurant_name\":\"Redcliff Cafe\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 14, 2.16, 'null', '2021-10-17 00:41:23', '2021-10-17 00:41:23', NULL, 0.00),
(54, NULL, 100046, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":0,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-08-20T20:37:56.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-10-17 00:42:58', '2021-10-17 00:44:33', 1, 0.00),
(55, 2, 100047, 150.00, '{\"id\":2,\"name\":\"Hyderabadi Mutton Biriyani\",\"description\":\"Hyderabadi Biryani is characteristically distinct. The aroma, taste, tender meat, the Zaffran, everything gives it a distinguished appearance. ... Yoghurt makes the meat tender, lemon tangy, fried onions add a crispy sweet taste, and Hyderabadi spices make it hot.\",\"image\":\"2021-08-21-612007ca5affc.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":150,\"tax\":10,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"amount\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-20T19:51:38.000000Z\",\"updated_at\":\"2021-08-21T20:35:15.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 20.00, 'discount_on_product', 1, 15.00, 'null', '2021-10-17 00:45:53', '2021-10-17 00:45:53', NULL, 0.00),
(56, 1, 100047, 250.00, '{\"id\":1,\"name\":\"Mutton Biriyani\",\"description\":\"This mutton biryani recipe has layers of mutton and saffron-milk-infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon, cloves, jaiphal, and javitri along with chilies, rose water, kewda, and saffron cooked with succulent mutton pieces.\",\"image\":\"2021-08-21-611ff39525320.png\",\"category_id\":6,\"category_ids\":[{\"id\":\"6\",\"position\":1}],\"variations\":[{\"type\":\"1:3\",\"price\":250},{\"type\":\"1:5\",\"price\":420}],\"add_ons\":[],\"attributes\":[\"2\"],\"choice_options\":[{\"name\":\"choice_2\",\"title\":\"Capacity\",\"options\":[\"1:3\",\" 1:5\"]}],\"price\":250,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:03:00\",\"available_time_ends\":\"23:56:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-20T18:25:25.000000Z\",\"updated_at\":\"2021-08-21T20:35:45.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"1:3\",\"price\":250}]', '[]', 25.00, 'discount_on_product', 1, 25.00, 'null', '2021-10-17 00:45:53', '2021-10-17 00:45:53', NULL, 0.00),
(57, 69, 100048, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-10-16T18:19:51.000000Z\",\"order_count\":2,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-10-17 00:46:45', '2021-10-17 00:46:45', NULL, 0.00),
(58, 68, 100048, 420.00, '{\"id\":68,\"name\":\"grilled lemon herb mediterranean chicken salad\",\"description\":\"This Grilled Lemon Herb Mediterranean Chicken Salad recipe is as close to perfect as you can get! Full of Mediterranean flavours: olives, tomatoes, cucumber, avocados, and chicken for a complete meal in a salad bowl!\",\"image\":\"2021-08-21-6120e72547646.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[{\"type\":\"lagre\",\"price\":420},{\"type\":\"medium\",\"price\":320},{\"type\":\"standard\",\"price\":220}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"lagre\",\" medium\",\" standard\"]}],\"price\":320,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:02:00\",\"available_time_ends\":\"23:46:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:44:37.000000Z\",\"updated_at\":\"2021-08-21T20:31:57.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"lagre\",\"price\":420}]', '[]', 63.00, 'discount_on_product', 1, 21.00, 'null', '2021-10-17 00:46:45', '2021-10-17 00:46:45', NULL, 0.00),
(59, 67, 100048, 400.00, '{\"id\":67,\"name\":\"Meat Pizza\",\"description\":\"If you\\u2019re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.\",\"image\":\"2021-08-21-6120e6dadf410.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":400},{\"type\":\"Large\",\"price\":750}],\"add_ons\":[{\"id\":31,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T11:29:34.000000Z\",\"updated_at\":\"2021-08-21T11:29:34.000000Z\",\"restaurant_id\":2,\"status\":1},{\"id\":34,\"name\":\"Extra Meat\",\"price\":14,\"created_at\":\"2021-08-21T11:32:24.000000Z\",\"updated_at\":\"2021-08-21T11:32:24.000000Z\",\"restaurant_id\":2,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":30,\"discount_type\":\"amount\",\"available_time_starts\":\"02:00:00\",\"available_time_ends\":\"22:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:43:22.000000Z\",\"updated_at\":\"2021-08-21T16:46:14.000000Z\",\"order_count\":1,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":4,\"rating_count\":1}', '[{\"type\":\"Small\",\"price\":400}]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-10-17 00:46:45', '2021-10-17 00:46:45', NULL, 0.00),
(60, NULL, 100049, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-08-20T20:37:56.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-10-17 15:11:01', '2021-10-17 15:11:01', 1, 0.00),
(61, 93, 100050, 280.00, '{\"id\":93,\"name\":\"Chicken Sausage Delight Burger\",\"description\":\"Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce\",\"image\":\"2021-08-21-6120fa10d06f2.png\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[{\"type\":\"small\",\"price\":230},{\"type\":\"medium\",\"price\":260},{\"type\":\"large\",\"price\":280}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}],\"price\":230,\"tax\":2,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:04:00\",\"available_time_ends\":\"23:56:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T13:05:20.000000Z\",\"updated_at\":\"2021-08-21T20:43:28.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"large\",\"price\":280}]', '[]', 28.00, 'discount_on_product', 4, 5.60, 'null', '2021-10-17 15:38:44', '2021-10-17 15:38:44', NULL, 0.00),
(62, 93, 100051, 230.00, '{\"id\":93,\"name\":\"Chicken Sausage Delight Burger\",\"description\":\"Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce\",\"image\":\"2021-08-21-6120fa10d06f2.png\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[{\"type\":\"small\",\"price\":230},{\"type\":\"medium\",\"price\":260},{\"type\":\"large\",\"price\":280}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}],\"price\":230,\"tax\":2,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:04:00\",\"available_time_ends\":\"23:56:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T13:05:20.000000Z\",\"updated_at\":\"2021-08-21T20:43:28.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"small\",\"price\":230}]', '[]', 23.00, 'discount_on_product', 1, 4.60, 'null', '2021-10-17 15:53:52', '2021-10-17 15:53:52', NULL, 0.00),
(63, 93, 100052, 230.00, '{\"id\":93,\"name\":\"Chicken Sausage Delight Burger\",\"description\":\"Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce\",\"image\":\"2021-08-21-6120fa10d06f2.png\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[{\"type\":\"small\",\"price\":230},{\"type\":\"medium\",\"price\":260},{\"type\":\"large\",\"price\":280}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}],\"price\":230,\"tax\":2,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:04:00\",\"available_time_ends\":\"23:56:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T13:05:20.000000Z\",\"updated_at\":\"2021-08-21T20:43:28.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"small\",\"price\":230}]', '[]', 23.00, 'discount_on_product', 6, 4.60, 'null', '2021-10-17 15:55:41', '2021-10-17 15:55:41', NULL, 0.00),
(64, 69, 100053, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-10-16T18:19:51.000000Z\",\"order_count\":2,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2021-10-17 15:56:37', '2021-10-17 15:56:37', NULL, 0.00),
(65, 77, 100054, 170.00, '{\"id\":77,\"name\":\"Veggie noodles\",\"description\":\"Healthy and tasty\",\"image\":\"2021-08-21-6120ee59cafaa.png\",\"category_id\":14,\"category_ids\":[{\"id\":\"14\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":15,\"name\":\"sauce\",\"price\":5,\"created_at\":\"2021-08-21T09:27:55.000000Z\",\"updated_at\":\"2021-08-21T09:27:55.000000Z\",\"restaurant_id\":1,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":170,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"02:45:00\",\"available_time_ends\":\"20:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2021-08-21T12:15:21.000000Z\",\"updated_at\":\"2021-08-21T12:15:21.000000Z\",\"order_count\":0,\"restaurant_name\":\"Caf\\u00e9 Monarch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 1, 17.00, 'null', '2021-11-15 16:15:20', '2021-11-15 16:15:20', NULL, 0.00),
(66, 93, 100055, 230.00, '{\"id\":93,\"name\":\"Chicken Sausage Delight Burger\",\"description\":\"Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce\",\"image\":\"2021-08-21-6120fa10d06f2.png\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[{\"type\":\"small\",\"price\":230},{\"type\":\"medium\",\"price\":260},{\"type\":\"large\",\"price\":280}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}],\"price\":230,\"tax\":2,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:04:00\",\"available_time_ends\":\"23:56:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T13:05:20.000000Z\",\"updated_at\":\"2021-08-21T20:43:28.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"small\",\"price\":230}]', '[]', 23.00, 'discount_on_product', 1, 4.60, 'null', '2021-11-15 16:15:28', '2021-11-15 16:15:28', NULL, 0.00),
(67, 3, 100056, 80.00, '{\"id\":3,\"name\":\"Burger Combo\",\"description\":\"A combo Burger.\",\"image\":\"2021-08-21-6120ad6b86273.png\",\"category_id\":24,\"category_ids\":[{\"id\":\"5\",\"position\":1},{\"id\":\"24\",\"position\":2}],\"variations\":[{\"type\":\"Small\",\"price\":80},{\"type\":\"Big\",\"price\":120}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Big\"]}],\"price\":80,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T07:38:19.000000Z\",\"updated_at\":\"2021-08-21T07:54:22.000000Z\",\"order_count\":1,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":5,\"rating_count\":1}', '[{\"type\":\"Small\",\"price\":80}]', '[]', 0.00, 'discount_on_product', 1, 1.60, 'null', '2021-11-15 16:15:42', '2021-11-15 16:15:42', NULL, 0.00),
(68, 69, 100057, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-10-16T18:19:51.000000Z\",\"order_count\":2,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[[]]', '[]', 14.25, 'discount_on_product', 1, 4.75, '\"\"', '2021-11-15 16:20:39', '2021-11-15 16:20:39', NULL, 0.00),
(69, 67, 100058, 400.00, '{\"id\":67,\"name\":\"Meat Pizza\",\"description\":\"If you\\u2019re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.\",\"image\":\"2021-08-21-6120e6dadf410.png\",\"category_id\":17,\"category_ids\":[{\"id\":\"17\",\"position\":1}],\"variations\":[{\"type\":\"Small\",\"price\":400},{\"type\":\"Large\",\"price\":750}],\"add_ons\":[{\"id\":31,\"name\":\"Pepsi\",\"price\":18,\"created_at\":\"2021-08-21T11:29:34.000000Z\",\"updated_at\":\"2021-08-21T11:29:34.000000Z\",\"restaurant_id\":2,\"status\":1},{\"id\":34,\"name\":\"Extra Meat\",\"price\":14,\"created_at\":\"2021-08-21T11:32:24.000000Z\",\"updated_at\":\"2021-08-21T11:32:24.000000Z\",\"restaurant_id\":2,\"status\":1}],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Large\"]}],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":30,\"discount_type\":\"amount\",\"available_time_starts\":\"02:00:00\",\"available_time_ends\":\"22:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:43:22.000000Z\",\"updated_at\":\"2021-08-21T16:46:14.000000Z\",\"order_count\":1,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":4,\"rating_count\":1}', '[{\"Size\":\"Small\"}]', '[{\"id\":34,\"name\":\"Extra Meat\",\"price\":14,\"quantity\":\"1\"}]', 60.00, 'discount_on_product', 1, 20.00, '\"Small\"', '2021-11-15 16:21:01', '2021-11-15 16:21:01', NULL, 14.00),
(70, 44, 100059, 200.00, '{\"id\":44,\"name\":\"Penne Pasta\",\"description\":\"Penne is a classic pasta type and pantry staple.\",\"image\":\"2021-08-21-6120d8f31563b.png\",\"category_id\":16,\"category_ids\":[{\"id\":\"16\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":3,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"11:00:00\",\"available_time_ends\":\"19:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":14,\"created_at\":\"2021-08-21T10:44:03.000000Z\",\"updated_at\":\"2021-08-21T10:44:03.000000Z\",\"order_count\":0,\"restaurant_name\":\"Italian Fast Food\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 1, 6.00, 'null', '2021-11-15 16:22:32', '2021-11-15 16:22:32', NULL, 0.00),
(71, 41, 100059, 250.00, '{\"id\":41,\"name\":\"Fusilli Pasta\",\"description\":\"Fusilli gives any dish an unexpected twist with its spiral shape\",\"image\":\"2021-08-21-6120d82e9a806.png\",\"category_id\":16,\"category_ids\":[{\"id\":\"16\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":11,\"name\":\"Sauce\",\"price\":5,\"created_at\":\"2021-08-21T09:22:31.000000Z\",\"updated_at\":\"2021-08-21T09:22:31.000000Z\",\"restaurant_id\":14,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":250,\"tax\":3,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"percent\",\"available_time_starts\":\"10:00:00\",\"available_time_ends\":\"18:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":14,\"created_at\":\"2021-08-21T10:40:46.000000Z\",\"updated_at\":\"2021-08-21T10:40:46.000000Z\",\"order_count\":0,\"restaurant_name\":\"Italian Fast Food\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 50.00, 'discount_on_product', 1, 7.50, 'null', '2021-11-15 16:22:32', '2021-11-15 16:22:32', NULL, 0.00),
(72, NULL, 100060, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-10-25T10:42:33.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2021-12-05 18:46:42', '2021-12-05 18:46:42', 1, 0.00),
(73, 69, 100061, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-10-16T18:19:51.000000Z\",\"order_count\":2,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[[]]', '[]', 14.25, 'discount_on_product', 1, 4.75, '\"\"', '2022-01-11 12:31:20', '2022-01-11 12:31:20', NULL, 0.00),
(74, 68, 100061, 420.00, '{\"id\":68,\"name\":\"grilled lemon herb mediterranean chicken salad\",\"description\":\"This Grilled Lemon Herb Mediterranean Chicken Salad recipe is as close to perfect as you can get! Full of Mediterranean flavours: olives, tomatoes, cucumber, avocados, and chicken for a complete meal in a salad bowl!\",\"image\":\"2021-08-21-6120e72547646.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[{\"type\":\"lagre\",\"price\":420},{\"type\":\"medium\",\"price\":320},{\"type\":\"standard\",\"price\":220}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"lagre\",\" medium\",\" standard\"]}],\"price\":320,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:02:00\",\"available_time_ends\":\"23:46:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:44:37.000000Z\",\"updated_at\":\"2021-08-21T20:31:57.000000Z\",\"order_count\":0,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"Size\":\"lagre\"}]', '[]', 63.00, 'discount_on_product', 1, 21.00, '\"lagre\"', '2022-01-11 12:31:20', '2022-01-11 12:31:20', NULL, 0.00),
(75, NULL, 100062, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-10-25T10:42:33.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2022-01-11 12:54:12', '2022-01-11 12:54:12', 1, 0.00),
(76, NULL, 100063, 400.00, '{\"id\":1,\"image\":\"2021-08-21-612012a4962dd.png\",\"description\":\"Spicy chilli crab is only mildly spicy and is often described as having a flavour that\'s both sweet and savoury. The crab is divine but the sauce is the star\\u2014sweet yet savoury, slightly spicy and supremely satisfying.\",\"status\":1,\"admin_id\":1,\"category_id\":null,\"category_ids\":[{\"id\":\"7\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":110,\"discount_type\":\"amount\",\"restaurant_id\":2,\"created_at\":\"2021-08-20T20:37:56.000000Z\",\"updated_at\":\"2021-10-25T10:42:33.000000Z\",\"name\":\"Spicy Crab Early Food\",\"available_time_starts\":\"00:01\",\"available_time_ends\":\"23:59\",\"available_date_starts\":\"2021-08-20\",\"available_date_ends\":\"2025-08-21\",\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 60.00, 'discount_on_product', 1, 20.00, 'null', '2022-01-11 12:59:27', '2022-01-11 12:59:27', 1, 0.00),
(77, 3, 100064, 80.00, '{\"id\":3,\"name\":\"Burger Combo\",\"description\":\"A combo Burger.\",\"image\":\"2021-08-21-6120ad6b86273.png\",\"category_id\":24,\"category_ids\":[{\"id\":\"5\",\"position\":1},{\"id\":\"24\",\"position\":2}],\"variations\":[{\"type\":\"Small\",\"price\":80},{\"type\":\"Big\",\"price\":120}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Small\",\"Big\"]}],\"price\":80,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:59:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T07:38:19.000000Z\",\"updated_at\":\"2021-08-21T07:54:22.000000Z\",\"order_count\":1,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":5,\"rating_count\":1}', '[{\"type\":\"Small\",\"price\":80}]', '[]', 0.00, 'discount_on_product', 1, 1.60, 'null', '2022-01-11 13:02:47', '2022-01-11 13:02:47', NULL, 0.00),
(78, 127, 100065, 145.00, '{\"id\":127,\"name\":\"Stawberry Cake\",\"description\":\"Strawberry cake is a cake that uses strawberry as a primary ingredient.\",\"image\":\"2021-08-21-61210b55b24e9.png\",\"category_id\":8,\"category_ids\":[{\"id\":\"8\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":145,\"tax\":25,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"amount\",\"available_time_starts\":\"07:00:00\",\"available_time_ends\":\"10:00:00\",\"set_menu\":0,\"status\":1,\"restaurant_id\":13,\"created_at\":\"2021-08-21T14:19:01.000000Z\",\"updated_at\":\"2021-08-21T14:19:01.000000Z\",\"order_count\":0,\"restaurant_name\":\"Pizza restaurant\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"01:00\",\"restaurant_closing_time\":\"10:00\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 20.00, 'discount_on_product', 2, 36.25, 'null', '2022-01-11 13:11:15', '2022-01-11 13:11:15', NULL, 0.00),
(79, 69, 100066, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2021-10-16T18:19:51.000000Z\",\"order_count\":2,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2022-01-11 13:38:32', '2022-01-11 13:38:32', NULL, 0.00);
INSERT INTO `order_details` (`id`, `food_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(80, 69, 100067, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2022-01-11T07:40:42.000000Z\",\"order_count\":3,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2022-01-11 13:42:04', '2022-01-11 13:42:04', NULL, 0.00),
(81, 69, 100068, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2022-01-11T07:45:07.000000Z\",\"order_count\":4,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2022-01-11 13:53:48', '2022-01-11 13:53:48', NULL, 0.00),
(82, 69, 100069, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2022-01-11T07:45:07.000000Z\",\"order_count\":4,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2022-01-11 14:17:39', '2022-01-11 14:17:39', NULL, 0.00),
(83, 69, 100070, 95.00, '{\"id\":69,\"name\":\"Medu Vada\",\"description\":\"Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.\",\"image\":\"2021-08-21-6120e7a4b7b2a.png\",\"category_id\":20,\"category_ids\":[{\"id\":\"20\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":95,\"tax\":5,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:01:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2021-08-21T11:46:44.000000Z\",\"updated_at\":\"2022-01-11T07:45:07.000000Z\",\"order_count\":4,\"restaurant_name\":\"Hungry Puppets\",\"restaurant_discount\":15,\"restaurant_opening_time\":\"10:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 14.25, 'discount_on_product', 1, 4.75, 'null', '2022-01-11 14:23:22', '2022-01-11 14:23:22', NULL, 0.00),
(84, 35, 100071, 120.00, '{\"id\":35,\"name\":\"Thai Stir Fried Noodles\",\"description\":\"The popular Thai stir-fried noodles are straight from the streets of Thailand are made at home! While Pad Thai is sweeter and nuttier, balanced with a touch of sour and a wonderful chargrilled flavor which you can create at home!\",\"image\":\"2021-08-21-6120d677c1c7b.png\",\"category_id\":19,\"category_ids\":[{\"id\":\"19\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":120,\"tax\":12,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"06:32:00\",\"available_time_ends\":\"20:32:00\",\"veg\":0,\"status\":1,\"restaurant_id\":11,\"created_at\":\"2021-08-21T10:33:27.000000Z\",\"updated_at\":\"2021-08-21T10:33:27.000000Z\",\"order_count\":0,\"restaurant_name\":\"Redcliff Cafe\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:59\",\"schedule_order\":false,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 0.00, 'discount_on_product', 1, 14.40, 'null', '2022-01-20 18:04:58', '2022-01-20 18:04:58', NULL, 0.00),
(85, 128, 100072, 290.00, '{\"id\":128,\"name\":\"Ramen\",\"description\":\"Ramen is a Japanese noodle soup. It consists of Chinese-style wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso\",\"image\":\"2021-08-21-61210c8b6348e.png\",\"category_id\":10,\"category_ids\":[{\"id\":\"10\",\"position\":1}],\"variations\":[],\"add_ons\":[{\"id\":27,\"name\":\"Tomato Sauce\",\"price\":10,\"created_at\":\"2021-08-21T11:01:41.000000Z\",\"updated_at\":\"2021-08-21T11:03:37.000000Z\",\"restaurant_id\":10,\"status\":1}],\"attributes\":[],\"choice_options\":[],\"price\":290,\"tax\":10,\"tax_type\":\"percent\",\"discount\":15,\"discount_type\":\"amount\",\"available_time_starts\":\"17:00:00\",\"available_time_ends\":\"23:00:00\",\"veg\":0,\"status\":1,\"restaurant_id\":10,\"created_at\":\"2021-08-21T14:24:11.000000Z\",\"updated_at\":\"2021-08-21T14:24:11.000000Z\",\"order_count\":0,\"restaurant_name\":\"Tasty Lunch\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"17:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[]', '[]', 15.00, 'discount_on_product', 1, 29.00, 'null', '2022-01-20 18:14:32', '2022-01-20 18:14:32', NULL, 0.00),
(86, 93, 100073, 260.00, '{\"id\":93,\"name\":\"Chicken Sausage Delight Burger\",\"description\":\"Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce\",\"image\":\"2021-08-21-6120fa10d06f2.png\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[{\"type\":\"small\",\"price\":230},{\"type\":\"medium\",\"price\":260},{\"type\":\"large\",\"price\":280}],\"add_ons\":[],\"attributes\":[\"1\"],\"choice_options\":[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"small\",\" medium\",\" large\"]}],\"price\":230,\"tax\":2,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"00:04:00\",\"available_time_ends\":\"23:56:00\",\"veg\":0,\"status\":1,\"restaurant_id\":4,\"created_at\":\"2021-08-21T13:05:20.000000Z\",\"updated_at\":\"2021-08-21T20:43:28.000000Z\",\"order_count\":0,\"restaurant_name\":\"Cheese Burger\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"00:01\",\"restaurant_closing_time\":\"23:58\",\"schedule_order\":true,\"avg_rating\":0,\"rating_count\":0}', '[{\"type\":\"medium\",\"price\":260}]', '[]', 26.00, 'discount_on_product', 1, 5.20, 'null', '2022-01-20 18:19:09', '2022-01-20 18:19:09', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `restaurant_amount` decimal(24,2) NOT NULL,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`id`, `vendor_id`, `delivery_man_id`, `order_id`, `order_amount`, `restaurant_amount`, `admin_commission`, `received_by`, `status`, `created_at`, `updated_at`, `delivery_charge`, `original_delivery_charge`, `tax`) VALUES
(1, 4, NULL, 100001, 244.80, 220.80, 24.00, 'admin', NULL, '2021-08-21 13:54:22', '2021-08-21 13:54:22', 0.00, 4321.12, 4.80),
(2, 2, 1, 100005, 1939.51, 323.00, 34.00, 'deliveryman', NULL, '2021-08-21 20:20:32', '2021-08-21 20:20:32', 1582.51, 1582.51, 17.00),
(3, 2, NULL, 100008, 357.00, 323.00, 34.00, 'restaurant', NULL, '2021-08-21 22:46:14', '2021-08-21 22:46:14', 0.00, 1582.51, 17.00),
(4, 2, 2, 100014, 260.93, 236.08, 24.85, 'deliveryman', NULL, '2021-08-21 23:15:03', '2021-08-21 23:15:03', 0.00, 1582.52, 12.43),
(5, 7, NULL, 100016, 4393.20, 63.00, 14.00, 'admin', NULL, '2021-08-22 01:13:11', '2021-08-22 01:13:11', 4316.20, 4316.20, 7.00),
(6, 7, NULL, 100017, 4390.45, 60.75, 13.50, 'admin', NULL, '2021-08-22 01:15:04', '2021-08-22 01:15:04', 4316.20, 4316.20, 6.75),
(7, 1, NULL, 100021, 5250.37, 685.00, 68.50, 'admin', NULL, '2021-08-22 01:27:43', '2021-08-22 01:27:43', 4496.87, 4496.87, 68.50),
(8, 11, 4, 100023, 878.40, 110.81, 10.86, 'deliveryman', NULL, '2021-08-22 01:38:54', '2021-08-22 01:38:54', 756.73, 756.73, 13.04),
(9, 7, 4, 100032, 4655.68, 288.00, 64.00, 'deliveryman', NULL, '2021-08-22 09:24:42', '2021-08-22 09:24:42', 4303.68, 4303.68, 32.00),
(10, 2, 7, 100037, 99.75, 90.25, 9.50, 'deliveryman', NULL, '2021-08-23 03:03:01', '2021-08-23 03:03:01', 0.00, 14171.77, 4.75),
(11, 2, 2, 100033, 99.75, 90.25, 9.50, 'deliveryman', NULL, '2021-10-17 00:19:51', '2021-10-17 00:19:51', 0.00, 1584.34, 4.75),
(12, 2, NULL, 100046, 357.00, 323.00, 34.00, 'restaurant', NULL, '2021-10-17 00:44:26', '2021-10-17 00:44:26', 0.00, 12143.00, 17.00),
(13, 2, NULL, 100028, 142.80, 129.20, 13.60, 'restaurant', NULL, '2021-10-17 00:44:54', '2021-10-17 00:44:54', 0.00, 1575.93, 6.80),
(14, 2, NULL, 100010, 276.68, 250.33, 26.35, 'restaurant', NULL, '2021-10-17 00:45:03', '2021-10-17 00:45:03', 0.00, 1582.51, 13.18),
(15, 11, 2, 100045, 904.62, 257.04, 25.20, 'admin', NULL, '2021-10-17 00:47:27', '2021-10-17 00:47:27', 622.38, 622.38, 30.24),
(16, 2, 1, 100066, 99.75, 90.25, 9.50, 'deliveryman', NULL, '2022-01-11 13:40:42', '2022-01-11 13:40:42', 0.00, 1341.16, 4.75),
(17, 2, 9, 100067, 99.75, 90.25, 9.50, 'restaurant', NULL, '2022-01-11 13:45:07', '2022-01-11 13:45:07', 0.00, 1341.16, 4.75),
(18, 11, NULL, 100071, 1967.10, 122.40, 12.00, 'admin', NULL, '2022-01-20 18:05:38', '2022-01-20 18:05:38', 1832.70, 1832.70, 14.40),
(19, 10, 5, 100072, 3718.45, 233.75, 68.75, 'deliveryman', NULL, '2022-01-20 18:22:27', '2022-01-20 18:22:27', 3415.95, 3415.95, 27.50),
(20, 10, 5, 100011, 9638.62, 4360.50, 1282.50, 'deliveryman', NULL, '2022-01-20 18:25:32', '2022-01-20 18:25:32', 3995.62, 3995.62, 513.00);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('demo@inboxgun.com', '4320', '2021-08-22 08:45:24'),
('ashek@gmail.com', '6625', '2021-08-23 21:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_verifications`
--

INSERT INTO `phone_verifications` (`id`, `phone`, `token`, `created_at`, `updated_at`) VALUES
(3, '+8801879762951', '3136', '2021-08-21 22:13:02', '2021-08-21 22:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT 0.00,
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `take_away` tinyint(1) NOT NULL DEFAULT 1,
  `food_section` tinyint(1) NOT NULL DEFAULT 1,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `delivery_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `non_veg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `opening_time`, `closeing_time`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `food_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `delivery_charge`, `delivery_time`, `veg`, `non_veg`) VALUES
(1, 'Café Monarch', '+910111111111', 'joshef.doe1025822@gmail.com', '2021-08-20-611fc4cd9c598.png', '19.055908041476712', '72.92335204083659', 'Ghatkopar - Mankhurd Link Road, Indian Oil Nagar, Mumbai', NULL, 0.00, 0.00, 0, '00:01:00', '23:59:00', 1, 1, '2021-08-20 21:05:49', '2022-01-11 14:04:13', 0, NULL, '2021-08-20-611fc4cd9d52b.png', 1, 1, 1, 10.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 0, 1),
(2, 'Hungry Puppets', '+101747410000', 'test.restaurant@gmail.com', '2021-08-20-611fc6cd6b011.png', '25.186958967714926', '85.00810402562027', 'House: 00, Road: 00, Test City', NULL, 0.00, NULL, 1, '10:01:00', '23:59:00', 1, 2, '2021-08-20 21:11:45', '2022-01-11 13:41:32', 1, '{\"1\":0,\"2\":0,\"3\":0,\"4\":1,\"5\":0}', '2021-08-20-611fc6cd6b218.png', 1, 1, 1, 5.00, 1, 1, 1, '17', '{\"status\":null,\"code\":null}', 1, 1, 0.00, '30-40', 1, 1),
(3, 'Cheesy Restaurant', '+8801747413273', 'nipon34.bd@gmail.com', '2021-08-20-611fc7b17088c.png', '23.62608237589538', '90.34303799676506', '101/4 Mohammadpur, Dhaka', NULL, 0.00, 0.00, 0, '10:00:00', '23:00:00', 1, 3, '2021-08-20 21:18:09', '2021-08-21 01:44:48', 1, NULL, '2021-08-20-611fc7b17153c.png', 1, 1, 1, 15.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(4, 'Cheese Burger', '+88525695888', 'test.restaurant1@gmail.com', '2021-08-20-611fc9b200e8c.png', '25.506848691070893', '74.1576624261471', 'House:00, Road:00, Test City', NULL, 0.00, NULL, 1, '00:01:00', '23:58:00', 1, 4, '2021-08-20 21:26:42', '2021-08-22 02:42:39', 1, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', '2021-08-20-611fc9b201ad6.png', 1, 1, 1, 2.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(5, 'Frying Nemo', '+6024588888', 'test.restaurant2@gmail.com', '2021-08-20-611fca3b81ea9.png', '30.319874842864174', '67.4779749261471', 'House: 15, Road: 5, Aukland', NULL, 0.00, NULL, 0, '00:01:00', '23:59:00', 1, 5, '2021-08-20 21:28:59', '2021-08-21 02:20:59', 1, NULL, '2021-08-20-611fca3b82b4e.png', 1, 0, 1, 5.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(6, 'The Great Impasta', '+8565222222', 'test.restaurant3@gmail.com', '2021-08-20-611fcae713d25.png', '16.23811767032843', '102.01555732360804', 'House:00, Road: 00, Street: 00, City Test', NULL, 0.00, NULL, 0, '10:00:00', '23:00:00', 1, 6, '2021-08-20 21:31:51', '2021-08-21 01:43:21', 0, NULL, '2021-08-20-611fcae7149c7.png', 0, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(7, 'Vintage Kitchen', '+12562458744', 'test.restaurant4@gmail.com', '2021-08-21-612008a117429.png', '34.037046130269005', '71.57724860778772', 'House: 00, Road: 00, Streed:00, Test City', NULL, 50.00, 20.00, 0, '00:01:00', '14:00:00', 1, 7, '2021-08-21 01:55:13', '2021-08-22 09:25:14', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', '2021-08-21-612008a11803f.png', 1, 1, 1, 10.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(8, 'The Capital Grill', '+12584555555', 'test.restaurant5@gmail.com', '2021-08-21-612009adefa47.png', '28.55772186629488', '83.20696357360804', 'House: 00, Road: 00, Streed:00, Test City', NULL, 0.00, NULL, 1, '10:00:00', '23:00:00', 1, 8, '2021-08-21 01:59:41', '2021-08-21 02:00:08', 1, NULL, '2021-08-21-612009adf0b9b.png', 1, 1, 1, 15.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(9, 'Tasty Takeaways', '+880100000000', 'test.restaurant6@gmail.com', '2021-08-21-61200a8ff04a6.png', '23.04107198840827', '90.98442557922327', 'House: 00, Road: 00, Streed:00, Test City', NULL, 50.00, NULL, 1, '00:01:00', '23:59:00', 1, 9, '2021-08-21 02:03:27', '2021-08-21 02:30:54', 0, NULL, '2021-08-21-61200a8ff10bc.png', 0, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(10, 'Tasty Lunch', '+91025888888', 'test.restaurant7@gmail.com', '2021-08-21-61200b96cd8f4.png', '29.63289473286146', '76.61516669860804', 'House: 00, Road: 00, Streed:00, Test City', NULL, 0.00, 25.00, 1, '17:00:00', '23:00:00', 1, 10, '2021-08-21 02:07:50', '2021-08-21 02:08:47', 0, NULL, '2021-08-21-61200b96ce580.png', 1, 0, 1, 10.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(11, 'Redcliff Cafe', '+91025558884', 'test.restaurant8@gmail.com', '2021-08-21-61200c725db85.png', '22.412810929663856', '87.82036307922327', 'House: 00, Road: 00, Streed:00, Test City', NULL, 100.00, NULL, 0, '00:01:00', '23:59:00', 1, 11, '2021-08-21 02:11:30', '2021-08-21 02:12:18', 0, NULL, '2021-08-21-61200c725e7b0.png', 1, 1, 1, 12.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(12, 'Mini Kebab', '+02541255888', 'test.restaurant10@gmail.com', '2021-08-21-61200e081c2b7.png', '7.280452008158948', '80.63957083753274', 'House: 00, Road: 00, Streed:00, Test City', NULL, 0.00, NULL, 0, '02:00:00', '13:00:00', 1, 12, '2021-08-21 02:18:16', '2021-08-21 02:20:03', 0, NULL, '2021-08-21-61200e081d0e1.png', 1, 1, 1, 7.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(13, 'Pizza restaurant', '+212588888', 'test.restaurant13@gmail.com', '2021-08-21-61200ff9e3cb0.png', '15.672099947435255', '101.45834449401819', 'House: 00, Road: 00, Streed:00, Test City', NULL, 0.00, NULL, 1, '01:00:00', '10:00:00', 1, 13, '2021-08-21 02:26:33', '2021-08-21 02:27:05', 1, NULL, '2021-08-21-61200ff9e48c2.png', 1, 1, 1, 25.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(14, 'Italian Fast Food', '+91021100000', 'test.restaurant12@gmail.com', '2021-08-21-6120109c340e7.png', '23.43469934021078', '81.33096221557581', 'House: 00, Road: 00, Streed:00, Test City', NULL, 200.00, NULL, 0, '00:01:00', '23:59:00', 1, 14, '2021-08-21 02:29:16', '2021-11-15 16:22:45', 0, NULL, '2021-08-21-6120109c34cd8.png', 1, 1, 1, 3.00, 1, 1, 0, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1),
(15, 'Food Fair', '01712251697', 'marjahan@gmail.com', '2021-10-17-616b19f5dc1e1.png', '23.753632919207067', '90.38490810465919', 'road 12, Tejgaon', NULL, 0.00, NULL, 0, '10:00:00', '01:10:00', 1, 15, '2021-10-17 00:29:09', '2022-01-20 18:16:35', 0, NULL, '2021-10-17-616b19f5dd002.png', 1, 1, 1, 10.00, 3, 1, 1, '', '{\"status\":\"0\",\"code\":null}', 0, 0, 0.00, '30-40', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_wallets`
--

CREATE TABLE `restaurant_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_wallets`
--

INSERT INTO `restaurant_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 1, 685.00, 0.00, 0.00, 0.00, '2021-08-21 01:36:41', '2021-08-22 01:27:43'),
(2, 6, 0.00, 0.00, 0.00, 0.00, '2021-08-21 01:38:13', '2021-08-21 01:38:13'),
(3, 2, 1945.61, 0.00, 0.00, 1233.23, '2021-08-21 01:42:33', '2022-01-11 13:45:07'),
(4, 5, 0.00, 0.00, 0.00, 0.00, '2021-08-21 01:43:35', '2021-08-21 01:43:35'),
(5, 4, 220.80, 0.00, 0.00, 0.00, '2021-08-21 01:44:08', '2021-08-21 13:54:22'),
(6, 3, 0.00, 0.00, 0.00, 0.00, '2021-08-21 01:44:37', '2021-08-21 01:44:37'),
(7, 7, 411.75, 0.00, 0.00, 0.00, '2021-08-21 01:55:16', '2021-08-22 09:24:42'),
(8, 8, 0.00, 0.00, 0.00, 0.00, '2021-08-21 01:59:48', '2021-08-21 01:59:48'),
(9, 9, 0.00, 0.00, 0.00, 0.00, '2021-08-21 02:03:35', '2021-08-21 02:03:35'),
(10, 10, 4594.25, 0.00, 0.00, 0.00, '2021-08-21 02:07:56', '2022-01-20 18:25:32'),
(11, 11, 490.25, 0.00, 0.00, 0.00, '2021-08-21 02:11:55', '2022-01-20 18:05:38'),
(12, 12, 0.00, 0.00, 0.00, 0.00, '2021-08-21 02:19:29', '2021-08-21 02:19:29'),
(13, 13, 0.00, 0.00, 0.00, 0.00, '2021-08-21 02:26:38', '2021-08-21 02:26:38'),
(14, 14, 0.00, 0.00, 0.00, 0.00, '2021-08-21 02:29:22', '2021-08-21 02:29:22'),
(15, 15, 0.00, 0.00, 0.00, 0.00, '2021-10-17 00:35:40', '2021-10-17 00:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_zone`
--

CREATE TABLE `restaurant_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `food_id`, `user_id`, `comment`, `attachment`, `rating`, `order_id`, `created_at`, `updated_at`, `item_campaign_id`, `status`) VALUES
(1, 3, 3, 'Very delicious food. It was really awesome. Thanks to the restaurant.', '[]', 5, 100001, '2021-08-21 13:55:50', '2021-08-21 13:55:50', NULL, 1),
(2, 67, 9, 'Nice', '[]', 4, 100008, '2021-08-21 22:46:23', '2021-08-21 22:46:23', NULL, 1),
(3, 108, 15, 'nice', '[]', 5, 100032, '2021-08-22 09:25:14', '2021-08-22 09:25:14', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`) VALUES
(1, 'Spencer', 'Hasting', '+8801673138206', 'sabrina77proma@gmail.com', NULL, 0, NULL, '$2y$10$AAhPrcfA7YOE0Iu46eJEQ.2ejRSwHnr5rrZuLd2J4ojhUZXXmnCWO', NULL, '2021-08-19 22:32:01', '2021-08-19 22:32:01', NULL, 'cFeNnUqORESpXs0woNJ1is:APA91bFaRfCZVNweXgdx2qiNRlwkH_BpTzb9sBjU31r6IR1ZzaEY_NCAIZqWugHyRSLccvJxjbkRHkZWjGqIfLTVI7spUy8dWWhRPQEAalM_6hsuHIBLuLuXhtFtfHcKDtDBAH8tu7qN', 1, 0, NULL, NULL),
(3, 'Sultan', 'Mahamud', '+8801723019980', 'sunnysultan1641@gmail.com', NULL, 0, NULL, '$2y$10$QutYq7tpbOdazxNqretlTOEl3ILYgGf27wJLQal.1d6zOa9VDrrCW', NULL, '2021-08-21 13:27:20', '2021-08-21 21:45:29', '[5,8,11,13,14,15]', 'f1INEbw7SseeL17yCulyPg:APA91bEvkhgEOPMxcG3DnW_iCdvwr8oWO8WCATyFMbPtiQq0sfEPyKYP81DPZoYoKfd8w-bJvjHgNfrj1ogdHHFbat_f8B9BBnH3Fdfh2ZQqb6powifVKKNB9q3awaODtpafhPcpms8p', 1, 3, NULL, NULL),
(4, 'Nipon', 'Roy', '+8801747413273', 'nipon34.bd@gmail.com', NULL, 0, NULL, '$2y$10$VlFUd5tAYILDY/1j43TXF.ddmLeTS43MG9toRnnsskAD9BX364Vj.', NULL, '2021-08-21 13:38:51', '2021-10-17 00:44:54', '[6,8,9,13,14,16]', 'dlrSenXOQDOL-5yJWNyMOn:APA91bGIBTZbtBIdQCnxLpzmVjVqvQ9S7M30MvWSC8gZOMiOCftaibJFmtIDXbPa7y8cN1iwJ0MsjUFq0oZNCIOe9naHz2eK9hEWu8TJXLBjUILv2Ep4WpOynpYaeIUDfUwSs95phT3g', 1, 1, NULL, NULL),
(5, 'Ashek', 'Elahe', '+8801879762951', 'ashek@gmail.com', NULL, 0, NULL, '$2y$10$YkYvhY.iEK6JOpXObVnpMO3tyrh3xuPrWqC5l8r8y9ejvd.F3fX5C', NULL, '2021-08-21 20:49:56', '2022-01-11 13:45:07', '[9,11,16]', 'e6zAZpABQrG3ldEkQt_53I:APA91bHTNEafclAigpVKEvvE1qTycAwkcg0XZXeYQFvrgRivtOCt76dl8hbkLVvwbyI8xtMIadtukQQnG4CO-9bhRHzqoIOuKmdvUu9OPgk9-K14XJ_f_J1u2jCThsvbYxu0-kdv3fJ1', 1, 2, NULL, NULL),
(6, 'Spencer', 'Hastings', '+8801673138207', 'sabrina707proma@gmail.com', '2021-08-21-61212cd9784be.png', 0, NULL, '$2y$10$uyEHbNyCkm7vlPd1clZBIu4Z4Jo//sNQuGWX6xN9ARFUT/BRl44Oi', NULL, '2021-08-21 21:38:37', '2021-08-21 22:42:01', '[5,6]', 'eJZ3MrK8S22SFtBBgbY_1a:APA91bE6lbtoI8N3J-4-eUrir9oRospjkiRIP9otbBXiP8hcP5EtUPukHZSU5zNVeGQ7bEhWD7H24IfyjK-2JvxB97TRmCoj38pEY_XvnuHLP_cM5Nrlvug3upcq7K3xjUDZFd1WeZRQ', 1, 0, NULL, NULL),
(7, 'Md', 'Aziz', '+8801975758279', 'azizsarkerarc@gmail.com', NULL, 0, NULL, '$2y$10$MM.XGZGd2b4ac4wsLJOoY.mNbBm1804Zc.UhM8G55/DbeBgs7ne76', NULL, '2021-08-21 21:40:29', '2021-10-17 00:47:27', '[5,9,17]', 'dDGShG96Tm68jd2AR8Nyee:APA91bEKl648jKnwgTdtCkyg_Up6r9o3FkD7yumTnAcp-Ov7HUOyMlflxewNQ8PJ86BkwzdYDWXpy4lSApqvwU_eWQvFTlnHDbmOwv9KfaBUBJDBkRB6zj_VCznStX3qfhTzihRLJpBa', 1, 1, NULL, NULL),
(8, 'Alif Emran', 'Emon', '+8801733077939', 'alifemu00@gmail.com', NULL, 0, NULL, '$2y$10$RdPathYTyHutXJ2aGDADf.xlrgsueL5WlHQ2VLoy99h2x.4z4FRpO', NULL, '2021-08-21 21:49:59', '2021-08-21 21:51:31', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'dqLeWeUDSvOJ2cpTEDPtFY:APA91bHvpNiaFgApCY6tBKomGb4fn_ltAqd17yfu8DHlCdlhSaRoPMTZ1uWhfdOZ3eVZLfGUsmqaoi4C4dw_LgRUUhmjxScniRSwBAfrQiduH48dh-PHx6WntW0Kz9YQ-BANgZ2xOYa4', 1, 0, NULL, NULL),
(9, 'Sultan 0', 'Mahamud 1', '+8801723019985', 'sunnysultan1640@gmail.com', '2021-08-21-612128ed28af0.png', 1, NULL, '$2y$10$P0Tw9I7.jdCYqnCdJGTKx.ZytpO.AMyEBSaLaBX5PRDDCNTO89AbW', NULL, '2021-08-21 21:52:14', '2021-10-17 00:45:03', NULL, '8C2DE7700C2C7B23F6B64CA11310BD9BF6C9FE58CBFDC87243D3E0118059CB8A', 1, 5, NULL, NULL),
(10, 'Md Al Imrun', 'Khandakar', '+8801759412381', 'md.alimrun@gmail.com', '2021-08-21-612129ad7354a.png', 1, NULL, '$2y$10$xfxB5uJe3ikVswyL9zsJqO02FyqEBimCD8T4FEwMxQy9jwome0pli', NULL, '2021-08-21 21:59:36', '2022-01-20 18:25:32', NULL, 'fpr8zCGnSryywIJVlNyukD:APA91bE40t3Oa7MXgcwCq0vwrdCkdMnyRFXSwiYL77D2OGDT-oGzXLQuuJL1OfvQK9LMWI3EHql0FgHYFTb6uBtft_tFn3ALB2Wj1aqxWf_fskJ3yX568q75MDUP_oPtVzKyoKzF7cfR', 1, 1, NULL, NULL),
(11, 'Kamrujjaman', 'Joy', '+8801733415955', 'joy25896@gmail.com', NULL, 0, NULL, '$2y$10$4EG8yCPrrx9lU1hnKaCf5O8peh8QIriSbUE94QhAqxUKOgIHnSUUG', NULL, '2021-08-21 22:50:06', '2021-08-21 22:50:27', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'edDkVtvKQTmXtRfpVw3NmJ:APA91bGnLp2WtzzVbBNT_Zr02earftndIt5OU145ndSewenmKWRpGC_0BTlSUBg3J4dcp9TGdAf0mlS4TT3SHVrJOeXp1sfHCzvr1hgTOEL3FZ6HFRnFOiqfTrCcLU67XWZ4H7LKiAMB', 1, 0, NULL, NULL),
(12, 'Spencer', 'Hastings', '+8801673138205', 'sabrina777proma@gmail.com', '2021-08-22-61214ccf01013.png', 0, NULL, '$2y$10$ki8MxgaE3a9H7mVE3lPG1OJj/fFuhQ1YOdI49llyPfwkqKiMFSIeG', NULL, '2021-08-22 00:57:42', '2021-08-22 01:15:19', '[5]', 'd0bm85YVSUu90drRDLC8xi:APA91bEp0lQjMJfnQ25Ww3FJD8nbs8XQE2ywqt4e0OO5z3nQq_1rmsPay7wp5FKxT7Q0svCnMozqxv3LypzXKM_Bf7K7Mc2W6goa6_a3R2QH7dBLABsnGx-GGfcgM82pSuP6ByC4HV2q', 1, 0, NULL, NULL),
(13, 'sultan', 'mahamud 2', '+8801723019986', 'sultan@gmail.com', NULL, 0, NULL, '$2y$10$Ckq2owsQewVUh40z4xk.p.8e3f/AwWpj8C9zjpxko7By579QvKUti', NULL, '2021-08-22 02:09:31', '2021-08-22 02:09:47', '[5,9,12,13,16]', '8C2DE7700C2C7B23F6B64CA11310BD9BF6C9FE58CBFDC87243D3E0118059CB8A', 1, 0, NULL, NULL),
(14, 'demo', 'demo', '+21620123123', 'demo@inboxgun.com', NULL, 0, NULL, '$2y$10$urDjzUu8SAXyusgPLGMV/esDpEfkJoe70r6VaB.tmP6D1RYrEqTWy', NULL, '2021-08-22 08:08:44', '2021-08-22 08:46:35', '[10,12,14,16,17,18,20]', 'cC9WXg3dQIS88hIertKT86:APA91bG_7GgQnN4a0MFMTXiPpm2BDAE691hMUibdFO-vqM0OkVcTeS305RrqidEuzXc4ZW804JWUG8HYkZagM0BgweV76f8zW5YDayG-Qssv25OLT2FoJ5_bl85FsJKHA5YeBnTAdrfG', 1, 0, NULL, NULL),
(15, 'hello', 'yes', '+21620555555', 'hello@kdmd.ddj', NULL, 0, NULL, '$2y$10$iAA63Wx/mnLBsi9z3JQcTOn1pPgerUdSxi0eMjTzN583eWUC.Og5y', NULL, '2021-08-22 08:52:21', '2021-10-17 00:19:51', '[5,6,7,9,11,12,13,16,17]', 'eRBYIEDfTKe0XCcIiuUyb5:APA91bEJsDnkwsQqPeN12ql8sHrwcFGvg3cpR1DzFiYRO-rAuisuLxSzmH5uYYdiwU2T58byxNn_J_PeADJG6dPl52jq3KW_vgt9Ut97cvOtSTmMZ9O4p9SayGJVkLXazrVR3EgK59Bn', 1, 3, NULL, NULL),
(16, 'Pili', '123', '+8801624343926', 'pili@gmail.com', NULL, 0, NULL, '$2y$10$aFiRU6GfhisyYvuivj3E3.IoaJYVDIZcmAxRQdNwiDPh2p6YLD2EG', NULL, '2021-10-17 00:08:36', '2021-10-17 00:08:36', NULL, 'c5eY9Vd6REajo4nmOHv-9U:APA91bF64P1xIPr4nJ5i5yFzRLg8-Bghg2m263tRZ6lKjfaeA0r5toKabxGML71sRLu2nyc96Q-piFI8D2K18bAwdav7MlWfNxkjL_HQJzJ9zTyl8IH_noAtpO0rjw4JZ2JowKsQK3A8', 1, 0, NULL, NULL),
(17, 'Pili', '123', '+8801624343928', 'marjahan@gmail.com', NULL, 0, NULL, '$2y$10$CxHYNyh0l.04J1X6IsQaZe046dJnOJN3EpGBfL.hCDnGTkGUT.sh2', NULL, '2021-10-17 00:09:49', '2021-10-17 00:10:19', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'dBABDeCFRZGO26YWltLn8k:APA91bEtEJuzpAM4OMDhO8aUIdCHxzEhJVRm0zILTsyD6PU15SKZTzuoc5-DS2jhHGlfoxVlwCbXQbbL_KUSwNVaBQluhkjBFjXONMyz6gyX13560pPeBWopO2CByYiXs-wQ5DXf6Zg3', 1, 0, NULL, NULL),
(18, 'Kadir', 'Atıcı', '+905555555555', 'kadir@cra-gmbh.de', NULL, 0, NULL, '$2y$10$6X7XulFbiIiX9eV5ZQWuGe.iqcP3kwmrAXBdDwcOKXfTkgqUWj46a', NULL, '2021-10-17 00:19:46', '2021-10-17 00:20:10', '[5,6]', 'cT8SfWUaTNeihfk5xYwyYR:APA91bFuI39NgFe1Ur4fh6jX5y4c1ZOGJxNmJOSAeITT3cBEP4CmM5w9tn7I-PhgIGAgArzKsHaNq-Q0OUe4RJDgLyK-BzzmbXdjLqwohUG6J3x8405SBp6ezoTfu8ur03hj5glnJB_1', 1, 0, NULL, NULL),
(19, 'Ali', 'Mohamed', '+201015523902', 'foodzy24.com@gmail.com', NULL, 0, NULL, '$2y$10$g3A9uFJOfyty2qLZJ2S9KuednoXozzCVkClVsXO7IVMdwUkBe2pIu', NULL, '2021-10-17 00:38:08', '2021-10-17 00:38:31', '[5,7,9]', 'dikno29WR0emqmWk7SiWSy:APA91bG2E_6LCdHULXiVUbTb2admG1a6UKHB5FKoCSdVA5ywv3hQsx1mX-_81gXsUS7_TO46cvUjhZSPapPAel1z-ZjawJKfWVP7c-VCa9AsDc58eZwm-4Jxs-PuulfHfnuGfrLScNoL', 1, 0, NULL, NULL),
(20, 'Dejan', 'Đusić', '+38163627543', 'fudonjakg@gmail.com', NULL, 0, NULL, '$2y$10$qKAOhopKAUAF7RDuJuLDwOQ3n9W4sPeZ/2oHGeQZoPeuf2ciZSg4W', NULL, '2021-10-17 00:39:46', '2021-10-17 00:44:26', NULL, NULL, 1, 1, NULL, NULL),
(21, 'Qwa', 'Qwa', '+919555856525', 'asifhkl@fhj.com', NULL, 0, NULL, '$2y$10$cnWcJ1/G9nHmzz4DBnU75uSPyS9TWPoRn2HbSCobLSC4rzfXVUCTe', NULL, '2021-10-17 15:10:11', '2021-10-17 15:10:19', '[5,6]', 'dZaTkvxgTXSWnZUAwMHahs:APA91bHSE_QrGg_lezHL-gu82AI2DwxDBvPD6jdFHMNp6HCDBy1bAq0nNrKBz-iwKU35yYhTBhUGDTmR8Iq24i7H4BefDHcv4TiCDGwmrk-_joV_sC1QQdvv7DHTBdL5nxaNETBSLfC8', 1, 0, NULL, NULL),
(22, 'Zubair', 'Jamil', '+923422643265', 'zj.zubair@gmail.com', NULL, 0, NULL, '$2y$10$Xc2J2ZC.EA/s5UUeIC2zku0fuR.gxnHFr.yHa8yEN2m7MaRrBXnIW', NULL, '2021-10-17 15:37:03', '2021-10-17 15:37:34', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'djRjbLwKTfqAIyz-5jIecJ:APA91bGSqbFvjYkrP66ETh9ob6pMuWJX214gRIYss6uWfn0BDrT5Y7WmNOP3ExZ6qNv3TXBTqrk1I5UtzLsEHvMc1oT7QmwENbMCmIkPwols9zDisN4tnr6OfAJUJA1eaw0hkRPk7084', 1, 0, NULL, NULL),
(23, 'Aakash', 'Hameed', '+923076153709', 'aakashhameed2@gmail.com', NULL, 0, NULL, '$2y$10$uwvKHKNgjM9XXDaRYsGnL.HIEHeTKD36eQ72wcvhJfStfruwx.TN6', NULL, '2021-10-17 15:53:18', '2021-10-17 15:54:43', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'dApCUOnQSkO7sYyXx4bPzg:APA91bEXorfEQttWAoMVxwD-E4gLGeQRHcp7W0b1D16QPZyaibekFtnJTQVjyuzGEO1Ur5DzLa5wAmemf6VWy0OGXBr0zkIESEmEV7o7lrdj5kV1_BGpt6SPFkugdHBBGkmU-edJcRYl', 1, 0, NULL, NULL),
(24, 'Sneha', 'Gupta', '+919090809090', 'sneha@gmail.com', NULL, 0, NULL, '$2y$10$vIXLvd7qIdOnulkY1xyL0.BdYrbcr8jjk5LMcgzOu0ugEjoR1YwNq', NULL, '2021-11-15 15:37:35', '2021-11-15 15:38:12', '[5,8,10,11,13,14,17,18]', 'edmgveokRJCCaUX-xXsW0X:APA91bH7HeakZklepMKTFxTkUffGPK89EbUjW74WVqgTkN_0O4Dm7XDI93S1tiWmBH8bI__PV_A4XBrakWIjaObA2kRIRK56ubVxDsodV-6AylRQS5StR-gQ78345dSPFbbAwrvgmpJc', 1, 0, NULL, NULL),
(25, 'king', 'ratana', '+85592444160', 'king@gmail.con', NULL, 0, NULL, '$2y$10$CFK3DA1shEr9sVK0wTEIselr/sE8oblIP/NxtXyBntvTdLIEqyZ2W', NULL, '2021-11-15 16:14:24', '2021-11-15 16:14:45', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'f73ekeuMToKytLFRqKOPeg:APA91bFdQTlFPshn_7n7GKAR4-ueKkps2ki0RuDo0A94QhypIEZtjUwXmbhbZC3An9zQaUIrg09UKtIZKkWG-tNdncrwz5LXU_UZpV8oP1DPr-uVzls9YQhQ6VWRj177QyY0jtRQcycC', 1, 0, NULL, NULL),
(26, 'Chinna', 'Chinna', '+918143143790', 'chinna.satya390@gmail.com', NULL, 0, NULL, '$2y$10$2qZ5tQrC/v3Odv9RgUfdJuz8RVAqxe5.nSXd9VRp2pShZpQYbQsjm', NULL, '2021-12-05 18:46:02', '2021-12-05 18:46:18', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]', 'fe4lWp9fQmy0q-9cKkDN8x:APA91bEwfungQf8FyrEgtjs-cFgKk4h4s3yrlsDJk3opejdIfNC9J6qii9ss7kE04icTG703CBsFalJjEbNn1YvLMK7DtgDSkCZ02PG0F4jDHbHGVv7eCwWqbCX7fvgQfEn_b0qUMD9C', 1, 0, NULL, NULL),
(27, 'V', 'V', '+911234567890', 'v@gmail.com', NULL, 0, NULL, '$2y$10$EIe7llNNk0P9Pc/z6.7r7e.xB5uuRbSwBZ3LS6HQ0v4wEGBhgBM7C', NULL, '2022-01-11 12:08:39', '2022-01-11 12:08:50', '[6,8,10,12,14,16,18,20]', 'eAzPyf-JRb-Tso_eH_r4m1:APA91bFarSxrQlMQoe23nG7wzznGFxRY4xOl4rLtD_DmBezspyjUfvODX73zmM5wP3hWMP6bQ-W_bRPfIeey3CMWeemXAmCEr_Am9ki8l7M1ioIr1ntzehfyCA5hviMpxhDC1arXeN7X', 1, 0, NULL, NULL),
(28, 'Sreekumar Pankjakshan Nair', 'Sreekumar Pankjakshan Nair', '+919746658386', 'gdgdgdgdgd@gddhh.com', NULL, 0, NULL, '$2y$10$ViuRXwmkgfJ44IPoNa4XCOYv9hql5lUCKaL2PnAK/AhYAUi8n3syG', NULL, '2022-01-11 12:12:24', '2022-01-11 12:12:40', '[5,6,7,9,10,11,12,13,15,16,17,18,20]', '@', 1, 0, NULL, NULL),
(29, 'Vijay', 'Vijay', '+917002346789', 'vijay@gmail.com', '2022-01-11-61dd2204b2d83.png', 0, NULL, '$2y$10$gt9.5AntzVrGcM.LBNTEueFZ5xzcWOOx5nCBVioH8AL5g2ejJuZMu', NULL, '2022-01-11 12:19:50', '2022-01-11 12:21:56', '[7,8,10,11,12,13,15,16,17,18,20]', 'eAzPyf-JRb-Tso_eH_r4m1:APA91bFarSxrQlMQoe23nG7wzznGFxRY4xOl4rLtD_DmBezspyjUfvODX73zmM5wP3hWMP6bQ-W_bRPfIeey3CMWeemXAmCEr_Am9ki8l7M1ioIr1ntzehfyCA5hviMpxhDC1arXeN7X', 1, 0, NULL, NULL),
(30, 'Anita', 'Susan', '+919582580255', 'sdfg@fggh.com', NULL, 0, NULL, '$2y$10$mWEn0Y8..PfaP2fGF9kqMuoUYKr3PuqUWRPLdHAJsSveEvaZWbEme', NULL, '2022-01-11 12:33:16', '2022-01-11 12:33:16', NULL, 'cDfSwyJwRfqqdoCHVmoJDB:APA91bHopcCCqlEShHm125JUwxsc2n5FnvgPlXNnZosKeAukr0OXY3xOcplHOtczcCPWAexI-zVhYyUj8mjZdVTOaaSv7mbVjnsNzbTQpp1cP8_5jhS6tzEm0m9AH5h9yIyXgrZkSol7', 1, 0, NULL, NULL),
(31, 'Anita', 'Susan', '+911234567891', 'v@gsg.com', NULL, 0, NULL, '$2y$10$XAcAjpcGZtA5vz5UG.xtdO0MPIyE2PmBO3EXFIEFL22HfXZnk9x9i', NULL, '2022-01-11 12:34:36', '2022-01-11 12:34:36', NULL, 'cDfSwyJwRfqqdoCHVmoJDB:APA91bHopcCCqlEShHm125JUwxsc2n5FnvgPlXNnZosKeAukr0OXY3xOcplHOtczcCPWAexI-zVhYyUj8mjZdVTOaaSv7mbVjnsNzbTQpp1cP8_5jhS6tzEm0m9AH5h9yIyXgrZkSol7', 1, 0, NULL, NULL),
(32, 'V', 'H', '+916437025100', 'vh@gmail.com', NULL, 0, NULL, '$2y$10$g8KYv30Q8SqsVNapFb/c6uZL8.bM..Q/aYn0R9GoflZNKmRqEYpIi', NULL, '2022-01-11 12:49:55', '2022-01-11 12:50:00', '[12,13,16,17,18,20]', 'eAzPyf-JRb-Tso_eH_r4m1:APA91bFarSxrQlMQoe23nG7wzznGFxRY4xOl4rLtD_DmBezspyjUfvODX73zmM5wP3hWMP6bQ-W_bRPfIeey3CMWeemXAmCEr_Am9ki8l7M1ioIr1ntzehfyCA5hviMpxhDC1arXeN7X', 1, 0, NULL, NULL),
(33, 'Elizabeth', 'John', '+919496462273', 'namitha.elizabeth@seeroo.com', NULL, 0, NULL, '$2y$10$PNkylQiV8AlrL0NM73u/xe9BBsdX6zT/S.rpaFQx8xHg4s0TbFpQK', NULL, '2022-01-11 13:11:08', '2022-01-11 13:11:42', '[16]', 'eFPxmiGfRXKAvvKJfji1Kp:APA91bHhTuLlcoy3ggTFy8r_QMf7lQt47xIBdGAyfL3OMu2DhpTGik0ycJ53iEVkdsjI_fF90jAuaSiQx8jTlB0Nj4gGE42Lq0pTZ7AffiOEQKYHu72_wJD4ZOj6b69CVb7ewH1zBn_I', 1, 0, NULL, NULL),
(34, 'Pakalavan', 'B', '+919884159192', 'pakalavan16@gmail.com', NULL, 0, NULL, '$2y$10$1YlhBAlZv6W.Vb/uOzA3K.AGgxBtFOXxRghsObF18QVfRNdXiqRXm', NULL, '2022-01-11 13:17:20', '2022-01-11 13:17:20', NULL, 'cIg-fM00TJ-sB4j75xIFRo:APA91bEQevGktoRRBlwaIAPjFByxX8Ga0y3cMnQ6Xn4ObH_h8t89WxMAmV9NCtHsC6WhMJ3xhu0MFD1DrCakFGLp77_YO-kBOd2guFzx5H7xqO71sea-eW13HlcqDDrD_u6lwanTqy9D', 1, 0, NULL, NULL),
(35, 'Shhh', 'Jjajjjj', '+10999999999', 'shsjsjsjajwjj@gmail.com', NULL, 0, NULL, '$2y$10$WA3Qvq4VsOMKns7C3lyz1OzQpt6k/cvMQpIVXP1Q8fGpBhuLvFcKK', NULL, '2022-01-11 13:55:33', '2022-01-11 13:55:39', '[5]', NULL, 1, 0, NULL, NULL),
(36, 'Shhh', 'Hjjh', '+17128999999', 'jjajajajj@gmail.com', NULL, 0, NULL, '$2y$10$WhdX4SQx6B9doU2l1nOAiurPetDz5a8UXsMh0G78.0LzJrf6pegrC', NULL, '2022-01-11 14:02:13', '2022-01-11 14:02:18', '[5]', 'fNw60k_pT6yMyO6f1tsbcm:APA91bHIJu2BWziV6-t4P0eyukZaZ34ksVCZAApCVmu-hqeRW2rV2MWW3In1cUa_8EdP9Y8H691t9G_1_-5yUNj9P4_8ZVhbMhoDaoLSNcshw6xGP7TvQ0najD6cHcz2ktaqEVCGB__v', 1, 0, NULL, NULL),
(37, 'Asdfghj', 'Asdfghj', '+919876543210', 'asdfghj@gmail.com', NULL, 0, NULL, '$2y$10$pj6TZLrHmpLeQOn2P89AsugLUpjfzDFtslKaSGPaPhmWKfiCCO3ky', NULL, '2022-01-11 14:15:42', '2022-01-11 14:15:46', '[37]', 'cZJr9uzjQLWDEUP7jPWHXF:APA91bFwaM8OpXgiB4A3OV3l00T87ewjhHW3CbxGKac41zaNkBdGxfPjX-Kuqq95koppS04aH7wF_rYjJk3ElIzYjoXfNDWtexW4KaNtSyMicuO4VV9kLgHd3cBuRh2BHKNX-As0mxYc', 1, 0, NULL, NULL),
(38, 'Fatema', 'Subarna', '+8801885576624', 'fatema@gmail.com', NULL, 0, NULL, '$2y$10$3BL6aWFMiapLBvFryTLiAO8K2RvnG7AT5JGwjUU.VATLGyeZHbNaq', NULL, '2022-01-11 14:22:31', '2022-01-20 18:22:27', '[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,37]', '@', 1, 1, NULL, NULL),
(39, 'Idrees', 'Awais', '+923014124781', 'idreesawais39@gmail.com', NULL, 0, NULL, '$2y$10$8r9Jn3fin08mt4EyWg8WdeJJzJSGccuueda44WaJTg0OA92DwW7ha', NULL, '2022-01-11 14:23:02', '2022-01-11 14:23:12', '[9,11,12,14,15,17]', 'fHkRFa3PTg-P3jIFo42obc:APA91bFUbtm4EPUK2flA8uH5Ns-_gxyobLzxwxVEDGJmbgKXATteoL-lXqglPuG9ckFu5O-DbGicXBEDuAE1254_oWz7AcagcIS5jD0YNeCdaPByWJvO0tYIcjISpfRYHjj7Mra93cLp', 1, 0, NULL, NULL),
(40, 'hahaS', 'ASJBHDS', '+919029765478', 'ASCZC@gmail.com', NULL, 0, NULL, '$2y$10$hc6aZIQjNur70/Iw1R7OVuvK2XzUTpYM8aEHnF6QP0mn6U4jrJp4q', NULL, '2022-01-20 18:04:01', '2022-01-20 18:07:04', NULL, 'ch6QpPKFSeSEuNOVw3tUJB:APA91bHJjS7U8b1JgU1IKXFpXFLay181jJm0Lv5UT-viEtXYKaURGxNMaohAvZW8cInNE_mDzqLgdnDRxaUxnM5bRn0EXRYAyjrJbiL66f3zF3GdyiT5ZmcFgwY_eilao3OtXNUg_cFL', 1, 2, NULL, NULL),
(41, 'Tanvir', 'Mahmud', '+8801775893233', 'tmtomalkh@gmail.com', NULL, 0, NULL, '$2y$10$KuNg3.gPk2BRz8G98NMepueXugmun6qpnhChI209QuskS18UuDEwi', NULL, '2022-01-20 18:13:53', '2022-01-20 18:13:53', NULL, NULL, 1, 0, NULL, NULL),
(42, 'M', 'M', '+917822954918', 'manojgrey112@gmail.com', NULL, 0, NULL, '$2y$10$N700cryEuGWTeZrofUg5YeDWqRkXF7h1EYjaNQARIjv1tDAN.yqJG', NULL, '2022-01-20 18:17:08', '2022-01-20 18:17:34', '[5,6,7,8]', 'eRRChFrPSJy1dQsyxb4f4f:APA91bEoyWFrnyzh1zOzAT9b5Q9u__4B1et2qFqai3cHdUllkqIO23Ylbdfrlfe0H6aHJFEy_rbofdCBprrQqMsFUKABLv_Grfp7-XVlt9NjFZZTfAuWnI38JqCyiymopvk-1Rn5LQ-w', 1, 0, NULL, NULL),
(43, 'Leo', 'Leonardo', '+40725042424', 'leo@leo.com', NULL, 0, NULL, '$2y$10$5genuI4SbXJZ1tKjOfv9aOPiofV5V61dnzNvPL0Sxz2cwe1cM/LUK', NULL, '2022-01-20 18:18:18', '2022-01-20 18:18:30', '[5,11,18]', 'eURuwnESR1-qFPfL5rD4s_:APA91bGvlTUPol6UVUjWFyysWSvKBqaSpcZCmO-k0YRUd7KliX0PO4xM7JXmFL4UEVpckUghoNDdzWgyVXJR_mNNIMdiT9sCBrwUkLmAvLCtwq5ZEGFOznmARIm2Nn2HOP2EqSbYcbjE', 1, 0, NULL, NULL),
(44, 'Vichu', 'Vichu', '+919487612609', 'employee@gmail.com', NULL, 0, NULL, '$2y$10$MeqTtK8dgVxD7t6zYRayOePp0VhkoRy1/qk5glGnuMAoUgMctEw6S', NULL, '2022-01-20 18:40:02', '2022-01-20 18:40:02', NULL, 'c1ZO6QsVQ568vjeE1A2Ey4:APA91bFwTXyey3vmwwBjbRVLIzLwVknmKoTJAdqhPXXI1zuP5K28w5tPTMaNcksFN5hFfaph0Zx5F35O4-3APGyK7WfqHDMiX_ej8iOrjdREcqzzrXrRHtUehr1XQR__ZHF1o-cQweM-', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:40:08', '2021-08-21 13:40:08'),
(2, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:53:47', '2021-08-21 13:53:47'),
(3, '{\"title\":\"Order\",\"description\":\"Your order is processing\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:53:53', '2021-08-21 13:53:53'),
(4, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:54:14', '2021-08-21 13:54:14'),
(5, '{\"title\":\"Order\",\"description\":\"Your order is out for delivery\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:54:18', '2021-08-21 13:54:18'),
(6, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:54:22', '2021-08-21 13:54:22'),
(7, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 13:58:06', '2021-08-21 13:58:06'),
(8, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 14:00:35', '2021-08-21 14:00:35'),
(9, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 4, NULL, NULL, '2021-08-21 14:03:25', '2021-08-21 14:03:25'),
(10, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 14:14:37', '2021-08-21 14:14:37'),
(11, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 14:20:36', '2021-08-21 14:20:36'),
(12, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 17:27:21', '2021-08-21 17:27:21'),
(13, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:10:11', '2021-08-21 20:10:11'),
(14, '{\"title\":\"Order\",\"description\":\"New order!\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 2, NULL, '2021-08-21 20:10:11', '2021-08-21 20:10:11'),
(15, '{\"title\":\"Order\",\"description\":\"Your order is processing\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:10:24', '2021-08-21 20:10:24'),
(16, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2021-08-21 20:10:24', '2021-08-21 20:10:24'),
(17, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:10:35', '2021-08-21 20:10:35'),
(18, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2021-08-21 20:10:35', '2021-08-21 20:10:35'),
(19, '{\"title\":\"Order\",\"description\":\"Your order is processing\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:16:55', '2021-08-21 20:16:55'),
(20, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:18:04', '2021-08-21 20:18:04'),
(21, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2021-08-21 20:18:04', '2021-08-21 20:18:04'),
(22, '{\"title\":\"Order\",\"description\":\"Your order is out for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:20:23', '2021-08-21 20:20:23'),
(23, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 20:20:32', '2021-08-21 20:20:32'),
(24, '{\"title\":\"Order\",\"description\":\"Your order is processing\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 21:15:31', '2021-08-21 21:15:31'),
(25, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2021-08-21 21:15:31', '2021-08-21 21:15:31'),
(26, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 21:15:41', '2021-08-21 21:15:41'),
(27, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2021-08-21 21:15:41', '2021-08-21 21:15:41'),
(28, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 21:38:49', '2021-08-21 21:38:49'),
(29, '{\"title\":\"Order\",\"description\":\"Your order is out for delivery\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 21:45:24', '2021-08-21 21:45:24'),
(30, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 3, NULL, NULL, '2021-08-21 21:45:29', '2021-08-21 21:45:29'),
(31, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:05:50', '2021-08-21 22:05:50'),
(32, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:09:18', '2021-08-21 22:09:18'),
(33, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:20:51', '2021-08-21 22:20:51'),
(34, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:22:15', '2021-08-21 22:22:15'),
(35, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2021-08-21 22:30:24', '2021-08-21 22:30:24'),
(36, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2021-08-21 22:30:47', '2021-08-21 22:30:47'),
(37, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:37:38', '2021-08-21 22:37:38'),
(38, '{\"title\":\"Order\",\"description\":\"Your order is processing\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:45:16', '2021-08-21 22:45:16'),
(39, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:45:28', '2021-08-21 22:45:28'),
(40, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:46:14', '2021-08-21 22:46:14'),
(41, '{\"title\":\"Order\",\"description\":\"Your order is pending\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 22:51:46', '2021-08-21 22:51:46'),
(42, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 23:03:19', '2021-08-21 23:03:19'),
(43, '{\"title\":\"Order\",\"description\":\"New order!\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 2, NULL, '2021-08-21 23:03:19', '2021-08-21 23:03:19'),
(44, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 23:04:50', '2021-08-21 23:04:50'),
(45, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2021-08-21 23:04:50', '2021-08-21 23:04:50'),
(46, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 23:05:24', '2021-08-21 23:05:24'),
(47, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2021-08-21 23:05:24', '2021-08-21 23:05:24'),
(48, '{\"title\":\"Order\",\"description\":\"Food is ready for handover\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 23:06:34', '2021-08-21 23:06:34'),
(49, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-21 23:15:03', '2021-08-21 23:15:03'),
(50, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:11:33', '2021-08-22 01:11:33'),
(51, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:12:46', '2021-08-22 01:12:46'),
(52, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:13:42', '2021-08-22 01:13:42'),
(53, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100018,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:18:27', '2021-08-22 01:18:27'),
(54, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100019,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:22:21', '2021-08-22 01:22:21'),
(55, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100020,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:26:26', '2021-08-22 01:26:26'),
(56, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100021,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:27:13', '2021-08-22 01:27:13'),
(57, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100022,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:31:58', '2021-08-22 01:31:58'),
(58, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:32:37', '2021-08-22 01:32:37'),
(59, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100024,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:33:47', '2021-08-22 01:33:47'),
(60, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100025,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 01:34:51', '2021-08-22 01:34:51'),
(61, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:37:35', '2021-08-22 01:37:35'),
(62, '{\"title\":\"Order\",\"description\":\"messages.you_are_assigned_to_a_order.\",\"order_id\":100023,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 4, '2021-08-22 01:37:35', '2021-08-22 01:37:35'),
(63, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:37:50', '2021-08-22 01:37:50'),
(64, '{\"title\":\"Order\",\"description\":\"New order!\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 11, NULL, '2021-08-22 01:37:50', '2021-08-22 01:37:50'),
(65, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:38:37', '2021-08-22 01:38:37'),
(66, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 4, '2021-08-22 01:38:37', '2021-08-22 01:38:37'),
(67, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:38:43', '2021-08-22 01:38:43'),
(68, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:38:54', '2021-08-22 01:38:54'),
(69, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:40:14', '2021-08-22 01:40:14'),
(70, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 01:40:28', '2021-08-22 01:40:28'),
(71, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100026,\"image\":\"\",\"type\":\"order_status\"}', 1, 13, NULL, NULL, '2021-08-22 02:43:52', '2021-08-22 02:43:52'),
(72, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100027,\"image\":\"\",\"type\":\"order_status\"}', 1, 13, NULL, NULL, '2021-08-22 02:44:12', '2021-08-22 02:44:12'),
(73, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100028,\"image\":\"\",\"type\":\"order_status\"}', 1, 4, NULL, NULL, '2021-08-22 03:48:12', '2021-08-22 03:48:12'),
(74, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100029,\"image\":\"\",\"type\":\"order_status\"}', 1, 14, NULL, NULL, '2021-08-22 08:10:54', '2021-08-22 08:10:54'),
(75, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100030,\"image\":\"\",\"type\":\"order_status\"}', 1, 14, NULL, NULL, '2021-08-22 08:16:38', '2021-08-22 08:16:38'),
(76, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100025,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2021-08-22 08:42:43', '2021-08-22 08:42:43'),
(77, '{\"title\":\"Order\",\"description\":\"messages.you_are_assigned_to_a_order.\",\"order_id\":100025,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 5, '2021-08-22 08:42:43', '2021-08-22 08:42:43'),
(78, '{\"title\":\"Suspended\",\"description\":\"Your account has been blocked! Please contact to our customer care.\",\"order_id\":\"\",\"image\":\"\",\"type\":\"block\"}', 1, 14, NULL, NULL, '2021-08-22 08:46:25', '2021-08-22 08:46:25'),
(79, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100031,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:20:03', '2021-08-22 09:20:03'),
(80, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100032,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:22:16', '2021-08-22 09:22:16'),
(81, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100032,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:22:56', '2021-08-22 09:22:56'),
(82, '{\"title\":\"Order\",\"description\":\"messages.you_are_assigned_to_a_order.\",\"order_id\":100032,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 4, '2021-08-22 09:22:56', '2021-08-22 09:22:56'),
(83, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100032,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:24:02', '2021-08-22 09:24:02'),
(84, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100032,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 4, '2021-08-22 09:24:02', '2021-08-22 09:24:02'),
(85, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100032,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:24:27', '2021-08-22 09:24:27'),
(86, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100032,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:24:42', '2021-08-22 09:24:42'),
(87, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:27:20', '2021-08-22 09:27:20'),
(88, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:28:45', '2021-08-22 09:28:45'),
(89, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:30:09', '2021-08-22 09:30:09'),
(90, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:30:23', '2021-08-22 09:30:23'),
(91, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:30:37', '2021-08-22 09:30:37'),
(92, '{\"title\":\"Order\",\"description\":\"messages.you_are_assigned_to_a_order.\",\"order_id\":100033,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2021-08-22 09:30:37', '2021-08-22 09:30:37'),
(93, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 09:31:03', '2021-08-22 09:31:03'),
(94, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100034,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-22 10:04:54', '2021-08-22 10:04:54'),
(95, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100035,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-08-22 19:11:39', '2021-08-22 19:11:39'),
(96, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100036,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 02:36:23', '2021-08-23 02:36:23'),
(97, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 02:58:13', '2021-08-23 02:58:13'),
(98, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 02:59:12', '2021-08-23 02:59:12'),
(99, '{\"title\":\"Order\",\"description\":\"New order!\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 2, NULL, '2021-08-23 02:59:12', '2021-08-23 02:59:12'),
(100, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 03:01:22', '2021-08-23 03:01:22'),
(101, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 7, '2021-08-23 03:01:22', '2021-08-23 03:01:22'),
(102, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 03:01:58', '2021-08-23 03:01:58'),
(103, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 7, '2021-08-23 03:01:58', '2021-08-23 03:01:58'),
(104, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 03:02:36', '2021-08-23 03:02:36'),
(105, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100037,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-08-23 03:03:01', '2021-08-23 03:03:01'),
(106, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100038,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:12:02', '2021-10-17 00:12:02'),
(107, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100039,\"image\":\"\",\"type\":\"order_status\"}', 1, 17, NULL, NULL, '2021-10-17 00:16:00', '2021-10-17 00:16:00'),
(108, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100040,\"image\":\"\",\"type\":\"order_status\"}', 1, 17, NULL, NULL, '2021-10-17 00:17:46', '2021-10-17 00:17:46'),
(109, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100041,\"image\":\"\",\"type\":\"order_status\"}', 1, 17, NULL, NULL, '2021-10-17 00:18:00', '2021-10-17 00:18:00'),
(110, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100033,\"image\":\"\",\"type\":\"order_status\"}', 1, 15, NULL, NULL, '2021-10-17 00:19:51', '2021-10-17 00:19:51'),
(111, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100042,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:30:50', '2021-10-17 00:30:50'),
(112, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100043,\"image\":\"\",\"type\":\"order_status\"}', 1, 19, NULL, NULL, '2021-10-17 00:40:40', '2021-10-17 00:40:40'),
(113, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100044,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:40:55', '2021-10-17 00:40:55'),
(114, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:41:39', '2021-10-17 00:41:39'),
(115, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100045,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 11, NULL, '2021-10-17 00:41:40', '2021-10-17 00:41:40'),
(116, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100046,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:42:58', '2021-10-17 00:42:58'),
(117, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100046,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2021-10-17 00:42:58', '2021-10-17 00:42:58'),
(118, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100046,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:43:36', '2021-10-17 00:43:36'),
(119, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100046,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:43:42', '2021-10-17 00:43:42'),
(120, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-10-17 00:43:51', '2021-10-17 00:43:51'),
(121, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100046,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:43:51', '2021-10-17 00:43:51'),
(122, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100028,\"image\":\"\",\"type\":\"order_status\"}', 1, 4, NULL, NULL, '2021-10-17 00:44:00', '2021-10-17 00:44:00'),
(123, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100046,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:44:09', '2021-10-17 00:44:09'),
(124, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100028,\"image\":\"\",\"type\":\"order_status\"}', 1, 4, NULL, NULL, '2021-10-17 00:44:10', '2021-10-17 00:44:10'),
(125, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100028,\"image\":\"\",\"type\":\"order_status\"}', 1, 4, NULL, NULL, '2021-10-17 00:44:19', '2021-10-17 00:44:19'),
(126, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100046,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:44:27', '2021-10-17 00:44:27'),
(127, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-10-17 00:44:28', '2021-10-17 00:44:28'),
(128, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-10-17 00:44:43', '2021-10-17 00:44:43'),
(129, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100028,\"image\":\"\",\"type\":\"order_status\"}', 1, 4, NULL, NULL, '2021-10-17 00:44:54', '2021-10-17 00:44:54'),
(130, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2021-10-17 00:45:03', '2021-10-17 00:45:03'),
(131, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100047,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:45:53', '2021-10-17 00:45:53'),
(132, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100047,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2021-10-17 00:45:53', '2021-10-17 00:45:53'),
(133, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:46:14', '2021-10-17 00:46:14'),
(134, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2021-10-17 00:46:14', '2021-10-17 00:46:14'),
(135, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:46:32', '2021-10-17 00:46:32'),
(136, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2021-10-17 00:46:32', '2021-10-17 00:46:32'),
(137, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100048,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2021-10-17 00:46:45', '2021-10-17 00:46:45'),
(138, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:47:11', '2021-10-17 00:47:11'),
(139, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 11, NULL, '2021-10-17 00:47:11', '2021-10-17 00:47:11'),
(140, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100045,\"image\":\"\",\"type\":\"order_status\"}', 1, 7, NULL, NULL, '2021-10-17 00:47:27', '2021-10-17 00:47:27'),
(141, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100049,\"image\":\"\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2021-10-17 15:11:01', '2021-10-17 15:11:01'),
(142, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100050,\"image\":\"\",\"type\":\"order_status\"}', 1, 22, NULL, NULL, '2021-10-17 15:38:44', '2021-10-17 15:38:44'),
(143, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100051,\"image\":\"\",\"type\":\"order_status\"}', 1, 22, NULL, NULL, '2021-10-17 15:53:52', '2021-10-17 15:53:52'),
(144, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100052,\"image\":\"\",\"type\":\"order_status\"}', 1, 22, NULL, NULL, '2021-10-17 15:55:41', '2021-10-17 15:55:41'),
(145, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100053,\"image\":\"\",\"type\":\"order_status\"}', 1, 22, NULL, NULL, '2021-10-17 15:56:37', '2021-10-17 15:56:37'),
(146, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100053,\"image\":\"\",\"type\":\"order_status\"}', 1, 22, NULL, NULL, '2021-10-17 16:01:18', '2021-10-17 16:01:18'),
(147, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100053,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 3, '2021-10-17 16:01:18', '2021-10-17 16:01:18'),
(148, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100052,\"image\":\"\",\"type\":\"order_status\"}', 1, 22, NULL, NULL, '2021-11-15 16:03:32', '2021-11-15 16:03:32'),
(149, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100052,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 4, NULL, '2021-11-15 16:03:32', '2021-11-15 16:03:32'),
(150, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100054,\"image\":\"\",\"type\":\"order_status\"}', 1, 16, NULL, NULL, '2021-11-15 16:15:20', '2021-11-15 16:15:20'),
(151, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100055,\"image\":\"\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2021-11-15 16:15:29', '2021-11-15 16:15:29'),
(152, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100056,\"image\":\"\",\"type\":\"order_status\"}', 1, 16, NULL, NULL, '2021-11-15 16:15:43', '2021-11-15 16:15:43'),
(153, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100056,\"image\":\"\",\"type\":\"order_status\"}', 1, 16, NULL, NULL, '2021-11-15 16:16:34', '2021-11-15 16:16:34'),
(154, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100056,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 4, NULL, '2021-11-15 16:16:34', '2021-11-15 16:16:34'),
(155, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100059,\"image\":\"\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2021-11-15 16:22:32', '2021-11-15 16:22:32'),
(156, '{\"title\":\"Order placed successfully!\",\"description\":\"Your order is successfully placed\",\"order_id\":100060,\"image\":\"\",\"type\":\"order_status\"}', 1, 26, NULL, NULL, '2021-12-05 18:47:09', '2021-12-05 18:47:09'),
(157, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100062,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-01-11 12:54:12', '2022-01-11 12:54:12'),
(158, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100063,\"image\":\"\",\"type\":\"order_status\"}', 1, 32, NULL, NULL, '2022-01-11 12:59:27', '2022-01-11 12:59:27'),
(159, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100064,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-01-11 13:02:47', '2022-01-11 13:02:47'),
(160, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:38:32', '2022-01-11 13:38:32'),
(161, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:39:41', '2022-01-11 13:39:41'),
(162, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100066,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-01-11 13:39:41', '2022-01-11 13:39:41'),
(163, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:40:02', '2022-01-11 13:40:02'),
(164, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2022-01-11 13:40:02', '2022-01-11 13:40:02'),
(165, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:40:15', '2022-01-11 13:40:15'),
(166, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 1, '2022-01-11 13:40:15', '2022-01-11 13:40:15'),
(167, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:40:27', '2022-01-11 13:40:27'),
(168, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 2, NULL, '2022-01-11 13:40:27', '2022-01-11 13:40:27'),
(169, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100066,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:40:42', '2022-01-11 13:40:42'),
(170, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:42:04', '2022-01-11 13:42:04'),
(171, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100067,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-01-11 13:42:04', '2022-01-11 13:42:04'),
(172, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:44:22', '2022-01-11 13:44:22'),
(173, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:44:41', '2022-01-11 13:44:41'),
(174, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 9, '2022-01-11 13:44:41', '2022-01-11 13:44:41'),
(175, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:44:50', '2022-01-11 13:44:50'),
(176, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 9, '2022-01-11 13:44:51', '2022-01-11 13:44:51'),
(177, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100067,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:45:07', '2022-01-11 13:45:07'),
(178, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100068,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-01-11 13:54:22', '2022-01-11 13:54:22'),
(179, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100068,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-01-11 13:54:22', '2022-01-11 13:54:22'),
(180, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100069,\"image\":\"\",\"type\":\"order_status\"}', 1, 37, NULL, NULL, '2022-01-11 14:17:39', '2022-01-11 14:17:39'),
(181, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100069,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-01-11 14:17:39', '2022-01-11 14:17:39'),
(182, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100070,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-11 14:23:22', '2022-01-11 14:23:22'),
(183, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100070,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 2, NULL, '2022-01-11 14:23:22', '2022-01-11 14:23:22'),
(184, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100071,\"image\":\"\",\"type\":\"order_status\"}', 1, 40, NULL, NULL, '2022-01-20 18:04:58', '2022-01-20 18:04:58'),
(185, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100071,\"image\":\"\",\"type\":\"order_status\"}', 1, 40, NULL, NULL, '2022-01-20 18:05:38', '2022-01-20 18:05:38'),
(186, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100071,\"image\":\"\",\"type\":\"order_status\"}', 1, 40, NULL, NULL, '2022-01-20 18:06:44', '2022-01-20 18:06:44'),
(187, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100071,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 11, NULL, '2022-01-20 18:06:44', '2022-01-20 18:06:44'),
(188, '{\"title\":\"Order\",\"description\":\"Your order is delivered\",\"order_id\":100071,\"image\":\"\",\"type\":\"order_status\"}', 1, 40, NULL, NULL, '2022-01-20 18:07:04', '2022-01-20 18:07:04'),
(189, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:14:32', '2022-01-20 18:14:32'),
(190, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:15:22', '2022-01-20 18:15:22'),
(191, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100072,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 5, '2022-01-20 18:15:22', '2022-01-20 18:15:22'),
(192, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2022-01-20 18:17:20', '2022-01-20 18:17:20'),
(193, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100011,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 10, NULL, '2022-01-20 18:17:20', '2022-01-20 18:17:20'),
(194, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2022-01-20 18:17:59', '2022-01-20 18:17:59'),
(195, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 5, '2022-01-20 18:17:59', '2022-01-20 18:17:59'),
(196, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2022-01-20 18:18:09', '2022-01-20 18:18:09'),
(197, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 5, '2022-01-20 18:18:10', '2022-01-20 18:18:10'),
(198, '{\"title\":\"Order\",\"description\":\"Order is canceled by your request\",\"order_id\":100025,\"image\":\"\",\"type\":\"order_status\"}', 1, 12, NULL, NULL, '2022-01-20 18:19:07', '2022-01-20 18:19:07'),
(199, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100073,\"image\":\"\",\"type\":\"order_status\"}', 1, 43, NULL, NULL, '2022-01-20 18:19:09', '2022-01-20 18:19:09'),
(200, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:19:16', '2022-01-20 18:19:16'),
(201, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100072,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 10, NULL, '2022-01-20 18:19:16', '2022-01-20 18:19:16'),
(202, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2022-01-20 18:19:31', '2022-01-20 18:19:31'),
(203, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 10, NULL, '2022-01-20 18:19:31', '2022-01-20 18:19:31'),
(204, '{\"title\":\"Order\",\"description\":\"Your order is started for cooking\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:21:17', '2022-01-20 18:21:17'),
(205, '{\"title\":\"Order\",\"description\":\"Proceed for Cooking\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 5, '2022-01-20 18:21:17', '2022-01-20 18:21:17'),
(206, '{\"title\":\"Order\",\"description\":\"Delivery man is on the way\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:21:29', '2022-01-20 18:21:29'),
(207, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 5, '2022-01-20 18:21:29', '2022-01-20 18:21:29'),
(208, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:21:59', '2022-01-20 18:21:59'),
(209, '{\"title\":\"Order\",\"description\":\"Your food is ready for delivery\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 10, NULL, '2022-01-20 18:21:59', '2022-01-20 18:21:59'),
(210, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 38, NULL, NULL, '2022-01-20 18:22:27', '2022-01-20 18:22:27'),
(211, '{\"title\":\"Order\",\"description\":\"Order delivered successfully\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 10, NULL, NULL, '2022-01-20 18:25:32', '2022-01-20 18:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'Joshef', 'Doe', '+910111111111', 'joshef.doe1025822@gmail.com', NULL, '$2y$10$f5Ujqi05wF33.RTiCwjOOumpFIcrmZakSzXAJnNxLdNW1DE8j7a8G', NULL, '2021-08-20 21:05:49', '2021-10-17 16:00:22', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 'Pichart', 'Anthony', '+8801710000000', 'test.restaurant@gmail.com', NULL, '$2y$10$GkV8QOoxu8hMGlRUiHqpP.DuT2M226k5g/99pT4.STuhGf5pNHPGG', 'Tfu3LvZWpS8KzPaMJtwGNPYDxCQ6CLWORziyJWsoIVFCbzcmZiIzhvVG7rrc', '2021-08-20 21:11:45', '2022-01-11 14:15:24', NULL, NULL, NULL, NULL, '2021-08-22-61214e5a0db7d.png', 1, 'ejNXMX_9Ssq7oDxuNeXyn-:APA91bFrnfuAM6Ie41QMnUXQXSvDZGo5QR0Ldfi2hOm-2gi9PZ1KIwvBG6AEaz7u35clTrkZMqNWx08Qk3E-rIL_LwiazQWxK4UDaMAwwJWBC4giM3OIlH9_9FuAO_qHZlEe2gaX9Ymf', 'nmsPX9plROacSxujOnSMs34Pjt1xu82qoaai5In6F0PTUN3xJPM9BOAj7PshwjFVtWND4yUb5HpiDj3QbkzRxi8mKfeNfc3Ecx6E4PQ2kse54omFXirOINsl'),
(3, 'Nipon', 'Roy', '+8801747413273', 'nipon34.bd@gmail.com', NULL, '$2y$10$JwU.Z0eXrpIR6vjkJUKy3.lJ4Wj8a3hctJ0.4m9EcNyGDPjJMk4vC', NULL, '2021-08-20 21:18:09', '2021-08-20 21:18:09', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(4, 'Jakatta', 'Potin', '+88525695888', 'test.restaurant1@gmail.com', NULL, '$2y$10$KhQKyf4AOnEqHE3tWB51x.nOj.orejD2QpBrpnkn9QLOyt3jd.sam', NULL, '2021-08-20 21:26:42', '2021-10-17 15:57:14', NULL, NULL, NULL, NULL, NULL, 1, 'e_w7Vuv9SmyyTfGHYwhMYP:APA91bEOc251yRiaSc116fUQHuVatD01wPqf0AvD4tFlVew2UN7Fq6U83Y999-brut0P5SBrRR3Ott1fwYymzXnp1dChdM5GueJKyiMga6Xp9syZBWmGTjzHBC_l_ks1FoPX6u_CMlfP', 'lNsm7hDeqo120RwSGXy6SRxcGxXvpvd2cPRL60BmCdx6vshsbZ9DQ59Z2ykK4iP9x7SfPxblheGVWBlUMY4YeYo2zYpwarDQD3cMdmTCbmHYdzoCb1cPBgV4'),
(5, 'Rimison', 'Doe', '+6024588888', 'test.restaurant2@gmail.com', NULL, '$2y$10$oGyCkIDOYbC22hTgkkiA6OrLIQ3GGlu40nyQKxmLGvsOysvuKWjsy', NULL, '2021-08-20 21:28:59', '2021-08-20 21:28:59', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(6, 'Yello', 'Thid', '+8565222222', 'test.restaurant3@gmail.com', NULL, '$2y$10$4n1iOICzuctagsDSrofS/usNmeITSmrJ5iEmLpKU7GfoxOkFDjwA6', NULL, '2021-08-20 21:31:51', '2021-08-20 21:31:51', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(7, 'Mirra', 'Roy', '+12562458744', 'test.restaurant4@gmail.com', NULL, '$2y$10$rOzu5Is.Xxs.Xr32RLyHuuqnVZ4scL3xRWP8S.enWB19duo.8Ed9S', NULL, '2021-08-21 01:55:13', '2021-10-17 16:02:08', NULL, NULL, NULL, NULL, NULL, 1, 'e_w7Vuv9SmyyTfGHYwhMYP:APA91bEOc251yRiaSc116fUQHuVatD01wPqf0AvD4tFlVew2UN7Fq6U83Y999-brut0P5SBrRR3Ott1fwYymzXnp1dChdM5GueJKyiMga6Xp9syZBWmGTjzHBC_l_ks1FoPX6u_CMlfP', '0LFDyXK2Gio6H0Oo9JEB55PhAv5IOp3THXF3Txzd1dP0OGdG15yJ6Cc0yBPj0t4EmiRi1agOSigdCCsSdE9uScsCGa5avNZd0MoRRd9A6MC21lmBno2O66kY'),
(8, 'Kutman', 'Beneti', '+12584555555', 'test.restaurant5@gmail.com', NULL, '$2y$10$pCGDs0eVCqjR4mRliFnZSOdIsMigqzOoJbXANQAQUYLk8GuKecG5y', NULL, '2021-08-21 01:59:41', '2021-08-21 01:59:41', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(9, 'Sunny', 'Sultan', '+880100000000', 'test.restaurant6@gmail.com', NULL, '$2y$10$tSDv3gvQEthGwH3ZaM2vau0vhWxV3.pZDtDPq06sKiP26Qi1UsNay', NULL, '2021-08-21 02:03:27', '2021-08-21 02:03:27', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(10, 'Sumitro', 'Das', '+91025888888', 'test.restaurant7@gmail.com', NULL, '$2y$10$bBaATHdS6quLOqItaqSvCek/N/oaMOZd3PW2eaLhI7qb5tLg0Djuq', NULL, '2021-08-21 02:07:50', '2022-01-20 18:07:10', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'ViAVg0CTdVZcm6sLjVhQZrVk1VDI1i4gpXTYuoIo10jM0ddGeDox0xxLC4KnHbe1PFYwhayqpXZdRWJFXbszjkBe9DK3oZJGkNBhwgr3mpOBOWzip2YPiCZ8'),
(11, 'Pinku', 'Islam', '+91025558884', 'test.restaurant8@gmail.com', NULL, '$2y$10$hTb7ShXmMUXPrqSoD3iPbeWKkZOmrK1uI/jVW3Ta8I8jz9ToBkix.', NULL, '2021-08-21 02:11:30', '2021-10-17 00:39:08', NULL, NULL, NULL, NULL, NULL, 1, 'dwwfnoM1ShqmZ23-yH9QN1:APA91bFRhIavLsVybuZnnTmtUMEOUx_z3QAMY78PR8dRmbVfMAS1jTQPHcEPh6NzoQjtEDntM_kF8GJLhC--afQ_UDtEBwkEUKXtaO5rxrevSJVzjIuFBGLptqyUN8SxUbP6_hP4H_ve', 'stdm9vbdhsjdFYB7RqzK3iTkPJyJckROE2cz77dYNeZHd0YmKxAC1fsTc7Tkmtgs1gzvX5s5l8Vb5Yvbx33oKINbCQ5ldDEMIu5Y0c9MtLR7aUigdbOUO3Ht'),
(12, 'Punchuk', 'Yangru', '+02541255888', 'test.restaurant10@gmail.com', NULL, '$2y$10$5D88uGCkHKd3ipRQ2A5Kgu.yGW.LVVbkDQXp7orL8UhVbPdCFNOiK', NULL, '2021-08-21 02:18:16', '2021-08-21 02:18:16', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(13, 'Jhon', 'Chung', '+212588888', 'test.restaurant13@gmail.com', NULL, '$2y$10$DpOcE/PmXp6m9S5Ps1ssBOifQ0av303cDC9YEteaBjouhZSR0Ha/.', NULL, '2021-08-21 02:26:33', '2021-08-21 02:26:33', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(14, 'Jibona', 'Posta', '+91021100000', 'test.restaurant12@gmail.com', NULL, '$2y$10$kV0C7LSujfDT7VX653qLVuQZwtti.JerqpGtXARW5pod8zEEhYW96', NULL, '2021-08-21 02:29:16', '2021-11-15 16:21:47', NULL, NULL, NULL, NULL, NULL, 1, 'eqqG_NSBQJGfwwZ8s2Z5gk:APA91bFG8XLdQ0IE69UaFOztNl54OEWiinqI9Zu-AixOY8pW280UaWrhX6CvyC-203YUG4qg24FO6azyO3EzeWCel4SnrceYEXLJF6JjroblcR6lA67dz5lYJKcjf8cu27BC4evKjkFG', '4Ja8QuWPYnO2BQmeibVNromnjtmdcocWYrfNA2O1JtuwLKIXP7CWhS8w3J1y2tBG2hZt3xwDx32yTFHIfcKFXQ0DcFeHsozeewmKg2OEwzk73lMogZ1LbVzC'),
(15, 'Marjhan', 'Sultana', '01712251697', 'marjahan@gmail.com', NULL, '$2y$10$OgY.DTVcv.0I88gQJVuq9u9ah1/Vl3YPijN1RwdZBHmj0TdZ74gj2', NULL, '2021-10-17 00:29:09', '2022-01-20 18:06:22', NULL, NULL, NULL, NULL, NULL, 1, '@', 'mBL9F2QOzPsU26D5nvRDpxSG29ym4k2hTemCm4flrpYxDfJb0WAwziqAtzSy64txaoAx8o051Dz4Ivw5cfJHC0lPcwMQKARsD56uke7rAPVOHEzij6paX5ii');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `food_id`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(2, 3, 1, '2021-08-21 14:18:14', '2021-08-21 14:18:14', NULL),
(3, 3, 3, '2021-08-21 14:18:18', '2021-08-21 14:18:18', NULL),
(4, 3, 4, '2021-08-21 14:18:21', '2021-08-21 14:18:21', NULL),
(5, 3, NULL, '2021-08-21 17:31:57', '2021-08-21 17:31:57', 1),
(6, 3, 21, '2021-08-21 17:32:35', '2021-08-21 17:32:35', NULL),
(7, 3, NULL, '2021-08-21 17:35:35', '2021-08-21 17:35:35', 2),
(8, 3, NULL, '2021-08-21 21:40:32', '2021-08-21 21:40:32', 4),
(9, 6, 3, '2021-08-21 21:41:19', '2021-08-21 21:41:19', NULL),
(10, 6, 69, '2021-08-21 21:41:25', '2021-08-21 21:41:25', NULL),
(11, 6, NULL, '2021-08-21 21:41:30', '2021-08-21 21:41:30', 3),
(12, 6, NULL, '2021-08-21 21:41:35', '2021-08-21 21:41:35', 4),
(13, 8, 93, '2021-08-21 21:52:14', '2021-08-21 21:52:14', NULL),
(14, 9, NULL, '2021-08-21 21:54:45', '2021-08-21 21:54:45', 1),
(15, 9, NULL, '2021-08-21 21:54:55', '2021-08-21 21:54:55', 2),
(16, 10, 74, '2021-08-21 22:02:32', '2021-08-21 22:02:32', NULL),
(17, 10, 65, '2021-08-21 22:02:34', '2021-08-21 22:02:34', NULL),
(19, 10, 60, '2021-08-21 22:02:36', '2021-08-21 22:02:36', NULL),
(20, 10, 63, '2021-08-21 22:02:40', '2021-08-21 22:02:40', NULL),
(21, 12, NULL, '2021-08-22 00:59:46', '2021-08-22 00:59:46', 1),
(22, 12, NULL, '2021-08-22 00:59:47', '2021-08-22 00:59:47', 2),
(23, 12, 3, '2021-08-22 00:59:54', '2021-08-22 00:59:54', NULL),
(24, 12, 1, '2021-08-22 00:59:58', '2021-08-22 00:59:58', NULL),
(25, 9, 121, '2021-08-22 01:28:34', '2021-08-22 01:28:34', NULL),
(26, 13, NULL, '2021-08-22 02:45:56', '2021-08-22 02:45:56', 7),
(27, 13, NULL, '2021-08-22 02:45:58', '2021-08-22 02:45:58', 8),
(28, 13, NULL, '2021-08-22 02:45:59', '2021-08-22 02:45:59', 9),
(29, 13, NULL, '2021-08-22 02:46:00', '2021-08-22 02:46:00', 11),
(30, 13, NULL, '2021-08-22 02:46:02', '2021-08-22 02:46:02', 12),
(31, 13, NULL, '2021-08-22 02:46:03', '2021-08-22 02:46:03', 13),
(32, 4, NULL, '2021-08-22 02:46:27', '2021-08-22 02:46:27', 8),
(33, 4, NULL, '2021-08-22 02:46:31', '2021-08-22 02:46:31', 6),
(34, 4, NULL, '2021-08-22 02:46:34', '2021-08-22 02:46:34', 4),
(35, 4, NULL, '2021-08-22 02:46:37', '2021-08-22 02:46:37', 1),
(36, 4, NULL, '2021-08-22 02:46:39', '2021-08-22 02:46:39', 2),
(37, 4, 121, '2021-08-22 02:46:45', '2021-08-22 02:46:45', NULL),
(38, 4, 97, '2021-08-22 02:46:48', '2021-08-22 02:46:48', NULL),
(39, 14, 23, '2021-08-22 08:16:01', '2021-08-22 08:16:01', NULL),
(40, 9, NULL, '2021-08-22 19:08:10', '2021-08-22 19:08:10', 4),
(42, 24, 109, '2021-11-15 15:41:50', '2021-11-15 15:41:50', NULL),
(43, 24, NULL, '2021-11-15 15:47:18', '2021-11-15 15:47:18', 1),
(44, 27, NULL, '2022-01-11 12:09:35', '2022-01-11 12:09:35', 2),
(45, 27, NULL, '2022-01-11 12:09:39', '2022-01-11 12:09:39', 1),
(47, 27, NULL, '2022-01-11 12:09:50', '2022-01-11 12:09:50', 4),
(48, 29, NULL, '2022-01-11 12:47:14', '2022-01-11 12:47:14', 14),
(49, 29, NULL, '2022-01-11 12:47:17', '2022-01-11 12:47:17', 13),
(50, 29, NULL, '2022-01-11 12:47:19', '2022-01-11 12:47:19', 12),
(51, 29, NULL, '2022-01-11 12:47:20', '2022-01-11 12:47:20', 11),
(53, 28, NULL, '2022-01-20 18:13:58', '2022-01-20 18:13:58', 7),
(54, 28, NULL, '2022-01-20 18:14:02', '2022-01-20 18:14:02', 11),
(55, 28, 119, '2022-01-20 18:14:20', '2022-01-20 18:14:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'All over the World', 0x0000000001030000000100000025000000de577956da4566c05ffb2847ee105140de57795612f065c0f4b1e90cbee75040de577956227765c054d9a52e5ab25040de577956123c65c059bde101cc885040de5779563a5f65c0c59ef914fa635040de5779561a9d65c0958caee6411a5040de57795642ed65c05754a92b533e5040de5779560a4366c0ac30798df16a5040de577956d23e66c06bbe60bb649f504022a886a9157f664044ccf8a6df91504022a886a9d5736640616fece9b340504022a886a9f562664027dbc3505a504f408b31538b82356440d6f5637e0f4e4c408b31538b62b162400f243ffb874b1ac08b31538be21e6640d1c08f519a4e43c08b31538b022d6540cb0b0984db1047c08b31538b229861406e3c7181204342c01563a61685145d403c18fa5e73ad40c09ec54c2d8a634640756126aaa37138c03c8b995a142b3440ccd3e164b0e540c0319d59e9ba3151c04883e9781b1b4bc0319d59e97a8e52c0937dad3429d548c0319d59e97a2651c0c48214170a0f33c0319d59e9baa753c02b9648092dfb20c0eb9c59e9ba7459c0b584594c36e63240eb9c59e93aa45ec0918fdd9dcaa6434075ceac741d8a63c02ea401df41044d4075ceac745dd064c08073b254e767504075ceac749dae64c08ed0c2d00d28514075ceac74bd8f63c0a529db2454bf5140eb9c59e97aea5fc01b075ce0df735140319d59e93abe53c0e8f8976fb6a754403c8b995a141739405ee27cdd06ed53409ec54c2d8a3e4d4029474755d4c152401563a616c54f5a400a438459e4e652408b31538b62fd6140527bedec1df55140de577956da4566c05ffb2847ee105140, 1, '2021-08-20 13:57:05', '2021-08-22 02:45:19', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man'),
(2, 'fenitzerplatz', 0x00000000010300000001000000060000002346a83e5b2c264090b6d04f94bb4840b747a83e143726401c8d54434bba48405846a83e2832264018b9120139b948408446a8be4d232640820a537589b948404e47a83e3a202640168e9ac3faba48402346a83e5b2c264090b6d04f94bb4840, 0, '2021-08-23 23:13:05', '2021-10-17 00:43:12', 'zone_2_restaurant', 'zone_2_customer', 'zone_2_delivery_man'),
(3, 'Farmgate', 0x0000000001030000000100000005000000fc2140f3a0975640ebf6e07e32c337401522400b2c9a5640129d656251c33740072240cb209a564017b79388bbbe3740ef2140b395975640e9e912caa1be3740fc2140f3a0975640ebf6e07e32c33740, 0, '2021-10-17 00:28:07', '2021-10-17 00:43:09', 'zone_3_restaurant', 'zone_3_customer', 'zone_3_delivery_man'),
(4, 'NAZIMABAD', 0x0000000001030000000100000009000000bde7fb68d394564065b8af06d1ca3740ace7fb58c5945640706c85703bc6374099e7fb786895564021ea5883a8c3374091e7fbe8059756401b496de2e4c23740a9e7fb88fa98564060da09ef1dc7374099e7fb788497564078ddeff637cb374095e7fba819965640b7e809032fcc3740c6e7fbe81695564097e2558bfbcb3740bde7fb68d394564065b8af06d1ca3740, 0, '2021-10-17 15:43:11', '2021-10-17 16:00:40', 'zone_4_restaurant', 'zone_4_customer', 'zone_4_delivery_man'),
(5, 'កញ្ចប់', 0x0000000001030000000100000004000000ea68f1b2123a5a401f7358564c1827402268f19afd395a40961b9467e91827403968f186023a5a40a383ceef01182740ea68f1b2123a5a401f7358564c182740, 1, '2021-11-15 15:33:30', '2021-11-15 15:33:30', 'zone_5_restaurant', 'zone_5_customer', 'zone_5_delivery_man'),
(6, 'cb', 0x00000000010300000001000000080000006d7770021d88534042beb8f26be023405d7770e287885340d26371184edd2340647770828d88534034783db2f7da2340647770828d885340336d32f1f9d82340537770727f8853408210052506d82340517770928d87534071343cf674d823406c777012a487534037a5e04d5adc23406d7770021d88534042beb8f26be02340, 1, '2021-12-05 18:43:16', '2021-12-05 18:43:16', 'zone_6_restaurant', 'zone_6_customer', 'zone_6_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`);

--
-- Indexes for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2524;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100074;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
