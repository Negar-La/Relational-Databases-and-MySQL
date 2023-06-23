-- 1-Use an aggregate to count the number of Clients. --500 rows
SELECT COUNT(*)
FROM client;

-- 2-Use an aggregate to count Client.BirthDate.   --463 rows
SELECT COUNT(BirthDate)
FROM client;

-- 3-Group Clients by City and count them.
SELECT city, count(clientId) client_count
FROM client c
GROUP BY city
ORDER BY client_count desc;

-- 4-Calculate a total per invoice using only the InvoiceLineItem table.
SELECT invoiceid, SUM(price * quantity) invoice_total
FROM invoicelineitem ili
GROUP BY invoiceid;

-- 5-Modify the previous query:
-- Only include totals greater than $500.00.
-- Sort from lowest total to highest.
SELECT invoiceid, SUM(price * quantity) invoice_total
FROM invoicelineitem
GROUP BY invoiceid
HAVING invoice_total > 500.00
ORDER BY invoice_total;

-- 6-Calculate the average line item total, grouped by InvoiceLineItem.Description.
SELECT description, AVG(price * quantity) invoice_average
FROM InvoiceLineItem
GROUP BY description;

-- 7-Select ClientId, FirstName, and LastName from Client for clients who have paid over $1000 total.
-- Paid is Invoice.InvoiceStatus = 2.
-- Sort by LastName, then FirstName.
SELECT c.clientid, firstName, lastName, SUM(price * quantity) total
FROM client c
INNER JOIN invoice i ON c.ClientId = i.ClientId
INNER JOIN invoicelineitem ili ON i.InvoiceId = ili.InvoiceId
WHERE InvoiceStatus = 2
GROUP BY clientid
HAVING total > 1000 
ORDER BY lastName, firstName;