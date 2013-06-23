set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nostrict;
set hive.exec.max.dynamic.partitions.pernode=1000;
set hive.exec.max.dynamic.partitions=+10000;
--set hive.exec.max.created.files=1000000;

INSERT OVERWRITE TABLE demogra
PARTITION(job)
SELECT *
FROM txtdata td;
