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

## 5 TODO list
* **IMPORTANT.** Make refactoring of frontend code - right now there is a mess 
(i was mostly focused on backend during creating this application - frontend was done to see results).
It is necessary to update style.css and separate style code from .jsp files.
* Make refactoring of backend code - delete unused code and simplify what is possible.