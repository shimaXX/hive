--auxpath /home/nahki/workspace/jar;
ADD JAR /home/nahki/workspace/jar/sample.jar;
CREATE TEMPORARY FUNCTION forx AS 'myUDF.Sample';
DESCRIBE FUNCTION EXTENDED forx;
