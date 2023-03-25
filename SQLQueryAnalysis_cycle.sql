---Combining the data together by month i.e jan-feb(Q1),mar-apr(Q2),may-jun(Q3), jul-aug(Q4), sep-oct(Q5), nov-dec(Q6)
SELECT [ride_id],[rideable_type],[started_at],[ended_at]
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q1
FROM
(
SELECT *
FROM 
[dbo].[202101-divvy-tripdata]
UNION
SELECT *
FROM [dbo].[202102-divvy-tripdata]
)A 

---Q2
SELECT [ride_id],[rideable_type],[started_at],[ended_at]
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q2
FROM
(
SELECT *
FROM 
[dbo].[202103-divvy-tripdata]
UNION
SELECT *
FROM [dbo].[202104-divvy-tripdata]
)A

---Q3
SELECT [ride_id],[rideable_type],[started_at],[ended_at]
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q3
FROM
(
SELECT *
FROM 
[dbo].[202105-divvy-tripdata]
UNION
SELECT *
FROM [dbo].[202106-divvy-tripdata]
)A 

---Q4
SELECT [ride_id],[rideable_type],[started_at],[ended_at]
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],ride_date,[ride_year],[ride_month],[weekdays]
INTO Q4
FROM
(
SELECT *
FROM 
[dbo].[202107-divvy-tripdata]
UNION
SELECT *
FROM 
[dbo].[202108-divvy-tripdata]
)A 

---Q5
SELECT [ride_id],[rideable_type],[started_at],[ended_at]
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q5
FROM
(
SELECT *
FROM 
[dbo].[202109-divvy-tripdata]
UNION
SELECT *
FROM 
[dbo].[202110-divvy-tripdata]
)A 

---Q6
SELECT [ride_id],[rideable_type],[started_at],[ended_at]
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q6
FROM
(
SELECT *
FROM 
[dbo].[202111-divvy-tripdata]
UNION
SELECT *
FROM 
[dbo].[202112-divvy-tripdata]
)A 

---Combining the Q's tables into a single one i.e Q1-Q2(Q7), Q3-Q4(Q8), Q5-Q6(Q9), Q7-Q8(Q10),Q9-Q10(Cyclistic_2021) as a complete dataset
SELECT [ride_id],[rideable_type],[started_at],
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q7
FROM
(
SELECT *
FROM 
[dbo].[Q1]
UNION
SELECT *
FROM 
[dbo].[Q2]
)A 
---
SELECT [ride_id],[rideable_type],[started_at],
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q8
FROM
(
SELECT *
FROM 
[dbo].[Q3]
UNION
SELECT *
FROM 
[dbo].[Q4]
)A 
---
SELECT [ride_id],[rideable_type],[started_at],
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q9
FROM
(
SELECT *
FROM 
[dbo].[Q5]
UNION
SELECT *
FROM 
[dbo].[Q6]
)A 

---
SELECT [ride_id],[rideable_type],[started_at],
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Q10
FROM
(
SELECT *
FROM 
Q7
UNION
SELECT *
FROM 
Q8
)A 

---
SELECT [ride_id],[rideable_type],[started_at],
[start_station_name],[start_station_id],
[end_station_name],[end_station_id],[start_lat],start_lng,end_lng,end_lat,[member_casual],
[ride_length],[started_at2],[ended_at2],[ride_date],[ride_year],[ride_month],[weekdays]
INTO Cyclistic_2021
FROM
(
SELECT *
FROM 
Q9
UNION
SELECT *
FROM 
Q10
)A 

---Exploring complete dataset/
SELECT DISTINCT ride_month
FROM Cyclistic_2021
ORDER BY 1 ASC

---Cleaning dataset ;checking for presence of null values.
---Using the DISTINCT function can help in checking for the unique values in a	column
SELECT DISTINCT *
FROM Cyclistic_2021

SELECT DISTINCT[ride_id]
FROM Cyclistic_2021
WHERE ride_id IS NULL
SELECT DISTINCT[rideable_type]
FROM Cyclistic_2021
WHERE rideable_type IS NULL
SELECT DISTINCT[started_at]
FROM Cyclistic_2021
WHERE started_at IS NULL
SELECT DISTINCT[start_station_name]
FROM Cyclistic_2021
WHERE start_station_name IS NULL
SELECT DISTINCT[start_station_id]--- presence of NULL
FROM Cyclistic_2021
WHERE start_station_id IS NULL
SELECT DISTINCT[end_station_name]--- presence of NULL
FROM Cyclistic_2021
WHERE end_station_name IS NULL
SELECT DISTINCT[end_station_id]--- presence of NULL
FROM Cyclistic_2021
WHERE end_station_id IS NULL
SELECT DISTINCT[start_lat]--- presence of NULL
FROM Cyclistic_2021
WHERE start_lat IS NULL
SELECT DISTINCT start_lng
FROM Cyclistic_2021
WHERE start_lng IS NULL
SELECT DISTINCT end_lng--- presence of NULL
FROM Cyclistic_2021
WHERE end_lng IS NULL
SELECT DISTINCT end_lat--- presence of NULL
FROM Cyclistic_2021
WHERE end_lat IS NULL
SELECT DISTINCT[member_casual]
FROM Cyclistic_2021
WHERE member_casual IS NULL
SELECT DISTINCT[ride_length]--- presence of NULL
FROM Cyclistic_2021
WHERE ride_length IS NULL
SELECT DISTINCT[started_at2]
FROM Cyclistic_2021
WHERE started_at2 IS NULL
SELECT DISTINCT[ended_at2]
FROM Cyclistic_2021
WHERE ended_at2 IS NULL
SELECT DISTINCT[ride_date]
FROM Cyclistic_2021
WHERE ride_date IS NULL
SELECT DISTINCT[ride_year]
FROM Cyclistic_2021
WHERE ride_year IS NULL
SELECT DISTINCT[ride_month]
FROM Cyclistic_2021
WHERE ride_month IS NULL
SELECT DISTINCT[weekdays]
FROM Cyclistic_2021
WHERE weekdays IS NULL

---To remove the null values from the dataset
SELECT *
INTO clean_cyclistic_2021
FROM Cyclistic_2021
WHERE start_station_id IS NOT NULL AND end_station_name IS NOT NULL AND end_station_id IS NOT NULL AND start_lat IS NOT NULL
      AND end_lng IS NOT NULL AND end_lat IS NOT NULL AND ride_length IS NOT NULL

---Statistical Analysis
SELECT *
FROM clean_cyclistic_2021

---Using ride_id as Total_ride and getting the no of rides taken in 2021
SELECT COUNT(ride_id)AS Total_ride
FROM clean_cyclistic_2021
/*There was a total of 4588187 rides in 2021*/

---What ride_id had the most ride_length 
SELECT COUNT(ride_id)AS Total_ride,ride_id,ride_length
FROM clean_cyclistic_2021
GROUP BY ride_length,ride_id
ORDER BY ride_length DESC
/*ride_id 6E5EE2BE94DE1F9C with ride_length of 23:59:57.0000000*/

---Finding the average of ride_length
SELECT AVG(ride_length)---with this the AVG can't be gotten since ride_length is in a Time datatype
FROM clean_cyclistic_2021--- so it needs to be converted to float 

SELECT CAST(ride_length AS float)AS duration --- So converting to float did not work 
---I will try converting it to decimal then to date time in other to give me a better result.
SELECT CAST(ride_length AS decimal)AS duration ---also converting time to decimal also did not work

--So, I converted theride_length time to datetime then to float to get the average.
SELECT AVG(CAST (ride_length_time AS float)) AS duration,member_casual
FROM
(
SELECT CAST(ride_length AS datetime) AS ride_length_time
FROM clean_cyclistic_2021
)a

/*ride_length had an average of 0.0139287681978297 using excel to convert to time 12:20:03am*/

---Getting the average of both annual member and casual riders
---member
SELECT AVG(CAST (ride_length_time AS float)) AS duration,member_casual
FROM
(
SELECT CAST(ride_length AS datetime) AS ride_length_time, member_casual
FROM clean_cyclistic_2021
)a
WHERE member_casual ='member'
GROUP BY member_casual ---annual member had an average of 0.00914908534587948 with a time of 12:13:10 am
 
 ---casual
 SELECT AVG(CAST (ride_length_time AS float)) AS duration,member_casual
FROM
(
SELECT CAST(ride_length AS datetime) AS ride_length_time, member_casual
FROM clean_cyclistic_2021
)a
WHERE member_casual ='casual'
GROUP BY member_casual ---casual riders had an average of 0.019855375097876 with a time of 12:28:36 am
/*By conclusion casual riders and annual member had a time difference of 13 minute 56 seconds.*/
  
  ---(finding the longest ride_length)
  SELECT MAX(ride_length) AS max_ridelength
  FROM clean_cyclistic_2021 ---23:59:57.0000000
  ---longest ride based on member and casual
    SELECT MAX(ride_length) AS max_ridelength
  FROM clean_cyclistic_2021
  WHERE member_casual = 'member'---23:46:34.0000000

  SELECT MAX(ride_length) AS max_ridelength
  FROM clean_cyclistic_2021
  WHERE member_casual = 'casual'---23:59:57.0000000

  --finding the shortest ride_length
  SELECT MIN(ride_length) AS max_ridelength
  FROM clean_cyclistic_2021 ---00:00:00.0000000
  ---longest ride based on member and casual
    SELECT MIN(ride_length) AS max_ridelength
  FROM clean_cyclistic_2021
  WHERE member_casual = 'member'---00:00:00.0000000

  SELECT MIN(ride_length) AS max_ridelength
  FROM clean_cyclistic_2021
  WHERE member_casual = 'casual'---00:00:00.0000000

  ---Finding the percentage of annual member and casual riders
  SELECT total_ride,total_member_ride,total_casual_ride,total_ride/total_member_ride , total_ride/total_casual_ride 
  FROM
  ( SELECT COUNT(ride_id) AS total_ride,
  COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS total_member_ride,
  COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS total_casual_ride
  FROM clean_cyclistic_2021
  )a

  ---Finding the median ride_length 
  SELECT DISTINCT Median_ride_length, member_casual
 FROM
 (
 SELECT TOP 2
 ride_id, ride_length, member_casual,
 PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY ride_length) OVER (PARTITION BY ride_length) AS Median_ride_length
 FROM clean_cyclistic_2021
 ORDER BY Median_ride_length DESC
 )a--- having a median of 23:59:22.0000000 and 23:59:57.0000000

    ---Finding the median ride_length of annual member and casual riders
	SELECT DISTINCT Median_ride_length, member_casual
	FROM
	(SELECT TOP 2
	ride_id, ride_length, member_casual,
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_length) OVER (PARTITION BY member_casual)Median_ride_length
	FROM clean_cyclistic_2021
	WHERE member_casual = 'member'
	ORDER BY Median_ride_length
	)a--- member had a median of 00:09:43.0000000

	--casual
	SELECT DISTINCT Median_ride_length, member_casual
	FROM
	(SELECT TOP 2
	ride_id, ride_length, member_casual,
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_length) OVER (PARTITION BY member_casual)Median_ride_length
	FROM clean_cyclistic_2021
	WHERE member_casual = 'casual'
	ORDER BY Median_ride_length
	)a--- member had a median of 00:16:39.0000000


/*Descriptive Analysis*/
---updating the weekdays in actual day
---convert to weekdays to varchar
SELECT CAST(weekdays AS varchar)AS weekday,*
INTO data
FROM clean_cyclistic_2021

UPDATE data
SET 
	weekday =
CASE
	WHEN weekday ='1' THEN 'Sunday'
	WHEN weekday = '2' THEN 'Monday'
	WHEN weekday = '3' THEN 'Tuesday'
	WHEN weekday = '4' THEN 'Wednesday'
	WHEN weekday = '5' THEN 'Thursday'
	WHEN weekday = '6' THEN 'Friday'
	WHEN weekday = '7' THEN 'Sunday'
END
WHERE weekdays IN (1,2,3,4,5,6,7)

---Getting the total no of rides based on the month,year,member_casual,rideable type and weekday
SELECT COUNT(ride_id) AS total_rides, ride_month,ride_year,member_casual,rideable_type,weekday
INTO data1
FROM data
GROUP BY ride_month,ride_year,member_casual,rideable_type,weekday
ORDER BY ride_month ASC
--- including the median daylength by casual riders and annual member
 SELECT DISTINCT Median_ride_length, member_casual
 FROM
 (
 SELECT TOP 100
 ride_id, ride_length, member_casual,
 PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY ride_length) OVER (PARTITION BY ride_length) AS Median_ride_length
 FROM clean_cyclistic_2021
 ORDER BY Median_ride_length DESC
 )A

---finding the most frequent place of visit by riders and casual
SELECT 
     end_station_name, member_casual,
        SUM(
            CASE WHEN ride_id = ride_id AND end_station_name = end_station_name THEN 1 ELSE 0 END
            ) AS total,
        SUM(
            CASE WHEN member_casual = 'member' AND end_station_name = end_station_name THEN 1 ELSE 0 END
            ) AS member,
        SUM(
            CASE WHEN member_casual = 'casual' AND end_station_name = end_station_name THEN 1 ELSE 0 END
            ) AS casual
FROM 
        clean_cyclistic_2021
GROUP BY 
        end_station_name, member_casual
ORDER BY 
        total DESC

		SELECT *
		FROM data1