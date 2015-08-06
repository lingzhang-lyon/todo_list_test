#!/bin/bash

script_dir=$(dirname $0);
cd $script_dir;
./sql-create.sh;


printf "\n10k-write-new"
time (sqlite3 ../todo_list.db <sql-script/10k-write-new.sql ) >sql-log/10k-write-new.log 

printf "\n10k-write-edit"
time (sqlite3 ../todo_list.db <sql-script/10k-write-edit.sql ) >sql-log/10k-write-edit.log

printf "\n10k-read"
time (sqlite3 ../todo_list.db <sql-script/10k-read.sql ) >sql-log/10k-read.log