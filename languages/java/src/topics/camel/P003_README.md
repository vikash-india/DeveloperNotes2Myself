# Description: File Copy Using Camel

### About
* This example copies file from `/tmp/input` to `/tmp/output` directories.
* As long as Thread.sleep(5000) is running, file created on path `/tmp/input` will be copied to the path `/tmp/output`. 
* This example will generate log warnings because in spite of adding slf4j libraries, those are not initialised. 

### Libraries Needed
* camel-core.jar
* slf4j-api.jar
* log4j.jar

### Files Directory Structure Needed
1. The following directories should exist
    - /tmp/input
    - /tmp/output
2. The `/tmp/input` directory should have a few sample files
    - f1.txt
    - f2.txt

### Bash Script for Creating Files and Directory Structure
```
# Create Directory Structure
mkdir -p /tmp/input /tmp/output

# Create Files
touch /tmp/input/f1.txt
touch /tmp/input/f2.txt

# Remove files from output directory
rm /tmp/output/*

# List Directories
ll /tmp/input/ /tmp/output/
```
