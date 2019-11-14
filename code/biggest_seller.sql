/*
***********************
Market Agora
***********************
/*

This will create a table that stores the value which is 20% of the total vendors, and also the total vendors (BEFORE DELETE occurs!).
*/
CREATE TABLE Agora_sellers AS 
SELECT total_vendors*20/100 AS amount_biggest_sellers, total_vendors FROM (SELECT COUNT(*) AS total_vendors FROM (SELECT * from feedbacks WHERE marketplace = 'Agora' GROUP BY receiver_hash));

/*
This will create a table that stores the top 20% biggest sellers with the highest feedback.
*/
CREATE TABLE Agora_biggest_sellers AS
SELECT receiver_hash, sum(feedback_value) FROM feedbacks WHERE marketplace = 'Agora' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC LIMIT (SELECT amount_biggest_sellers FROM Agora_sellers);

/*
This will create a table that stores the feedback_value and average turnover. The turnover is averaged on the same feedback values.
*/
CREATE TABLE Agora_feedback_turnover AS
SELECT FBV AS feedback_value, avg(turnover) AS avg_turnover FROM (
SELECT receiver_hash, sum(feedback_value) AS FBV, sum(order_amount_usd) AS turnover FROM feedbacks WHERE marketplace = 'Agora' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC
) GROUP BY FBV ORDER BY FBV DESC;

/*
This will remove the biggest sellers from the feedbacks and items table. Note that once deleted, if you re run certain queries, there will be missing results due to the deletion.
*/
DELETE FROM feedbacks WHERE marketplace = 'Agora' AND (receiver_hash IN (SELECT receiver_hash from Agora_biggest_sellers));
DELETE from items WHERE marketplace = 'Agora' AND (vendor_hash IN (SELECT receiver_hash from Agora_biggest_sellers));
 

 
/*
The code below is a repetition of the code above, we do it for all markets that have a feedback_value
*/ 


/*
***********************
Market Evolution
***********************
*/
CREATE TABLE Evolution_sellers AS 
SELECT total_vendors*20/100 AS amount_biggest_sellers, total_vendors FROM (SELECT COUNT(*) AS total_vendors FROM (SELECT * from feedbacks WHERE marketplace = 'Evolution' GROUP BY receiver_hash));

CREATE TABLE Evolution_biggest_sellers AS
SELECT receiver_hash, sum(feedback_value) FROM feedbacks WHERE marketplace = 'Evolution' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC LIMIT (SELECT amount_biggest_sellers FROM Evolution_sellers);

CREATE TABLE Evolution_feedback_turnover AS
SELECT FBV AS feedback_value, avg(turnover) AS avg_turnover FROM (
SELECT receiver_hash, sum(feedback_value) AS FBV, sum(order_amount_usd) AS turnover FROM feedbacks WHERE marketplace = 'Evolution' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC
) GROUP BY FBV ORDER BY FBV DESC;

DELETE FROM feedbacks WHERE marketplace = 'Evolution' AND (receiver_hash IN (SELECT receiver_hash from Evolution_biggest_sellers));
DELETE from items WHERE marketplace = 'Evolution' AND (vendor_hash IN (SELECT receiver_hash from Evolution_biggest_sellers));

/*
***********************
Market Hydra
***********************
*/
CREATE TABLE Hydra_sellers AS 
SELECT total_vendors*20/100 AS amount_biggest_sellers, total_vendors FROM (SELECT COUNT(*) AS total_vendors FROM (SELECT * from feedbacks WHERE marketplace = 'Hydra' GROUP BY receiver_hash));

CREATE TABLE Hydra_biggest_sellers AS
SELECT receiver_hash, sum(feedback_value) FROM feedbacks WHERE marketplace = 'Hydra' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC LIMIT (SELECT amount_biggest_sellers FROM Hydra_sellers);

CREATE TABLE Hydra_feedback_turnover AS
SELECT FBV AS feedback_value, avg(turnover) AS avg_turnover FROM (
SELECT receiver_hash, sum(feedback_value) AS FBV, sum(order_amount_usd) AS turnover FROM feedbacks WHERE marketplace = 'Hydra' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC
) GROUP BY FBV ORDER BY FBV DESC;

DELETE FROM feedbacks WHERE marketplace = 'Hydra' AND (receiver_hash IN (SELECT receiver_hash from Hydra_biggest_sellers));
DELETE from items WHERE marketplace = 'Hydra' AND (vendor_hash IN (SELECT receiver_hash from Hydra_biggest_sellers));



/*
***********************
Market Pandora
***********************
*/
CREATE TABLE Pandora_sellers AS 
SELECT total_vendors*20/100 AS amount_biggest_sellers, total_vendors FROM (SELECT COUNT(*) AS total_vendors FROM (SELECT * from feedbacks WHERE marketplace = 'Pandora' GROUP BY receiver_hash));

CREATE TABLE Pandora_biggest_sellers AS
SELECT receiver_hash, sum(feedback_value) FROM feedbacks WHERE marketplace = 'Pandora' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC LIMIT (SELECT amount_biggest_sellers FROM Pandora_sellers);

CREATE TABLE Pandora_feedback_turnover AS
SELECT FBV AS feedback_value, avg(turnover) AS avg_turnover FROM (
SELECT receiver_hash, sum(feedback_value) AS FBV, sum(order_amount_usd) AS turnover FROM feedbacks WHERE marketplace = 'Pandora' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC
) GROUP BY FBV ORDER BY FBV DESC;

DELETE FROM feedbacks WHERE marketplace = 'Pandora' AND (receiver_hash IN (SELECT receiver_hash from Pandora_biggest_sellers));
DELETE from items WHERE marketplace = 'Pandora' AND (vendor_hash IN (SELECT receiver_hash from Pandora_biggest_sellers));


/*
***********************
Market Silk Road 1
***********************
*/
CREATE TABLE SilkRoad1_sellers AS 
SELECT total_vendors*20/100 AS amount_biggest_sellers, total_vendors FROM (SELECT COUNT(*) AS total_vendors FROM (SELECT * from feedbacks WHERE marketplace = 'Silk Road 1' GROUP BY receiver_hash));

CREATE TABLE SilkRoad1_biggest_sellers AS
SELECT receiver_hash, sum(feedback_value) FROM feedbacks WHERE marketplace = 'Silk Road 1' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC LIMIT (SELECT amount_biggest_sellers FROM SilkRoad1_sellers);

CREATE TABLE SilkRoad1_feedback_turnover AS
SELECT FBV AS feedback_value, avg(turnover) AS avg_turnover FROM (
SELECT receiver_hash, sum(feedback_value) AS FBV, sum(order_amount_usd) AS turnover FROM feedbacks WHERE marketplace = 'Silk Road 1' GROUP BY receiver_hash ORDER BY sum(feedback_value) DESC
) GROUP BY FBV ORDER BY FBV DESC;

DELETE FROM feedbacks WHERE marketplace = 'Silk Road 1' AND (receiver_hash IN (SELECT receiver_hash from SilkRoad1_biggest_sellers));
DELETE from items WHERE marketplace = 'Silk Road 1' AND (vendor_hash IN (SELECT receiver_hash from SilkRoad1_biggest_sellers));
 