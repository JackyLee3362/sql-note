---
type: basic-note
title: sql-基础-DDL-建表语句
author: JackyLee
create_time: 2025-09-25
update_time:
tags:
description:
---

## 建库和删库

```sql
-- 显示数据库
SHOW DATABASES;
-- 建库
CREATE DATABASE IF NOT EXISTS db_test;
-- 删库
DROP DATABASE IF EXISTS db_test;
```

## 建表

```sql
-- 使用数据库
USE db_test;
-- 显示数据表
SHOW TABLES;

-- 建表
DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname  VARCHAR(50) NOT NULL,
    points      INT NOT NULL DEFAULT 0,
    email       VARCHAR(255) NOT NULL UNIQUE
);

-- 显示表
DESC user;
```

## 更改表

```sql
ALTER TABLE user
    -- 新增列
    ADD age INT NOT NULL,
    ADD city VARCHAR(50) NOT NULL AFTER email,
    -- 修改列
    MODIFY COLUMN uname VARCHAR(55) NOT NULL DEFAULT '',
    -- 删除列
    DROP points;
```

## 建立外键关系

```sql
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname  VARCHAR(50) NOT NULL,
    points      INT NOT NULL DEFAULT 0,
    email       VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS orders
(
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY fk_orders_user (user_id)
        REFERENCES user (id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
```

## 更改主键

```sql
CREATE TABLE IF NOT EXISTS temp (uuid INT PRIMARY KEY, uname VARCHAR(55));
-- 删除主键
ALTER TABLE orders DROP PRIMARY KEY;
-- 增加主键
ALTER TABLE temp ADD PRIMARY KEY id;
-- 更换主键
ALTER TABLE orders
    DROP PRIMARY KEY,
    ADD PRIMARY KEY id,
    ;
```

## 更改外键

```sql
ALTER TABLE orders
    DROP FOREIGN KEY fk_orders_customers,
    ADD FOREIGN KEY fk_orders_customers (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;
```

## 9.30 字符集和排序规则

```sql
SHOW CHARSET;
---------------------
CREATE DATABASE db_name
    CHARACTER SET latin1;
ALTER DATABASE db_name
    CHARACTER SET latin1;
CREATE TABLE table1
    CHARACTER SET latin1;
ALTER TABLE table1
    CHARACTER SET latin1
```

## 存储引擎

```sql
SHOW ENGINES; 
ALTER TABLE customers ENGINE = InnoDB
```

## 复制表结构

```sql
CREATE TABLE user_bak AS SELECT * FROM user
```

### 练习 0.29

```sql
CREATE TABLE user_bak AS
SELECT
    i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i
JOIN clients c
    USING (client_id)
WHERE payment_date IS NOT NULL
```

### 关于 USING() 函数

```sql
-- 示例：
select a.*, b.* from a left join b using(colA);
-- 等同于：
select a.*, b.* from a left join b on a.colA = b.colA;
```

## 参考资料
