EmpDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_details.txt' USING PigStorage(',') AS(EmpID:int,name:chararray,salary:int,DepartmentID:int);

ExpenseDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_expenses.txt' USING PigStorage(' ') AS (id:int,expense:int);

Odd = FILTER EmpDetails BY (EmpID%2 != 0);

SalOrder = ORDER Odd BY salary desc;

Limit3 = limit SalOrder 3;

Sol2 = FOREACH Limit3 GENERATE EmpID,name;

dump Sol2;
