select * from bank_loan_data

-- total loan applications
select count(id) as 'total loan applications' from bank_loan_data

-- month to date loan applications
select count(id) as 'MTD loan applications' 
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- previous month to date loan applications
select count(id) as 'PMTD loan applications' 
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

-- total funded amount
select sum(loan_amount) as 'total funded amount' 
from bank_loan_data

-- MTD funded amount
select sum(loan_amount) as 'MTD total funded amount' 
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- total payment received
select sum(total_payment) as 'total payment received' 
from bank_loan_data

--mtd total payment received
select sum(total_payment) as 'mtd total payment received' 
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

--Average interest rate
select round(avg(int_rate) * 100,2) as 'Average interset rate'
from bank_loan_data

--MTD Average interest rate
select round(avg(int_rate) * 100,2) as 'MTD Average interset rate'
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- Avg DTI
select round(avg(dti) * 100,2) as 'Average DTI' from bank_loan_data

-- Avg MTD DTI
select round(avg(dti) * 100,2) as 'Average DTI' from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- Good Loan Percentage
select 
(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' then id END) * 100)
/
COUNT(id) as 'Good Loan Percentage'
FROM bank_loan_data

-- Good Loan Applications
select count(id) as 'Good Loan Applications' from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

-- Good Loan Funded amount
select sum(loan_amount) as 'Good Loan funded amount' from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Good loan received amount
select sum(total_payment) as 'Good Loan received amount' from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

-- Bad Loan Percentage
select 
(COUNT(CASE WHEN loan_status = 'Charged Off' then id END) * 100)
/
COUNT(id) as 'Bad Loan Percentage'
FROM bank_loan_data

-- Bad Loan Applications
select count(id) as 'Bad Loan Applications' from bank_loan_data
where loan_status = 'Charged Off'

-- Bad Loan Funded amount
select sum(loan_amount) as 'Bad Loan funded amount' from bank_loan_data
where loan_status = 'Charged Off'

--Bad loan received amount
select sum(total_payment) as 'Bad Loan received amount' from bank_loan_data
where loan_status = 'Charged Off'

-- Loan Status
select 
	loan_status,
	COUNT(id) as Total_Loan_Applications,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_funded_amount,
	avg(int_rate * 100) as Interest_rate,
	avg(dti * 100) as DTI
from
	bank_loan_data
group by
	loan_status

--MTD Loan Status
select 
	loan_status,
	sum(total_payment) as MTD_total_amount_received,
	sum(loan_amount) as MTD_total_funded_amount
from
	bank_loan_data
where
	MONTH(issue_date) = 12 
group by
	loan_status




--BANK LOAN REPORT | OVERVIEW

--Month
SELECT
	MONTH(issue_date) as Month_Num,
	DATENAME(MONTH, issue_date) as Month_Name,
	COUNT(id) as Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
group by		MONTH(issue_date),DATENAME(MONTH, issue_date)
order by 		MONTH(issue_date)

-- State
SELECT
	address_state,
	COUNT(id) as Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
group by address_state
order by SUM(loan_amount) DESC

--Term
SELECT
	term,
	COUNT(id) as Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
group by term
order by term

--Emp Length
SELECT
	emp_length,
	COUNT(id) as Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
group by emp_length
order by COUNT(id) desc

-- Purpose
SELECT
	purpose,
	COUNT(id) as Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
group by purpose
order by COUNT(id) desc

-- Purpose
SELECT
	purpose,
	COUNT(id) as Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
FROM bank_loan_data
group by purpose
order by COUNT(id) desc

-- Home Ownership
	SELECT
		home_ownership,
		COUNT(id) as Total_Loan_Application,
		SUM(loan_amount) as Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
	FROM bank_loan_data
	group by home_ownership
	order by COUNT(id) desc













