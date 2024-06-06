CREATE DATABASE IF NOT EXISTS nyse_db;

USE nyse_db;

CREATE TABLE IF NOT EXISTS nyse_stage(
    ticker VARCHAR(255),
    trade_date INT,
    openprice FLOAT,
    highprice FLOAT,
    lowprice FLOAT,
    closeprice FLOAT,
    volume BIGINT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' ;

CREATE TABLE IF NOT EXISTS nyse_parquet(
    ticker VARCHAR(255),
    trade_date INT,
    openprice FLOAT,
    highprice FLOAT,
    lowprice FLOAT,
    closeprice FLOAT,
    volume BIGINT
) PARTITIONED BY (trade_month int)
STORED AS parquet;

LOAD DATA INPATH '/user/${user_name}/nyse_data/NYSE_1997'
OVERWRITE INTO TABLE nyse_stage;

SET hive.exec.dynamic.partition.mode = nonstrict;

INSERT OVERWRITE TABLE nyse_parquet PARTITION (trade_month)
SELECT ns.*, SUBSTR(trade_date, 1, 6) AS trade_month FROM nyse_stage AS ns;

SHOW PARTITIONS nyse_parquet;