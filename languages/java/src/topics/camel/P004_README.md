# Description: File Copy Using Camel

### Note
* As long as Thread.sleep(5000*10) is running, file placed in `/tmp/input` directory will be copied to `/tmp/output`. 
* This example will generate log warnings because in spite of adding slf4j libraries, those are not initialised. 

### Libraries Needed for This Example
* camel-core.jar
* slf4j-1.7.25/slf4j-api-1.7.25.jar
* apache-log4j-1.2.17/log4j-1.2.17.jar

### Directory Structure Needed
1. The following directory should exist
    - /tmp/input
    - /tmp/output
2. The /tmp/input should have a few sample files
    - file1.xml
    - file2.txt
