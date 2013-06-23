--add jar /home/nahki/mahout/mahout-examples-0.7.jar;
add jar /home/nahki/mahout/mahout-examples-0.7-job.jar;
add jar /home/nahki/hive-0.11.0/lib/hive-contrib-0.11.0.jar;
add jar /home/nahki/hive-0.11.0/lib/hive-serde-0.11.0.jar;
add jar /home/nahki/workspace/jar/hive-json-serde-0.2.jar;
add jar /home/nahki/workspace/jar/json-serde-1.1.4-jar-with-dependencies.jar;

CREATE EXTERNAL TABLE IF NOT EXISTS jsontable(
jsondata STRING
)
--ROW FORMAT SERDE "org.apach.hadoop.hive.contrib.serde2.JsonSerde"
ROW FORMAT SERDE "org.openx.data.jsonserde.JsonSerDe"
--WITH SERDEPROPERTIES(
--  "jsondata"="$.response.area"
--)
LOCATION '/home/nahki/workspace/input/json/';
SELECT * FROM jsontable LIMIT 10;
