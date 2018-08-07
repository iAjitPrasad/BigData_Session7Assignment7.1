EmpDetail = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_details.txt' USING PigStorage(',') AS (EmpID:int,name:chararray,salary:int,DepartmentID:int);

ExpenseDetail = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_expenses.txt' USING PigStorage('\t') AS (id:int,expense:int);

JoinExpense = JOIN EmpDetail by EmpID, ExpenseDetail by id;

MaxExpense = ORDER JoinExpense by expense desc;

LimitMaxExpense = LIMIT MaxExpense 1;

FinalMaxExpense = FOREACH LimitMaxExpense GENERATE EmpID,name;

DUMP FinalMaxExpense;