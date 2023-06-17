USE ConsumerComplaints;

-- The SELECT keyword is used to retrieve data from one or more tables in a database. 

DESCRIBE Complaint;
-- To view a list of the dates received, products, companies, and states:

USE ConsumerComplaints;
SELECT DateReceived, Product, Company, State
FROM complaint;

-- If you want all columns:
USE ConsumerComplaints;
SELECT * 
FROM complaint;

-- The WHERE Clause
-- Example 1:
USE ConsumerComplaints;
SELECT
	DateReceived,
    Product,
    Issue,
    Company,
    State
FROM complaint 
WHERE State = 'LA';

-- Example 2:
USE ConsumerComplaints;
SELECT
    Product,
    Issue,
    Company
FROM complaint 
WHERE SubmissionMethod = 'Referral' AND State = 'AZ';

-- Example 3:
USE ConsumerComplaints;
SELECT
    Product,
    Issue,
    Company
FROM complaint 
WHERE SubmissionMethod = 'Referral' AND State = 'AZ';

-- Example 4:
USE ConsumerComplaints;
SELECT
   Product,
   State,
   SubmissionMethod
FROM complaint 
WHERE ConsumerDisputed = 0 AND SubmissionMethod = 'Web' AND State IN ('LA', 'NC', 'FL');

-- Example 5:
USE ConsumerComplaints;
SELECT *
FROM Complaint
WHERE State = 'LA'
AND (Product = 'Mortgage' OR Product = 'Debt collection');

-- Filtering Numbers
-- Does ComplaintId 1200385 exist?
USE ConsumerComplaints;
SELECT *
FROM Complaint
WHERE ComplaintId = 1200385;

-- What is the most common Product between ComplaintId 100,000 and 200,000?
USE ConsumerComplaints;
SELECT Product,
ComplaintId
FROM Complaint
WHERE ComplaintId BETWEEN 100000 AND 200000;

USE ConsumerComplaints;
SELECT 
  Product, 
  Issue, 
  Company, 
  ResponseToConsumer
FROM Complaint
WHERE ConsumerDisputed = 1
AND ConsumerConsent = 1
AND Product NOT IN ('Mortgage', 'Debt collection');

-- Filtering Dates
-- Did anyone submit a complaint on New Year's Day, 2014?
USE ConsumerComplaints;
SELECT 
  Product, 
  Company
FROM Complaint
WHERE DateReceived = '2014-01-01';

-- Are there complaints in 2018?
USE ConsumerComplaints;
SELECT 
  Product, 
  Company,
  DateReceived
FROM Complaint
WHERE DateReceived BETWEEN '2018-01-01' AND '2018-12-30';

-- How many complaints were reported in July of 2015?
USE ConsumerComplaints;
SELECT 
  Product, 
  Company,
  DateReceived
FROM Complaint
WHERE DateReceived BETWEEN '2015-07-01' AND '2015-07-31';

-- Do any complaints claim to have been sent to the company (DateSentToCompany) before the complaint was received (DateReceived)?
USE ConsumerComplaints;
SELECT 
  Product, 
  Company,
  DateSentToCompany,
  DateReceived
FROM Complaint
WHERE DateSentToCompany < DateReceived;

-- Pattern Matching Text
-- Find consumer complaints about companies with names that start with 'V'.
