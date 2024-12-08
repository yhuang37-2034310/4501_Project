
WITH trip_distances AS (
    SELECT taxi_trips.trip_distance AS trip_distance
    FROM taxi_trips
    WHERE taxi_trips.pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    UNION ALL
    SELECT uber_trips.trip_distance AS trip_distance
    FROM uber_trips
    WHERE uber_trips.pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
),
ordered_distances AS (
    SELECT 
        trip_distance,
        ROW_NUMBER() OVER (ORDER BY trip_distance) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM trip_distances
)
SELECT trip_distance
FROM ordered_distances
WHERE row_num = CAST(0.95 * total_rows AS INTEGER);
