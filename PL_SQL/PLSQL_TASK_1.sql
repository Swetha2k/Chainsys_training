--Write a PL/SQL program to arrange the number of two variable in such a way that the small number will store in num_small variable and large number will store in num_large variable.

DECLARE
A NUMBER DEFAULT 8;
B NUMBER DEFAULT 9;
NUM_SMALL NUMBER;
NUM_LARGE NUMBER;
BEGIN
IF A > B THEN
    NUM_LARGE := A; 
    NUM_SMALL := B;
ELSE
    NUM_LARGE := B; 
    NUM_SMALL := A;
END IF;
DBMS_OUTPUT.PUT_LINE('LARGE NUMBER : ' || NUM_LARGE);
DBMS_OUTPUT.PUT_LINE('SMALL NUMBER : ' || NUM_SMALL);
END;

--Write a PL/SQL program to check whether a given character is letter or digit.

DECLARE
CHARAC VARCHAR(1) := '&CHARAC';
BEGIN
    IF (CHARAC >= 'A' AND CHARAC <= 'Z') OR (CHARAC >= 'a' AND CHARAC <= 'z') THEN
        DBMS_OUTPUT.PUT_LINE('A lETTER');
    ELSE
        DBMS_OUTPUT.PUT_LINE('A DIGIT');
    END IF;
END;

--Write a program in PL/SQL to print the value of a variable inside and outside a loop using LOOP WHEN EXIT statement.

DECLARE
C NUMBER := 0;
BEGIN 
LOOP
    C := C + 1;
    EXIT WHEN C >= 10;
    DBMS_OUTPUT.PUT_LINE(C);
END LOOP;
DBMS_OUTPUT.PUT_LINE('OUTSIDE LOOP: ' || C);
END;

--Write a PL/SQL program to display which day is a specific date

DECLARE
DAY_SPECIFIC DATE := '&DAY_SPECIFIC';
BEGIN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(day_specific, 'DAY'));
END;

--Write a PL/SQL procedure to calculate the incentive on a specific target otherwise a general incentive to be paid using IF-THEN-ELSE

DECLARE
INCENTIVE NUMBER(10,3) := 0;
TARGETN NUMBER := &TARGETN;
SALARY NUMBER := &SALARY;
BEGIN
IF TARGETN >= 10000 THEN
INCENTIVE := SALARY * 0.1;
ELSIF TARGETN < 10000 AND TARGETN >= 6000 THEN
INCENTIVE := SALARY * 0.08;
ELSIF TARGETN < 10000 AND TARGETN >= 6000 THEN
INCENTIVE := SALARY * 0.05;
ELSE
INCENTIVE := SALARY * 0.02;
END IF;
DBMS_OUTPUT.PUT_LINE('INCENTIVE TO BE PAID: ' || INCENTIVE);
END;

--Write a PL/SQL block to calculate the incentive of an employee whose ID is 101.

DECLARE
INCENTIVE EMPLOYEES_2591.SALARY%TYPE;
BEGIN
SELECT SALARY * 0.05 AS INCENTIVES
INTO INCENTIVE
FROM EMPLOYEES_2591
WHERE EMPLOYEE_ID = 101;
DBMS_OUTPUT.PUT_LINE(INCENTIVE);
END;

-- Write a block to display name, contact no and no of rows from employee table.
DECLARE
NO_OF_ROWS NUMBER;
BEGIN
FOR EBLOCK IN (
SELECT EMPLOYEE_ID, PHONE_NUMBER
FROM EMPLOYEES_2591)LOOP
DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID: ' || EBLOCK.employee_id || ', CONTACT_NO: ' || EBLOCK.PHONE_NUMBER);
END LOOP;
SELECT COUNT(*) 
INTO NO_OF_ROWS
FROM EMPLOYEES_2591;
DBMS_OUTPUT.PUT_LINE('NO OF ROWS: ' || NO_OF_ROWS);
END;


--To develop a procedure named adjust_salary() sample database.
--We’ll update the salary information of employees in the employees table by 
--using SQL UPDATE statement.

CREATE OR REPLACE PROCEDURE ADJUST_SALARY
(EMP_ID IN EMPLOYEES_2591.EMPLOYEE_ID%TYPE,
NEW_SAL IN  EMPLOYEES_2591.SALARY%TYPE) 
IS
BEGIN
UPDATE EMPLOYEES_2591 
SET 
    SALARY = NEW_SAL
WHERE EMPLOYEE_ID = EMP_ID;
END;



















