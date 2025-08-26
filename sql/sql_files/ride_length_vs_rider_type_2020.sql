# to compare ride length grouped by rider category (member/casual)
SELECT 
    CASE 
        WHEN member_casual = 'member' THEN 'Member'
        WHEN member_casual = 'casual' THEN 'Casual'
    END AS user_type,
    CASE 
        WHEN TIMESTAMPDIFF(SECOND, started_at, ended_at) < 300 THEN 'Very Short (<5 min)'
        WHEN TIMESTAMPDIFF(SECOND, started_at, ended_at) BETWEEN 300 AND 900 THEN 'Short (5-15 min)'
        WHEN TIMESTAMPDIFF(SECOND, started_at, ended_at) BETWEEN 901 AND 1800 THEN 'Medium (15-30 min)'
        WHEN TIMESTAMPDIFF(SECOND, started_at, ended_at) BETWEEN 1801 AND 3600 THEN 'Long (30-60 min)'
        ELSE 'Very Long (60+ min)'
    END AS ride_length_category,
    COUNT(*) AS total_rides
FROM trips_2020
GROUP BY user_type, ride_length_category
ORDER BY ride_length_category DESC;