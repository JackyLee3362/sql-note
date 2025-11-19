# SECTION 4

## 4.1 Creating Views

```sql
USE sql_invoicing;

CREATE VIEW sales_by_client AS
SELECT 
    client_id,
    name,
    SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name
```

### 练习 

```sql
USE sql_invoicing;

CREATE VIEW clients_balance AS 
SELECT 
    client_id,
    name,
    SUM(invoice_total - payment_total) AS Balance
FROM clients
JOIN invoices USING (client_id)
GROUP BY client_id, name

```

## 4.2  Altering or Dropping Views

```sql
DROP VIEW sales_by_client
--------------------------
-- CLICK TOOL ICON IN VIEW
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sql_invoicing`.`sales_by_client` AS
    SELECT 
        `c`.`client_id` AS `client_id`,
        `c`.`name` AS `name`,
        SUM(`i`.`invoice_total`) AS `total_sales`
    FROM
        (`sql_invoicing`.`clients` `c`
        JOIN `sql_invoicing`.`invoices` `i` ON ((`c`.`client_id` = `i`.`client_id`)))
    GROUP BY `c`.`client_id` , `c`.`name`
    ORDER BY total_sales DESC
```

## 4.3 Updatable Views

```sql
-- in some certain circumstance like follow

-- don't have this clause
-- DISTINCT
-- Aggregate Function(MIN,MAX,SUM)
-- GROUP BY, HAVING
-- UNION
--------------------------------------
-- CREATE A VIEW
USE sql_invoicing;

CREATE OR REPLACE VIEW invoice_with_balance AS
SELECT 
    invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
WHERE (invoice_total - payment_total) > 0
-- DELETE
DELETE FROM invoice_with_balance 
WHERE invoice_id = 1
-- UPDATE
UPDATE invoice_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2
```

## 4.4 The with option check Clause

```sql
USE sql_invoicing;

CREATE OR REPLACE VIEW invoice_with_balance AS
SELECT 
    invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
WHERE (invoice_total - payment_total) > 0
WITH CHECK OPTION
-----------------------
UPDATE invoice_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 2
```

## *4.5 Other Benefits of Views

- Simplify queries
- Reduce the impact of changes
- Restrict access to the data

