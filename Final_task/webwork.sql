-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2016 at 12:03 PM
-- Server version: 5.7.12-log
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `source` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`id`, `title`, `source`, `content`) VALUES
(1, '白血病', '百度百科', 'http://baike.baidu.com/link?url=E6xwDWyREC-BPNt3qPS0slHQvX640JBsILyIT0pqljzf-N4RSAdE8ih8oyUZ6f72'),
(2, '白血病', '维基百科', 'https://zh.wikipedia.org/wiki/%E7%99%BD%E8%A1%80%E7%97%85'),
(3, '白血病', '搜狗百科', 'http://baike.sogou.com/v64595.htm?fromTitle=%E7%99%BD%E8%A1%80%E7%97%85'),
(4, '白血病', '互动百科', 'http://www.baike.com/wiki/%E7%99%BD%E8%A1%80%E7%97%85&prd=so_1_doc'),
(5, '糖尿病', '百度百科', 'http://baike.baidu.com/view/923.htm'),
(6, '糖尿病', '搜狗百科', 'http://baike.sogou.com/v124453.htm?fromTitle=糖尿病'),
(7, '糖尿病', '360百科', 'http://baike.so.com/doc/5337691-5573130.html'),
(8, '糖尿病', '维基百科', 'https://zh.wikipedia.org/wiki/%E7%B3%96%E5%B0%BF%E7%97%85'),
(9, '高血压', '360百科', 'http://baike.so.com/doc/4754563-4970001.html?from=200861&sid=4970001&redirect=search'),
(10, '高血压', '互动百科', 'http://so.baike.com/doc/高血压病&prd=button_doc_search'),
(11, '高血压', '百度百科', 'http://baike.baidu.com/view/6632.htm?fromtitle=高血压病&fromid=3271&type=syn'),
(12, '高血压', '维基百科', 'https://zh.wikipedia.org/wiki/%E9%AB%98%E8%A1%80%E5%A3%93'),
(13, '头痛', '维基百科', 'https://zh.wikipedia.org/wiki/%E9%A0%AD%E7%97%9B'),
(14, '头痛', '百度百科', 'http://baike.baidu.com/view/2200848.htm'),
(15, '头痛', '互动百科', 'http://www.baike.com/wiki/头痛病&prd=so_1_doc'),
(16, '头痛', '搜狗百科', 'http://baike.sogou.com/v7701895.htm?fromTitle=头痛病'),
(17, '头痛', '360百科', 'http://baike.so.com/doc/6167806-6381037.html'),
(18, '哮喘', '维基百科', 'https://zh.wikipedia.org/wiki/%E5%93%AE%E5%96%98'),
(19, '哮喘', '百度百科', 'http://baike.baidu.com/view/24558.htm'),
(20, '哮喘', '互动百科', 'http://www.baike.com/wiki/哮喘&prd=so_1_doc'),
(21, '哮喘', '搜狗百科', 'http://baike.sogou.com/v181996.htm?fromTitle=哮喘'),
(22, '哮喘', '360百科', 'http://baike.so.com/doc/4585866-4797329.html?from=2867784&sid=4797329&redirect=search'),
(23, '甲亢', '维基百科', 'https://zh.wikipedia.org/wiki/%E7%94%B2%E7%8A%B6%E8%85%BA%E5%8A%9F%E8%83%BD%E4%BA%A2%E8%BF%9B%E7%97%87'),
(24, '甲亢', '百度百科', 'http://baike.baidu.com/view/61892.htm?fromtitle=甲状腺功能亢进&fromid=1122325&type=syn'),
(25, '甲亢', '互动百科', 'http://www.baike.com/wiki/甲状腺功能亢进&prd=so_1_doc'),
(26, '甲亢', '搜狗百科', 'http://baike.sogou.com/v145630319.htm?fromTitle=甲亢'),
(27, '甲亢', '360百科', 'http://baike.so.com/doc/5338936-5574377.html?from=179617&sid=5574377&redirect=search'),
(28, '冠心病', '维基百科', 'https://zh.wikipedia.org/wiki/%E5%86%A0%E7%8B%80%E5%8B%95%E8%84%88%E7%96%BE%E7%97%85'),
(29, '冠心病', '百度百科', 'http://baike.baidu.com/view/124840.htm?fromtitle=冠状动脉性心脏病&fromid=467330&type=syn'),
(30, '冠心病', '互动百科', 'http://www.baike.com/wiki/冠状动脉性心脏病&prd=so_1_doc'),
(31, '冠心病', '搜狗百科', 'http://baike.sogou.com/v64609.htm?fromTitle=冠状动脉性心脏病'),
(32, '冠心病', '360百科', 'http://baike.so.com/doc/2555618-2699135.html?from=124325&sid=2699135&redirect=search');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
