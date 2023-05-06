use employees;
select first_name, last_name from employees
where first_name like 'Sa%' or last_name like 'P%' and last_name like '____';
      