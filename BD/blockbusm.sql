-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2022 a las 03:35:57
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blockbusm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id` int(10) NOT NULL,
  `genre` text NOT NULL,
  `description` text NOT NULL,
  `movDisp` int(11) NOT NULL,
  `movTotal` int(11) NOT NULL,
  `public` varchar(2) NOT NULL,
  `time` time NOT NULL,
  `price` int(11) NOT NULL,
  `actors` text NOT NULL,
  `starsMed` int(1) NOT NULL,
  `starsUsm` int(1) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relpeliculas`
--

CREATE TABLE `relpeliculas` (
  `userId` int(10) NOT NULL,
  `movId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reluser`
--

CREATE TABLE `reluser` (
  `userId` int(10) NOT NULL,
  `followerId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `userId` int(10) NOT NULL,
  `movId` int(10) NOT NULL,
  `description` text NOT NULL,
  `punt` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userID` int(10) NOT NULL,
  `userName` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `cantFollows` int(11) DEFAULT NULL,
  `cantFollowers` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `userId` int(10) NOT NULL,
  `movId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relpeliculas`
--
ALTER TABLE `relpeliculas`
  ADD KEY `userId` (`userId`,`movId`),
  ADD KEY `movId` (`movId`);

--
-- Indices de la tabla `reluser`
--
ALTER TABLE `reluser`
  ADD KEY `userId` (`userId`,`followerId`),
  ADD KEY `followerId` (`followerId`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD KEY `userId` (`userId`,`movId`),
  ADD KEY `movId` (`movId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD KEY `userId` (`userId`,`movId`),
  ADD KEY `movId` (`movId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relpeliculas`
--
ALTER TABLE `relpeliculas`
  ADD CONSTRAINT `relpeliculas_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relpeliculas_ibfk_2` FOREIGN KEY (`movId`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reluser`
--
ALTER TABLE `reluser`
  ADD CONSTRAINT `reluser_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reluser_ibfk_2` FOREIGN KEY (`followerId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movId`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`movId`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
