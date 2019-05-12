#!/bin/bash
for file in destination/*.log; do mv ./$file ./$file.back; done && mv source/*.log destination/
echo "Flag suzen23 is: $(ls |egrep '^[0-9a-zA-Z]{12,}')"