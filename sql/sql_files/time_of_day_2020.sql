# Time of day classification
SELECT 
CASE 
WHEN HOUR (started_at) BETWEEN 6 and 11 THEN 'Morning'
WHEN HOUR (started_at) BETWEEN 12 and 17 THEN 'Afternoon'
WHEN HOUR (started_at) BETWEEN 18 and 22 THEN 'Evening'
ELSE 'Night'
END AS time_of_day,
     CASE 
        WHEN member_casual = 'member' THEN 'Member'
        WHEN member_casual = 'casual' THEN 'Casual'
    END AS user_type,
    COUNT(*) AS trips
    FROM trips_2020
    GROUP BY time_of_day, user_type
    ORDER BY time_of_day, user_type;