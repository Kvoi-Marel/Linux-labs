#!/bin/bash
echo "Flag suzen 20 is: $(cd .. && rm -R john && ls -a suzen | egrep '^[0-9a-zA-Z]')"
