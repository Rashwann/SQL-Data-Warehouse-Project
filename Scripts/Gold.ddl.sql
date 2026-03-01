CREATE VIEW gold.dim_customer as

SELECT 
	ROW_NUMBER() OVER(ORDER BY customer_id) AS customer_number,
	ci.customer_id AS customer_id,
	ci.customer_key AS customer_key,
	ci.customer_first_name AS first_name,
	ci.customer_last_name AS last_name,
	ci.customer_martial_status AS martial_status,
	CASE WHEN ci.gender != 'n/a' THEN ci.gender
	ELSE COALESCE(ca.gender,'n/a')
	END as gender,
	ci.Create_date AS Create_date,
	ca.bdate AS birth_date,
	cl.cntry AS country 
FROM Silver.cust_id_info as ci
LEFT JOIN Silver.erp_cust_az12 as ca
ON ci.customer_key = ca.cid
LEFT JOIN Silver.erp_loc_a101 as cl
ON ci.customer_key = cl.l_cid





CREATE VIEW gold.dim_product AS

SELECT 
	ROW_NUMBER() OVER(ORDER BY pn.prd_start_dt,pn.prd_key) AS product_no,
	pn.prd_id AS product_id,
	pn.prd_key AS product_key,
	pn.prd_line AS product_name,
	pn.cat_id AS category_id,
	pc.cat AS category,
	pc.subcat AS subcategory,
	pc.maintenance AS maintenance,
	pn.prd_num AS cost,
	pn.prd_cost AS product_line,
	pn.prd_start_dt AS start_date,
	pn.prd_end_dt AS end_date
FROM Silver.cust_prd_info as pn
LEFT JOIN Silver.erp_px_cat12 as pc
ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL









CREATE VIEW fact_sales AS

SELECT 
		sd.sales_ord,
		pr.product_key,
		cu.customer_key,
		sd.sls_prd_key,
		sd.sls_order_dt,
		sd.sls_ship_dt,
		sd.sls_due_dt,
		sd.sls_sales,
		sd.sls_quantity,
		sd.sls_price
FROM Silver.cust_sales_details as sd
LEFT JOIN Gold.dim_product AS pr
ON sd.sls_prd_key = pr.product_key
LEFT JOIN Gold.dim_customer as cu
ON sd.sls_cust_id = cu.customer_id
