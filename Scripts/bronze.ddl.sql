/*
Layer:        Bronze
 Project:      SQL Data Warehouse - Medallion Architecture
 Platform:     Microsoft SQL Server
 Author:       Mohamed Rashwan

 Description:
 This script creates the Bronze layer tables for the Data Warehouse.

 The Bronze layer represents the raw ingestion layer of the Medallion
 Architecture. Tables in this layer store source data in its original
 structure with minimal or no transformation.
*/

IF OBJECT_ID ('bronze.cust_id_info','U') IS NOT NULL
	DROP TABLE bronze.cust_id_info;

CREATE TABLE bronze.cust_id_info(
customer_id INT ,
customer_key NVARCHAR(50),
customer_first_name NVARCHAR(50),
customer_last_name NVARCHAR(50),
customer_martial_status NVARCHAR(50),
gender NVARCHAR(50),
Create_date date
);

GO
IF OBJECT_ID ('bronze.cust_prd_info','U') IS NOT NULL
	DROP TABLE bronze.cust_prd_info;

CREATE TABLE bronze.cust_prd_info(
prd_id INT ,
prd_key NVARCHAR(50),
prd_num NVARCHAR(50),
prd_cost NVARCHAR(50),
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);

GO

IF OBJECT_ID ('bronze.cust_sales_details','U') IS NOT NULL
	DROP TABLE bronze.cust_sales_details;

CREATE TABLE bronze.cust_sales_details(
sales_ord NVARCHAR(50) ,
sls_prd_key NVARCHAR(50),
sls_cust_id NVARCHAR(50),
sls_order_dt NVARCHAR(50),
sls_ship_dt NVARCHAR(50),
sls_due_dt NVARCHAR(50),
sls_sales NVARCHAR(50),
sls_quantity NVARCHAR(50),
sls_price NVARCHAR(50)
);

GO

IF OBJECT_ID ('bronze.erp_cust_az12','U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12(
cid NVARCHAR(50),
bdate DATE,
gender NVARCHAR(50)
);

GO

IF OBJECT_ID ('bronze.erp_loc_a101','U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101(
l_cid NVARCHAR(50),
cntry NVARCHAR(50)
);

GO

IF OBJECT_ID ('bronze.erp_px_cat12','U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat12;

CREATE TABLE bronze.erp_px_cat12(
id NVARCHAR(50),
cat NVARCHAR(50),	
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);
