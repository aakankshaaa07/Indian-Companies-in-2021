-- Arrange the data from earliest to latest
SELECT state, roc, category, class, company_type, activity_description, STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date
FROM startups21.`2021 registered companies`
ORDER BY date; 

-- Find the percentage of companies registered in Bangalore
SELECT *, COUNT(roc)/54890*100 AS Numbers 
FROM startups21.`2021 registered companies`
WHERE roc = 'RoC-Bangalore';
-- Total percentage = 7.68%

-- Display all companies that have authorized_capital = paidup_capital
SELECT state, roc, category, class, company_type, activity_description, STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date, authorized_capital, paidup_capital
FROM startups21.`2021 registered companies`
WHERE authorized_capital = paidup_capital;

-- Number of One Person Company
SELECT class, COUNT(class) AS Numbers 
FROM startups21.`2021 registered companies`
WHERE class = 'Private(One Person Company)';
-- 3277 one person companies

-- Find the percentage of Manufacturing businesses registered in Mumbai
SELECT activity_description, roc, COUNT(roc)/54890*100 AS Numbers 
FROM startups21.`2021 registered companies`
WHERE roc = 'RoC-Mumbai' AND activity_description LIKE '%Manufacturing%';
-- 2.64% of Manufacturing businesses registered in Mumbai

-- Break up of number of companies started month wise
SELECT state, roc, category, class, COUNT(company_type), activity_description, STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date
FROM startups21.`2021 registered companies`
WHERE  MONTH(STR_TO_DATE (date_of_registration, '%d-%m-%Y')) = 1;
-- Companies that started in January = 10924

SELECT state, roc, category, class, COUNT(company_type), activity_description, STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date
FROM startups21.`2021 registered companies`
WHERE  MONTH(STR_TO_DATE (date_of_registration, '%d-%m-%Y')) = 2;
-- Companies that started in February = 14091

SELECT state, roc, category, class, COUNT(company_type), activity_description, STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date
FROM startups21.`2021 registered companies`
WHERE  MONTH(STR_TO_DATE (date_of_registration, '%d-%m-%Y')) = 3;
-- Companies that started in March = 17321

SELECT state, roc, category, class, COUNT(company_type), activity_description, STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date
FROM startups21.`2021 registered companies`
WHERE  MONTH(STR_TO_DATE (date_of_registration, '%d-%m-%Y')) = 4;
-- Companies that started in April = 12554

-- Compare companies in Maharashtra, Delhi and Karnataka
SELECT *, COUNT(roc) AS Numbers 
FROM startups21.`2021 registered companies`
WHERE state = 'Maharashtra';
-- 7440 companies

SELECT *, COUNT(roc) AS Numbers 
FROM startups21.`2021 registered companies`
WHERE state = 'Delhi';
-- 4090 companies

SELECT *, COUNT(roc) AS Numbers 
FROM startups21.`2021 registered companies`
WHERE state = 'Karnataka';
-- 3156 companies

-- UID of the company with the max difference between authorized capital and paid up capital
SELECT *,
STR_TO_DATE (date_of_registration, '%d-%m-%Y') AS date, 
MAX(authorized_capital - paidup_capital) AS difference
FROM startups21.`2021 registered companies`
LIMIT 1;
-- b928b473-d6d6-4b92-a63d-d262bf30c24b
