
SELECT strftime('%H', pickup_datetime) AS each_hour,
       COUNT(*) as rides
FROM taxi_trips
GROUP BY each_hour
ORDER BY rides DESC
