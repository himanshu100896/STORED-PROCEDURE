CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FNL_HOP2`()
BEGIN
    DECLARE SOURCE1_TABLE VARCHAR(30);
    DECLARE TARGET1_TABLE VARCHAR(30);
    DECLARE SOURCE2_TABLE VARCHAR(30);
    DECLARE TARGET2_TABLE VARCHAR(30);
    DECLARE SOURCE3_TABLE VARCHAR(30);
    DECLARE TARGET3_TABLE VARCHAR(30);
	DECLARE SOURCE4_TABLE VARCHAR(30);
    DECLARE TARGET4_TABLE VARCHAR(30);
	DECLARE SOURCE5_TABLE VARCHAR(30);
    DECLARE TARGET5_TABLE VARCHAR(30);
	DECLARE SOURCE6_TABLE VARCHAR(30);
    DECLARE TARGET6_TABLE VARCHAR(30);
	DECLARE SOURCE7_TABLE VARCHAR(30);
    DECLARE TARGET7_TABLE VARCHAR(30);
	DECLARE SOURCE8_TABLE VARCHAR(30);
    DECLARE TARGET8_TABLE VARCHAR(30);
	DECLARE SOURCE9_TABLE VARCHAR(30);
    DECLARE TARGET9_TABLE VARCHAR(30);
	DECLARE SOURCE10_TABLE VARCHAR(30);
    DECLARE TARGET10_TABLE VARCHAR(30);
	DECLARE SOURCE11_TABLE VARCHAR(30);
    DECLARE TARGET11_TABLE VARCHAR(30);
	DECLARE SOURCE12_TABLE VARCHAR(30);
    DECLARE TARGET12_TABLE VARCHAR(30);
    DECLARE SOURCE13_TABLE VARCHAR(30);
    DECLARE TARGET13_TABLE VARCHAR(30);
    DECLARE SOURCE14_TABLE VARCHAR(30);
    DECLARE TARGET14_TABLE VARCHAR(30);
    DECLARE SOURCE15_TABLE VARCHAR(30);
    DECLARE TARGET15_TABLE VARCHAR(30);
	DECLARE SOURCE16_TABLE VARCHAR(30);
    DECLARE TARGET16_TABLE VARCHAR(30);
    DECLARE SOURCE1_COUNT INT;
    DECLARE TARGET1_COUNT INT;
	DECLARE SOURCE2_COUNT INT;
    DECLARE TARGET2_COUNT INT;
	DECLARE SOURCE3_COUNT INT;
    DECLARE TARGET3_COUNT INT;
    DECLARE SOURCE4_COUNT INT;
    DECLARE TARGET4_COUNT INT;
	DECLARE SOURCE5_COUNT INT;
    DECLARE TARGET5_COUNT INT;
	DECLARE SOURCE6_COUNT INT;
    DECLARE TARGET6_COUNT INT;
	DECLARE SOURCE7_COUNT INT;
    DECLARE TARGET7_COUNT INT;
	DECLARE SOURCE8_COUNT INT;
    DECLARE TARGET8_COUNT INT;
	DECLARE SOURCE9_COUNT INT;
    DECLARE TARGET9_COUNT INT;
	DECLARE SOURCE10_COUNT INT;
    DECLARE TARGET10_COUNT INT;
	DECLARE SOURCE11_COUNT INT;
    DECLARE TARGET11_COUNT INT;
	DECLARE SOURCE12_COUNT INT;
    DECLARE TARGET12_COUNT INT;
    DECLARE SOURCE13_COUNT INT;
    DECLARE TARGET13_COUNT INT;
    DECLARE SOURCE14_COUNT INT;
    DECLARE TARGET14_COUNT INT;
    DECLARE SOURCE15_COUNT INT;
    DECLARE TARGET15_COUNT INT;
    DECLARE SOURCE16_COUNT INT;
    DECLARE TARGET16_COUNT INT;

    DECLARE PROCESS_NAME VARCHAR(30);
    DECLARE OPERATION_TYPE VARCHAR(50);
    DECLARE LOG_DETAILS VARCHAR(50);


SELECT 'tbl_trans_actor_hop1' INTO SOURCE1_TABLE;
    SELECT 'tbl_fnl_actor' INTO TARGET1_TABLE;
    SET OPERATION_TYPE = 'CONCAT AND FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE1_COUNT FROM tbl_trans_actor_hop1;
  
   INSERT INTO tbl_fnl_actor 
   SELECT 
       actor_id
	  ,name
   FROM
       tbl_trans_actor_hop1;
       
       SELECT COUNT(*) INTO TARGET1_COUNT FROM tbl_fnl_actor;
    
    IF SOURCE1_COUNT <> TARGET1_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE1_TABLE,
        TARGET1_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());
	##################################################
    
	SELECT 'tbl_trans_address_hop1' INTO SOURCE2_TABLE;
    SELECT 'tbl_fnl_address' INTO TARGET2_TABLE;
    SET OPERATION_TYPE = 'REMOVING NULLS AND FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE2_COUNT FROM tbl_trans_address_hop1;
    
    INSERT INTO tbl_fnl_address
    SELECT address_id
       , address
       , district
       , city_id
       , IFNULL(postal_code, 'ZERO') AS modified_postal_code
       , IFNULL(phone, '0000000000') AS modified_phone
	FROM tbl_trans_address_hop1;
    
    SELECT COUNT(*) INTO TARGET2_COUNT FROM tbl_fnl_address;
    
        IF SOURCE2_COUNT <> TARGET2_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE2_TABLE,
        TARGET2_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());
   ############################################################     
        
	SELECT 'tbl_trans_category_hop1' INTO SOURCE3_TABLE;
    SELECT 'tbl_fnl_category' INTO TARGET3_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE3_COUNT FROM tbl_trans_category_hop1;
    
    INSERT INTO tbl_fnl_category
    SELECT category_id
       , name
	FROM tbl_trans_category_hop1;
    
    SELECT COUNT(*) INTO TARGET3_COUNT FROM tbl_fnl_category;
    
        IF SOURCE3_COUNT <> TARGET3_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE3_TABLE,
        TARGET3_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_city_hop1' INTO SOURCE4_TABLE;
    SELECT 'tbl_fnl_city' INTO TARGET4_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE4_COUNT FROM tbl_trans_city_hop1;
    
    INSERT INTO tbl_fnl_city
    SELECT city_id
       , city
       , country_id
	FROM tbl_trans_city_hop1;
    
    SELECT COUNT(*) INTO TARGET4_COUNT FROM tbl_fnl_city;
    
        IF SOURCE4_COUNT <> TARGET4_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE4_TABLE,
        TARGET4_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
	
    SELECT 'tbl_trans_country_hop1' INTO SOURCE5_TABLE;
    SELECT 'tbl_fnl_country' INTO TARGET5_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE5_COUNT FROM tbl_trans_country_hop1;
    
    INSERT INTO tbl_fnl_country
    SELECT city_id
       , city
       , country_id
	FROM tbl_trans_country_hop1;
    
    SELECT COUNT(*) INTO TARGET5_COUNT FROM tbl_fnl_country;
    
        IF SOURCE5_COUNT <> TARGET5_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE5_TABLE,
        TARGET5_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
	
	SELECT 'tbl_trans_customer_hop1' INTO SOURCE6_TABLE;
    SELECT 'tbl_fnl_customer' INTO TARGET6_TABLE;
	SET OPERATION_TYPE = 'CONCAT NAME AND FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE6_COUNT FROM tbl_trans_customer_hop1;
    
    INSERT INTO tbl_fnl_customer
    SELECT customer_id
       , store_id
       , CONCAT(first_name, ' ', last_name) AS name 
       , REPLACE(EMAIL, 'sakilacustomer.org', 'blueboxdvd.com') UPDATED_EMAIL
       , address_id
       , active
	FROM tbl_trans_customer_hop1;
    
    SELECT COUNT(*) INTO TARGET6_COUNT FROM tbl_fnl_customer;
    
        IF SOURCE6_COUNT <> TARGET6_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE6_TABLE,
        TARGET6_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_film_actor_hop1' INTO SOURCE7_TABLE;
    SELECT 'tbl_fnl_film_actor' INTO TARGET7_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE7_COUNT FROM tbl_trans_film_actor_hop1;
    
    INSERT INTO tbl_fnl_film_actor
    SELECT actor_id
       , film_id
	FROM tbl_trans_film_actor_hop1;
    
    SELECT COUNT(*) INTO TARGET7_COUNT FROM tbl_fnl_film_actor;
    
        IF SOURCE7_COUNT <> TARGET7_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE7_TABLE,
        TARGET7_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_film_hop1' INTO SOURCE8_TABLE;
    SELECT 'tbl_fnl_film' INTO TARGET8_TABLE;
    SET OPERATION_TYPE = 'REMOVE, UPDATE AND FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE8_COUNT FROM tbl_trans_film_hop1;
    
    INSERT INTO tbl_fnl_film
    SELECT film_id
       , title
       , description
       , release_year
       , language_id
       , rental_duration
       , rental_rate
       , length
       , replacement_cost
       , CASE WHEN rating= "G" THEN "General Audience"
				 WHEN rating= "PG" THEN "Parental Guidance"
                 WHEN rating= "PG-13" THEN "Parents Strongly Cautioned"
                 WHEN rating= "R" THEN "Restricted"
                 WHEN rating= "NC-17" THEN "Adults only"
			END AS rating
       ,special_features
	FROM tbl_trans_film_hop1;
    
    SELECT COUNT(*) INTO TARGET8_COUNT FROM tbl_fnl_film;
    
        IF SOURCE8_COUNT <> TARGET8_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE8_TABLE,
        TARGET8_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_film_category_hop1' INTO SOURCE9_TABLE;
    SELECT 'tbl_fnl_film_category' INTO TARGET9_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE9_COUNT FROM tbl_trans_film_category_hop1;
    
    INSERT INTO tbl_fnl_film_category
    SELECT film_id
       , category_id
	FROM tbl_trans_film_category_hop1;
    
    SELECT COUNT(*) INTO TARGET9_COUNT FROM tbl_fnl_film_category;
    
        IF SOURCE9_COUNT <> TARGET9_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE9_TABLE,
        TARGET9_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_inventory_hop1' INTO SOURCE10_TABLE;
    SELECT 'tbl_fnl_inventory' INTO TARGET10_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE10_COUNT FROM tbl_trans_inventory_hop1tbl_fnl_inventory;
    
    INSERT INTO tbl_fnl_inventory
    SELECT inventory_id
	   , film_id
       , store_id
	FROM tbl_trans_inventory_hop1;
    
    SELECT COUNT(*) INTO TARGET10_COUNT FROM tbl_fnl_inventory;
    
        IF SOURCE10_COUNT <> TARGET10_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE10_TABLE,
        TARGET10_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_payment_hop1' INTO SOURCE11_TABLE;
    SELECT 'tbl_fnl_payment' INTO TARGET11_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE11_COUNT FROM tbl_trans_payment_hop1;
    
    INSERT INTO tbl_fnl_payment
    SELECT payment_id
	   , customer_id
       , staff_id
       , rental_id
       , amount
       , payment_date
	FROM tbl_trans_payment_hop1;
    
    SELECT COUNT(*) INTO TARGET11_COUNT FROM tbl_fnl_payment;
    
        IF SOURCE11_COUNT <> TARGET11_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE11_TABLE,
        TARGET11_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
      
	SELECT 'tbl_trans_languages_hop1' INTO SOURCE12_TABLE;
    SELECT 'tbl_fnl_languages' INTO TARGET12_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE12_COUNT FROM tbl_trans_languages_hop1;
    
    INSERT INTO tbl_fnl_languages
    SELECT language_id
	   , name
	FROM tbl_trans_languages_hop1;
    
    SELECT COUNT(*) INTO TARGET12_COUNT FROM tbl_fnl_languages;
    
        IF SOURCE12_COUNT <> TARGET12_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE12_TABLE,
        TARGET12_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_rental_hop1' INTO SOURCE13_TABLE;
    SELECT 'tbl_fnl_rental' INTO TARGET13_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE13_COUNT FROM tbl_trans_rental_hop1;
    
    INSERT INTO tbl_fnl_rental
    SELECT rental_id
	   , rental_date
       , inventory_id
       , customer_id
	   , return_date
       , staff_id
	FROM tbl_trans_rental_hop1;
    
    SELECT COUNT(*) INTO TARGET13_COUNT FROM tbl_fnl_rental;
    
        IF SOURCE13_COUNT <> TARGET13_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE13_TABLE,
        TARGET13_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
 	SELECT 'tbl_trans_staff_hop1' INTO SOURCE14_TABLE;
    SELECT 'tbl_fnl_staff' INTO TARGET14_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE14_COUNT FROM tbl_trans_staff_hop1;
    
    INSERT INTO tbl_fnl_staff
    SELECT staff_id
	   , first_name
       , last_name
       , address_id
	   , email  
	   , store_id  
       , active
       , username
       , password
       , last_update
	FROM tbl_trans_staff_hop1;
    
    SELECT COUNT(*) INTO TARGET14_COUNT FROM tbl_fnl_staff;
    
        IF SOURCE14_COUNT <> TARGET14_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE14_TABLE,
        TARGET14_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	SELECT 'tbl_trans_store_hop1' INTO SOURCE15_TABLE;
    SELECT 'tbl_fnl_store' INTO TARGET15_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE15_COUNT FROM tbl_trans_store_hop1;
    
    INSERT INTO tbl_fnl_store
    SELECT store_id
	   , manager_staff_id
       , address_id
       , last_update
	FROM tbl_trans_store_hop1;
    
    SELECT COUNT(*) INTO TARGET15_COUNT FROM tbl_fnl_store;
    
        IF SOURCE15_COUNT <> TARGET15_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE15_TABLE,
        TARGET15_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
	
        SELECT 'tbl_stg_film_text' INTO SOURCE16_TABLE;
    SELECT 'tbl_fnl_film_text' INTO TARGET16_TABLE;
    SET OPERATION_TYPE = 'FINAL LOAD';
    SET PROCESS_NAME = 'SP_FNL_HOP2';
    
    SELECT COUNT(*) INTO SOURCE16_COUNT FROM tbl_stg_film_text;
    
    INSERT INTO tbl_fnl_film_text
    SELECT store_id
	   , manager_staff_id
       , address_id
       , last_update
	FROM tbl_stg_film_text;
    
    SELECT COUNT(*) INTO TARGET16_COUNT FROM tbl_fnl_film_text;
    
        IF SOURCE16_COUNT <> TARGET16_COUNT THEN
        SET LOG_DETAILS = 'MISMATCH, NEED TO CHECK THE FLOW';
    ELSE
        SET LOG_DETAILS = 'NO MISMATCH, DATA LOADED SUCCESSFULLY';
    END IF;
    
    INSERT INTO FILM_SYSTEM_AUDIT_CONTROL 
    (SOURCE_NAME,
    TARGET_NAME,
    PROCESS_NAME,
    OPERATION_TYPE,
    SOURCE_COUNT,
    TARGET_COUNT,
    LOG_DETAILS,
    OPERATED_BY,
	OPERATION_DATE)
    VALUES 
        (
        SOURCE16_TABLE,
        TARGET16_TABLE,
        PROCESS_NAME,
        OPERATION_TYPE,
        SOURCE1_COUNT,
        TARGET1_COUNT,
        LOG_DETAILS,
        CURRENT_USER(),
        CURRENT_TIMESTAMP());  
        #####################################################
        
        
        END