-- Kasi Mart Data Engineering Project 1
-- Snowflake setup and table creation

-- Database and schema were created in Snowflake
-- using Catalog -> Databases -> Create
-- and Schema -> Create.

USE DATABASE DE_PROJECT1;
USE SCHEMA KASI_MART;

-- Customers dimension table
CREATE TABLE CUSTOMERS (
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    email VARCHAR(255),
    province VARCHAR(50),
    signup_date DATE
);
