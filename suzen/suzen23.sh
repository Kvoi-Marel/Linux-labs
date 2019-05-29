#!/bin/bash
echo "Flag suzen23 is: $(for file in destination/*.log; do mv ./$file ./$file.back; done && mv source/*.log destination/ ; ls |egrep '^[0-9a-zA-Z]{12,}')"