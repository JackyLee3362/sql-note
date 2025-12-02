# SECTION 7

## 1 事务

A group of SQL statement that represent a single unit of work

ACID Properties

- 原子性: Atomicity
- 一致性: Consistency
- 隔离性: Isolation
- 持久性: Durability

## 2 创建事务

```sql
USE sql_store;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, state)
VALUES(1, '2019-01-01' ,1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

COMMIT;

```

## 3 并发和锁

```sql
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT

```

## 4 并发问题

- 脏读
- 不可重复读
- 幻读

- Lost Updates
- Dirty Reads
- Non-repeating Reads
- Phantom Reads

```sql

```

## 5 事务隔离级别

|                  | Lost Updates | Dirty Reads | Non-repeating Reads | Phantom Reads |
| ---------------- | ------------ | ----------- | ------------------- | ------------- |
| READ UNCOMMITTED |              |             |                     |               |
| READ COMMITTED   |              | O           |                     |               |
| REPEATABLE READ  | O            | O           | O                   |               |
| SERIALIZABLE     | O            | O           | O                   | O             |



```sql
SHOW VARIABLES like 'TRANSACTION_ISOLATION';
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

- 读未提交
- 读已提交
- 可重复读
- 序列化


## 死锁问题


