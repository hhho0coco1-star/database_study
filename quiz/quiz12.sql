-- Quiz

SELECT * FROM panmae;
SELECT * FROM product;
SELECT * FROM gift;

SELECT 
    TO_CHAR(TO_DATE(pa.p_date), 'YYYY-MM-DD') 판매일자,
    pa.p_code 상품코드,
    pr.p_name 상품명,
    pr.p_price 상품가,
    pa.p_qty 구매수량,
    TO_CHAR(pa.p_total, '9,999,999') 총금액,
    TO_CHAR(pa.p_total * 100, '9,999,999') 적립포인트,
    CASE
        WHEN TO_CHAR(TO_DATE(TO_CHAR(pa.p_date), 'YYYYMMDD'), 'MMDD') = '0101' 
        THEN TO_CHAR(pa.p_total * 200, '9,999,999')
        ELSE TO_CHAR(pa.p_total * 100, '9,999,999')
    END 새해2배적립포인트,
    gi.gname 사은품명,
    TO_CHAR(gi.g_start, '9,999,999') 포인트STRAT,
    TO_CHAR(gi.g_end, '9,999,999') 포인트END
FROM panmae pa, product pr, gift gi
WHERE pa.p_code = pr.p_code AND 
(CASE WHEN TO_CHAR(TO_DATE(TO_CHAR(pa.p_date), 'YYYYMMDD'), 'MMDD') = '0101'
THEN pa.p_total * 200 ELSE pa.p_total * 100 END) BETWEEN gi.g_start AND gi.g_end
ORDER BY 판매일자;

