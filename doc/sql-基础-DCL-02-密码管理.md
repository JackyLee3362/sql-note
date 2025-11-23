---
type: basic-note
title: sql-基础-DCL
author: JackyLee
create_time: 2025-10-22
update_time:
tags:
description:
---

## 修改密码

> 空密码也是这样设置的

```sql

-- 5.7.6 以前
SET PASSWORD FOR 用户名@localhost = PASSWORD('新密码');

-- 5.7.6 以后
SET PASSWORD FOR 用户名@localhost = '新密码';
SET PASSWORD FOR 用户名 = '新密码';

-- 8.0 以后
ALTER USER 'root'@'localhost' IDENTIFIED BY '新密码';
```

## 忘记密码如何处理

启动 mysql 时跳过授权表

`/etc/my.cnf` 中添加一行然后重新启动

```ini
skip_grant_tables 
```

## 参考资料
