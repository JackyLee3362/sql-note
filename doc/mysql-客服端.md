---
title: mysql 客户端
create_time: 2025-02-26
update_time:
tags:
description:
---

### 客户端

```sh
# 如果 localhost 可忽略
mysql -h localhost -u root -p
# 输入密码
```

客户端，测试连接

```sql
-- 查看数据库
show databases;

-- 选择数据库
use xxx;

-- 查看数据表
show tables;

-- 查看字符集
show charset;

-- 查看引擎
show engines;
```

## 查看数据的长度

```sql
SELECT COUNT(*) FROM `{table_name}`;
```

## 查看数据长度是否符合要求

```sql
SELECT * FROM `{table_name}` WHERE LEN(`{index_name}`) == 10
```
