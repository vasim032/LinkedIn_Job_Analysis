CREATE DATABASE WEB_SCRAPING_PROJECT;
USE WEB_SCRAPING_PROJECT;
SELECT * FROM [dbo].[Jobs(1)];
SELECT * FROM [dbo].[Company(2)];
SELECT * FROM [dbo].[Details(3)];

-- JOBS AT DISTINCT LOCATION
SELECT COUNT(DISTINCT LOCATION) FROM [dbo].[Jobs(1)];
SELECT DISTINCT LOCATION FROM [dbo].[Jobs(1)];

--JOB POSTED BY LOCATION
--IT IS NOT THE NO OF JOBS POSTED (AS VACANCIES NOT MENTIONED)
SELECT state, COUNT(COMPANY_ID) AS NUM_JOBS
FROM [dbo].[Jobs(1)]
GROUP BY state
HAVING STATE != 'NOT_SPECIFY' 
ORDER BY COUNT(COMPANY_ID) DESC;

SELECT LOCATION, COUNT(COMPANY_ID) AS NUM_JOBS
FROM [dbo].[Jobs(1)]
WHERE LOCATION LIKE '%KARNATAKA%'
GROUP BY LOCATION;

--level not specify
select count(level) 
from [dbo].[Details(3)] 
where level = 'not_specify'                                

--Generate some insight with respect to number of jobs distribution across various industry. 
--For instance, what is the total number of jobs in Software Industry as compared to Marketing

SELECT b.industry ,COUNT(a.JOB_ID) AS NUM_JOBS
FROM [dbo].[Jobs(1)] AS a
LEFT JOIN [dbo].[Company(2)] AS b
ON a.company_id = b.company_id
GROUP BY b.industry;

--Generate insights into number of opening with respect to the current employee count
--Number of opening in a company with more than 1000 employees in comparison to number of openings in a company with 100 employees

SELECT COUNT(a.JOB_ID) AS EMPLOYEE_LESS_101
FROM [dbo].[Jobs(1)] AS a
LEFT JOIN [dbo].[Company(2)] AS b
ON a.company_id = b.company_id
WHERE b.EMPLOYEES_COUNT_MAX < 101
UNION
SELECT COUNT(a.JOB_ID) AS EMPLOYEE_GREATET_999
FROM [dbo].[Jobs(1)] AS a
LEFT JOIN [dbo].[Company(2)] AS b
ON a.company_id = b.company_id
WHERE b.EMPLOYEES_COUNT_MAX >1000;

SELECT DISTINCT b.COMPANY_NAME, b.LINKEDIN_FOLLOWERS, b.EMPLOYEES_COUNT_MAX
FROM [dbo].[Jobs(1)] AS a
LEFT JOIN [dbo].[Company(2)] AS b
ON a.company_id = b.company_id
WHERE b.EMPLOYEES_COUNT_MAX < 101


SELECT DISTINCT b.COMPANY_NAME, b.LINKEDIN_FOLLOWERS, b.EMPLOYEES_COUNT_MAX
FROM [dbo].[Jobs(1)] AS a
LEFT JOIN [dbo].[Company(2)] AS b
ON a.company_id = b.company_id
WHERE b.EMPLOYEES_COUNT_MAX >999


/*Count the number of jobs across different industry across different locations. 
For instance, how many Frontend Engineer jobs are there in Bangalore as compared to Data Analytics jobs in Bangalore, 
or how many Data Analytics jobs are there in Bangalore as compared to number of Data Scientists job in Gurgaon - 
this needs to be done in SQL but presented in the above created Excel dashboard*/

select * from [dbo].[Jobs(1)];
select * from [dbo].[Company(2)];
select * from [dbo].[Details(3)];

SELECT *
FROM [dbo].[Jobs(1)]
WHERE CITY LIKE '%BENGALURU%' AND DESIGNATION LIKE '%DATA% ANAL%'
UNION
SELECT *
FROM [dbo].[Jobs(1)]
WHERE CITY LIKE '%GURUGRAM%' AND DESIGNATION LIKE '%DATA% SCI%';

