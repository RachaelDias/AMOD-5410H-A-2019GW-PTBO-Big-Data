CREATE DATABASE IF NOT EXISTS data;
USE data;

CREATE TABLE tweets (
id int(11) NOT NULL AUTO_INCREMENT,
tweet_id varchar(250) DEFAULT NULL,
name varchar(128) DEFAULT NULL,
screen_name varchar(128) DEFAULT NULL,
created_at timestamp NULL DEFAULT NULL,
followers int(11),
friends int(11),
text text,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE crypto (
id int(11) NOT NULL AUTO_INCREMENT,
name varchar(250) DEFAULT NULL,
rank int(11) DEFAULT NULL,
price_usd DOUBLE(16,2) DEFAULT NULL,
date_time timestamp NULL DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

describe tweets;
describe crypto;

SELECT * FROM tweets;
select * from crypto;

#Select and function queries
use data;

SELECT * FROM tweets where text like '%TRON%';
SELECT * FROM tweets where followers>=10000;
SELECT * FROM tweets where friends>=10000;
select name, screen_name, count(*) FROM tweets group by name, screen_name having count(*)>1;
select * FROM tweets group by name order by followers, friends desc;

SELECT max(followers),min(followers),avg(followers) FROM tweets;
SELECT max(friends),min(friends),avg(friends) FROM tweets;

select * from crypto order by price_usd desc;
select * from crypto;

CREATE TABLE tweets2 (
id int(11) NOT NULL AUTO_INCREMENT,
tweet_id varchar(250) DEFAULT NULL,
name varchar(128) DEFAULT NULL,
screen_name varchar(128) DEFAULT NULL,
created_at timestamp NULL DEFAULT NULL,
followers int(11),
friends int(11),
text text,
currency varchar(128) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

describe tweets2;

insert into tweets2
select id,tweet_id,name,screen_name,created_at,followers,friends,text,
case
 when text like '%bitcoin%' THEN "Bitcoin"
 when text like '%ripple%' THEN "XRP"
 when text like '%XRP%' THEN "XRP"
 when text like '%ethereum%' THEN "Ethereum"
 when text like '%bitcoin cash%' THEN "Bitcoin Cash"
 when text like '%EOS%' THEN "EOS"
 when text like '%tether%' THEN "Tether"
 when text like '%THETA%' THEN "Tether"
 when text like '%litecoin%' THEN "Litecoin"
 when text like '%stellar%' THEN "Stellar"
 when text like '%TRON%' THEN "TRON"
 when text like '%Bitcoin SV%' THEN "Bitcoin SV"
 when text like '%Cardano%' THEN "Cardano"
 when text like '%binance%' THEN "Binance"
 when text like '%Monero%' THEN "Monero"
 when text like '%DASH%' THEN "DASH"
  else NULL
 END AS currency
FROM tweets; 

select * from tweets order by created_at desc;

#INNER JOIN 
select text,currency,b.name,b.price_usd,created_at,date_time 
FROM tweets2 a inner join crypto b on a.currency=b.name;

#LEFT JOIN 
select text,currency,b.name,b.price_usd,created_at,date_time 
FROM tweets2 a LEFT join crypto b on a.currency=b.name;

#RIGHT JOIN 
select text,currency,b.name,b.price_usd,created_at,date_time 
FROM tweets2 a RIGHT join crypto b on a.currency=b.name;

select distinct currency from tweets2;
