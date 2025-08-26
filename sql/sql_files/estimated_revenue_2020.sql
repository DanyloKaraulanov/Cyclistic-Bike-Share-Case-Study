# We estimate that casuals pay $3 per ride； members pay $150 per year
# Estimate casual revenue
SELECT 
    'Casual' AS rider_type,
    CONCAT('$', FORMAT(COUNT(*) * 3, 0)) AS estimated_revenue
FROM trips_2020
WHERE member_casual = 'casual'
UNION ALL
# Estimate member revenue
SELECT 
    'Member' AS rider_type,
    CONCAT('$', FORMAT(COUNT(DISTINCT DATE (started_at), ride_id) * 150, 0)) AS estimated_revenue
# We assume that distinct combination of date + ride id as a rough 'unique member' count
FROM trips_2020
WHERE member_casual = 'member';
