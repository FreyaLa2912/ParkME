-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 25, 2022 lúc 03:35 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vpmsdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(20) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `adminregdate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `adminregdate`) VALUES
(1, 'Tran Quoc Dat', 'dattran', 945, 'tqdat.tt114@kgc.edu.vn', '123456', '2022-12-13 14:40:18'),
(2, 'La Bảo Trân', 'tranla', 2912, 'freya.la2912@gmail.com', '123321', '2022-12-18 15:03:54'),
(3, 'admin', 'admin', 900, 'admin@gmail.com', 'admin@123', '2022-12-19 14:07:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(11) NOT NULL,
  `VehicleCat` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `VehicleCat`, `CreationDate`) VALUES
(1, 'Truck', '2020-05-22 15:01:49'),
(2, 'Car', '2020-05-22 15:02:10'),
(3, 'Motorbike', '2020-05-22 15:02:22'),
(4, 'Bicycle', '2020-05-22 15:02:39'),
(8, 'Xe dien', '2022-12-23 08:03:34'),
(9, 'xe ba gac', '2022-12-23 08:25:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblparkingseatcapacity`
--

CREATE TABLE `tblparkingseatcapacity` (
  `parking_seat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblparkingseatcapacity`
--

INSERT INTO `tblparkingseatcapacity` (`parking_seat`) VALUES
(25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbluser`
--

INSERT INTO `tbluser` (`id`, `fullname`, `mobile`, `email`, `address`, `uname`, `password`) VALUES
(1, 'La Trân', '+84946115542', 'freya.la2912@gmail.com', 'null', 'latran', '11111111'),
(16, 'Tran', '23446', 'fakjmcvn@gmail.com', 'svbg', 'latran29', '123321'),
(17, 'La Trân', '+84946115542', 'freya.la2912@gmail.com', '174/8/1F Nguyễn Bỉnh Khiêm', 'latran12', '123321'),
(18, 'La Bảo Trân', '0946115542', 'freya.la2912@gmail.com', '174/8/1F Nguyễn Bỉnh Khiêm', 'tranla123', '123321'),
(19, 'La Bảo Trân', '0815022072', 'freya.la2912@gmail.com', 'sd', 'latran1234', '11111111');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblvehicle`
--

CREATE TABLE `tblvehicle` (
  `ID` int(11) NOT NULL,
  `ParkingNumber` varchar(120) DEFAULT NULL,
  `VehicleCategory` varchar(120) NOT NULL,
  `VehicleCompanyname` varchar(120) DEFAULT NULL,
  `RegistrationNumber` varchar(120) DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `OwnerName` varchar(120) DEFAULT NULL,
  `OwnerContactNumber` bigint(20) DEFAULT NULL,
  `InTime` timestamp NULL DEFAULT current_timestamp(),
  `OutTime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `parkingcharge` varchar(120) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblvehicle`
--

INSERT INTO `tblvehicle` (`ID`, `ParkingNumber`, `VehicleCategory`, `VehicleCompanyname`, `RegistrationNumber`, `uname`, `OwnerName`, `OwnerContactNumber`, `InTime`, `OutTime`, `parkingcharge`, `remark`, `status`) VALUES
(22, '8064897', 'Xe đạp', 'Hodan', '3214', NULL, 'Đạt ơi là Đạt12321`3', 9456232, '2022-12-11 03:42:07', '2022-12-16 15:24:23', '0', 'ád', 'Out'),
(23, '4797021', 'Xe 4 bánh', 'Hodan', '479191569', NULL, 'Đạt', 94512, '2022-12-12 16:55:44', '2022-12-17 14:30:38', '0', 'out', 'Out'),
(24, '6814564', 'Xe 4 bánh', 'Hodan', '3214', NULL, 'Trần Quốc Đạt', 945906024, '2022-12-15 10:31:06', '2022-12-17 14:14:14', '0', 'out', 'Out'),
(25, '2708085', 'Xe 2 bánh', 'SH', '68-A1 05.2141', NULL, 'La Bảo Trân', 946115542, '2022-12-16 14:41:21', '2022-12-17 14:24:45', '0', 'a', 'Out'),
(26, '5418705', 'Xe 4 bánh', 'BMW', 'bvdfdf', NULL, 'La Bảo Trân', 946115542, '2022-12-16 14:45:21', '2022-12-17 14:09:07', '0', 'sd', 'Out'),
(27, '1585431', 'Xe 4 bánh', 'Honda', '68-A1 051.41', NULL, 'La Bảo Trân', 946115542, '2022-12-17 14:07:14', '2022-12-17 14:09:07', '0', 'sd', 'Out'),
(28, '6308240', 'Xe 2 bánh', 'SH', '68-A1 051.41', NULL, 'La Bảo Trân', 946115542, '2022-12-17 14:09:26', '2022-12-17 14:24:45', '0', 'a', 'Out'),
(29, '3442992', 'Xe 2 bánh', 'SH', '68-A1 05.2141', NULL, 'La Bảo Trân', 946115542, '2022-12-17 14:24:37', '2022-12-17 14:24:45', '0', 'a', 'Out'),
(30, '1593449', 'Xe 2 bánh', 'SH', '68-A1 051.41', NULL, 'La Trân', 84946115542, '2022-12-17 14:32:46', '2022-12-17 14:41:15', '0', 'null', 'null'),
(31, '7353475', 'Xe 4 bánh', 'Honda', '68-A1 05.2141', NULL, 'La Trân', 84946115542, '2022-12-17 14:46:12', '2022-12-17 14:46:36', '0', 'đã thanh toán', 'Out'),
(32, '9467986', 'Xe 4 bánh', 'Honda', '68-A1 05.2141', NULL, 'La Trân', 84946115542, '2022-12-17 14:52:54', '2022-12-17 15:00:27', '0', 'out', 'Out'),
(33, '6422775', 'Xe đạp', 'SH', 'LATRAN', NULL, 'La Trân', 84946115542, '2022-12-17 15:11:11', '2022-12-17 15:26:19', '2000', 'out ', 'Out'),
(34, '3926151', 'Xe 2 bánh', 'Honda', '68-A1 051.41', NULL, 'La Trân', 84946115542, '2022-12-17 15:58:44', '2022-12-17 16:36:22', '0', 'asdasd', 'Out'),
(35, '6746096', 'Xe 2 bánh', 'SH', '68 AA', NULL, 'La Trân', 84946115542, '2022-12-17 16:14:06', '2022-12-17 16:44:02', '0', 'out', 'Out'),
(36, '4516882', '0', 'SH', 'BC', NULL, 'La Trân', 84946115542, '2022-12-17 16:50:16', '2022-12-17 16:50:28', '0', 'out', 'Out'),
(37, '6500054', 'Xe đạp', 'asd', '43', NULL, 'La Trân', 84946115542, '2022-12-17 16:54:04', '2022-12-17 16:54:28', '0', 'hello', 'Out'),
(38, '4627922', 'Xe 4 bánh', 'a', 'cx', NULL, 'La Trân', 84946115542, '2022-12-17 16:56:37', '2022-12-17 16:56:49', '0', 'outds', 'Out'),
(39, '2382353', '0', 'sda', 'cxc', NULL, 'La Trân', 84946115542, '2022-12-17 17:00:09', '2022-12-17 17:00:26', '0', 'dgvdfgfd', 'Out'),
(40, '3322643', 'Xe 4 bánh', 'xc', 'vcsdf', NULL, 'La Trân', 84946115542, '2022-12-17 17:01:27', '2022-12-17 17:01:35', '0', 'cfhfg', 'Out'),
(41, '7783489', 'Moto', 'sds', 'vcvc', NULL, 'La Trân', 84946115542, '2022-12-17 17:03:45', '2022-12-18 16:02:17', '0', 'null', 'null'),
(42, '7857971', 'Truck', 'xc', 'vc', NULL, 'La Trân', 84946115542, '2022-12-17 17:19:59', '2022-12-18 16:02:33', '1000000', 'null', 'null'),
(43, '5690505', 'Bicycle', 'SH', '2912', NULL, 'La Trân', 84946115542, '2022-12-18 16:18:50', '2022-12-19 13:00:34', '10000', 'Đã thanh toán', 'Out'),
(44, '9299877', 'Motorbike', 'SH', '68-A1 051.41', NULL, 'Freya La', 946115542, '2022-12-19 15:11:05', '2022-12-19 15:38:55', '15000', 'Có xuất hóa đơn giấy', 'Out'),
(45, '8406732', 'Truck', 'Honda', '68-A1 05.2141', 'latran12', 'La Trân', 84946115542, '2022-12-22 17:12:54', '2022-12-23 07:49:55', '600000', 'nbcv', 'Out'),
(46, '1812945', 'Bicycle', 'SH', '68-A1 051.41', 'latran', 'La Trân', 84946115542, '2022-12-23 07:09:22', '2022-12-23 08:04:52', '2000', 'Da thanh toan', 'Out'),
(47, '1618511', 'Car', 'Honda', '68-A1 05.2141', 'latran', 'La Trân', 84946115542, '2022-12-23 07:20:23', '2022-12-23 07:49:47', '300000', 'nbtfd', 'Out'),
(48, '9198914', 'Motorbike', 'SH', '68-A1 05.2141', 'latran', 'La Trân', 84946115542, '2022-12-23 07:57:47', '2022-12-23 08:13:02', '15000', 'da thanh toan', 'Out'),
(49, '9431184', 'Bicycle', 'SH', 'Vang', 'latran', 'La Trân', 84946115542, '2022-12-23 08:19:41', '2022-12-23 08:28:06', '2000', 'Da thanh toan', 'Out'),
(50, '8163104', 'Motorbike', 'SH', '68-A1 012.54', NULL, 'Tran Quoc Dat', 934543032, '2022-12-23 08:27:04', NULL, NULL, NULL, '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblvehicle`
--
ALTER TABLE `tblvehicle`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `tblvehicle`
--
ALTER TABLE `tblvehicle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
