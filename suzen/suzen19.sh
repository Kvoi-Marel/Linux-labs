#!/bin/bash
mkdir -p Documents/projects/lab19/using/simple/bash/commands
echo "Flag suzen 19 is: $(ls -a Documents/projects/lab19/using/simple/bash/commands | egrep '^[0-9a-zA-Z]')"