CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRANS_HOP1`()
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

    DECLARE PROCESS_NAME VARCHAR(30);
    DECLARE OPERATION_TYPE VARCHAR(50);
    DECLARE LOG_DETAILS VARCHAR(50);


SELECT 'tbl_stg_actor' INTO SOURCE1_TABLE;
    SELECT 'tbl_trans_actor_hop1' INTO TARGET1_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE1_COUNT FROM tbl_stg_actor;
  
   INSERT INTO tbl_trans_actor_hop1 
   SELECT 
       actor_id
	  ,CONCAT(first_name, ' ', last_name) AS full_name
   FROM
       tbl_stg_actor;
       
       SELECT COUNT(*) INTO TARGET1_COUNT FROM tbl_trans_actor_hop1;
    
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
    
	SELECT 'tbl_stg_address' INTO SOURCE2_TABLE;
    SELECT 'tbl_trans_address_hop1' INTO TARGET2_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE2_COUNT FROM tbl_stg_address;
    
    INSERT INTO tbl_trans_address_hop1
    SELECT address_id
       , address
       , address2
       , district
       , city_id
       , postal_code
       , phone
	FROM tbl_stg_address;
    
    SELECT COUNT(*) INTO TARGET2_COUNT FROM tbl_trans_actor_hop1;
    
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
        
	SELECT 'tbl_stg_category' INTO SOURCE3_TABLE;
    SELECT 'tbl_trans_category_hop1' INTO TARGET3_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE3_COUNT FROM tbl_stg_category;
    
    INSERT INTO tbl_trans_category_hop1
    SELECT category_id
       , name
	FROM tbl_stg_category;
    
    SELECT COUNT(*) INTO TARGET3_COUNT FROM tbl_trans_category_hop1;
    
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
        
	SELECT 'tbl_stg_city' INTO SOURCE4_TABLE;
    SELECT 'tbl_trans_city_hop1' INTO TARGET4_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE4_COUNT FROM tbl_stg_category;
    
    INSERT INTO tbl_trans_city_hop1
    SELECT city_id
       , city
       , country_id
	FROM tbl_stg_city;
    
    SELECT COUNT(*) INTO TARGET4_COUNT FROM tbl_trans_city_hop1;
    
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
	
    SELECT 'tbl_stg_country' INTO SOURCE5_TABLE;
    SELECT 'tbl_trans_country_hop1' INTO TARGET5_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE5_COUNT FROM tbl_stg_country;
    
    INSERT INTO tbl_trans_country_hop1
    SELECT city_id
       , city
       , country_id
	FROM tbl_stg_country;
    
    SELECT COUNT(*) INTO TARGET5_COUNT FROM tbl_trans_country_hop1;
    
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
	
	SELECT 'tbl_stg_customer' INTO SOURCE6_TABLE;
    SELECT 'tbl_trans_customer_hop1' INTO TARGET6_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE6_COUNT FROM tbl_stg_customer;
    
    INSERT INTO tbl_trans_customer_hop1
    SELECT customer_id
       , store_id
       , name
       , email
       , address_id
       , active
	FROM tbl_stg_customer;
    
    SELECT COUNT(*) INTO TARGET6_COUNT FROM tbl_trans_customer_hop1;
    
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
        
	SELECT 'tbl_stg_film_actor' INTO SOURCE7_TABLE;
    SELECT 'tbl_trans_film_actor_hop1' INTO TARGET7_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE7_COUNT FROM tbl_stg_film_actor;
    
    INSERT INTO tbl_trans_film_actor_hop1
    SELECT actor_id
       , film_id
	FROM tbl_stg_film_actor;
    
    SELECT COUNT(*) INTO TARGET7_COUNT FROM tbl_trans_film_actor_hop1;
    
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
        
	SELECT 'tbl_stg_film' INTO SOURCE8_TABLE;
    SELECT 'tbl_trans_film_hop1' INTO TARGET8_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE8_COUNT FROM tbl_stg_film;
    
    INSERT INTO tbl_trans_film_hop1
    SELECT film_id
       , title
       , description
       , release_year
       , language_id
       , rental_duration
       , rental_rate
       , length
       , replacement_cost
       , rating
       ,special_features
	FROM tbl_stg_film;
    
    SELECT COUNT(*) INTO TARGET8_COUNT FROM tbl_trans_film_hop1;
    
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
        
	SELECT 'tbl_stg_film_category' INTO SOURCE9_TABLE;
    SELECT 'tbl_trans_film_category_hop1' INTO TARGET9_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE9_COUNT FROM tbl_stg_film_category;
    
    INSERT INTO tbl_trans_film_category_hop1
    SELECT film_id
       , category_id
	FROM tbl_stg_film_category;
    
    SELECT COUNT(*) INTO TARGET9_COUNT FROM tbl_trans_film_category_hop1;
    
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
        
	SELECT 'tbl_stg_inventory' INTO SOURCE10_TABLE;
    SELECT 'tbl_trans_inventory_hop1' INTO TARGET10_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE10_COUNT FROM tbl_stg_inventory;
    
    INSERT INTO tbl_trans_inventory_hop1
    SELECT inventory_id
	   , film_id
       , store_id
	FROM tbl_stg_inventory;
    
    SELECT COUNT(*) INTO TARGET10_COUNT FROM tbl_trans_inventory_hop1;
    
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
        
	SELECT 'tbl_stg_payment' INTO SOURCE11_TABLE;
    SELECT 'tbl_trans_payment_hop1' INTO TARGET11_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE11_COUNT FROM tbl_stg_payment;
    
    INSERT INTO tbl_trans_payment_hop1
    SELECT payment_id
	   , customer_id
       , staff_id
       , rental_id
       , amount
       , payment_date
	FROM tbl_stg_payment;
    
    SELECT COUNT(*) INTO TARGET11_COUNT FROM tbl_trans_payment_hop1;
    
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
      
	SELECT 'tbl_stg_languages' INTO SOURCE12_TABLE;
    SELECT 'tbl_trans_languages_hop1' INTO TARGET12_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE12_COUNT FROM tbl_stg_languages;
    
    INSERT INTO tbl_trans_languages_hop1
    SELECT language_id
	   , name
	FROM tbl_stg_languages;
    
    SELECT COUNT(*) INTO TARGET12_COUNT FROM tbl_trans_languages_hop1;
    
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
        
	SELECT 'tbl_stg_rental' INTO SOURCE13_TABLE;
    SELECT 'tbl_trans_rental_hop1' INTO TARGET13_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE13_COUNT FROM tbl_stg_rental;
    
    INSERT INTO tbl_trans_rental_hop1
    SELECT rental_id
	   , rental_date
       , inventory_id
       , customer_id
	   , return_date
       , staff_id
	FROM tbl_stg_rental;
    
    SELECT COUNT(*) INTO TARGET13_COUNT FROM tbl_trans_rental_hop1;
    
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
        
	SELECT 'tbl_stg_rental' INTO SOURCE13_TABLE;
    SELECT 'tbl_trans_rental_hop1' INTO TARGET13_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE13_COUNT FROM tbl_stg_rental;
    
    INSERT INTO tbl_trans_rental_hop1
    SELECT rental_id
	   , rental_date
       , inventory_id
       , customer_id
	   , return_date
       , staff_id
	FROM tbl_stg_rental;
    
    SELECT COUNT(*) INTO TARGET13_COUNT FROM tbl_trans_rental_hop1;
    
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
        
        
	SELECT 'tbl_stg_rental' INTO SOURCE13_TABLE;
    SELECT 'tbl_trans_rental_hop1' INTO TARGET13_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE13_COUNT FROM tbl_stg_rental;
    
    INSERT INTO tbl_trans_rental_hop1
    SELECT rental_id
	   , rental_date
       , inventory_id
       , customer_id
	   , return_date
       , staff_id
	FROM tbl_stg_rental;
    
    SELECT COUNT(*) INTO TARGET13_COUNT FROM tbl_trans_rental_hop1;
    
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
        
 	SELECT 'tbl_stg_staff' INTO SOURCE14_TABLE;
    SELECT 'tbl_trans_staff_hop1' INTO TARGET14_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE14_COUNT FROM tbl_stg_staff;
    
    INSERT INTO tbl_trans_staff_hop1
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
	FROM tbl_stg_staff;
    
    SELECT COUNT(*) INTO TARGET14_COUNT FROM tbl_trans_staff_hop1;
    
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
        
	SELECT 'tbl_stg_store' INTO SOURCE15_TABLE;
    SELECT 'tbl_trans_store_hop1' INTO TARGET15_TABLE;
    SET OPERATION_TYPE = 'REMOVING LAST_UPDATE COLUMN FROM EACH TABLE';
    SET PROCESS_NAME = 'SP_TRANS_HOP1';
    
    SELECT COUNT(*) INTO SOURCE15_COUNT FROM tbl_stg_store;
    
    INSERT INTO tbl_trans_store_hop1
    SELECT store_id
	   , manager_staff_id
       , address_id
       , last_update
	FROM tbl_stg_store;
    
    SELECT COUNT(*) INTO TARGET15_COUNT FROM tbl_trans_store_hop1;
    
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
        
        END