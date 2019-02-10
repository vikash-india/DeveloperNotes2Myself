# Description: Transform Messages Using Bean Method

### About
* This example will transform CSV file with comma (,) as separator to colon (:) as separator.
* Example: CSV files of format `Dilbert,Single,Male,Engineer` will be transformed to `Dilbert:Single:Male:Engineer`.

### Libraries Needed for This Code
* camel-core.jar
* slf4j-1.7.25/slf4j-api-1.7.25.jar
* apache-log4j-1.2.17/log4j-1.2.17.jar

### Files Directory Structure Needed
1. The following directories should exist
    - /tmp/input
    - /tmp/output
    
2. The `/tmp/input` directory should have a few sample files
    - file1.csv with content as `Dilbert,Single,Male,Engineer`

### Bash Script for Creating Files and Directory Structure
```
# Create Directory Structure
mkdir -p /tmp/input /tmp/output

# Create Files
touch /tmp/input/f1.csv
echo "Dilbert,Single,Male,Engineer" > /tmp/input/f1.csv
echo "Catbert,Unknown,Male,HR Director" >> /tmp/input/f1.csv 

# Remove files from output directory
rm /tmp/output/*

# List Directories and Content
ll /tmp/input/ /tmp/output/
cat /tmp/input/* /tmp/output/*
```
