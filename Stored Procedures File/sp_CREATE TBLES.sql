CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_TABLES`()
BEGIN

DECLARE TABLE_COUNT INT;
DECLARE OPERATION_TYPE VARCHAR (50);
DECLARE LOG_DETAILS VARCHAR (50);
DECLARE PROCESS_NAME VARCHAR(30);
SET OPERATION_TYPE = "Creating Tables for layers";
SET PROCESS_NAME = 'SP_CREATE_TABLES';

/*HERE WE WILL CAPTURE ALL OPERATION AND DETAILS FOR AUDIT*/

CREATE TABLE FILM_SYSTEM_AUDIT_CONTROL
(
OP_ID INT PRIMARY KEY AUTO_INCREMENT,
SOURCE_NAME VARCHAR(30),
TARGET_NAME VARCHAR(30),
PROCESS_NAME VARCHAR(30),
OPERATION_TYPE VARCHAR(50),
SOURCE_COUNT INT,
TARGET_COUNT INT,
LOG_DETAILS VARCHAR(30),
OPERATED_BY VARCHAR(30),
OPERATION_DATE TIMESTAMP
);
#Create STG tables  

create table tbl_stg_actor
(
actor_id SMALLINT,
first_name  VARCHAR(45),
last_name  VARCHAR(45),
last_update DATE );


create table tbl_stg_address (
  address_id SMALLINT,
  address VARCHAR(50),
  address2 VARCHAR(50),
  district VARCHAR(20),
  city_id SMALLINT,
  postal_code VARCHAR(10),
  phone VARCHAR(20),
  last_update DATE); 


create table tbl_stg_category 
(  category_id TINYINT,
  name VARCHAR(25),
  last_update DATE);


create table tbl_stg_city
 (city_id SMALLINT,
  city VARCHAR(50),
  country_id VARCHAR(50),
  last_update DATE);
  
  
 create table tbl_stg_film_actor 
  ( actor_id SMALLINT,
  film_id SMALLINT,
  last_update DATE);

create table tbl_stg_customer 
( customer_id SMALLINT,
  store_id TINYINT,
  first_name VARCHAR(45),
  last_name VARCHAR(45),
  email VARCHAR(50),
  address_id SMALLINT,
  active BOOLEAN,
  create_date DATE,
  last_update DATE);
  
create table tbl_stg_film_category 
( film_id SMALLINT,
  category_id TINYINT,
  last_update DATE);
  
  create table tbl_stg_payment 
  (payment_id SMALLINT,
  customer_id SMALLINT,
  staff_id TINYINT,
  rental_id INT,
  amount DECIMAL(5, 2),
  payment_date DATE,
  last_update DATE);


create table tbl_stg_store 
( store_id TINYINT,
  manager_staff_id TINYINT,
  address_id SMALLINT,
  last_update DATE);


create table tbl_stg_inventory 
( inventory_id MEDIUMINT,
  film_id SMALLINT,
  store_id TINYINT,
  last_update DATE);

create table tbl_stg_film_text 
( film_id SMALLINT,
  title VARCHAR(255),
  description TEXT);

create table tbl_stg_rental 
( rental_id INT,
  rental_date DATE,
  inventory_id MEDIUMINT,
  customer_id SMALLINT,
  return_date DATE,
  staff_id TINYINT,
  last_update DATE);


create table tbl_stg_staff 
( staff_id TINYINT,
  first_name VARCHAR(45),
  last_name VARCHAR(45),
  address_id SMALLINT,
  email VARCHAR(50),
  store_id TINYINT,
  active BOOLEAN,
  username VARCHAR(16),
  password VARCHAR(40),
  last_update DATE);

create table tbl_stg_film 
( film_id SMALLINT,
  title VARCHAR(128),
  description TEXT,
  release_year YEAR,
  language_id TINYINT,
  original_language_id TINYINT,
  rental_duration TINYINT,
  rental_rate DECIMAL(4, 2),
  length SMALLINT,
  replacement_cost DECIMAL(5, 2),
  rating VARCHAR(5),
  special_features VARCHAR(20),
  last_update DATE);

create table tbl_stg_languages 
(language_id TINYINT,
  name CHAR(20),
  last_update DATE);

create table tbl_stg_country (
    country_id SMALLINT,
    country VARCHAR(50),
    last_update DATE);


#Create HOP 1 tables 
	
create table tbl_trans_actor_hop1
(actor_id SMALLINT,
name VARCHAR(100));


create table tbl_trans_address_hop1 
(address_id SMALLINT,
  address VARCHAR(50),
  district VARCHAR(20),
  city_id SMALLINT,
  postal_code VARCHAR(10),
  phone VARCHAR(20));


create table tbl_trans_customer_hop1
( customer_id SMALLINT,
  store_id TINYINT,
  name VARCHAR(100),
  email VARCHAR(50),
  address_id SMALLINT,
  active BOOLEAN);
  
create table tbl_trans_film_hop1
( film_id SMALLINT,
  title VARCHAR(128),
  description TEXT,
  release_year YEAR,
  language_id TINYINT,
  rental_duration TINYINT,
  rental_rate DECIMAL(4, 2),
  length SMALLINT,
  replacement_cost DECIMAL(5, 2),
  rating VARCHAR(45),
  special_features VARCHAR(20));


create table tbl_trans_category_hop1
(  category_id TINYINT,
  name VARCHAR(25));


create table tbl_trans_city_hop1
 (city_id SMALLINT,
  city VARCHAR(50),
  country_id VARCHAR(50));
  
  
 create table tbl_trans_film_actor_hop1 
  ( actor_id SMALLINT,
  film_id SMALLINT);

  
create table tbl_trans_film_category_hop1 
( film_id SMALLINT,
  category_id TINYINT);
  
  create table tbl_trans_payment_hop1 
  (payment_id SMALLINT,
  customer_id SMALLINT,
  staff_id TINYINT,
  rental_id INT,
  amount DECIMAL(5, 2),
  payment_date DATE);

create table tbl_trans_inventory_hop1 
( inventory_id MEDIUMINT,
  film_id SMALLINT,
  store_id TINYINT);

create table tbl_trans_film_text_hop1 
( film_id SMALLINT,
  title VARCHAR(255),
  description TEXT);

create table tbl_trans_rental_hop1 
( rental_id INT,
  rental_date DATE,
  inventory_id MEDIUMINT,
  customer_id SMALLINT,
  return_date DATE,
  staff_id TINYINT);


create table tbl_trans_staff_hop1 
( staff_id TINYINT,
  first_name VARCHAR(45),
  last_name VARCHAR(45),
  address_id SMALLINT,
  email VARCHAR(50),
  store_id TINYINT,
  active BOOLEAN,
  username VARCHAR(16),
  password VARCHAR(40));


create table tbl_trans_languages_hop1 
(language_id TINYINT,
  name CHAR(20));
  
  
create table tbl_trans_store_hop1 
(store_id TINYINT,
  manager_staff_id TINYINT,
  address_id SMALLINT);

create table tbl_trans_country_hop1 (
    country_id SMALLINT,
    country VARCHAR(50));
    
#Create Final tables 
  
  create table tbl_fnl_actor
(actor_id SMALLINT,
name VARCHAR(100));


create table tbl_fnl_address 
(address_id SMALLINT,
  address VARCHAR(50),
  district VARCHAR(20),
  city_id SMALLINT,
  postal_code VARCHAR(10),
  phone VARCHAR(20));


create table tbl_fnl_customer
( customer_id SMALLINT,
  store_id TINYINT,
  name VARCHAR(100),
  email VARCHAR(50),
  address_id SMALLINT,
  active BOOLEAN);
  
create table tbl_fnl_film
( film_id SMALLINT,
  title VARCHAR(128),
  description TEXT,
  release_year YEAR,
  language_id TINYINT,
  rental_duration TINYINT,
  rental_rate DECIMAL(4, 2),
  length SMALLINT,
  replacement_cost DECIMAL(5, 2),
  rating VARCHAR(45),
  special_features VARCHAR(20));


create table tbl_fnl_category
(  category_id TINYINT,
  name VARCHAR(25));


create table tbl_fnl_city
 (city_id SMALLINT,
  city VARCHAR(50),
  country_id VARCHAR(50));
  
  
 create table tbl_fnl_film_actor
  ( actor_id SMALLINT,
  film_id SMALLINT);

  
create table tbl_fnl_film_category 
( film_id SMALLINT,
  category_id TINYINT);
  
  create table tbl_fnl_payment
  (payment_id SMALLINT,
  customer_id SMALLINT,
  staff_id TINYINT,
  rental_id INT,
  amount DECIMAL(5, 2),
  payment_date DATE);

create table tbl_fnl_inventory 
( inventory_id MEDIUMINT,
  film_id SMALLINT,
  store_id TINYINT);

create table tbl_fnl_film_text 
( film_id SMALLINT,
  title VARCHAR(255),
  description TEXT);

create table tbl_fnl_rental 
( rental_id INT,
  rental_date DATE,
  inventory_id MEDIUMINT,
  customer_id SMALLINT,
  return_date DATE,
  staff_id TINYINT);


create table tbl_fnl_staff 
( staff_id TINYINT,
  first_name VARCHAR(45),
  last_name VARCHAR(45),
  address_id SMALLINT,
  email VARCHAR(50),
  store_id TINYINT,
  active BOOLEAN,
  username VARCHAR(16),
  password VARCHAR(40));


create table tbl_fnl_languages
(language_id TINYINT,
  name CHAR(20));
  
  
create table tbl_fnl_store 
(store_id TINYINT,
  manager_staff_id TINYINT,
  address_id SMALLINT);

create table tbl_fnl_country (
    country_id SMALLINT,
    country VARCHAR(50));

SELECT COUNT(*) INTO TABLE_COUNT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'storess';

IF TABLE_COUNT = 49 THEN
        SET LOG_DETAILS = 'ALL TABLES ARE CREATED ';
ELSE 
        SET LOG_DETAILS = 'MISMATCH IN NO. OF TABLES';
END IF; 

INSERT INTO FILM_SYSTEM_AUDIT_CONTROL
(
PROCESS_NAME,
OPERATION_TYPE,
LOG_DETAILS,
OPERATED_BY,
OPERATION_DATE
)
VALUES
(
PROCESS_NAME,
OPERATION_TYPE,
LOG_DETAILS,
current_user(),
current_timestamp()
);

END