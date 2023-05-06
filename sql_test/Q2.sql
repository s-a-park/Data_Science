use employees;
select emp_no, hire_date, first_name, last_name from employees
where hire_date < (select hire_date from employees
				     where first_name='Aamer' and last_name='Slutz');