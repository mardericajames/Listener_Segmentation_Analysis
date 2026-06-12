															/* data cleaning script */
/* Query 1: Check total rows */
select count(*)
from listener_dataset;


/* Query: Check for duplicate user_id */
SELECT user_id, COUNT(*) AS duplicates
FROM listener_dataset
	GROUP BY user_id
	HAVING COUNT(*) > 1;


/* Query: Check for Null Values per Column within the entire dataset */
SELECT COUNT(*) AS total_rows,
    COUNT(CASE WHEN user_id IS NULL THEN 1 END) AS null_user_id,
    COUNT(CASE WHEN gender IS NULL THEN 1 END) AS null_gender,
    COUNT(CASE WHEN age IS NULL THEN 1 END) AS null_age,
    COUNT(CASE WHEN country IS NULL THEN 1 END) ASnull_country,
    COUNT(CASE WHEN subscription_type IS NULL THEN 1 END) AS null_subscription_type,
    COUNT(CASE WHEN listening_time IS NULL THEN 1 END) AS null_listening_time,
    COUNT(CASE WHEN songs_played_per_day IS NULL THEN 1 END) AS null_songs_played_per_day,
    COUNT(CASE WHEN skip_rate IS NULL THEN 1 END) AS null_skip_rate,
    COUNT(CASE WHEN device_type IS NULL THEN 1 END) AS null_device_type,
    COUNT(CASE WHEN ads_listened_per_week IS NULL THEN 1 END) AS null_ads_listened_per_week,
    COUNT(CASE WHEN offline_listening IS NULL THEN 1 END) AS null_offline_listening,
    COUNT(CASE WHEN is_churned IS NULL THEN 1 END) AS null_is_churned
FROM listener_dataset;
    
    
/* Query: Validating Data Ranges/Values in Numeric Columns are usable and realistic */
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    MIN(listening_time) AS min_listnening_time,
    MAX(listening_time) AS max_listnening_time,
    MIN(songs_played_per_day) AS min_songs_played_per_day,
	MAX(songs_played_per_day) AS max_songs_played_per_day,
    MIN(skip_rate) AS min_skip_rate,
    MAX(skip_rate) AS max_skip_rate,
    MIN(ads_listened_per_week) AS min_ads_listened_per_week,
    MAX(ads_listened_per_week) AS max_ads_listened_per_week
FROM listener_dataset;

    
															/*Exploratory Data Analysis(EDA)*/
/* Query: MIN/MAX/AVG of Metric Columns */
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS avg_age,
    MIN(listening_time) AS min_listnening_time,
    MAX(listening_time) AS max_listnening_time,
    AVG(listening_time) AS avg_listnening_time,
    MIN(songs_played_per_day) AS min_songs_played_per_day,
	MAX(songs_played_per_day) AS max_songs_played_per_day,
	AVG(songs_played_per_day) AS avg_songs_played_per_day,
    MIN(skip_rate) AS min_skip_rate,
    MAX(skip_rate) AS max_skip_rate,
	AVG(skip_rate) AS avg_skip_rate,
    MIN(ads_listened_per_week) AS min_ads_listened_per_week,
    MAX(ads_listened_per_week) AS max_ads_listened_per_week,
	AVG(ads_listened_per_week) AS AVG_ads_listened_per_week
FROM listener_dataset;


															/* Segmentation */


/* Query: creating a listner segment table with distributions
using CASE statments with conditions based on temp thresholds 
for all 3 key metrics */
CREATE TABLE listener_segmentation AS
SELECT
user_id,
listening_time,
songs_played_per_day,
skip_rate,
CASE
    WHEN listening_time < 120
         AND songs_played_per_day < 40
         AND skip_rate > 0.4
    THEN 'Casual Listener'

    WHEN listening_time BETWEEN 120 AND 180
         AND songs_played_per_day BETWEEN 40 AND 65
         AND skip_rate BETWEEN 0.2 AND 0.4
    THEN 'Recurring Listener'

    WHEN listening_time > 180
         AND songs_played_per_day > 65
         AND skip_rate < 0.2
    THEN 'Retained Listener'

    ELSE 'Unclassified'
END AS listener_segment
FROM listener_dataset;


/* listener_segment column distribution with key metric case conditions */
SELECT 
    listener_segment, 
    COUNT(*) AS user_count
FROM listener_segmentation
GROUP BY listener_segment;


/* the listener_segment table was too strict 
so I am dropping the table to recreate 
another table with less conditions */
DROP TABLE listener_segmentation;


/* creating a new listener_segmentation table with 1 key metric condition */
CREATE TABLE listener_segmentation AS
SELECT
user_id,
listening_time,
songs_played_per_day,
skip_rate,
CASE
    WHEN listening_time > 180
    OR songs_played_per_day > 65
    THEN 'Retained Listener'

    WHEN listening_time BETWEEN 120 AND 180
    OR songs_played_per_day BETWEEN 40 AND 65
    THEN 'Recurring Listener'

    ELSE 'Casual Listener'
END AS listener_segment
FROM listener_dataset;


/* Validating the segment */
SELECT
listener_segment,
AVG(listening_time),
AVG(songs_played_per_day),
AVG(skip_rate)
FROM listener_segmentation
GROUP BY listener_segment;


/* Platform-level KPI results */
SELECT
    AVG(listening_time),
    AVG(songs_played_per_day),
    SUM(skip_rate * songs_played_per_day) * 1.0 / SUM(songs_played_per_day)
FROM listener_dataset;
