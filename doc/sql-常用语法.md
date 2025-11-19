---
title: 常用的sql命令
create_time: 2025-02-26
update_time: 
tags:
description: 
---

## 测试语法

```sql
show databases;
use xxx;  -- 选择数据库
show tables;
```

## 查看数据的长度

```sql
SELECT COUNT(*) FROM `{table_name}`;
```

## 查看数据长度是否符合要求

```sql
SELECT * FROM `{table_name}` WHERE LEN(`{index_name}`) == 10
```
