---
type: basic-note
title: sql-基础-DCL-01-用户管理
author: JackyLee
create_time: 2025-09-25
update_time:
tags:
description:
---

## 用户管理

```sql
-- 新建用户
CREATE USER john IDENTIFIED BY '1234';
-- john
-- john@129.7.0.58
-- john@localhost
-- john@'%.outlook.com'

-- 查看用户
SELECT * FROM mysql.user;

-- 查看用户权限
SELECT Host, User, 
Select_priv, Insert_priv, Delete_priv, Update_priv, Create_priv, Drop_priv
password_last_changed 
FROM mysql.user;

-- 删除用户
CREATE USER bob@outlook.com IDENTIFIED BY '1234';
DROP USER bob@outlook.com;
```

## 参考资料
