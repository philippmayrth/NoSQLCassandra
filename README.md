# Getting started

## MacOS

Install docker https://www.docker.com/ then run `make`


# Experiences
- Database UI tools
- CQL limits (join, union)
- CQL: allow filtering
- CQL: where x is Null -> does not exist
- CQL: where x = y -> https://stackoverflow.com/questions/43873374/how-do-i-select-everything-where-two-columns-contain-equal-values-in-cql


This does not work in CQL https://stackoverflow.com/questions/46928074/count-number-of-rows-in-cassandra
```sql
SELECT titel, count(titel)
  FROM test.teilnehmer_count
 GROUP by titel
```


# Sources
- Tables need to be designed for the query this can lead to some data being stored in several tables which is perfectly normal use case in cassandra (denormalization) https://www.youtube.com/watch?v=5LTs-G308wY&list=PLalrWAGybpB-L1PGA-NfFu2uiWHEsdscD&index=5

