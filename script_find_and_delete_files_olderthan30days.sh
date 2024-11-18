#!/bin/bash

###############################################
# Author : Mohansai
# Version : v0.0.1
###############################################

FILES_DIRECTORY="/path"
NO_OF_DAYS_OLDER=30

find "$FILES_DIRECTORY" -type f -mtime +$NO_OF_DAYS_OLDER -exec rm -f {} \;

echo "We have deleted the files successfully which are older than $NO_OF_DAYS_OLDER from the $FILES_DIRECTORY"


