#!/bin/bash
echo "Flag suzen16 is : $(id | awk -F, '{print $12}' | awk -F"(" '{print $2}' | awk -F")" '{
print $1}')"
