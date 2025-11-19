# SECTION 10

## 10.2 新增索引

```sql
EXPLAIN SELECT customer_id FROM customers WHERE state = 'CA';

CREATE INDEX idx_state ON customers (state);

-- 如果是修改表
ALTER TABLE customer_id
DROP INDEX idx_xxx(col_1, col_2)
DROP INDEX idx_yyy(col_3, col_4);

```

### 练习 

```sql
EXPLAIN SELECT customer_id FROM customers WHERE points > 1000;

CREATE INDEX idx_points ON customers (points);

-- 如果是修改表
ALTER TABLE customer_id
ADD INDEX idx_xxx(col_1, col_2)
ADD INDEX idx_yyy(col_3, col_4);
```

## 10.3 删除索引

```sql
DROP INDEX 
```



## 10.4 Viewing Indexes

```sql
SHOW INDEXES IN customers;

ANALYZE TABLE customers;

SHOW INDEXES IN orders;
```

## 10.5 Prefix Indexes

STRING COLUMNS

- CHAR
- VARCHAR
- TEXT
- BLOB

```sql
CREATE INDEX idx_lastname ON customers (last_name(20));

SELECT 
    COUNT(DISTINCT LEFT(last_name, 1)),
    COUNT(DISTINCT LEFT(last_name, 5)),
    COUNT(DISTINCT LEFT(last_name, 10))
FROM customers;
```

## 10.6 Full-text Indexes

```sql
USE sql_blog;
SELECT *
FROM posts
WHERE title LIKE '%react redux%' OR
        body LIKE '%react redux%';
------------------------------------
CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT * 
FROM posts
WHERE MATCH(title, body) AGAINST('react redux')
-----------------------------------
CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT *, MATCH(title, body) AGAINST('react redux')
FROM posts
WHERE MATCH(title, body) AGAINST('react redux')
------------------------------------
CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT *, MATCH(title, body) AGAINST('react redux')
FROM posts
WHERE MATCH(title, body) AGAINST('react -redux +form' IN BOOLEAN MODE)
-----------------------------------
CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT *, MATCH(title, body) AGAINST('react redux')
FROM posts
WHERE MATCH(title, body) AGAINST('"handling a form"' IN BOOLEAN MODE)
```

## 10.7 Composite Indexes

```sql
USE sql_store;
SHOW INDEXES IN customers;
EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' AND points > 1000;
---------------------------------------
USE sql_store;
CREATE INDEX idx_state_points ON customers (state, points);
EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' AND points > 1000;
--------------------------------------
SHOW INDEXES IN customers;
DROP INDEX idx_state ON customers;
DROP INDEX idx_points ON customers;
```

## 10.8 Order of Columns in Composite Index

ORDER OF COLUMNS

- Frequently used columns

- High cardinality columns
- Take your queries into account

```sql
EXPLAIN SELECT customer_id
FROM customers
USE INDEX (idx_state_lastname)
WHERE state LIKE 'CA' AND last_name LIKE 'A%';

CREATE INDEX idx_state_lastname ON customers
(state, last_name);

CREATE INDEX idx_lastname_state ON customers
(last_name, state);

DROP INDEX idx_lastname_state ON customers;
```

## 10.9 When Indexes are Ignored

```sql
EXPLAIN 
    SELECT customer_id FROM customers
    WHERE state = 'CA'
    OR points > 1000;

CREATE INDEX idx_points ON customers(points);
EXPLAIN 
    SELECT customer_id FROM customers
    WHERE state = 'CA'
    UNION
    SELECT customer_id FROM customers
    WHERE points > 1000;

EXPLAIN SELECT customer_id FROM customers
WHERE points + 10 > 2010;
```

## 10.10 Using Indexes for Sorting

```sql
EXPLAIN SELECT customer_id FROM customers
-- ORDER BY state;
-- ORDER BY first_name;
ORDER BY state DESC, points DESC;
SHOW STATUS LIKE 'last_query_cost';

-- (a, b)
-- a
-- a, b
-- a DESC, b DESC
```

## 10.11 Covering Indexes

```sql
EXPLAIN SELECT * FROM customers
ORDER BY state;

EXPLAIN SELECT customer_id, state FROM customers
ORDER BY state;
```

## 10.12 Index Maintenance

| Duplicate Indexes | Redundant Indexes |
| ----------------- | ----------------- |
| (A, B, C)         | (A, B)            |
| X (A, B, C)       | X (A)             |
|                   | (B, A)            |
|                   | (B)               |

Before creating new indexes, check the existing ones.