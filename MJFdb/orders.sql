CREATE TABLE `order_table` (
  `num` int NOT NULL AUTO_INCREMENT,
  `order_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '수주번호',
  `order_date` date NOT NULL COMMENT '수주일자',
  `delivery_date` date NOT NULL COMMENT '납기일자',
  `account_code` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '거래처명',
  `product_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '품목코드',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '품목이름',
  `product_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '품목색상',
  `product_measure` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '품목단위',
  `product_quantity` int unsigned NOT NULL COMMENT '품목수량',
  `product_price` int NOT NULL COMMENT '단가',
  `supply_price` int NOT NULL COMMENT '공급가액',
  `vat` int NOT NULL COMMENT '부가세',
  `total_amount` int NOT NULL,
  `member_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '담당자명',
  `order_progress` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '진행상황',
  `order_note` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '비고',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

SET @TODAYS = DATE_FORMAT(NOW(), '%y%m%d-');
SELECT
	CONCAT(@TODAYS, LPAD(IFNULL(MAX(SUBSTR(SEQ, -6)), 1), 3, '0')) AS SEQ2
FROM (
	SELECT MAX(CAST(order_num AS SIGNED))+1 AS SEQ FROM order_table
	) AA
	WHERE AA.SEQ LIKE CONCAT(@TODAYS, '%');
	
SELECT * FROM order_table;

