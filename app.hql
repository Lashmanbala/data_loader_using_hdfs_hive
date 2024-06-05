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

CREATE TABLE IF NOT EXISTS nyse_daily(
    ticker VARCHAR(255),
    trade_date INT,
    openprice FLOAT,
    highprice FLOAT,
    lowprice FLOAT,
    closeprice FLOAT,
    volume BIGINT
) PARTITIONED BY (trade_month int)
STORED AS parquet;

LOAD DATA INPATH '/user/`whoami`/nyse_data'
OVERWRITE INTO TABLE nyse_stage;

SET hive.exec.dynamic.partition.mode = nonstrict;