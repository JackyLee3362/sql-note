---
type: basic-note
title: sql-基础-DDL-02-建模
author: JackyLee
create_time: 2025-09-27
update_time:
tags:
description:
---

## 数据库设计

## 数据模型

- 理解需求
- 创建概念模型(实体)
- 创建逻辑模型(字段和类型)
- 创建物理模型(分库分表、引擎、索引)

## Conceptual Models 概念模型

Represents the entities and their relationships

- 实体关系图: Entity Relationship (ER): ERP
- UML

实体关系图

- Microsoft Visio
- draw.io
- LucidCharts

## Logical Models 逻辑模型

## Physical Models 物理模型

## Primary Keys 主键

## Foreign Keys 外键

## Foreign Key Constraints 约束外键

## Normalization 范式

- 1st Normal Form: 第一范式
- 2nd Normal Form: 第二范式
- 3rd Normal Form: 第三范式

## 9.10 First Normal Form(1NF)

Each cell should have a **single value** and we cannot repeated columns

## 9.11 Link Tables

## 9.12 Second Normal Form(2NF)

Every **table** should describe **one entity**, and every column in that should describe that entity.

## 9.13 Third Normal Form(3NF)

A column in a table should not be derived from other columns

## 9.14 My Pragmatic Advice

## 9.15 Don't Model the Universe

EAV

- Entities
- Attributes
- Values

Solve today's problems, not future problems that may never happen.

Simplicity is the Ultimate Sophistication

## 9.16 Forward Engineering a Model

Menu->Database->Forward Engineering

忘记保存了……一会重做吧，当练习了

## 9.17 Synchronizing a Model with a Database

## 9.18 Reverse Engineering a Database

## 9.19 Project-Flight Booking System

## 9.20 Solution - Conceptual Model

## 9.21 Solution - Logical Model

## 9.22 Project - Video Rental Application

## 9.23 Solution - Conceptual Model

## 9.24 Solution - Logical Model

## 参考资料
