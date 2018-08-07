lines = LOAD '/hadoopdata/wordcount/file327.txt' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
mywordcount = FOREACH grouped GENERATE group, COUNT(words);
DUMP mywordcount;