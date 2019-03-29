#!/bin/bash
cd destination
bash
for file in *.log
do
mv ./$file ./$file.back
done
exit
cd ..
cd source
bash
for file in *.log
do
mv ./$file ../destination
done
exit
cd ..
ls -all
