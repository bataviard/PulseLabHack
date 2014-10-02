-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2014 at 03:26 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pulselab`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `chatdate` datetime DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `lat` text NOT NULL,
  `lon` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE IF NOT EXISTS `list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RUAS_TOL_ID` text NOT NULL,
  `RUAS_TOL` text NOT NULL,
  `CONNECTED_NODE` text NOT NULL,
  `LENGTH` text NOT NULL,
  `DESC` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`ID`, `RUAS_TOL_ID`, `RUAS_TOL`, `CONNECTED_NODE`, `LENGTH`, `DESC`) VALUES
(1, 'JM1', 'DALAM_KOTA', 'CAWANG-TOMANG-CENGKARENG', '23.55', 'Tol dalam kota Bagian dari Ruas JIRR, Menghubungkan Cawang-Tomang-Cengkareng'),
(2, 'JM2', 'SEDYATMO', 'BANDARA-JIRR-JORR', '12', 'Menghubungkan Jakarta dengan Bandara Sukarno Hatta'),
(3, 'JM3', 'JAGORAWI', 'JAKARTA-BOGOR-CIAWI', '59', 'Menghubungkan Jakarta-Cibubur-Citeureup-Bogor-Ciawi'),
(4, 'JM4', 'CIKAMPEK', 'JAKARTA-JIRR-JORR-BEKASI-PURBALEUNYI', '83', 'Menghubungkan Jakarta-Bekasi-Bandung'),
(5, 'JM5', 'JANGER', 'JAKARTA-TANGERANG', '33', 'Menghubungkan Tol Dalam Kota-Tangerang Merak'),
(6, 'JM6', 'PURBALEUNYI', 'JAKARTA-PURWAKARTA-BANDUNG-PADELEUNYI', '123', 'Menghubungkan Jakarta-Bandung via Cipularang'),
(7, 'JM7', 'PALIKANCI', 'PALIMANAN-KANCI', '26.3', 'Menghubungkan Cikampek dan Pantura');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` text NOT NULL,
  `RUAS_TOL_ID` text NOT NULL,
  `GT_SEQUENCE` text NOT NULL,
  `GT_NAME` text NOT NULL,
  `KM` int(11) NOT NULL,
  `NEAREST` text NOT NULL,
  `RUAS` text NOT NULL,
  `LAT` text NOT NULL,
  `LON` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`ID`, `code`, `RUAS_TOL_ID`, `GT_SEQUENCE`, `GT_NAME`, `KM`, `NEAREST`, `RUAS`, `LAT`, `LON`) VALUES
(1, 'A1', 'JM1', '1', 'GT-CAWANG', 0, 'Cawang/Bandara Halim/ Kampung Melayu', 'JM3|JM4', '-6.243176', '106.859691'),
(2, 'A2', 'JM1', '2', 'GT-TEBET', 4, 'Tebet/ Manggarai/ Pasar Minggu', '', '-6.242728', '106.849695'),
(3, 'A3', 'JM1', '3', 'GT-KUNINGAN', 8, 'Mampang / Kuningan / Menteng', '', '-6.24069', '106.834493'),
(4, 'A4', 'JM1', '4', 'GT-SEMANGGI', 9, 'Semanggi/Senayan/ Kebayoran', '', '-6.223846', '106.815577'),
(5, 'A5', 'JM1', '5', 'GT-SENAYAN', 9, 'Bendungan Hilir / Senayan /  Kebayoran', '', '-6.2308136', '106.8202937'),
(6, 'A6', 'JM1', '6', 'GT-PEJOMPONGAN', 10, 'Slipi/ Palmerah/ Tanah Abang', '', '-6.204926', '106.801402'),
(7, 'A7', 'JM1', '7', 'GT-SLIPI', 11, 'Slipi/ Palmerah/ Tanah Abang', '', '-6.1996173', '106.7984833'),
(8, 'A8', 'JM1', '8', 'GT-TANJUNG DUREN', 14, 'Tomang / Grogol', '', '-6.16807565', '106.7881393'),
(9, 'A9', 'JM1', '9', 'GT-TOMANG', 16, 'Grogol/ Tomang/ Jalan Tol Jakarta/Tangerang', 'JM5', '-6.157999295', '106.7919622'),
(10, 'A10', 'JM1', '10', 'GT-ANGKE ', 18, 'Angke/ Pejagalan/ Glodok', '', '-6.142463669', '106.7879355'),
(11, 'A11', 'JM1', '11', 'GT-PLUIT', 20, 'Kapuk Muara/ Pantai Indah Kapuk/ Jalan Tol Prof. Dr. Sedyatmo', 'JM2', '-6.123665941', '106.7768064'),
(12, 'B1', 'JM2', '1', 'GT-PLUIT', 20, 'Jalan Tol Cawang/Pluit/ Jalan Tol Pelabuhan', 'JM1', '-6.123665941', '106.7768064'),
(13, 'B2', 'JM2', '2', 'GT-KAPUK', 22, 'Gerbang tol utama (arah JIRR)', '', '-6.121800232', '106.7685635'),
(14, 'B3', 'JM2', '3', 'GT- KAMAL', 26, 'Kamal/ Jalan Tol Lingkar Luar Jakarta', '', '-6.1171716', '106.7341089'),
(15, 'B4', 'JM2', '4', 'GT-CENGKARENG', 31, 'GT utama (arah Dadap/ Benda/ Rawa Bokor/ Bandara Internasional Soekarno/Hatta)', '', '-6.105671639', '106.6965151'),
(16, 'C1', 'JM3', '1', 'GT-CAWANG', 0, 'Tebet/ Semanggi/ Bandara Soekarno/Hatta/ Jatinegara/ Kelapa Gading/ Tanjung Priok/ Ancol', 'JM1', '-6.243176', '106.859691'),
(17, 'C2', 'JM3', '2', 'GT-PASAR REBO', 8, 'Jalan Tol Lingkar Luar Jakarta/ Jalan Tol Jakarta/Serpong/ Jalan Tol Jakarta/Cikampek', '', '-6.312137332', '106.8923757'),
(18, 'C3', 'JM3', '3', 'GT-CIBUBUR', 13, 'Cibubur/ Cileungsi/ Cikeas', '', '-6.365778166', '106.8949449'),
(19, 'C4', 'JM3', '4', 'GT-CIBUBUR UTAMA', 14, 'Gerbang awal arah Bogor/Ciawi', '', '-6.368912986', '106.8951648'),
(20, 'C5', 'JM3', '5', 'GT-CISALAK', 16, 'Cisalak, Depok, Margonda, Jalan Tol Cinere-Jagorawi', '', '-6.377595299', '106.8873733'),
(21, 'C6', 'JM3', '6', 'GT-CIMANGGIS', 19, 'Cimanggis, Cikeas', '', '-6.421084', '106.893721'),
(22, 'C7', 'JM3', '7', 'GT-CIMANGGIS UTAMA', 19, 'Gerbang akhir (arah Jakarta)', '', '-6.411836', '106.89788'),
(23, 'C8', 'JM3', '8', 'GT-GUNUNG PUTRI ', 24, 'Gunung Putri, Karanggan, Cikeas                         ', '', '-6.461339', '106.889183?'),
(24, 'C9', 'JM3', '9', 'GT-CITEUREUP ', 27, 'Citeureup, Cibinong                                     ', '', '-6.484186', '106.873656'),
(25, 'C10', 'JM3', '10', 'GT-SENTUL ', 34, 'IPSC, Sirkuit Sentul, Sentul, Nanggewer                 ', '', '-6.531939', '106.853051'),
(26, 'C11', 'JM3', '11', 'GT-SENTUL SELATAN', 37, 'Sentul City, Kedung Halang, Jalan Tol Lingkar Luar Bogor', '', '-6.562177', '106.845322'),
(27, 'C12', 'JM3', '12', 'GT-BOGOR', 42, 'Gerbang akhir (ke Bogor Kota, Kebun Raya)', '', '-6.597429', '106.817603'),
(28, 'C13', 'JM3', '13', 'GT-CIAWI', 44, 'Ciawi, Sukabumi, Gadog, Cisarua, Puncak, Taman Safari, Cianjur, Padalarang dan Bandung', '', '-6.631115', '106.839057'),
(29, 'D1', 'JM4', '1', 'GT-CAWANG', 0, 'Jatinegara, Tanjung Priok, Grogol, Kelapa Gading, Jalan Tol Lingkar Dalam Jakarta, Bandara Internasional Soekarno-Hatta, Pelabuhan Tanjung Priok', 'JM1', '-6.243176', '106.859691'),
(30, 'D2', 'JM4', '2', 'GT-HALIM', 1, 'Cawang, Cililitan, Halim PK, Jalan Tol Jagorawi, Bandar Udara Halim Perdanakusuma', 'JM3', '-6.245211782', '106.8890333'),
(31, 'D3', 'JM4', '3', 'GT-CIKUNIR', 10, 'Jalan Tol Lingkar Luar Jakarta', '', '-6.255712403', '106.9604436'),
(32, 'D4', 'JM4', '4', 'GT-BEKASI BARAT', 13, 'Bekasi Barat, Pekayon', '', '-6.251568182', '106.9865799'),
(33, 'D5', 'JM4', '5', 'GT-BEKASI TIMUR', 16, 'Bekasi Timur, Bulak Kapal, Bantar Gebang', '', '-6.261880376', '107.0175233'),
(34, 'D6', 'JM4', '6', 'GT-TAMBUN ', 21, 'Tambun, Mustika Jaya, Setu', '', '-6.278502155', '107.0509185'),
(35, 'D7', 'JM4', '7', 'GT-CIBITUNG ', 24, 'Cibitung, Kawasan Industri MM 2100', '', '-6.282411', '107.085092'),
(36, 'D8', 'JM4', '8', 'GT-CIKARANG UTAMA ', 29, 'Pintu gerbang utama Gerbang awal <arah Cikampek, Bandung> dan Gerbang akhir <arah Jakarta, Bogor>', '', '-6.303163072', '107.1205831'),
(37, 'D9', 'JM4', '9', 'GT-CIKARANG BARAT ', 31, 'Cikarang Barat, Lemahabang', '', '-6.311627086', '107.1377297'),
(38, 'D10', 'JM4', '10', 'GT-CIKARANG TIMUR ', 37, 'Cikarang Pusat, Pasirranji, Sukamahi', '', '-6.341823885', '107.1856293'),
(39, 'D11', 'JM4', '11', 'GT-KARAWANG BARAT', 47, 'Karawang Barat, Kawasan Industri KIIC, Rengasdengklok', '', '-6.345589121', '107.2709082'),
(40, 'D12', 'JM4', '12', 'GT-KARAWANG TIMUR', 54, 'Karawang Timur, Klari, Kawasan Industri Surya Cipta', '', '-6.356730207', '107.3359364'),
(41, 'D13', 'JM4', '13', 'GT-DAWUAN INTERCHANGE', 67, 'Jalan Tol Cipularang, Jalan Tol Purbaleunyi', 'JM6', '-6.426958437', '107.4415388'),
(42, 'D14', 'JM4', '14', 'GT-KALIHURIP', 68, 'Bukit Indah, Kawasan Industri KIKC, Indotaisei, Dawuan, Cikampek Barat', '', '-6.415982757', '107.4147674'),
(43, 'D15', 'JM4', '15', 'GT-CIKAMPEK', 73, 'Gerbang Akhir Arah Cikampek, Gerbang Awal Arah Jakarta', 'JM7', '-6.204432496', '106.8119699'),
(44, 'E1', 'JM5', '1', 'GT-TOMANG', 0, 'Dalam Kota ', 'JM1', '-6.181627553', '106.7935091'),
(45, 'E2', 'JM5', '2', 'GT-KEBON JERUK', 4, 'Kebon Jeruk, Kedoya', '', '-6.190059982', '106.7671523'),
(46, 'E3', 'JM5', '3', 'GT-MERUYA', 6, 'Kembangan, Meruya Ilir, Joglo', '', '-6.193737846', '106.7409572'),
(47, 'E4', 'JM5', '4', 'GT-MERUYA UTARA', 7, 'JORR', '', '-6.191471957', '106.7370006'),
(48, 'E5', 'JM5', '5', 'GT-TANGERANG', 19, 'Tangerang, Serpong', '', '-6.223070432', '106.6376352'),
(49, 'E6', 'JM5', '6', 'GT-KARAWACI BARAT', 20, 'Lippo Village, Legok, Binong', '', '-6.226824715', '106.6141605'),
(50, 'E7', 'JM5', '7', 'GT-KARAWACI TIMUR', 21, 'Lippo Village, Legok, Binong', '', '-6.223411732', '106.6216922'),
(51, 'E8', 'JM5', '8', 'GT-TANGERANG BARAT', 26, 'Bitung, Curung', '', '-6.222461506', '106.6356496'),
(52, 'F1', 'JM6', '1', 'GT-DAWUAN INTERCHANGE', 0, 'Purwakarta, Sadang, Subang', '', '-6.426958437', '107.4415388'),
(53, 'F2', 'JM6', '2', 'GT-SADANG', 1, 'Purwakarta, Sadang, Subang', 'JM4', '-6.506341101', '107.4495736'),
(54, 'F3', 'JM6', '3', 'GT-JATILUHUR', 8, 'Purwakarta, Jatiluhur, Ciganea', '', '-6.566139896', '107.431188'),
(55, 'F4', 'JM6', '4', 'GT-PADALARANG', 47, 'Padalarang, Kota Baru Parahyangan, Cikalongwetan, Cianjur, Sukabumi', '', '-6.85665627', '107.4946391'),
(56, 'F5', 'JM6', '5', 'GT-BAROS', 51, 'Baros, Cimahi, Leuwigajah', '', '-6.89712099', '107.5420654'),
(57, 'F6', 'JM6', '6', 'GT-PASTEUR', 51, 'Cimahi, Pasteur, Lembang, Bandung Kota', '', '-6.890810115', '107.5758719'),
(58, 'F7', 'JM6', '7', 'GT-PASIR KOJA', 58, ' Pasir Koja, Leuwi Panjang, Bandung Kota', '', '-6.931399991', '107.5727031'),
(59, 'F8', 'JM6', '8', 'GT-KOPO', 60, 'Kopo, Soreang, Ciwidey, Bandung Kota', '', '-6.956460398', '107.5811291'),
(60, 'F9', 'JM6', '9', 'GT-M TOHA', 62, 'Mohammad Toha, Banjaran, Pangalengan, Bandung Kota', '', '-6.956588197', '107.6096892'),
(61, 'F10', 'JM6', '10', 'GT-BUAH BATU', 65, '  Buah Batu, Dayeuhkolot, Ciparay, Majalaya, Bandung Kota', '', '-6.961827895', '107.6375628'),
(62, 'F11', 'JM6', '11', 'GT-CILEUNYI', 79, 'Gerbang akhir (ke Cileunyi, Jatinangor, Sumedang, Cirebon, Garut, Tasikmalaya, Ciamis, Banjar, Pangandaran, Purwokerto, Yogyakarta, Solo, Blitar, Kediri, Malang, Jember, Banyuwangi) (arah Cileunyi)\rGerbang awal (arah Bandung/Jakarta)', '', '-6.944196565', '107.7478249'),
(63, 'G1', 'JM7', '1', 'GT-PALIMANAN', 1, 'Jalan Tol Cikampek-Palimanan ', 'JM4', '-6.697598468', '108.4815359'),
(64, 'G2', 'JM7', '2', 'GT-PLUMBON', 5, 'Harjamukti, Cirebon', '', '-6.699126844', '108.4836429'),
(65, 'G3', 'JM7', '3', 'GT-CIPERNA', 8, 'Stasiun Cirebon', '', '-6.724070629', '108.5105683'),
(66, 'G4', 'JM7', '4', 'GT-KANCI', 14, 'Kanci', '', '-6.799625938', '108.6171913');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `LAT` text NOT NULL,
  `LONG` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`ID`, `USER_ID`, `LAT`, `LONG`) VALUES
(1, 1, '-6', '106'),
(2, 1, '-6', '106'),
(3, 1, '-6', '106'),
(4, 1, '-6', '106'),
(5, 1, '-6', '106'),
(6, 1, '-6', '106'),
(7, 1, '-6', '106'),
(8, 1, '-6', '106'),
(9, 1, '-6', '106'),
(10, 1, '-6', '106'),
(11, 1, '-6', '106'),
(12, 1, '-6', '106'),
(13, 1, '-6', '106'),
(14, 1, '-6', '106'),
(15, 1, '-6', '106'),
(16, 1, '-6', '106'),
(17, 1, '-6', '106'),
(18, 1, '-6', '106'),
(19, 1, '-6', '106'),
(20, 1, '-6', '106'),
(21, 1, '-6', '106'),
(22, 1, '-6', '106'),
(23, 1, '-6', '106'),
(24, 1, '-6', '106'),
(25, 1, '-6', '106'),
(26, 1, '-6', '106'),
(27, 1, '-6', '106'),
(28, 1, '-6', '106'),
(29, 1, '-6', '106'),
(30, 1, '-6', '106'),
(31, 1, '-6', '106'),
(32, 1, '-6', '106'),
(33, 1, '-6', '106'),
(34, 1, '-6', '106'),
(35, 1, '-6', '106'),
(36, 1, '-6', '106'),
(37, 1, '-6', '106'),
(38, 1, '-6', '106'),
(39, 1, '-6', '106'),
(40, 1, '-6', '106'),
(41, 1, '-6', '106'),
(42, 1, '-6', '106'),
(43, 1, '-6', '106'),
(44, 1, '-6', '106'),
(45, 1, '-6', '106'),
(46, 1, '-6', '106'),
(47, 1, '-6', '106'),
(48, 1, '-6', '106'),
(49, 1, '-6', '106'),
(50, 1, '-6', '106'),
(51, 1, '-6', '106'),
(52, 1, '-6', '106'),
(53, 1, '-6', '106'),
(54, 1, '-6', '106'),
(55, 1, '-6', '106'),
(56, 1, '-6', '106'),
(57, 1, '-6', '106'),
(58, 1, '-6', '106'),
(59, 1, '-6', '106'),
(60, 1, '-6', '106'),
(61, 1, '-6', '106'),
(62, 1, '-6', '106'),
(63, 1, '-6', '106'),
(64, 1, '-6', '106'),
(65, 1, '-6', '106'),
(66, 1, '-6', '106'),
(67, 1, '-6', '106'),
(68, 1, '-6', '106'),
(69, 1, '-6', '106'),
(70, 1, '-6', '106'),
(71, 1, '-6', '106'),
(72, 1, '-6', '106'),
(73, 1, '-6', '106'),
(74, 1, '-6', '106'),
(75, 1, '-6', '106'),
(76, 1, '-6', '106'),
(77, 1, '-6', '106'),
(78, 1, '-6', '106'),
(79, 1, '-6', '106'),
(80, 1, '-6', '106'),
(81, 1, '-6', '106'),
(82, 1, '-6', '106'),
(83, 1, '-6', '106'),
(84, 1, '-6', '106'),
(85, 1, '-6', '106');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
