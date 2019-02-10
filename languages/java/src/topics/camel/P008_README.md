# Description: Multiple Camel Routes

### About
* As long as Thread.sleep(5000*10) is running, file placed in input directories will be copied to output directories. 

### Libraries Needed
* camel-core.jar
* slf4j-api.jar
* log4j.jar

### Files and Directory Structure Required 
1. The following input directories should exist
    - /tmp/input1
    - /tmp/input2
2. The following output directories should exist
    - /tmp/output1
    - /tmp/output2
3. The `/tmp/input1` directory should have a few sample files
    - file11.txt
    - file12.txt
4. The `/tmp/input2` directory should have a few sample files
    - file21.txt
    - file22.txt

### Bash Script for Creating Files and Directory Structure
```
# Create Directory Structure
mkdir -p /tmp/input1 /tmp/input2 /tmp/output1 /tmp/output2

# Create Files
touch /tmp/input1/f11.txt
touch /tmp/input1/f12.txt

touch /tmp/input2/f21.txt
touch /tmp/input2/f22.txt

# Remove files from output directory
rm /tmp/output1/* /tmp/output2/*

# List Directories
ll /tmp/input1/ /tmp/input2/ /tmp/output1/ /tmp/output2/
``` 
