use employees;
select emp_no, AVG(salary) from salaries
group by emp_no having emp_no='10001';