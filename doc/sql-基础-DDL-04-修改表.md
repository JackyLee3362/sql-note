---
type: basic-note
title: sql-基础-DDL-04-修改表
author: JackyLee
create_time: 2026-03-19
update_time:
tags:
description:
---

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

## 参考资料
