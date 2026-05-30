-- =====================================================
-- HR Analytics + Attrition Intelligence SQL Analysis
-- =====================================================


-- Create Database

CREATE DATABASE hr_analytics_db;

USE hr_analytics_db;


-- Import Dataset Using:
-- Server → Table Data Import Wizard
-- File: hr_cleaned_data.csv
-- Table Name: employee_attrition


-- Verify Table Structure

DESCRIBE employee_attrition;


-- View Complete Dataset

SELECT *
FROM employee_attrition;


-- Total Employees

SELECT COUNT(*) AS total_employees
FROM employee_attrition;


-- Attrition Distribution

SELECT Attrition,
       COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Attrition;


-- Department-wise Employee Count

SELECT Department,
       COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Department
ORDER BY employee_count DESC;


-- Job Role Distribution

SELECT JobRole,
       COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY JobRole
ORDER BY employee_count DESC;


-- Average Monthly Income by Department

SELECT Department,
       ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM employee_attrition
GROUP BY Department
ORDER BY avg_monthly_income DESC;


-- Attrition by Department

SELECT Department,
       Attrition,
       COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Department, Attrition
ORDER BY Department;


-- Attrition by Gender

SELECT Gender,
       Attrition,
       COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Gender, Attrition;


-- Top 10 Highest Paid Employees

SELECT EmployeeNumber,
       JobRole,
       MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;


-- Employees Working Overtime

SELECT OverTime,
       COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY OverTime;


-- Average Age by Department

SELECT Department,
       ROUND(AVG(Age), 2) AS average_age
FROM employee_attrition
GROUP BY Department;


-- Rank Employees by Monthly Income

SELECT EmployeeNumber,
       Department,
       MonthlyIncome,
       RANK() OVER(ORDER BY MonthlyIncome DESC) AS income_rank
FROM employee_attrition;


-- Row Number by Department

SELECT EmployeeNumber,
       Department,
       MonthlyIncome,
       ROW_NUMBER() OVER(PARTITION BY Department ORDER BY MonthlyIncome DESC) AS row_num
FROM employee_attrition;


-- Attrition Percentage

SELECT Attrition,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_attrition), 2) AS attrition_percentage
FROM employee_attrition
GROUP BY Attrition;


-- Employees with More Than 5 Years at Company

SELECT EmployeeNumber,
       JobRole,
       YearsAtCompany
FROM employee_attrition
WHERE YearsAtCompany > 5
ORDER BY YearsAtCompany DESC;


-- Department-wise Average Job Satisfaction

SELECT Department,
       ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction
FROM employee_attrition
GROUP BY Department
ORDER BY avg_job_satisfaction DESC;