
SELECT strftime('%w', pickup_datetime) AS day_of_week,
       COUNT(*) as rides
FROM uber_trips
GROUP BY day_of_week
ORDER BY rides DESC
