-- Quiz16

SELECT * FROM panmae; -- p_code
SELECT * FROM product; -- p_code
SELECT * FROM gift;

SELECT 
    TO_CHAR(TO_DATE(pm.p_date), 'YYYY-MM-DD') 판매일자,
    pm.p_code 상품코드,
    pd.p_name 상품명,
    TO_CHAR(pd.p_price, '9,999,999') 상품가,
    pm.p_qty 구매수량,
    TO_CHAR(pm.p_total, '9,999,999') 총금액,
    TO_CHAR(pm.p_total * 100, '9,999,999') 적립포인트,
    -- DECODE OR CASE 
    TO_CHAR(
    CASE SUBSTR(pm.p_date, -4, 4)
        WHEN '0101' THEN pm.p_total * 200
        ELSE pm.p_total * 100 
    END, '9,999,999') 새해2배적립포인트,
    TO_CHAR(DECODE(SUBSTR(pm.p_date, 5, 4), '0101', pm.p_total * 200, pm.p_total * 100), '9,999,999') 새해2배적립포인트2,
    gf.gname 사은품명,
    gf.g_start 포인트START,
    gf.g_end 포인트END
FROM panmae pm 
    JOIN product pd ON pm.p_code = pd.p_code
    JOIN gift gf ON CASE WHEN SUBSTR(pm.p_date, 5, 4) = '0101' THEN pm.p_total * 200
         ELSE pm.p_total * 100 
    END BETWEEN gf.g_start AND gf.g_end
ORDER BY pm.p_date;