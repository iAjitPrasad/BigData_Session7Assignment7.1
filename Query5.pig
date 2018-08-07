EmpDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_details.txt' USING PigStorage(',') AS (EmpID:int,name:chararray,salary:int,DepartmentID:int);

ExpenseDetails = LOAD '/hadoopdata/pig/EmployeeDatasets/Input/employee_expenses.txt' USING PigStorage('\t') AS (id:int,expense:int);

NonCommonEmp = JOIN EmpDetails by EmpID LEFT OUTER, ExpenseDetails by id;

NoExpenseEntry = FILTER NonCommonEmp BY id is null;

FinalNoEntry = FOREACH NoExpenseEntry GENERATE EmpID,name;

DUMP FinalNoEntry;