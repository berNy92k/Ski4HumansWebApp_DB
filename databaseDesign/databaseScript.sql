USE [Ski4humansDatabase];
GO

CREATE TABLE [USERS] (
  [user_id] int IDENTITY(1,1) PRIMARY KEY,
  [email] varchar(64) NOT NULL,
  [password] varchar(16) NOT NULL,
  [full_name] varchar(30) NOT NULL
)

CREATE TABLE [CATEGORY] (
  [category_id] int IDENTITY(1,1) PRIMARY KEY,
  [name] varchar(30) NOT NULL
)

CREATE TABLE [MANUFACTURER] (
  [manufacturer_id] int IDENTITY(1,1) PRIMARY KEY,
  [manufacturer_name] varchar(30) NOT NULL,
  [description] varchar(2000) NOT NULL,
  [image] varbinary(max) NOT NULL
)

CREATE TABLE [EQUIPMENT] (
  [equipment_id] int IDENTITY(1,1) PRIMARY KEY,
  [name] varchar(128) NOT NULL UNIQUE,
  [short_description] varchar(1000) NOT NULL,
  [long_description] varchar(2000) NOT NULL,
  [sex] varchar(6) NOT NULL,
  [image] varbinary(max) NOT NULL,
  [price] float NOT NULL,
  [length_or_size] varchar(10) NOT NULL,
  [category_id] int NOT NULL FOREIGN KEY REFERENCES CATEGORY(category_id),
  [manufacturer_id] int NOT NULL FOREIGN KEY REFERENCES MANUFACTURER(manufacturer_id),
  [publish_date] datetime NOT NULL,
  [last_update_time] datetime NOT NULL
)

CREATE TABLE [CUSTOMER] (
  [customer_id] int IDENTITY(1,1) PRIMARY KEY,
  [email] varchar(64) NOT NULL UNIQUE,
  [password] varchar(16) NOT NULL,
  [first_name] varchar(30) NOT NULL,
  [last_name] varchar(30) NOT NULL,
  [street] varchar(128) NOT NULL,
  [home_number] varchar(30) NOT NULL,
  [city] varchar(32) NOT NULL,
  [zip_code] varchar(32) NOT NULL,
  [country] varchar(64) NOT NULL,
  [phone_number] varchar(15) NOT NULL,
  [register_date] datetime NOT NULL
)

CREATE TABLE [REVIEW] (
  [review_id] int IDENTITY(1,1) PRIMARY KEY,
  [rating] int NOT NULL,
  [headline] varchar(128) NOT NULL,
  [comment] varchar(500) NOT NULL,
  [review_time] datetime NOT NULL,
  [equipment_id] int NOT NULL FOREIGN KEY REFERENCES EQUIPMENT(equipment_id),
  [customer_id] int NOT NULL FOREIGN KEY REFERENCES CUSTOMER(customer_id)
)

CREATE TABLE [SHIPPING_ADDRESS] (
  [shipping_address_id] int IDENTITY(1,1) PRIMARY KEY,
  [email] varchar(256) NOT NULL,
  [first_name] varchar(256) NOT NULL,
  [last_name] varchar(256) NOT NULL,
  [street_name] varchar(256) NOT NULL,
  [house_or_apartment_number] varchar(15) NOT NULL,
  [city] varchar(256) NOT NULL,
  [zip_code] varchar(20) NOT NULL,
  [country] varchar(20) NOT NULL,
  [phone_number] varchar(20) NOT NULL
)

CREATE TABLE [ORDERS] (
  [order_id] int IDENTITY(1,1) PRIMARY KEY,
  [payment_method] varchar(256) NOT NULL,
  [total] float NOT NULL,
  [status] varchar(256) NOT NULL,
  [order_date] datetime NOT NULL,
  [customer_id] int NOT NULL FOREIGN KEY REFERENCES CUSTOMER(customer_id),
  [shipping_address_id] int NOT NULL FOREIGN KEY REFERENCES SHIPPING_ADDRESS(shipping_address_id)
)

CREATE TABLE [ORDER_EQUIPMENT_DETAIL] (
  [order_eq_detail_id] int IDENTITY(1,1) PRIMARY KEY,
  [quantity] int NOT NULL,
  [subtotal] float NOT NULL,
  [order_id] int NOT NULL FOREIGN KEY REFERENCES [ORDERS](order_id),
  [equipment_id] int NOT NULL FOREIGN KEY REFERENCES EQUIPMENT(equipment_id)
)


