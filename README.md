# Skii 4 humans - website
## 1 Introduction
_Website with accessories for skiing. This application was created to train JAVA backend, while the frontend was created in order to present the progress._
_It is not website for any existing shop_

## 2 Table of Contents
- [Introduction](#1-Introduction)
- [Table of Contents](#2-Table-of-Contents)
- [How to run ?](#3-how-to-run-)
- [Properties](#4-Properties)
  - [General properties](#41-generalproperties)
    - [disable.enable.export.or.import.data](#411--disableenableexportorimportdata)
    - [save.to.file.used.sql.queries](#412--savetofileusedsqlqueries)
    - [source.db.server](#413--sourcedbserver)
    - [source.db.port](#414--sourcedbport)
    - [source.db.name](#415--sourcedbname)
    - [source.db.user](#416--sourcedbuser)
    - [source.db.password](#417--sourcedbpassword)
    - [table.name](#418--tablename)
    - [column.name](#419--columnname)
    - [ids](#4110-ids)
    - [path.to.masking.file](#4111-pathtomaskingfile)
    - [old.files.with.sql.scripts](#4112-oldfileswithsqlscripts)
    - [save.to.file.delete.rows.in.one.query](#4113-savetofiledeleterowsinonequery)
    - [save.to.file.insert.rows.in.one.query](#4114-savetofileinsertrowsinonequery)
    - [destination.db.server](#4115-destinationdbserver)
    - [destination.db.port](#4116-destinationdbport)
    - [destination.db.name](#4117-destinationdbname)
    - [destination.db.user](#4118-destinationdbuser)
    - [destination.db.password](#4119-destinationdbpassword)
  - [Masking properties](#42-maskingproperties)
    - [masking.type](#421-maskingtype)
    - [masking.type.path](#422-maskingtypepath)
    - [mask.clob.type](#423-maskclobtype)
    - [mask.blob.type](#424-maskblobtype)
  - [File with table/columns to mask](#43-listoftablesandcolumnstomasktxt)
- [TODO list](#5-TODO-list)

## 3 How to run ?

Download from this link: https://github.com/berNy92k/Ski4HumansWebApp_DB and run using for example tomcat with Intellij

or

use link from heroku: TODO

## 4 Properties
All properties must be in 'properties' directory (in root directory).

Main settings for this application have to be in properties/database/ and name of this file is general.properties.
Application have option to mask chosen data. Settings for masking part have to be in properties/masking/ and names fo this files are masking.properties and listOfTablesAndColumnsToMask.txt.

```
properties
   database
       general.properties
   masking
       listOfTablesAndColumnsToMask.txt
       masking.properties
```
More detail about properties files are below.

### 4.1 general.properties
Main file with settings for this application.
##### 4.1.1  disable.enable.export.or.import.data
    User decide here if run import or export
    
##### 4.1.2  save.to.file.used.sql.queries
    User decide here if all used sql queries will be saved to file

##### 4.1.3  source.db.server
    Server name of source database

##### 4.1.4  source.db.port
    Port of source database

##### 4.1.5  source.db.name
    Name of source database

##### 4.1.6  source.db.user
    Username of source database

##### 4.1.7  source.db.password
    Password of source database

##### 4.1.8  table.name
    Table name to select from source database

##### 4.1.9  column.name
    Column name - related with next point (ids)

##### 4.1.10 ids
    Ids to select from source database

##### 4.1.11 path.to.masking.file
    Path to masking file

##### 4.1.12 old.files.with.sql.scripts
    User decide here if old files will be moved to 'oldFiles' directory or deleted

##### 4.1.13 save.to.file.delete.rows.in.one.query
    example:
    save.to.file.insert.rows.in.one.query=2
    
    DELETE FROM CONTACTS
    	WHERE CONTACT_ID IN (
    		  15,
    		  5)
    		  
    If in database is more data it will create more queries like before.
    For example in database are 5 data to select:
    save.to.file.insert.rows.in.one.query=2
        
    DELETE FROM CONTACTS
    	WHERE CONTACT_ID IN (
    		  15,
    		  5)
    DELETE FROM CONTACTS
    	WHERE CONTACT_ID IN (
    		  25,
    		  55)
    DELETE FROM CONTACTS
    	WHERE CONTACT_ID IN (
    		  33)
##### 4.1.14 save.to.file.insert.rows.in.one.query
    example:
    save.to.file.delete.rows.in.one.query=2
    
    INSERT ALL
    	INTO CONTACTS (CONTACT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,CUSTOMER_ID)
    		VALUES (15,'Cimetqovy','Jarvis','geraldine.schneider@whirlpoolcorp.com','+1 319 123 4288',15)
    	INTO CONTACTS (CONTACT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,CUSTOMER_ID)
    		VALUES (5,'Nixu','Reeves','jeni.levy@centene.com','+1 414 123 4381',5)
    SELECT * FROM dual
    
    The same like for delete 4.1.13.

##### 4.1.15 destination.db.server
    Server name of destination database

##### 4.1.16 destination.db.port
    Port of destination database
    
##### 4.1.17 destination.db.name
    Name of destination database
    
##### 4.1.18 destination.db.user
    Username of destination database
    
##### 4.1.19 destination.db.password
    Password of destination database

### 4.2 masking.properties
```
#==============================================================================
#                                 Masking types
#==============================================================================
# 0-Disable maskingPartOfSensitiveData
# 1-Enable maskingPartOfSensitiveData
masking.type=0
masking.type.path=/properties/masking/listOfTablesAndColumnsToMask.txt
#==============================================================================
#                            BLOB/CLOB types - settings
#==============================================================================
# 0-Without blob/clob maskingPartOfSensitiveData --> to maskMethodForRandomizeData blob/clob types user of application have
#                       to add this information in listOfTablesAndColumnsToMask.txt
#                       If not the application will not maskMethodForRandomizeData blob/clob types
# 1-With blob/clob maskingPartOfSensitiveData    --> automatically replace data in all tables that
#                       have blob/clob types for value that was added
#                       in blob/clob maskMethodForRandomizeData methods
#                   --> maskingPartOfSensitiveData.type must have value '1'. It will
#                       not work with value '0' in 'maskingPartOfSensitiveData.type'
mask.clob.type=1
mask.blob.type=1
```
##### 4.2.1 masking.type
    User decide here if first part of application will be done with or without masking

##### 4.2.2 masking.type.path
    Path to listOfTablesAndColumnsToMask.txt

##### 4.2.3 mask.clob.type
    User decide here if clob type should be replaced automatically (only if masking.type=1)

##### 4.2.4 mask.blob.type
    User decide here if blob type should be replaced automatically (only if masking.type=1)

### 4.3 listOfTablesAndColumnsToMask.txt
File where user can decide about data which should be mask.

_Format:_ [TABLE_NAME.COLUMN_NAME.METHOD_NAME] _or_ [TABLE_NAME.COLUMN_NAME1,...,COLUMN_NAMEx.METHOD_NAME]

```
# MULTICOLUMNSDB - Randomly entity from database and replace selected columns
# BLOBTYPE - replace blob type
# CLOBTYPE - replace clob type
# DATETYPE - randomly created new date
# ALLOTHERTYPES - randomly created new string/number/email but keep the same length
#        Format of info about masking:
# [TABLE_NAME.COLUMN_NAME.METHOD_NAME]
# or
# [TABLE_NAME.COLUMN_NAME1,...,COLUMN_NAMEx.METHOD_NAME]
CONTACTS.LAST_NAME,PHONE.MULTICOLUMNSDB
CONTACTS.FIRST_NAME.ALLOTHERTYPES
EMPLOYEES.FIRST_NAME.ALLOTHERTYPES
EMPLOYEES.HIRE_DATE.DATETYPE
```

## 5 TODO list
* **IMPORTANT.** Make refactoring of frontend code - right now there is a mess 
(i was mostly focused on backend during creating this application - frontend was done to see results).
It is necessary to update style.css and separate style code from .jsp files.
* Make refactoring of backend code - delete unused code and simplify what is possible.