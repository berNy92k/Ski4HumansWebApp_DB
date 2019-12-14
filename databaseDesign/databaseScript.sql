USE [Ski4humansDatabase];
GO

CREATE TABLE [USERS] (
  [user_id] int IDENTITY(1,1) PRIMARY KEY,
  [email] varchar(64) NOT NULL,
  [password] varchar(16) NOT NULL,
  [full_name] varchar(30) NOT NULL,
)

CREATE TABLE [CATEGORY] (
  [category_id] int IDENTITY(1,1) PRIMARY KEY,
  [name] varchar(30) NOT NULL,
)

CREATE TABLE [MANUFACTURER] (
  [manufacturer_id] int IDENTITY(1,1) PRIMARY KEY,
  [manufacturer_name] varchar(30) NOT NULL,
  [description] varchar(2000) NOT NULL
)

CREATE TABLE [EQUIPMENT] (
  [equipment_id] int IDENTITY(1,1) PRIMARY KEY,
  [name] varchar(128) NOT NULL UNIQUE,
  [manufacturer_id] int NOT NULL FOREIGN KEY REFERENCES MANUFACTURER(manufacturer_id),
  [short_description] varchar(1000) NOT NULL,
  [long_description] varchar(2000) NOT NULL,
  [sex] varchar(6) NOT NULL,
  [image] varbinary(max) NOT NULL,
  [price] float NOT NULL,
  [length_or_size] varchar(10) NOT NULL,
  [category_id] int NOT NULL FOREIGN KEY REFERENCES CATEGORY(category_id),
)

CREATE TABLE [CUSTOMER] (
  [customer_id] int IDENTITY(1,1) PRIMARY KEY,
  [email] varchar(64) NOT NULL UNIQUE,
  [fullname] varchar(30) NOT NULL,
  [address] varchar(128) NOT NULL,
  [city] varchar(32) NOT NULL,
  [country] varchar(64) NOT NULL,
  [phone_number] varchar(15) NOT NULL,
  [zipCode] varchar(24) NOT NULL,
  [password] varchar(16) NOT NULL,
  [register_date] datetime NOT NULL
)

CREATE TABLE [REVIEW] (
  [review_id] int IDENTITY(1,1) PRIMARY KEY,
  [equipment_id] int NOT NULL FOREIGN KEY REFERENCES EQUIPMENT(equipment_id),
  [customer_id] int NOT NULL FOREIGN KEY REFERENCES CUSTOMER(customer_id),
  [rating] int NOT NULL,
  [headline] varchar(128) NOT NULL,
  [comment] varchar(500) NOT NULL,
  [review_time] datetime NOT NULL,
)

CREATE TABLE [EQUIPMENT_ORDER] (
  [order_id] int IDENTITY(1,1) PRIMARY KEY,
  [equipment_id] int NOT NULL FOREIGN KEY REFERENCES EQUIPMENT(equipment_id),
  [order_date] datetime NOT NULL,
  [shipping_address] varchar(256) NOT NULL,
  [recipient_name] varchar(30) NOT NULL,
  [recipient_phone] varchar(15) NOT NULL,
  [payment_method] varchar(20) NOT NULL,
  [order_total] float NOT NULL,
  [order_status] varchar(20) NOT NULL,
)

CREATE TABLE [ORDER_DETAIL] (
  [order_id] int NOT NULL FOREIGN KEY REFERENCES EQUIPMENT_ORDER(order_id),
  [equipment_id] int NOT NULL FOREIGN KEY REFERENCES EQUIPMENT(equipment_id),
  [quantity] int NOT NULL,
  [subtotal] float NOT NULL
)
