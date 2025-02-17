--1. Displays the name of each workplace and the name of each plan offered by that workplace alphabetically by workplace name.
SELECT workplaceName, planName
FROM workplaceplan NATURAL JOIN workplace NATURAL JOIN plan
ORDER BY workplaceName ASC;

--2. Increases each member's balance by that member's premium.
UPDATE member
JOIN plan ON member.planID = plan.planID
SET balance = balance + premium;

--3.Displays the member name, procedure name, and date for every procedure performed that has the word 'preventive' (without being case sensitive) in its name.
SELECT memberName, procedureName, date
FROM member NATURAL JOIN procedureperformance NATURAL JOIN healthcareprocedure
WHERE LOWER(procedureName) LIKE '%preventive%';

--4. Lists the name of each workplace along with the number of members from that workplace.
SELECT workplaceName, COUNT(memberID) AS NumberOfMembers
FROM workplace LEFT OUTER JOIN member ON workplace.workplaceID = member.workplaceID
GROUP BY workplaceName;

--5. Creates a procedure called eob that has a memberID as a parameter that displays a table containing the procedure name, date, allowed amount, and copay for every procedure performed on that member.
DELIMITER $$
CREATE PROCEDURE eob(memberID CHAR(16))
BEGIN
SELECT procedureName, date, allowedAmt, copay
FROM member NATURAL JOIN procedureperformance PrP NATURAL JOIN healthcareprocedure NATURAL JOIN planprocedure
WHERE PrP.memberID = memberID;
END $$
DELIMITER ;

CALL eob('OY1OYNGF2591BETZ');
CALL eob('YP1GXPPX9TNTLY2C');

--6. Lists the name of each employee on the most recent call made by the member with the specified id. This example refers to a member having the id OY1OYNGF2591BETZ.
SELECT empName
FROM agent NATURAL JOIN callagent
WHERE datetime = (SELECT datetime
				  FROM phonecall
                  WHERE phonecall.memberID = 'OY1OYNGF2591BETZ'
				  ORDER BY datetime DESC
				  LIMIT 1);

--7. Lists (without duplicates) the names of all employees who participated in any call requiring multiple employees.
SELECT DISTINCT empName
FROM agent NATURAL JOIN callagent
WHERE datetime IN (SELECT datetime
	               FROM callagent
	               GROUP BY datetime
	               HAVING COUNT(empID) > 1);

--8. Displays the name of each plan along with the average profit per member enrolled in that plan.
SELECT planName, CONCAT("$", FORMAT(AVG(TotalProfit), 2)) AS AverageProfitPerMember
FROM (SELECT P.planName, M.memberID, P.premium - GREATEST((SUM(PlP.allowedAmt - PlP.copay) - P.deductible), 0) AS TotalProfit
	  FROM Member M
	  JOIN Plan P ON M.planID = P.planID
	  JOIN ProcedurePerformance PrP ON M.memberID = PrP.memberID
	  JOIN PlanProcedure PlP ON PrP.medicalCode = PlP.medicalCode AND P.planID = PlP.planID
	  GROUP BY P.planName, M.memberID) AS ProfitPerMember
GROUP BY planName;


