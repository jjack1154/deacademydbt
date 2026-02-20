/*
VERSION 1:
READ EMPLOYEE RAW DATA FROM SNOWFLAKE
*/

{{ config(materialized='table') }}

with employee as (
    SELECT 
        EMPID AS emp_id,
        SPLIT_PART(NAME,' ',1) AS emp_firstname,
        SPLIT_PART(NAME,' ',2) AS emp_lastname,
        SALARY as emp_salary,
        HIREDATE emp_hiredate,
        SPLIT_PART(ADDRESS,',',1) AS emp_street,
        SPLIT_PART(ADDRESS,',',2) AS emp_city,
        SPLIT_PART(ADDRESS,',',3) AS emp_country,
        SPLIT_PART(ADDRESS,',',4) AS emp_zipcode
    FROM {{source('employee', 'EMPLOYEE_RAW')}}

)
SELECT * FROM employee