
SELECT date(u.pickup_datetime) AS date,
       COUNT(*) AS rides, 
       d.daily_precipitation, 
       d.daily_wind_speed, 
       AVG(u.trip_distance) AS avg_trip_distance
FROM uber_trips u
JOIN daily_weather d 
  ON date(u.pickup_datetime) = date(d.date)
WHERE u.pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
  AND d.daily_precipitation IS NOT NULL
GROUP BY date(u.pickup_datetime)
ORDER BY COUNT(*) DESC
LIMIT 10;
