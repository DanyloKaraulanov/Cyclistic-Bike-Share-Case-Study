#average trip duration by user type
SELECT 
 CASE 
        WHEN user_type = 'Subscriber' THEN 'Member'
        WHEN user_type = 'Customer' THEN 'Casual'
    END AS user_type,
    ROUND(AVG(trip_duration)/60, 1) AS avg_duration_mins, # to convert seconds into minutes. If >20 then Leisurely; if <20 then Quick trip
    CASE 
    WHEN ROUND(AVG(trip_duration)/60, 1) > 20 THEN 'Leisurely'
    ELSE 'Quick trip'
    END AS ride_style
    FROM trips_2019
    GROUP BY user_type