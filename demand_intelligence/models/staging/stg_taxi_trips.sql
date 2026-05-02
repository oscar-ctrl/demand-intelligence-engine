WITH main_source AS(
    SELECT * FROM raw_taxi_trips
),

cleaned AS(

    SELECT 
        VendorID                    AS vendor_id,
        tpep_pickup_datetime        AS pickup_at,
        tpep_dropoff_datetime       AS dropoff_at,
        passenger_count             AS passenger_count,
        trip_distance               AS trip_distance_miles,
        PULocationID                AS pickup_location_id,
        DOLocationID                AS dropoff_location_id,
        fare_amount                 AS fare_amount,
        total_amount                AS total_amount

    FROM main_source
    WHERE 
        tpep_pickup_datetime IS NOT NULL
        AND fare_amount > 0
        AND fare_amount IS NOT NULL
        AND total_amount > 0
        AND total_amount IS NOT NULL
        AND trip_distance > 0
        AND trip_distance IS NOT NULL
)

SELECT * FROM cleaned