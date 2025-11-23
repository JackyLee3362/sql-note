---
type: basic-note
title: sql-基础-DML-INSERT
author: JackyLee
create_time: 2025-09-25
update_time:
tags:
description:
---

## 插入单行

```sql
-- 全列插入
INSERT INTO user
VALUE (DEFAULT, 'Alice', 18, '1990-01-01', NULL)
-- 指定列
INSERT INTO user (name, age, birth)
VALUE ('Alice', 20, '1990-01-01');
```

## 插入多行

```sql
-- 指定列
INSERT INTO user (name, age, birth)
VALUES ('alice', 15, '1990-01-01'),
       ('bob', 11, '1994-03-13'),
       ('cindy', 12, '1993-04-25');
```

## 0.28 Inserting Hierarchical Rows

```sql
INSERT INTO user (id, name, age)
VALUES (1, 'alice', 12);

-- SELECT LAST_INSERT_ID();
INSERT INTO user(id, name, age)
VALUES
    (LAST_INSERT_ID(), 'bob', 10),
    (LAST_INSERT_ID(), 'cindy', 13)


```

## 参考资料
