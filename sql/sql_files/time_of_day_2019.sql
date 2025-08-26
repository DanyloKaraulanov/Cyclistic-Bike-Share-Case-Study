# Time of day classification
SELECT 
CASE 
WHEN HOUR (start_time) BETWEEN 6 and 11 THEN 'Morning'
WHEN HOUR (start_time) BETWEEN 12 and 17 THEN 'Afternoon'
WHEN HOUR (start_time) BETWEEN 18 and 22 THEN 'Evening'
ELSE 'Night'
END AS time_of_day,
 CASE 
        WHEN user_type = 'Subscriber' THEN 'Member'
        WHEN user_type = 'Customer' THEN 'Casual'
    END AS user_type,
    COUNT(*) AS trips
    FROM trips_2019
    GROUP BY time_of_day, user_type
    ORDER BY time_of_day, user_type;