use F1_Data;
   
SELECT Manu.Manu_name, AVG(Result.Fastest_lapSpeed) AS avg_speed
FROM Result
JOIN Manu ON Result.Manu_id = Manu.Manu_id
GROUP BY Manu.Manu_name
HAVING COUNT(DISTINCT Result.Race_id) >= 5
ORDER BY avg_speed DESC
LIMIT 10;

SELECT Manu.Manu_name, Driver.first_name, Driver.last_name, AVG(Result.Fastest_lapSpeed) AS avg_speed
FROM Result
JOIN Manu ON Result.Manu_id = Manu.Manu_id
JOIN Driver ON Result.Driver_id = Driver.Driver_id
WHERE Driver.Nationality = 'British'
GROUP BY Manu.Manu_name, Driver.first_name, Driver.last_name
HAVING COUNT(DISTINCT Result.Race_id) >= 5
ORDER BY avg_speed DESC
LIMIT 10;

SELECT Manu.Manu_name, Driver.first_name, Driver.last_name, AVG(Result.Fastest_lapSpeed) AS avg_speed
FROM Result
JOIN Manu ON Result.Manu_id = Manu.Manu_id
JOIN Driver ON Result.Driver_id = Driver.Driver_id
WHERE Driver.Nationality = 'Italian'
GROUP BY Manu.Manu_name, Driver.first_name, Driver.last_name
HAVING COUNT(DISTINCT Result.Race_id) >= 5
ORDER BY avg_speed DESC
LIMIT 10;

SELECT Driver.first_name, Driver.last_name, COUNT(Result.Result_id) AS num_results
FROM Driver
LEFT JOIN Result ON Driver.Driver_id = Result.Driver_id
GROUP BY Driver.Driver_id
HAVING num_results >= 10
ORDER BY num_results DESC;

SELECT Driver.nationality, Driver.first_name, COUNT(*) AS num_drivers
FROM Driver
GROUP BY Driver.nationality, Driver.first_name;

SELECT 
    Circuit.Country, 
    Circuit.Location, 
    COUNT(*) AS Number_of_Races, 
    AVG(Result.Fastest_lapSpeed) AS Average_Fastest_Lap_Speed
FROM Circuit
JOIN Result ON Circuit.Circuit_id = Result.Race_id
GROUP BY Circuit.Country, Circuit.Location
ORDER BY Number_of_Races DESC;

INSERT INTO Circuit (Circuit_id, Circuit_name, Location, Country)
VALUES (6, 'Monza', 'Monza, Italy', 'Italy');

INSERT INTO Driver (Driver_id, first_name, last_name, Nationality)
VALUES (29, 'Chad', 'Owen', 'American');

UPDATE Lap
SET Lap_time = '01:30.253'
WHERE Lap = 100;

UPDATE Circuit
SET Location = 'Los Angeles', Country = 'United State'
WHERE Circuit_id = 300; 

SELECT Driver.first_name, Driver.last_name, AVG(Lap.Lap_time) AS avg_lap_time
FROM Lap
JOIN Driver ON Lap.Driver_id = Driver.Driver_id
GROUP BY Driver.first_name, Driver.last_name
ORDER BY avg_lap_time ASC;
