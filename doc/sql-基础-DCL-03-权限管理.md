---
type: basic-note
title: sql-基础-DCL-03-权限管理
author: JackyLee
create_time: 2025-11-21
update_time:
tags:
description:
---

## 授予权限

```sql
-- 查看权限
SHOW GRANTS FOR john;
-- 查看某个具体权限
SELECT Host, User, Select_priv FROM mysql.user;


-- 赋予权限
-- 某个数据库全部数据表
GRANT CREATE VIEW ON sql_store.* TO 甲用户;
GRANT SELECT VIEW ON sql_store.* TO 甲用户;
GRANT INSERT VIEW ON sql_store.* TO 甲用户;
GRANT UPDATE VIEW ON sql_store.* TO 甲用户;
GRANT DELETE VIEW ON sql_store.* TO 甲用户;
GRANT EXECUTE VIEW ON sql_store.* TO 甲用户;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON sql_store.* TO 甲用户

-- 撤销权限
-- 某个数据库全部数据表
REVOKE CREATE VIEW ON sql_store.* FROM 甲用户;
```

## 场景

场景 1: 对于应用 moon_app 授予某个数据库权限，对于管理员 john 授予全部数据库权限

```sql
-- 创建用户
CREATE USER moon_app IDENTIFIED BY '1234';

-- 授予权限
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON sql_store.*  TO moon_app
-- GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON ON sql_store.customers  TO moon_app

-- GOOGLE mysql privileges
GRANT ALL ON *.* TO john;
```

## 参考资料
