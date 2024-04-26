# BANK LOAN REPORT QUERIES:
#A.BANK LOAN REPORT | SUMMARY.
# KPI’s:
# Total Loan Applications:
select count(*) as Total_loan_applications
from bank_loan_data;
 

# MTD Loan Applications:
select count(id) as MTD_Total_loan_applications
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data); 
 

# PMTD Loan Applications:
select count(id) as PMTD_Total_loan_applications
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) - 1 from bank_loan_data);
 

# MOM = (MTD – PMTD) / PMTD

# Total Funded Amount:
select sum(loan_amount) as total_funded_amount
from bank_loan_data;
 
# MTD Total Funded Amount
select sum(loan_amount) as MTD_total_funded_amount
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data);
 
# PMTD Total Funded Amount
select sum(loan_amount) as PMTD_total_funded_amount
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) - 1 from bank_loan_data);
 


# Total Amount Received
select sum(total_payment) as total_amount_received
from bank_loan_data;
 

# MTD Total Amount Received
select sum(total_payment) as MTD_total_amount_received
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y')))  from bank_loan_data);
 

# PMTD Total Amount Received
select sum(total_payment) as PMTD_total_amount_received
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) - 1  from bank_loan_data);
 


#Average Interest
select round(avg(int_rate) * 100,2) as average_int_rate
from bank_loan_data;
 
# MTD Average Interest
select round(avg(int_rate) * 100,2) as MTD_average_int_rate
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y')))  from bank_loan_data);
 

# MTD Average Interest
select round(avg(int_rate) * 100,2) as PMTD_average_int_rate
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) - 1  from bank_loan_data);
 


# Average DTI
select round(avg(dti) * 100,2) as average_DTI
from bank_loan_data;
 

# MTD Average DTI
select round(avg(dti) * 100,2) as MTD_average_DTI
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y')))  from bank_loan_data);
 

# PMTD Average DTI
select round(avg(dti) * 100,2) as PMTD_average_DTI
from bank_loan_data
where year(str_to_date(issue_date, '%d-%m-%Y')) = (select year(max(str_to_date(issue_date, '%d-%m-%Y'))) from bank_loan_data)
and month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y'))) - 1  from bank_loan_data);
 

# GOOD LOAN ISSUED:
# Good Loan Percentage
select round(count(case when loan_status in  ('Fully Paid', 'Current') then id end) / count(id) * 100, 0) as Good_loan_perccentage 
from bank_loan_data ;
 

# Good Loan Applications
select count(case when loan_status in  ('Fully Paid', 'Current') then id end)  as Good_loan_Application
from bank_loan_data ;
 

# Good Loan Funded Amount:
select sum(case when loan_status in  ('Fully Paid', 'Current') then loan_amount end)  as Good_Loan_Funded_Amount
from bank_loan_data ;
 

#Good Loan Amount Received
select sum(case when loan_status in  ('Fully Paid', 'Current') then total_payment end)  as Good_Loan_Received_Amount
from bank_loan_data ;
 

# BAD LOAN ISSUED:
# Bad Loan Percentag:
select round(count(case when loan_status = 'Charged Off'then id end) / count(id) * 100, 0) as Bad_Loan_Percentage 
from bank_loan_data ;
 
# Bad Loan Applications
select count(case when loan_status = 'Charged Off' then id end)  as Bad_Loan_Application
from bank_loan_data ;
 
# Bad Loan Funded Amount
select sum(case when loan_status = 'Charged Off' then loan_amount end)  as Bad_Loan_Funded_Amount
from bank_loan_data ;
 
# Bad Loan Amount Received
select sum(case when loan_status = 'Charged Off' then total_payment end)  as Bad_Loan_Received_Amount
from bank_loan_data ;
 

# LOAN STATUS:
select
        loan_status,
        count(id) as Total_Loan_Application,
        sum(total_payment) as Total_Amount_Received,
        sum(loan_amount) as Total_Funded_Amount,
        avg(int_rate * 100) as Interest_Rate,
        avg(dti * 100) as DTI
    from
        bank_loan_data
    group by
        loan_status
;
 

select 
loan_status,
 	sum(total_payment) as MTD_Total_Amount_Received,
              sum(loan_amount) as MTD_Total_Funded_Amount
from bank_loan_data
where month(str_to_date(issue_date, '%d-%m-%Y')) = (select month(max(str_to_date(issue_date, '%d-%m-%Y')))  from bank_loan_data)
group by loan_status;
 



#A.	BANK LOAN REPORT | OVERVIEW
#B.	MONTH
select 
	month(str_to_date(issue_date, '%d-%m-%Y')) AS Month_Munber,
    monthname(str_to_date(issue_date, '%d-%m-%Y')) as Month_name,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by month(str_to_date(issue_date, '%d-%m-%Y')), monthname(str_to_date(issue_date, '%d-%m-%Y'))
order by month(str_to_date(issue_date, '%d-%m-%Y')) ;


#STATE
select 
	address_state,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by address_state
order by sum(loan_amount) desc ;
 

#TERM
select 
	term,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by term
order by term;
 

#EMPLOYEE LENGTH
select 
	emp_length,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by emp_length
order by emp_length;
 

#PURPOSE
select  purpose,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by purpose
order by count(id) desc;


 

#HOME OWNERSHIP
select 
	home_ownership,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by home_ownership
order by count(id) desc;
 


#Note: We have applied multiple Filters on all the dashboards. You can check the results for the filters as well by modifying the query and comparing the results.
#For e.g
#See the results when we hit the Grade A in the filters for dashboards.


