-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2022 at 02:28 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cv_fadillah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_jual` decimal(10,0) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `harga_jual`, `stok_barang`) VALUES
('BR001', 'abcd', '10000', 100),
('BR002', 'qwe', '2000', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `NoFaktur` varchar(20) NOT NULL,
  `Tanggal` varchar(20) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `total_beli` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`NoFaktur`, `Tanggal`, `nama_pembeli`, `total_beli`) VALUES
('TR0001', '05-08-2022', 'awe', '12000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualanrinci`
--

CREATE TABLE `tb_penjualanrinci` (
  `NoFaktur` varchar(20) NOT NULL,
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_barang` decimal(10,0) NOT NULL,
  `total_harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penjualanrinci`
--

INSERT INTO `tb_penjualanrinci` (`NoFaktur`, `id_barang`, `nama_barang`, `jumlah_barang`, `harga_barang`, `total_harga`) VALUES
('CVF0001', 'BR001', 'abcd', 2, '1000', '2000'),
('TR0001', 'BR002', 'qwe', 6, '2000', '12000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`nama`, `username`, `password`, `level`) VALUES
('rifki', 'admin', 'admin', 'Admin'),
('rifki', 'admin1', 'MTIz', 'Admin'),
('markicob', 'user1', 'cXdlcnR5MTIz', 'User'),
('adri', 'user', 'MTIz', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `tb_userlevel`
--

CREATE TABLE `tb_userlevel` (
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_userlevel`
--

INSERT INTO `tb_userlevel` (`level`) VALUES
('Admin'),
('User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`NoFaktur`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD KEY `level` (`level`);

--
-- Indexes for table `tb_userlevel`
--
ALTER TABLE `tb_userlevel`
  ADD PRIMARY KEY (`level`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `tb_userlevel` (`level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
