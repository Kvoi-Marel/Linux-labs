#!/bin/bash
bash
echo "Flag suzen22 is: $(for i in {1..999}; do touch ${i}.txt; done; ls -a | egrep '^[0-9a-zA-Z]{11,}')"