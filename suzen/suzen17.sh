#!/bin/bash
echo "Flag suzen17 is: $(ls -a | egrep '[0-9A-Za-z]{11,}' | awk -F. {'print $2
'})"
