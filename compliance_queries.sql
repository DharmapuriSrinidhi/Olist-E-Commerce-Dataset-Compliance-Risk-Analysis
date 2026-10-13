-- =======================================================
-- Project: Olist E-Commerce Dataset Compliance & Risk Analysis
-- File: compliance_queries.sql
-- Description: SQL queries for transaction risk screening, high value voucher analysis, and payment volume monitoring.
-- =======================================================

-- =======================================================
-- Query 1
-- Question: High-Value Voucher Screening

-- USE ecommerce;

SELECT order_id, payment_type, payment_value
FROM order_payments
WHERE payment_type = 'voucher' 
  AND payment_value > 100
ORDER BY payment_value DESC;

-- =======================================================
-- Query 2
-- Question: High Valur Credit Card

SELECT order_id, payment_type, payment_value 
FROM order_payments
WHERE payment_type = 'credit_card'
  AND payment_value > 500
ORDER BY payment_value DESC;

-- =======================================================
-- Query 3
-- Question: Payment Type Summary

SELECT payment_type, COUNT(order_id) AS total_orders, SUM(payment_value) AS total_spend
FROM order_payments
GROUP BY payment_type
ORDER BY total_spend DESC;

-- =======================================================
-- Query 4
-- Question: High Volume Payment 

SELECT payment_type, COUNT(order_id) AS total_orders, SUM(payment_value) AS total_spend
FROM order_payments
GROUP BY payment_type
HAVING COUNT(order_id) > 1000
ORDER BY total_spend DESC;

-- =======================================================
-- Query 5
-- Question: High Average Spend

SELECT payment_type, COUNT(order_id) AS total_orders, AVG(payment_value) AS avg_payment
FROM order_payments
GROUP BY payment_type
HAVING AVG(payment_value) > 50
ORDER BY avg_payment DESC;

-- =======================================================

