---
type: basic-note
title: sql-基础-DML-DELETE
author: JackyLee
create_time: 2025-09-25
update_time:
tags:
description:
---

## 删除行

```sql
-- 普通删除
DELETE FROM user WHERE id = 1;
-- 从子查询中删除
DELETE FROM user 
WHERE dep_id IN (
    SELECT id 
    FROM department
    WHERE id > 3
);
```

## 参考资料
