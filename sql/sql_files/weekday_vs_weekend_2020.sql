# compare weekday vs weekday usage 
SELECT  
    CASE 
        WHEN member_casual = 'member' THEN 'Member'
        WHEN member_casual = 'casual' THEN 'Casual'
    END AS user_type,
    CASE 
        WHEN DAYOFWEEK(started_at) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS trips
FROM trips_2020
GROUP BY day_type, user_type
ORDER BY day_type, user_type;