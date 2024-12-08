
WITH RECURSIVE
  cnt(x) AS (
     SELECT 0
     UNION ALL
     SELECT x+1 FROM cnt
     LIMIT 216
  ),
  all_hours AS (
    SELECT 
      datetime(
        '2023-09-25', 
        '+' || cnt.x || ' hours'
      ) AS hour
    FROM cnt
  )
SELECT
  strftime('%Y-%m-%d %H', all_hours.hour) AS hour,
  COALESCE(t.trip_count, 0) + COALESCE(u.trip_count, 0) AS trip_count,
  COALESCE(w.total_precipitation, 0) AS total_precipitation,
  COALESCE(w.avg_wind_speed, 0) AS avg_wind_speed
FROM all_hours
LEFT JOIN temp_taxi_rides t ON strftime('%Y-%m-%d %H', all_hours.hour) = t.hour
LEFT JOIN temp_uber_rides u ON strftime('%Y-%m-%d %H', all_hours.hour) = u.hour
LEFT JOIN temp_hourly_weather w ON strftime('%Y-%m-%d %H', all_hours.hour) = w.hour;
