CREATE EXTERNAL TABLE IF NOT EXISTS stocks(
  exchange STRING,
  symbol STRING,
  ymd STRING,
  price_open FLOAT,
  price_high FLOAT,
  price_low FLOAT,
  volume INT,
  price_adj_close FLOAT)
PARTITIONED BY (year INT, month INT, day INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/home/nahki/workspace/input';
