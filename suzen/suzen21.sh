#!/bin/bash
echo "Flag suzen21 is: $(rm *[0-9]*.txt && rm *[a-z]*.png && rm test-*.[!gz]* && ls -a | egrep '^[a-z0-9A-Z]{21,}')"