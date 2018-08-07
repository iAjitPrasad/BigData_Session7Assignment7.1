EmpDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_details.txt' USING PigStorage(',') AS(EmpID:int,name:chararray,salary:int,DepartmentID:int);

ExpenseDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_expenses.txt' USING PigStorage(' ') AS (id:int,expense:int);

ratingOrder = ORDER EmpDetails BY DepartmentID asc;

limit5 = limit ratingOrder 5;

SPLIT limit5 into rating1 if DepartmentID == 1, rating2 if DepartmentID == 2;

orderedRating1 = ORDER rating1 by name asc;

Sol1 = UNION rating2,orderedRating1;

SolFinal = FOREACH Sol1 GENERATE EmpID,name;

dump SolFinal;
