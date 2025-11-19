---
type: basic-note
title: sql-教程-DQL-SELECT
author: JackyLee
create_time: 2025-02-26
update_time:
  - 2025-09-25
tags:
description: 来自 Mosh 课程
---

## DQL

```sql
SELECT * -- 选择列
FROM user -- 选择表
WHERE age > 18 -- 条件
ORDER BY age -- 排序 ORDER BY {column} [ASC|DESC]
```

### AS 别名

对表别名 Alias `AS`，参考[教程](https://www.w3school.com.cn/sql/sql_alias.asp)

```sql
SELECT
    first_name,
    last_name,
    points,
    (points + 10) * 100 AS discount_factor,
    (points + 10) * 100 AS 'discount factor'
FROM customers AS c
```

### DISTINCT 去除重复值

对某列去重

参考[教程](https://www.w3school.com.cn/sql/sql_distinct.asp)

```sql
SELECT DISTINCT state
FROM customers
```

### WHERE 条件语句

时间比较

```sql
SELECT *
FROM orders
WHERE order_date > '2018-12-31'
```

## AND OR NOT

```sql
SELECT *
FROM Customers
WHERE birth_date > '1990-01-01' AND points > 1000
-- WHERE birth_date > '1990-01-01' OR points > 1000
-- WHERE NOT (birth_date > '1990-01-01' OR points > 1000)
```

优先级: `NOT >  AND >  OR`

```sql
SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30
```

## IN

```sql
SELECT *
FROM Customers
WHERE state IN ('VA','GA','FL')
-- WHERE state = 'VA' OR state = 'GA' OR state = 'FL'
-- WHERE state NOT IN ('VA','GA','FL')
-- WHERE xxx IN (30, 31, 32) -- 数字 IN
```

## BETWEEN

```sql
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000
-- WHERE points >= 1000 AND points <= 3000
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'
```

## LIKE

like，[教程](https://www.w3school.com.cn/sql/sql_like.asp)

```sql
SELECT *
FROM customers
-- WHERE last_name LIKE 'b%' -- 以b开头的last_name
-- WHERE last_name LIKE 'brush%' -- 以brush开头的last_name
-- WHERE last_name LIKE '%b%' -- 中间有b的last_name
-- WHERE last_name LIKE '%y' -- 以y结尾的last_name
-- WHERE last_name LIKE '_____y' 以y结尾，且_表示任意一个字符（或汉字）
WHERE last_name LIKE 'b____y'
-- % any number of characters
-- _ string character
```

## REGEXP 正则表达式

> 视频时间：1h09min

```sql
SELECT *
FROM customers
WHERE last_name REGEXP 'field'
-- ^ beginning
-- $ end
-- | logical or
-- [abcd]
-- [a-f]
```

## IS NULL 为空

```sql
SELECT *
FROM customers
WHERE phone IS NULL
-- WHERE phone IS NOT NULL
```

## ORDER BY 排序

```sql
SELECT *
FROM customers
ORDER BY first_name
-- ORDER BY first_name DESC
-- ORDER BY state DESC, first_name DESC
```

## LIMIT

- 前 5 行: `LIMIT 5`
- 跳过 2 行并获取 5 行: `LIMIT 5 OFFSET 3`
- 第 3 行开始，获取接下来的 5 行: `LIMIT 3, 5`
