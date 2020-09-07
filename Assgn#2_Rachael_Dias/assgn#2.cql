CREATE KEYSPACE cassandra
WITH replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 3
};

use cassandra;

CREATE TABLE tweets (
   tweet_id bigint,
   name varchar,
   screen_name varchar,
   created_at varchar,
   text text,
   followers int,
   friends int,
   PRIMARY KEY (tweet_id)
); 
 
CREATE TABLE coin
(
sr_no int,
"24h_volume_usd" decimal,
available_supply double,
id varchar,
last_updated double,
market_cap_usd double,
max_supply double,
name varchar,
percent_change_1h decimal,
percent_change_24h decimal,
percent_change_7d decimal,
price_btc decimal,
price_usd decimal,
rank int,
symbol varchar,
total_supply decimal,
PRIMARY KEY (id)
);

select * from coin;

select * from tweets;

Create index textindex1 on cassandra.tweets1(text);


CREATE TABLE tweets1 (
   tweet_id bigint,
   name varchar,
   screen_name varchar,
   created_at varchar,
   text text,
   followers int,
   friends int,
   PRIMARY KEY (tweet_id)
); 


CREATE CUSTOM INDEX idx_text2 ON cassandra.tweets2 (text) 
USING 'org.apache.cassandra.index.sasi.SASIIndex' 
WITH OPTIONS = {
'mode': 'CONTAINS', 
'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.NonTokenizingAnalyzer', 
'case_sensitive': 'false'};


CREATE TABLE coin1
(
sr_no int,
"24h_volume_usd" decimal,
available_supply double,
id varchar,
last_updated double,
market_cap_usd double,
max_supply double,
name varchar,
percent_change_1h decimal,
percent_change_24h decimal,
percent_change_7d decimal,
price_btc decimal,
price_usd decimal,
rank int,
symbol varchar,
total_supply decimal,
PRIMARY KEY (id)
);

CREATE CUSTOM INDEX idx_name ON cassandra.coin1 (name) 
USING 'org.apache.cassandra.index.sasi.SASIIndex' 
WITH OPTIONS = {
'mode': 'CONTAINS', 
'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.NonTokenizingAnalyzer', 
'case_sensitive': 'false'};

select * from coin1;


select * from tweets1 where text like '%bitcoin%' or text like '%xrp%';
select count(*) from coin1;


select * from coin1 order by id;


CREATE TABLE coin2
(
sr_no int,
"24h_volume_usd" decimal,
available_supply double,
id varchar,
last_updated double,
market_cap_usd double,
max_supply double,
name varchar,
percent_change_1h decimal,
percent_change_24h decimal,
percent_change_7d decimal,
price_btc decimal,
price_usd decimal,
rank int,
symbol varchar,
total_supply decimal,
PRIMARY KEY (id,rank))
WITH CLUSTERING ORDER BY (rank desc);


CREATE CUSTOM INDEX idx_name2 ON cassandra.coin2 (name) 
USING 'org.apache.cassandra.index.sasi.SASIIndex' 
WITH OPTIONS = {
'mode': 'CONTAINS', 
'analyzer_class': 'org.apache.cassandra.index.sasi.analyzer.NonTokenizingAnalyzer', 
'case_sensitive': 'false'};

select * from coin2;

drop index IF EXISTS cassandra.idx_name2;

CREATE TABLE tweets2 (
   tweet_id bigint,
   name varchar,
   screen_name varchar,
   created_at varchar,
   text text,
   followers int,
   friends int,
   PRIMARY KEY (name, created_at))
WITH CLUSTERING ORDER BY (created_at desc); 

select * from tweets2;