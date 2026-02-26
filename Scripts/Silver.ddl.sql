IF OBJECT_ID('Silver.cust_id_info','U') IS NOT NULL
	DROP TABLE silver.cust_id_info;
CREATE TABLE silver.cust_id_info(
customer_id INT ,
customer_key NVARCHAR(50),
customer_first_name NVARCHAR(50),
customer_last_name NVARCHAR(50),
customer_martial_status NVARCHAR(50),
gender NVARCHAR(50),
Create_date date,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO
IF OBJECT_ID ('silver.cust_prd_info','U') IS NOT NULL
	DROP TABLE silver.cust_prd_info;

CREATE TABLE silver.cust_prd_info(
prd_id INT ,
prd_key NVARCHAR(50),
prd_num NVARCHAR(50),
prd_cost NVARCHAR(50),
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.cust_sales_details','U') IS NOT NULL
	DROP TABLE silver.cust_sales_details;

CREATE TABLE silver.cust_sales_details(
sales_ord NVARCHAR(50) ,
sls_prd_key NVARCHAR(50),
sls_cust_id NVARCHAR(50),
sls_order_dt NVARCHAR(50),
sls_ship_dt NVARCHAR(50),
sls_due_dt NVARCHAR(50),
sls_sales NVARCHAR(50),
sls_quantity NVARCHAR(50),
sls_price NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.erp_cust_az12','U') IS NOT NULL
	DROP TABLE silver.erp_cust_az12;

CREATE TABLE silver.erp_cust_az12(
cid NVARCHAR(50),
bdate DATE,
gender NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.erp_loc_a101','U') IS NOT NULL
	DROP TABLE silver.erp_loc_a101;

CREATE TABLE silver.erp_loc_a101(
l_cid NVARCHAR(50),
cntry NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.erp_px_cat12','U') IS NOT NULL
	DROP TABLE silver.erp_px_cat12;

CREATE TABLE silver.erp_px_cat12(
id NVARCHAR(50),
cat NVARCHAR(50),	
subcat NVARCHAR(50),
maintenance NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);
