#average trip duration by user type
SELECT 
    CASE 
        WHEN member_casual = 'member' THEN 'Member'
        WHEN member_casual = 'casual' THEN 'Casual'
    END AS user_type,
    ROUND(AVG(TIMESTAMPDIFF(SECOND, started_at, ended_at)) / 60, 1) AS avg_duration_mins,  # to convert seconds to minutes
    CASE 
        WHEN ROUND(AVG(TIMESTAMPDIFF(SECOND, started_at, ended_at)) / 60, 1) > 20 THEN 'Leisurely'
        ELSE 'Quick trip'
    END AS ride_style
FROM trips_2020
GROUP BY user_type;