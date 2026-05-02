WITH trips AS(
    SELECT * FROM {{ ref('stg_taxi_trips') }}
),

demand AS(

    SELECT 

        pickup_location_id              AS zone_id,
        DATE_TRUNC('hour', pickup_at)   AS hour,
        DAYOFWEEK(pickup_at)            AS day_of_week,
        HOUR(pickup_at)                 AS hour_of_day,
        COUNT(*)                        AS total_trips,
        AVG(trip_distance_miles)        AS avg_distance,
        AVG(fare_amount)                AS avg_fare,
        SUM(fare_amount)                AS total_revenue

    FROM trips
    GROUP BY 
        pickup_location_id,
        DATE_TRUNC('hour', pickup_at),
        DAYOFWEEK(pickup_at),
        HOUR(pickup_at)
)

SELECT * FROM demand