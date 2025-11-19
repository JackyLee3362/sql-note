---
type: basic-note
title: sql-基础-DCL
author: JackyLee
create_time: 2025-09-25
update_time:
tags:
description:
---

## 新建用户

Creating a User

```sql
CREATE USER john IDENTIFIED BY '1234';

-- john
-- john@129.7.0.58
-- john@localhost
-- john@'%.codewithmosh.com'
```

## 查看用户

Viewing Users

```sql
SELECT * FROM mysql.user;
```

## 删除用户

Dropping Users

```sql
CREATE USER bob@codewithmosh.com IDENTIFIED BY '1234';
DROP USER bob@codewithmosh.com;
```

## 删除密码

Changing Passwords

```sql
SET PASSWORD FOR john = '1234';
-- Navigator -> Users and Privileges
```

## 权限管理

Granting Privileges

```sql
-- 1: web/desktop application
CREATE USER moon_app IDENTIFIED BY '1234';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
ON sql_store.*
-- ON sql_store.customers
TO moon_app;

-- 2: admin
-- GOOGLE mysql privileges
GRANT ALL
ON *.*
TO john;
```

## 查看权限

Viewing Privileges

```sql
SHOW GRANTS FOR john;
```

## 赋予权限

```sql
GRANT CREATE VIEW
ON sql_store.*
TO moon_app;
```

## 撤销权限

```sql
REVOKE CREATE VIEW
ON sql_store.*
FROM moon_app;
```

## 参考资料
