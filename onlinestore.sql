-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 12 2021 г., 06:58
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `onlinestore`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-03-11 16:21:18', '');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryDescription` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Косметика', '', '2021-03-12 06:40:37', NULL),
(2, 'Парфюмерия', '', '2021-03-12 06:46:36', NULL),
(14, 'Украшения', '', '2021-03-14 08:44:46', '2021-03-15 17:17:46 ');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderStatus` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(15, 1, 2, 2, '2021-03-20 13:26:25', 'Дебетовая / кредитная карта', 'Доставлено'),
(16, 1, 29, 1, '2021-04-05 09:37:14', 'При получении', 'В процессе'),
(17, 1, 1, 1, '2021-04-09 15:17:25', 'При получении', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(7, 15, 'В процессе', 'Обрабатывается', '2021-03-20 15:25:23'),
(8, 15, 'В процессе', 'Передано службе доставки', '2021-03-20 15:29:46'),
(9, 15, 'В процессе', 'Заказ в пути', '2021-03-20 15:30:24'),
(10, 15, 'В процессе', 'В пункте выдачи', '2021-03-20 15:30:50'),
(11, 15, 'Доставлено', 'Вручен адресату', '2021-03-20 15:31:24'),
(12, 16, 'В процессе', '11111', '2021-04-09 15:19:04');

-- --------------------------------------------------------

--
-- Структура таблицы `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(11, 2, 5, 5, 5, 'Александра', 'Прекрасные духи', 'Лучшие духи! Всем советую', '2021-04-02 07:49:19');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productCompany` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productImage1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productImage2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productImage3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 2, 1, 'Gucci Parfume Flora Gorgeous 100 мл', 'Gucci', 4590, 0, '<font face=\"comic sans ms\"><span style=\"color: rgb(0, 26, 52); font-size: 16px;\">Туалетная вода Gucci Flora Gorgeous Gardenia Edt, 100 ml обладает цветочно-фруктовым звучанием.&nbsp;</span><span style=\"color: rgb(0, 26, 52); font-size: 16px;\">Стартовый аккорд композиции образует красные ягоды и груша. К ним присоединяются сердечные ноты – Франжипани и гардения. В завершении слышатся базовые ноты, состоящие из переливов коричневого сахара и листьев пачули.</span></font><br>', 'product-707838-0-productPageDesktop.jfif', '', '', 0, 'В наличии', '2021-03-14 07:18:22', NULL),
(2, 2, 1, 'GUERLAIN La Petite Robe Noire', 'GUERLAIN', 3934, 5890, '<p style=\"box-sizing: border-box; color: rgb(34, 34, 34); font-size: 14px;\"><font face=\"comic sans ms\">В верхних нотах пирамиды слышится нежное звучание розы, окутанное таинственной дымкой флердоранжа. Лирическое настроение деликатно поддерживает жасмин. Под этот чувственный аккомпанемент раскрываются волнующие и завораживающие ноты сердца. Кружат голову вишневые аккорды, переливается цитрусовая свежесть и сочно искрится нагретое солнцем зеленое яблоко. В ароматном послевкусии шлейфа звучат терпковатые ноты белого мускуса и пачули. Завершает композицию томная, обволакивающая амбра, придающая аромату неповторимый восточный колорит.</font></p><p style=\"box-sizing: border-box; margin-bottom: 0px; color: rgb(34, 34, 34); font-size: 14px;\"><font face=\"comic sans ms\">Насыщенный и многогранный аромат заключен в элегантный флакон с изображением маленького черного платья. Дизайн хрустальной упаковки подчеркивает оригинальность ее содержимого. Притягивая к себе взгляд, La Petite Robe Noire пробуждает фантазию и вызывает желания, которые скромно дремали где-то очень глубоко.</font></p>', '3346470114722_1.jpg', 'GUE011473.webp', '', 0, 'В наличии', '2021-03-14 07:38:14', NULL),
(26, 2, 1, 'Givenchy Irresistible Eau de Parfum', 'Givenchy', 4586, 6115, '<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Аромат парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Цветочные фруктовые</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Объем, мл</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">35</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип товара</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Производство</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Франция</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Для</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">женщин</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерная вода (Eau de Parfum)<br></font><br><br></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; margin-top: 1rem !important; margin-bottom: 1rem !important;\"></div>', 'givenchy.jfif', 'Без названия.jfif', 'Без названия (1).jfif', 0, 'Нет в наличии', '2021-03-14 07:55:47', NULL),
(27, 2, 1, 'Lolita Lempicka Lolitaland Eau de Parfum', 'Lolita Lempicka', 5531, 7375, '														<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Аромат парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Фруктовые цветочные</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип товара</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Производство</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Франция</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Для</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">женщин</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерная вода (Eau de Parfum)</font></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" itemprop=\"description\" class=\"ng-star-inserted\" style=\"box-sizing: inherit;\"><font face=\"comic sans ms\">Аромат, созданный Франсисом Кюркджяном, который приглашает Вас отпраздновать щедрость Природы, на грани мечты и реальности.<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Верхние ноты</span>: беллини, масло непальского можжевельника, перец Тимут, масло итальянского мандарина, грейпфрут, лимон, лайм, апельсин.<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Ноты сердца</span>: абсолю самбакского жасмина, лепестки жасмина, белый персик, черная смородина, магнолия, слива.</font><br style=\"box-sizing: inherit;\"></div></div>', '324gr5.jfif', '', '', 0, 'Нет в наличии', '2021-03-14 07:58:50', NULL),
(28, 2, 1, 'Lancome La Vie Est Belle Soleil Cristal Eau De Parfum', 'Lancome', 6720, 8960, '<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Аромат парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Цветочные фруктовые</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Объем, мл</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">50</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип товара</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Производство</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Франция</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Для</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">женщин</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерная вода (Eau de Parfum)</font></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" itemprop=\"description\" class=\"ng-star-inserted\" style=\"box-sizing: inherit;\"><font face=\"comic sans ms\">Счастье — это больше чем чувство. Это заряд энергии. Это позитивная вибрация и ореол света, исходящие от тех, кто по-настоящему счастлив. С момента своего основания Lancôme культивирует представление о безграничном и ослепительном счастье. Lancôme создает новую версию аромата La Vie est Belle Soleil Cristal. Этот аромат обладает сияющим шлейфом, словно это ореол счастья.<br style=\"box-sizing: inherit;\">Чуткая и ослепительная женщина La Vie est Belle Soleil Cristal озаряет мир своим счастьем. От ее отношения до ее движений, — все в ней излучает радость жизни, «joie de vivre». Ее красота поистине обворожительна. Любой, кто оказался с ней рядом, наполняется светом. Она улыбается, и мир улыбается ей в ответ.<br style=\"box-sizing: inherit;\">Шлейф солнечных нот La Vie est Belle Soleil Cristal озаряет и наполняет светом оригинальный аромат. Он сияет еще ярче.<br style=\"box-sizing: inherit;\">Подобно улыбке, озаряющей знакомое лицо, солнечные ноты наполняют сиянием культовый аккорд La Vie est Belle изнутри.</font></div></div>', 'htrkh5ki4rb9ji.jfif', 'bj4jtn.jfif', '', 0, 'В наличии', '2021-03-14 08:02:34', NULL),
(29, 2, 1, 'Lacoste L.12.12 Rose Eau de Parfum', 'Lacoste', 3738, 4985, '<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Объем, мл</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">35</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип товара</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Производство</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Германия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Для</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">женщин</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерная вода (Eau de Parfum)</font></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" itemprop=\"description\" class=\"ng-star-inserted\" style=\"box-sizing: inherit;\"><font face=\"comic sans ms\">Напоминая невесомость ткани пике, из которой создано легендарное поло Lacoste, этот новый утонченный парфюм для женщин пронизан легкими цветочными оттенками красного жасмина и розы, подчеркнутыми яркими аккордами зеленого мандарина и мяты на основе базовых успокаивающих нот мускуса и амбретты. Розовый матовый флакон, заключающий в себе сияющий и свежий фруктово-цветочный аромат, предназначен для женщин, ценящих свободу выбора и стиля.</font></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div></div>', 'rg4g.jfif', 'g5j9rjm4.jfif', 'tg5i4rg5.jfif', 0, 'В наличии', '2021-03-14 08:06:07', NULL),
(30, 2, 1, 'By Kilian Playing with the Devil Eau de Parfum', 'KILIAN', 19975, 23500, '<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\">Аромат парфюма</div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\">Восточные цветочные</div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\">Объем, мл</div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\">50</div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\">Тип товара</div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\">Парфюмерия</div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\">Производство</div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\">Франция</div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\">Для</div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\">мужчин и женщин</div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\">Тип парфюма</div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\">Духи (Parfum)</div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" itemprop=\"description\" class=\"ng-star-inserted\" style=\"box-sizing: inherit;\">Playing with the Devil - игра огня и флирта. Терпкая эссенция апельсина «королёк» в сочетании с личи с оттенком розы приобретает огненный характер благодаря эссенции пикантного гвоздичного перца. Мягкое сандаловое дерево в базовой ноте придает аромату знойный флер. Фруктовая гармония с анималистическим характером.<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\">Парфюмер Калис Бекер</div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"></div></div></div>', 'gr5ikg5.jfif', '', '', 0, 'В наличии', '2021-03-14 08:14:29', NULL),
(34, 2, 2, 'Lacoste L.12.12 Blanc Eau de Parfum', 'Lacoste', 4735, 6285, '<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Аромат парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Древесные прочие</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Объем, мл</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">50</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип товара</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Производство</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Германия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Для</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">мужчин</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерная вода (Eau de Parfum)</font></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 14px; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" itemprop=\"description\" class=\"ng-star-inserted\" style=\"box-sizing: inherit;\"><font face=\"comic sans ms\">Совершенно чуждый традиционным принципам, но при этом всегда актуальный аромат переливается контрастами, чтобы идеально подстроиться под своего владельца. Изящно искрящиеся оттенки цитрусовых сливаются с наполняющими энергией зелеными нотами. Тепло дерева вступает в противоборство со свежестью эвкалипта. Все это на фоне базовых успокаивающих нот кедра и кардамона.</font></div></div>', '5hg6h.jfif', 'ky65hjg565.jfif', 'h5re4h5.jfif', 0, 'В наличии', '2021-03-14 08:56:25', NULL),
(35, 2, 2, 'DIOR SAUVAGE', 'DIOR', 3950, 5255, '<div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3 d-table\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: KievitPro, sans-serif; font-size: 16px; display: table !important; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Аромат парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Цитрусовые древесные</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Объем, мл</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">30</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип товара</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Парфюмерия</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Производство</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Франция</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Для</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">мужчин</font></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-row ng-star-inserted\" style=\"box-sizing: inherit; display: table-row !important;\"><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell c-lucid-darker pr-3 py-1\" style=\"box-sizing: inherit; display: table-cell !important; padding-top: 0.25rem !important; padding-bottom: 0.25rem !important; padding-right: 1rem !important; color: rgb(121, 127, 133);\"><font face=\"comic sans ms\">Тип парфюма</font></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"d-table-cell\" style=\"box-sizing: inherit; display: table-cell !important;\"><font face=\"comic sans ms\">Туалетная вода (Eau de Toilette)</font></div></div></div><div _ngcontent-rg-shop-app-c28=\"\" class=\"my-3\" style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-size: 16px; margin-top: 1rem !important; margin-bottom: 1rem !important;\"><div _ngcontent-rg-shop-app-c28=\"\" itemprop=\"description\" class=\"ng-star-inserted\" style=\"box-sizing: inherit;\"><font face=\"comic sans ms\">Sauvage - творение, вдохновленное широкими открытыми пространствами. Чистейшее синее небо, простирающееся над скалистыми вершинами гор. Смелая композиция для верного себе мужчины.<br style=\"box-sizing: inherit;\">\"В качестве отправной точки при создании Sauvage я использовал мужчину. Яркую и столь очевидную мужественность. Образ мужчины, который выходит за рамки времени и моды\".<br style=\"box-sizing: inherit;\">Франсуа Демаши, парфюмер-создатель Dior.</font></div></div>', 'Без названия (2).jpg', 'Без названия (4).jfif', '', 0, 'В наличии', '2021-03-14 09:04:34', NULL);
INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(36, 1, 21, 'Max Factor False Lash Effect Raven Black', 'Max Factor', 499, 705, '														<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:#797F85;mso-fareast-language:RU\">Результат<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">Объем и удлинение<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:#797F85;mso-fareast-language:RU\">Объем, мл<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">13,1<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:#797F85;mso-fareast-language:RU\">Тип товара<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">Декоративная косметика<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:#797F85;mso-fareast-language:RU\">Производство<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">Великобритания<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:#797F85;mso-fareast-language:RU\">Для<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">женщин<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:#797F85;mso-fareast-language:RU\">Тип декоративной\r\nкосметики<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">Тушь для ресниц<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0cm; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">Тушь</span><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;mso-fareast-language:\r\nRU\"> </span><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\r\nRU\">для</span><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;\r\nmso-fareast-language:RU\"> </span><span style=\"font-size:10.5pt;font-family:\r\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\r\nmso-fareast-language:RU\">ресниц</span><span lang=\"EN-US\" style=\"font-size:10.5pt;\r\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:black;mso-ansi-language:EN-US;mso-fareast-language:RU\"> Max Factor False\r\nLash Effect </span><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\r\nRU\">в</span><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;\r\nmso-fareast-language:RU\"> </span><span style=\"font-size:10.5pt;font-family:\r\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\r\nmso-fareast-language:RU\">оттенке</span><span lang=\"EN-US\" style=\"font-size:10.5pt;\r\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:black;mso-ansi-language:EN-US;mso-fareast-language:RU\"> Raven Black. </span><span style=\"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:RU\">Достигните естественного\r\nэффекта накладных ресниц с тушью False Lash Effect в оттенке Raven Black!\r\nКлассическая тушь, ставшая бестселлером возвращается с более яркими пигментами,\r\nдля создания драматичного образа. Тушь придает экстремальный объем ресницам\r\nблагодаря формуле жидких ресниц и широкому аппликатору, который прокрашивает\r\nкаждую ресничку.<o:p></o:p></span></p>', 'Без названия.jfif', 'Без названия (1).jfif', '', 150, 'В наличии', '2021-04-09 15:20:58', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 2, 'Женские ароматы', '2021-03-12 06:41:55', NULL),
(2, 2, 'Мужские ароматы', '2021-03-12 06:42:10', NULL),
(3, 2, 'Ароматерапия и свечи ', '2021-03-12 06:43:00', '2021-03-12 09:56:28 '),
(16, 1, 'Бронзеры', '2021-03-14 08:40:16', NULL),
(17, 1, 'Гель для бровей', '2021-03-14 08:40:47', NULL),
(18, 1, 'Блекс для губ', '2021-03-14 08:41:07', NULL),
(19, 1, 'Карандаши для бровей', '2021-03-14 08:41:28', NULL),
(20, 1, 'Тени для век', '2021-03-14 08:41:35', NULL),
(21, 1, 'Туш для ресниц', '2021-03-14 08:41:49', NULL),
(22, 1, 'Губная помада', '2021-03-14 08:41:58', NULL),
(23, 14, 'Браслеты', '2021-03-14 08:46:53', NULL),
(24, 14, 'Кольца', '2021-03-14 08:47:19', NULL),
(25, 14, 'Серьги', '2021-03-14 08:47:37', NULL),
(26, 14, 'Колье', '2021-03-14 08:47:57', NULL),
(27, 14, 'Шармы', '2021-03-14 08:48:05', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(48, 'alexandra@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 12:16:10', '2021-04-06 15:16:17 ', 1),
(49, 'alexandra@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 17:43:09', '2021-04-06 22:28:17 ', 1),
(50, 'alexandra@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 19:28:37', '2021-04-07 00:00:35 ', 1),
(52, 'alexandra@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 21:12:58', '2021-04-07 00:18:35 ', 1),
(53, 'alexandra@gmail.com', 0x3a3a3100000000000000000000000000, '2021-04-06 21:28:34', '2021-04-07 17:45:08 ', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shippingAddress` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shippingCountry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shippingCity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingCountry`, `shippingCity`, `shippingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Alexandra', 'alexandra@gmail.com', 89991746900, '9db3c8f773c85206e661d7538de50fe7', 'Рабфаковская, д.34Б, к.324', 'Россия', 'Иваново', 153003, '2021-03-04 19:30:50', '2021-04-06 22:03:50 ');

-- --------------------------------------------------------

--
-- Структура таблицы `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(5, 1, 27, '2021-03-31 21:10:54'),
(7, 1, 1, '2021-04-09 15:16:25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Индексы таблицы `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`);

--
-- Индексы таблицы `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subCategory` (`subCategory`),
  ADD KEY `category` (`category`);

--
-- Индексы таблицы `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Индексы таблицы `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD CONSTRAINT `ordertrackhistory_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `productreviews`
--
ALTER TABLE `productreviews`
  ADD CONSTRAINT `productreviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`subCategory`) REFERENCES `subcategory` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
