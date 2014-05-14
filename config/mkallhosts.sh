#!/bin/bash

 awk -F\" '
	/_HOST/ { host=$2; next }
	/_PLATFORM/ { print $2";"host; }
' docmd_config.txt  > allhosts.txt


## EOF ##
