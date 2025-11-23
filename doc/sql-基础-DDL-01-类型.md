---
type: basic-note
title: sql-基础-DDL-01-类型
author: JackyLee
create_time: 2025-09-27
update_time:
tags:
description:
---

MYSQL 数据类型

- 字符串 String
- 数值 Numeric
- 日期和时间 Date and Time
- 二进制数据 Blob
- 特殊 Spacial

## 字符串类型

- CHAR(x): 定长字符串 0~255 B
- VARCHAR : 变长字符串 0~65,535 B
- MEDIUMTEXT 最大 16MB
- LONGTEXT 最大 4GB
- TINYTEXT 最大 255 B
- TEXT 最大 64KB

> char(30) 表示能存 30 个字符，而不是 30 个字节

## 数值类型

- TINYINT: 1 字节
- UNSIGNED TINYINT: 1 字节
- SMALLINT: 2 字节
- MEDIUMINT: 3 字节
- INT: 4 字节
- BIGINT: 8 字节

## 浮点型

- DECIMAL(p, s): DECIMAL(9, 2) , => 1234567.89
- DEC
- NUMERIC
- FIXED
- FLOAT: 4b
- DOUBLE: 8b

## 布尔类型

- BOOL
- BOOLEAN

```sql
UPDATE posts
SET is_published = 1
-- SET is_published = TRUE
-- SET is_published = FALSE
```

## 枚举和集合类型

> 尽量不使用

```sql
ENUM('small', 'medium', 'large')

SET(...)
```

## 日期和时间类型

- DATE
- TIME
- DATETIME , 8b ,
- TIMESTAMP , 4b(up to 2038) ,
- YEAR

## 二进制类型

- TINYBLOB: 255 字节
- BLOB: 65KB
- MEDIUMBLOB: 16MB
- LONGBLOB: 4GB

## JSON 类型

JSON

```sql
UPDATE products
SET properties = '
{
    "dimension": [1, 2, 3],
    "weight": 10,
    "manufacturer":{"name": "sony"}
}
'
WHERE product_id = 1
-------------------------
UPDATE products
SET properties = JSON_OBJECT(
    'weight', 10,
    'dimension', JSON_ARRAY(1, 2, 3),
    'manufacturer', JSON_OBJECT('name': 'sony')
)
WHERE product_id = 2
----------------------------
SELECT
    product_id,
    JSON_EXTRACT(properties, '$.weight') AS weight
FROM products
WHERE product_id = 1
---------------------------
SELECT
    product_id,
    properties -> '$.weight' AS weight, -- $ means current table
    properties -> '$.dimension[0]' AS dimension,
    properties -> '$.manufacturer',
    properties -> '$.manufacturer.name',
    properties ->> '$.manufacturer.name'
FROM products
-- WHERE product_id = 1
WHERE  properties ->> '$.manufacturer.name' = 'sony'
---------------------------
UPDATE products
SET properties = JSON_SET(
    properties,
    '$.weight', 20,
    '$.age', 10
)
WHERE product_id = 1
----------------------------
UPDATE products
SET properties = JSON_REMOVE(
    properties,
    '$.age'
)
WHERE product_id = 1
```

## 列属性

- DATATYPE:
  - INT
  - VARCHAR(50)
  - CHAR(50)
- PK:
  - PRIMARY KEY
- NN:
  - NOT NULLABLE
- AI:
  - AUTO INSERT
- DEFAULT/EXPRESSION:
  - NULL
  - '0'
