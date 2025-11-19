# SECTION 7

## 7.1 Transactions

A group of SQL statement that represent a single unit of work

ACID Properties

- Atomicity
- Consistency
- Isolation
- Durability

## 7.2 Creating Transaction

```sql
USE sql_store;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, state)
VALUES(1, '2019-01-01' ,1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

COMMIT;

```

## 7.3 Concurrency and Locking

```sql
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT

```

## 7.4 Concurrency Problem

- Lost Updates
- Dirty Reads
- Non-repeating Reads
- Phantom Reads

```sql

```

## 7.5  Transaction isolation Levels

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

## 7.6 READ UNCOMMITEED isolation Level

```sql

```

## 7.7 READ COMMITTEED isolation Level

```sql

```

## 7.8 REPEATABLE READ isolation Level

```sql

```

## 7.9 SERIALIZABLE isolation Level

```sql

```

## 7.10 Deadlocks

```sql

```

