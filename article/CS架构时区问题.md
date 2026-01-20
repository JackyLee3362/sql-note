---
type: basic-note
title: CS架构时区问题
author: JackyLee
create_time: 2026-01-19
update_time:
tags:
description:
---

## 几种情况

- 服务器东八区 + 客户端东八区
- 服务器东八区 + 客户端 UTC
- 服务器UTC + 客户端东八区
- 服务器UTC + 客户端UTC

连接时强制指定时区为东八区

## 如何查看当数据库服务器时区

1. 全局时区
2. 会话时区

## 参考资料
