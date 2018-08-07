EmpDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_details.txt' USING PigStorage(',') AS(EmpID:int,name:chararray,salary:int,DepartmentID:int);

ExpenseDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_expenses.txt' USING PigStorage('\t') AS (id:int,expense:int);

CommonExpense = JOIN EmpDetails by EmpID, ExpenseDetails by id;

ListExpense = FOREACH CommonExpense GENERATE EmpID,name;

FinalEntry = DISTINCT ListExpense;

DUMP FinalEntry;