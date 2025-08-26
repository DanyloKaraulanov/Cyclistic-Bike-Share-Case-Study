# compare weekday vs weekday usage 
SELECT  #comap
 CASE 
        WHEN user_type = 'Subscriber' THEN 'Member'
        WHEN user_type = 'Customer' THEN 'Casual'
    END AS user_type,
CASE 
WHEN day_of_week IN (1, 7) THEN 'Weekend'
ELSE 'Weekday'
END AS day_type,
COUNT(*) AS trips
FROM trips_2019
GROUP BY day_type, user_type
ORDER BY day_type, user_type