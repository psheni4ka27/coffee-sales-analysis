-- 1. Общая статистика
SELECT 
    COUNT(*) AS total_sales,
    ROUND(SUM(money), 2) AS total_revenue
FROM "index_1.csv";


-- 2. Продажи и выручка по каждому напитку
SELECT 
    coffee_name,
    COUNT(*) AS quantity,
    ROUND(SUM(money), 2) AS revenue
FROM "index_1.csv"
GROUP BY coffee_name
ORDER BY revenue DESC;


-- 3. Продажи по часам
SELECT 
    EXTRACT(HOUR FROM CAST(datetime AS TIMESTAMP)) AS hour,
    COUNT(*) AS quantity,
    ROUND(SUM(money), 2) AS revenue
FROM "index_1.csv"
GROUP BY hour
ORDER BY hour;


-- 4. Продажи по дням недели
SELECT 
    strftime('%w', CAST(datetime AS TIMESTAMP)) AS day_of_week,
    COUNT(*) AS quantity,
    ROUND(SUM(money), 2) AS revenue
FROM "index_1.csv"
GROUP BY day_of_week
ORDER BY day_of_week;


-- 5.1 Топ-5 напитков по выручке
SELECT 
    coffee_name,
    ROUND(SUM(money), 2) AS revenue
FROM "index_1.csv"
GROUP BY coffee_name
ORDER BY revenue DESC
LIMIT 5;


-- 5.2 Доля топ-5 напитков в общей выручке
SELECT 
    coffee_name,
    ROUND(SUM(money), 2) AS revenue,
    ROUND(SUM(money) * 100.0 / (SELECT SUM(money) FROM "index_1.csv"), 1) AS revenue_share
FROM "index_1.csv"
GROUP BY coffee_name
ORDER BY revenue DESC
LIMIT 5;