Use predictiveMaintenance;
---- Query 1: Total number of machine failures
Select Count(*) As
Total_Failures 
From predictive_maintenance
where Target=1;

-- Query 2: Failure count by machine type
Select Type,count(*) as Failures
From predictive_maintenance
where Target=1
Group By Type 
order by Failures DESC

-- Query 3: Average sensor readings by failure status
SELECT Target,
       AVG(Air_temperature_K) AS Avg_Air_Temp,
       AVG(Process_temperature_K) AS Avg_Process_Temp,
       AVG(Torque_Nm) AS Avg_Torque,
       AVG(Tool_wear_min) AS Avg_Tool_Wear
FROM predictive_maintenance
GROUP BY Target;

-- Query 4: Top 10 machines with highest tool wear
SELECT TOP 10 *
FROM predictive_maintenance
ORDER BY Tool_wear_min DESC;

-- Query 5: Machines with high torque
SELECT *
FROM predictive_maintenance
WHERE Torque_Nm > 60;

-- Query 6: Machines with high process temperature
SELECT *
FROM predictive_maintenance
WHERE Process_temperature_K > 310;

-- Query 7: Failure count by Failure Type
SELECT Failure_Type, COUNT(*) AS Total
FROM predictive_maintenance
GROUP BY Failure_Type
ORDER BY Total DESC;

-- Query 8: Average rotational speed by machine type
SELECT Type,
       AVG(Rotational_speed_rpm) AS Avg_RPM
FROM predictive_maintenance
GROUP BY Type;


-- Query 9: Total machines by type
SELECT Type,
       COUNT(*) AS Total_Machines
FROM predictive_maintenance
GROUP BY Type;

-- Query 10: Failed machines with high tool wear
SELECT *
FROM predictive_maintenance
WHERE Target = 1
AND Tool_wear_min > 150;



