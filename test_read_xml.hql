--add jar /home/nahki/mahout/mahout-examples-0.7.jar;
add jar /home/nahki/mahout/mahout-examples-0.7-job.jar;
add jar /home/nahki/hive-0.11.0/lib/hive-contrib-0.11.0.jar;
add jar /home/nahki/hive-0.11.0/lib/hive-serde-0.11.0.jar;

CREATE EXTERNAL TABLE IF NOT EXISTS xmltable(
--  no STRING,
--  year STRING,
--  h_temp FLOAT,
--  l_temp FLOAT,
--  avg_temp FLOAT,
--  humid FLOAT,
--  precip FLOAT,
--  snw_year FLOAT,
--  snw_day FLOAT,
--  url STRING
xmldata STRING
)
STORED AS
--INPUTFORMAT 'org.apache.mahout.classifier.bayes.XmlInputFormat'
INPUTFORMAT 'org.apache.mahout.text.wikipedia.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
--TBLPROPERTIES(
--  "xmlinput.star"="<temp>",
--  "xmlinput.end"="</temp>"
--);
;
LOAD DATA LOCAL INPATH '/home/nahki/workspace/input/temp.xml' INTO TABLE xmltable;
SELECT COUNT(*) FROM xmltable LIMIT 1;
