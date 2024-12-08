
CREATE TABLE IF NOT EXISTS hourly_weather (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME,
    latitude REAL,
    longitude REAL,
    hourly_precipitation REAL,
    hourly_wind_speed REAL,
    daily_snowfall REAL,
    daily_id INTEGER, 
    FOREIGN KEY (daily_id) REFERENCES daily_weather(id)
);

CREATE TABLE IF NOT EXISTS daily_weather (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME,
    latitude REAL,
    longitude REAL,
    daily_precipitation REAL,
    daily_wind_speed REAL,
    daily_snowfall REAL
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pickup_datetime DATETIME,
    trip_distance REAL,
    pickup_location_id INTEGER,
    dropoff_location_id INTEGER,
    base_passenger_fare REAL,
    rush_hour_surcharge REAL,
    mta_tax REAL,
    tip_amount REAL,
    tolls_amount REAL,
    improvement_surcharge REAL,
    total_amount REAL,
    congestion_surcharge REAL,
    airport_fee REAL
    centroid_lat REAL, 
    centroid_lon REAL
);

CREATE TABLE IF NOT EXISTS uber_trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    request_datetime DATETIME,
    pickup_datetime DATETIME,
    trip_distance REAL,
    pickup_location_id INTEGER,
    dropoff_location_id INTEGER,
    base_passenger_fare REAL,
    tip_amount REAL,
    tolls_amount REAL,
    black_car_fund_fee REAL,
    total_amount REAL,
    sales_tax REAL,
    congestion_surcharge REAL,
    airport_fee REAL,
    centroid_lat REAL, 
    centroid_lon REAL
);

CREATE TABLE IF NOT EXISTS taxi_zones (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    zone TEXT, 
    location_id INTEGER
);
