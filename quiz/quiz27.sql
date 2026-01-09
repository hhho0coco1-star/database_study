--테이블 생성시, product_quiz 테이블명으로 생성

CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

SELECT * FROM product_quiz;

SELECT
    FLOOR(price / 10000) * 10000 AS price_group,
--    COUNT(*) AS cnt
FROM product_quiz;

CREATE TABLE product_total
(
price_group VARCHAR(8) NOT NULL,
PRODUCTS NUMBER(3)
);

SELECT * FROM product_total
ORDER BY price_group;

INSERT INTO product_total(price_group) VALUES (0);
INSERT INTO product_total(price_group) VALUES (10000);
INSERT INTO product_total(price_group) VALUES (20000);
INSERT INTO product_total(price_group) VALUES (30000);

MERGE INTO product_total PT
USING (
    SELECT
        TO_CHAR(FLOOR(price / 10000) * 10000) AS price_group,
        COUNT(*) AS cnt
    FROM product_quiz
    GROUP BY FLOOR(price / 10000) * 10000    
) PQ
ON ( PT.price_group = PQ.price_group )
WHEN MATCHED THEN
    UPDATE SET PT.PRODUCTS = PT.PRODUCTS + PQ.cnt
WHEN NOT MATCHED THEN
    INSERT (price_group, products)
    VALUES (PQ.price_group, PQ.cnt);
    
TRUNCATE TABLE product_total; -- 테이블 데이터 삭제



-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 풀이 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@












