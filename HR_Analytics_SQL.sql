-- Create Database
CREATE DATABASE HR_Analytics;
USE HR_Analytics;

-- Create Employee Table
CREATE TABLE Employee_Data (
    EmployeeID INT PRIMARY KEY,
    Age INT,
    Attrition VARCHAR(20),
    BusinessTravel VARCHAR(50),
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    Gender VARCHAR(10),
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT
);

-- View Employee Data
SELECT * FROM Employee_Data;

-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM Employee_Data;

-- Attrition Count
SELECT COUNT(*) AS Attrition_Count
FROM Employee_Data
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT 
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*), 2
    ) AS Attrition_Rate
FROM Employee_Data;

-- Average Age
SELECT AVG(Age) AS Average_Age
FROM Employee_Data;

-- Average Salary
SELECT AVG(MonthlyIncome) AS Average_Salary
FROM Employee_Data;

-- Department-wise Attrition
SELECT Department,
       COUNT(*) AS Employee_Count,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM Employee_Data
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- Job Role-wise Attrition
SELECT JobRole,
       COUNT(*) AS Employee_Count,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM Employee_Data
GROUP BY JobRole
ORDER BY Attrition_Count DESC;

-- Gender Distribution
SELECT Gender,
       COUNT(*) AS Total_Employees
FROM Employee_Data
GROUP BY Gender;

-- Salary Slab Analysis
SELECT 
    CASE 
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Slab,
    COUNT(*) AS Employees
FROM Employee_Data
GROUP BY Salary_Slab;

-- Years at Company Analysis
SELECT YearsAtCompany,
       COUNT(*) AS Employees
FROM Employee_Data
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

-- Overtime Impact on Attrition
SELECT OverTime,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM Employee_Data
GROUP BY OverTime;