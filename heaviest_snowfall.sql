
SELECT date(u.pickup_datetime) AS date,
       d.daily_snowfall, 
       COUNT(*) as rides
FROM uber_trips u
JOIN daily_weather d 
  ON date(u.pickup_datetime) = date(d.date)
WHERE u.pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
  AND d.daily_snowfall NOT IN ('T', '')
GROUP BY date(u.pickup_datetime)
ORDER BY daily_snowfall DESC
LIMIT 10;
