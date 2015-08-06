#!/bin/bash
if [ -d "sql-script" ]; then
	rm -rf sql-script;
	mkdir sql-script;
else 
	mkdir sql-script;
fi


for i in {1..10000}
do
   echo "select * from items where id = $i;" >> sql-script/10k-read.sql
done

for i in {1..10000}
do
   echo "insert into items (content) values ('staff'+$i) ;" >> sql-script/10k-write-new.sql
done

for i in {1..10000}
do
   echo "update items set done='t' where id=$i ;" >> sql-script/10k-write-edit.sql
done

if [ -d "sql-log" ]; then
	rm -rf sql-log;
	mkdir sql-log;
else 
	mkdir sql-log;
fi