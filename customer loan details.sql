CREATE TABLE customers (
    loan_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
	salary INT,
	company_name VARCHAR(255),
    loan_disburse_year VARCHAR(4)
);

INSERT INTO customers (loan_id, first_name, last_name, email, salary, company_name, loan_disburse_year) VALUES 
(1, 'ramesh', 'raj', 'ramesh@example.com', '100000','wipro','2021'),
(2, 'raj', 'kumar', 'rajkumar@example.com','95000','tcs', '2021'),
(3, 'muni', 'mahesh', 'muni@example.com','110000','cognizant', '2021'),
(4, 'prasad', 'singh', 'prasad@example.com','88000','ibm', '2021'),
(5, 'ramesh', 'mathew', 'ramesh@example.com','97000','wipro' ,'2021'),
(6, 'rakesh', 'babu', 'rakeshbabu@example.com', '102000','ibm','2021'),
(7, 'michael', 'madhan', 'michael@example.com', '85000','cognizant','2021'),
(8, 'megala', 'gopal', 'megala@example.com','115000','tcs', '2021'),
(9, 'harish', 'patel', 'harish@example.com','104000','minetree' ,'2021'),
(10, 'chitra', 'priya', 'chitrapriya@example.com','110000','tcs' ,'2021');

CREATE TABLE customer_details (
    loan_id INT,
    father_name VARCHAR(255),
    cust_location VARCHAR(255),
    loan_amount INT,
    FOREIGN KEY (loan_id) REFERENCES customers(loan_id)
);

INSERT INTO customer_details (loan_id, father_name, cust_location, loan_amount) VALUES 
(1, 'ranganathan', 'salem', 67000),
(2, 'muthusamy', 'namakkal', 150000),
(3, 'rathinaraj', 'erode', 120000),
(4, 'arunachalam', 'namakkal', 70000),
(5, 'rayappan', 'salem', 140000),
(6, 'govindaraj', 'namakkal', 98000),
(7, 'murugesan', 'salem', 100000),
(8, 'bhaskar', 'erode', 55000),
(9, 'selvaraj', 'namakkal', 93000),
(10, 'jayavel', 'salem', 75000);

CREATE TABLE loan_type (
    loan_id INT,
    loan_type VARCHAR(255),
    loan_tenure_years INT,
    insurance_amount  INT,
    FOREIGN KEY (loan_id) REFERENCES customers(loan_id)
);

INSERT INTO loan_type (loan_id, loan_type, loan_tenure_years, insurance_amount) VALUES
(1, 'twowheeler_loan', 4,723 ),
(2, 'personal_loan', 3, 1634),
(3, 'personal_loan', 4, 1356),
(4, 'gold_loan', 5, 895),
(5, 'personal_loan', 5, 1521),
(6, 'twowheeler_loan', 4, 999),
(7, 'gold_loan', 5, 1101),
(8, 'gold_loan', 3, 657),
(9, 'personal_loan', 5, 1003),
(10, 'twowheeler_loan', 3, 780);


CREATE TABLE sales_managers (
    emp_id INT,
    emp_name VARCHAR(255),
    emp_location VARCHAR(255),
    loan_type VARCHAR(255),
    experience INT
);

INSERT INTO sales_managers (emp_id, emp_name, emp_location, loan_type, experience) VALUES
(1, 'karthick', 'salem', 'gold_loan', 2),
(2, 'chandrasekaran', 'salem', 'personal_loan', 4),
(3, 'manikandan', 'salem', 'twowheeler_loan', 3);

--TO FIND MAXIMUM SALARY OF COMPANYS
select company_name, max(salary)
from customers
group by company_name

--TO GET PERSONAL LOAN TENURE AND INSURANCE
select * from loan_type
where loan_type in(select loan_type from loan_type where loan_type='personal_loan')

--TO GETTING LOAN_ID WITH EACH PRODUCT SALESMANAGERS
select loan_id,emp_name from loan_type l,sales_managers s
where l.loan_type = s.loan_type

--TO GETTING MAXIMUM SALARY OF EACH COMPANY WITH CUSTOMER FIRST_NAME
select first_name,salary,company_name from customers c1
where salary=(select max(salary)from customers c2 where c1.salary=c2.salary)

--TO GETTING LOCATION WISE SALARY less than 100000
select loan_id,cust_location,loan_amount from(select * from customer_details where loan_amount<100000 )a


--TO VIEW ALL TABLES
select * from customers
select * from customer_details
select * from loan_type
select * from sales_managers


