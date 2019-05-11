#!/bin/bash
bash
for file in destination/*.log; do mv ./$file ./$file.back; done
for file in source/*.log; do mv ./$file destination/; done 
ls
