# Description: Content Based Routing Using Direct Component

### About
* There is a route called ROUTE1 which polls a directory, and then based on the name of the file found, sends 
  it to either to SPECIAL ROUTE2 or NORMAL ROUTE3. Since ROUTE1, ROUTE2 and ROUTE3 are separated, there is a need for a 
  bridge channel to pass the messages through. This is done through 'direct' component.

### Libraries Needed
* camel-core.jar
* slf4j-api.jar
* log4j.jar

### Files Directory Structure Needed
1. The following directories should exist
    - /tmp/input
    - /tmp/output_special
    - /tmp/output_normal
2. The `/tmp/input` directory should have 
    - At least one `*.txt` file.
    - At least one `*_SPECIAL.txt` file.
3. The `/tmp/output_special` will get all the `*_SPECIAL.txt` files.
4. The `/tmp/output_normal` will get all the `*.txt` files.  

### Bash Script for Creating Files and Directory Structure
```
# Create Directory Structure
mkdir -p /tmp/input /tmp/output_special /tmp/output_normal

# Copy Input Files
touch /tmp/input/f1.txt /tmp/input/f2.txt
touch /tmp/input/f3_SPECIAL.txt /tmp/input/f4_SPECIAL.txt
 
# Remove files from output directory
rm /tmp/output_special/* /tmp/output_normal/*

# List Directories and Content
ll /tmp/input/ /tmp/output_special  /tmp/output_normal
```
