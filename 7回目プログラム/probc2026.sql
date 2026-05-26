-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2026-05-19 16:09:27
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `probc2026`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `ユーザ`
--

CREATE TABLE `ユーザ` (
  `ID` int(11) NOT NULL,
  `氏名` varchar(50) NOT NULL,
  `所属ID` int(11) DEFAULT NULL,
  `電話番号` varchar(20) NOT NULL,
  `メールアドレス` varchar(100) NOT NULL,
  `学籍番号` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `ユーザ`
--

INSERT INTO `ユーザ` (`ID`, `氏名`, `所属ID`, `電話番号`, `メールアドレス`, `学籍番号`) VALUES
(1, '文教太郎', 1, '000-0000-0000', 'c0p00000@bunkyo.ac.jp', 'c0p00000');

-- --------------------------------------------------------

--
-- テーブルの構造 `保管場所`
--

CREATE TABLE `保管場所` (
  `ID` int(11) NOT NULL,
  `保管場所名` varchar(50) NOT NULL,
  `詳細位置` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `保管場所`
--

INSERT INTO `保管場所` (`ID`, `保管場所名`, `詳細位置`) VALUES
(1, '教育支援課', '事務棟1階'),
(2, '', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `所属`
--

CREATE TABLE `所属` (
  `ID` int(11) NOT NULL,
  `所属名` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `所属`
--

INSERT INTO `所属` (`ID`, `所属名`) VALUES
(1, '学生'),
(2, '教員'),
(3, '事務員'),
(4, 'その他学校関係者'),
(5, '部外者');

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物`
--

CREATE TABLE `拾得物` (
  `ID` int(11) NOT NULL,
  `拾得物分類ID` int(11) DEFAULT NULL,
  `拾得場所` varchar(50) DEFAULT NULL,
  `色` varchar(20) NOT NULL,
  `特徴` varchar(200) DEFAULT NULL,
  `拾得日時` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `拾得物`
--

INSERT INTO `拾得物` (`ID`, `拾得物分類ID`, `拾得場所`, `色`, `特徴`, `拾得日時`) VALUES
(1, 4, '7201教室に財布', '黒', '中に現金あり', '2026-05-19 20:14:32'),
(2, 1, '食堂の券売機の中に小銭', '銀', '100円硬貨が2枚', '2026-05-14 00:00:00'),
(3, 20, '5201教室に傘', '青', '特になし', '2026-05-16 00:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物分類`
--

CREATE TABLE `拾得物分類` (
  `ID` int(11) NOT NULL,
  `分類名` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `拾得物分類`
--

INSERT INTO `拾得物分類` (`ID`, `分類名`) VALUES
(1, '現金'),
(2, 'かばん類'),
(3, '袋・封筒類'),
(4, '財布類'),
(5, 'カードケース類'),
(6, 'カメラ類'),
(7, '時計類'),
(8, 'めがね類'),
(9, '電気製品類'),
(10, '携帯電話類'),
(11, '貴金属類'),
(12, '趣味・娯楽用品類'),
(13, '証明書類'),
(14, '有価証券類'),
(15, '著作品類'),
(16, '手帳・文具類'),
(17, '書類・紙類'),
(18, '小包・箱類'),
(19, '衣類・履物類'),
(20, 'かさ類'),
(21, '鍵類'),
(22, '生活用品類'),
(23, '医療・化粧品類'),
(24, '食料品類'),
(25, '動植物類'),
(26, 'その他');

-- --------------------------------------------------------

--
-- テーブルの構造 `拾得物管理状況`
--

CREATE TABLE `拾得物管理状況` (
  `ID` int(11) NOT NULL,
  `ユーザID` int(11) DEFAULT NULL,
  `拾得物ID` int(11) DEFAULT NULL,
  `変更日時` datetime NOT NULL,
  `変更内容` varchar(100) NOT NULL,
  `実行者` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `拾得物管理状況`
--

INSERT INTO `拾得物管理状況` (`ID`, `ユーザID`, `拾得物ID`, `変更日時`, `変更内容`, `実行者`) VALUES
(1, 1, 1, '2026-05-19 16:02:57', '落とし主発見、本人確認後返却済み', '事務員');

-- --------------------------------------------------------

--
-- テーブルの構造 `本人確認`
--

CREATE TABLE `本人確認` (
  `ID` int(11) NOT NULL,
  `確認書類区分` varchar(50) NOT NULL,
  `確認日時` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `本人確認`
--

INSERT INTO `本人確認` (`ID`, `確認書類区分`, `確認日時`) VALUES
(1, '学生証', '2026-05-19 16:04:34');

-- --------------------------------------------------------

--
-- テーブルの構造 `遺失物捜索依頼`
--

CREATE TABLE `遺失物捜索依頼` (
  `ID` int(11) NOT NULL,
  `ユーザID` int(11) DEFAULT NULL,
  `遺失物分類ID` int(11) DEFAULT NULL,
  `遺失した場所` varchar(50) NOT NULL,
  `色` varchar(20) NOT NULL,
  `特徴` varchar(50) NOT NULL,
  `遺失日時` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `遺失物捜索依頼`
--

INSERT INTO `遺失物捜索依頼` (`ID`, `ユーザID`, `遺失物分類ID`, `遺失した場所`, `色`, `特徴`, `遺失日時`) VALUES
(1, 1, 4, '7201教室', '黒', '黒い財布。中が現金あり', '2026-05-18 16:06:14');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `ユーザ`
--
ALTER TABLE `ユーザ`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `所属ID` (`所属ID`);

--
-- テーブルのインデックス `保管場所`
--
ALTER TABLE `保管場所`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `所属`
--
ALTER TABLE `所属`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `拾得物`
--
ALTER TABLE `拾得物`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `拾得物分類ID` (`拾得物分類ID`);

--
-- テーブルのインデックス `拾得物分類`
--
ALTER TABLE `拾得物分類`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ユーザID` (`ユーザID`),
  ADD KEY `拾得物ID` (`拾得物ID`);

--
-- テーブルのインデックス `本人確認`
--
ALTER TABLE `本人確認`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ユーザID` (`ユーザID`),
  ADD KEY `遺失物分類ID` (`遺失物分類ID`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `ユーザ`
--
ALTER TABLE `ユーザ`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `保管場所`
--
ALTER TABLE `保管場所`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `所属`
--
ALTER TABLE `所属`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `拾得物`
--
ALTER TABLE `拾得物`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `拾得物分類`
--
ALTER TABLE `拾得物分類`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- テーブルの AUTO_INCREMENT `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `本人確認`
--
ALTER TABLE `本人確認`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `ユーザ`
--
ALTER TABLE `ユーザ`
  ADD CONSTRAINT `ユーザ_ibfk_1` FOREIGN KEY (`所属ID`) REFERENCES `所属` (`ID`);

--
-- テーブルの制約 `拾得物`
--
ALTER TABLE `拾得物`
  ADD CONSTRAINT `拾得物_ibfk_1` FOREIGN KEY (`拾得物分類ID`) REFERENCES `拾得物分類` (`ID`);

--
-- テーブルの制約 `拾得物管理状況`
--
ALTER TABLE `拾得物管理状況`
  ADD CONSTRAINT `拾得物管理状況_ibfk_1` FOREIGN KEY (`ユーザID`) REFERENCES `ユーザ` (`ID`),
  ADD CONSTRAINT `拾得物管理状況_ibfk_2` FOREIGN KEY (`拾得物ID`) REFERENCES `拾得物` (`ID`);

--
-- テーブルの制約 `遺失物捜索依頼`
--
ALTER TABLE `遺失物捜索依頼`
  ADD CONSTRAINT `遺失物捜索依頼_ibfk_1` FOREIGN KEY (`ユーザID`) REFERENCES `ユーザ` (`ID`),
  ADD CONSTRAINT `遺失物捜索依頼_ibfk_2` FOREIGN KEY (`遺失物分類ID`) REFERENCES `拾得物分類` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
