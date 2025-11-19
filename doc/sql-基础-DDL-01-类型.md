---
type: basic-note
title: sql-基础-DDL-01-类型
author: JackyLee
create_time: 2025-09-27
update_time:
tags:
description:
---

## 介绍

MYSQL 数据类型

- 字符串 String
- 数值 Numeric
- 日期和时间 Date and Time
- 二进制数据 Blob
- 特殊 Spacial

## 8.2 String-Types

- CHAR(x): 固定长度
- VARCHAR : 65,535 characters (~64KB)
  - VARCHAR(50) for short strings
  - VARCHAR(255) for medium-length strings
- MEDIUMTEXT max: 16MB
- LONGTEXT max:4GB
- TINYTEXT max: 255 bytes
- TEXT max: 64KB

## 8.3 integer Types

|                  |     |             |
| ---------------- | --- | ----------- |
| TINYINT          | 1b  | [-128, 127] |
| UNSIGNED TINYINT |     | [0, 255]    |
| SMALLINT         | 2b  | [-32K, 32K] |
| MEDIUMINT        | 3b  | [-8M, 8M]   |
| INT              | 4b  | [-2B, 2B]   |
| BIGINT           | 8b  | [-9Z, 9Z]   |

ZEROFILL

```sql
GOOGLE mysql integer types
```

## 8.4 Fixed-point and Floating-point Types

RATIONALS

|               |               |               |
| ------------- | ------------- | ------------- |
| DECIMAL(p, s) | DECIMAL(9, 2) | => 1234567.89 |
| DEC           |               |               |
| NUMERIC       |               |               |
| FIXED         |               |               |
| FLOAT         | 4b            |               |
| DOUBLE        | 8b            |               |

## 8.5 Boolean Types

- BOOL
- BOOLEAN

```sql
UPDATE posts
SET is_published = 1  # or FALSE
```

## 8.6 Enum and Set Types

```sql
-- avoid ENUM
ENUM('small', 'medium', 'large')

SET(...)

```

## 8.7 Data and Time Types

|           |                |
| --------- | -------------- |
| DATE      |                |
| TIME      |                |
| DATEMIE   | 8b             |
| TIMESTAMP | 4b(up to 2038) |
| YEAR      |                |

## 8.8 Blob Types

|            |      |
| ---------- | ---- |
| TINYBLOB   | 255b |
| BLOB       | 65KB |
| MEDIUMBLOB | 16MB |
| LONGBLOB   | 4GB  |
|            |      |

PROBLEMS WITH STORING FILES IN A DATABASE

- Increased database size
- Slower backups
- Performance problems
- More code to read/write images

## 8.9 JSON Type

JSON

- Lightweight format for storing and transferring date over the internet

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
    'manufacturer', JSON_OBJECT('name', 'sony')
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
