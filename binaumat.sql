-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2020 at 03:32 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binaumat`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `username`, `password`, `nama`) VALUES
(4, 'binaumat@gmail.com', 'admin', '$2y$10$nJ.DUqx2FdoKwWncSzTi0e3bhK9sS95TlJqirSt/90fL3DzpdZ8Nq', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

CREATE TABLE `bobot` (
  `id_bobot` int(100) NOT NULL,
  `nama_bobot` varchar(100) NOT NULL,
  `bobot` float NOT NULL,
  `kode_pelajaran` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bobot`
--

INSERT INTO `bobot` (`id_bobot`, `nama_bobot`, `bobot`, `kode_pelajaran`) VALUES
(2, 'UTS', 0.15, 'ba'),
(4, 'UAS', 0.25, 'ba');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `agama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `gelar` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `username`, `password`, `nama`, `nip`, `tempat_lahir`, `tgl_lahir`, `alamat`, `agama`, `jenis_kelamin`, `gelar`, `phone`) VALUES
(3, 'guru', '$2y$10$1Sm2hhg/bTHKiDmyG42fSOjr2U7Y3N7EikuiwGSM3iy64WGGiRvbe', 'ASEP', '999344', 'BANDUNG', '2019-03-13', 'MAJALAYA', 'ISLAM', '', 'S2', '0348'),
(5, 'COBA', '$2y$10$unsIa.kQF.05.ONF35XaHutDdsW8XfrcnXQc788X6T3MuqyLUdgo.', 'UJUANG', '9898979797979778978Q', 'JAKARTA', '2019-07-05', 'KP.MENTENG', 'ISLAM', 'L', 'S3', '0897886786767');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'X'),
(2, 'XI'),
(3, 'XII');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` int(100) NOT NULL,
  `kode_pelajaran` varchar(100) NOT NULL,
  `id_bobot` int(25) NOT NULL,
  `nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `kode_pelajaran`, `id_bobot`, `nilai`) VALUES
(2, 6, 'ba', 0, 90),
(6, 6, 'ba', 4, 80);

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

CREATE TABLE `pelajaran` (
  `kode_pelajaran` varchar(50) NOT NULL,
  `pelajaran` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`kode_pelajaran`, `pelajaran`, `id_guru`, `id_kelas`) VALUES
('ba', 'MATEMATIKA', 1, 1),
('ipa09', 'IPA', 4, 2),
('ipa10', 'IPA', 4, 1),
('ka', 'PAI', 2, 1),
('ok', 'budaya', 5, 2),
('web', 'Pemrograman Web', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nisn` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `id_kelas` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nisn`, `nama`, `tempat_lahir`, `tgl_lahir`, `alamat`, `phone`, `id_kelas`) VALUES
(1, '98989', 'jkjkjkj', 'kjkjkj', '2019-04-12', 'asasas', '121212', 1),
(3, '989898', 'ilham', 'asas', '2019-04-26', 'jkjkjq', '8989898', 3),
(5, '90909', 'oklklklk', 'lklklk', '2019-05-03', 'lklklk', '8989898876655456576', 2),
(6, '121212', 'asep', 'asasas', '2019-04-17', 'jkjkj', '7878787', 1),
(7, '9098786765657', 'udin', 'kjkjkjk', '2019-05-03', 'kjkjkj', '98989898877645', 2),
(8, '878867678687', 'UTIT', 'BOGOR', '2019-07-18', 'KP.PANCA RT 03 RW 04 DESA NAGRAK KECAMATAN PACET', '0909898797979987', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bobot`
--
ALTER TABLE `bobot`
  ADD PRIMARY KEY (`id_bobot`),
  ADD KEY `kode_pelajaran` (`kode_pelajaran`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_pelajaran` (`kode_pelajaran`);

--
-- Indexes for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD PRIMARY KEY (`kode_pelajaran`),
  ADD UNIQUE KEY `kode_pelajaran` (`kode_pelajaran`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `nisn` (`nisn`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bobot`
--
ALTER TABLE `bobot`
  MODIFY `id_bobot` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
