CREATE EXTERNAL TABLE IF NOT EXISTS txtdata(
  sex STRING,
  age STRING,
  area STRING,
  have_car STRING,
  have_cam STRING,
  have_pc STRING,
  job STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/home/nahki/workspace/input/txt';

CREATE VIEW mail_only AS
SELECT sex, age FROM txtdata WHERE sex=='男';

SELECT a.sex, a.age
FROM
(SELECT sex, age FROM txtdata) a
JOIN
mail_only b
ON a.sex=b.sex
GROUP BY a.sex, a.age
;
