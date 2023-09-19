create or replace table `uber-data-analytics-399007.uber_dataset.analytics_table`
as(
select f.trip_distance_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
pc.passenger_count,
td.trip_distance,
rc.rate_code_name,
pl.pickup_latitude,
pl.pickup_longitude,
dl.dropoff_latitude,
dl.dropoff_longitude,
pt.payment_type_name,
f.fare_amount,
f.extra,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount,
f.mta_tax
from
`uber-data-analytics-399007.uber_dataset.fact_table` f
join `uber-data-analytics-399007.uber_dataset.datetime_dim` d on f.datetime_id =
d.datetime_id
join `uber-data-analytics-399007.uber_dataset.dropoff_location_dim` dl on
f.dropoff_location_id = dl.dropoff_location_id
join `uber-data-analytics-399007.uber_dataset.passenger_count_dim` pc on
f.passenger_count_id = pc.passenger_count_id
join `uber-data-analytics-399007.uber_dataset.payment_type_dim` pt on
f.payment_type_id = pt.payment_type_id
join `uber-data-analytics-399007.uber_dataset.pickup_location_dim` pl on
f.pickup_location_id = pl.pickup_location_id
join `uber-data-analytics-399007.uber_dataset.rate_code_dim` rc on f.rate_code_id =
rc.rate_code_id
join `uber-data-analytics-399007.uber_dataset.trip_distance_dim` td on
f.trip_distance_id = td.trip_distance_id
);