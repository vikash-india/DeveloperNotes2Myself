# Description: XML Transformation Using Camel XSLT Component

### About
* This code will transform XML messages using XSLT
* XML and XSLT Files Used
    - Input XML             : P013_a_Input.xml
    - XSLT Transformation   : P013_b_Transformation.xslt
    - Output XML            : P013_c_Output.xml

### Libraries Needed
* camel-core.jar
* slf4j-api.jar
* log4j.jar

### Files Directory Structure Needed
1. The following directories should exist
    - /tmp/input
    - /tmp/output
2. The `/tmp/input` directory should have one or more XML file(s) of the format `P013_a_Input.xml`. 
3. The XSLT transformation file `P013_b_Transformation.xslt` will be applied to all the input XMLs.
4. The `/tmp/output` will have XML of the format `P013_c_Output.xml`.  

### Bash Script for Creating Files and Directory Structure
```
# Create Directory Structure
mkdir -p /tmp/input /tmp/output

# Copy Input XML Files
cp /home/vikash/Personal/Workspace/DeveloperNotes2Myself/languages/java/src/topics/camel/P013_a_Input.xml /tmp/input/f1.xml
cp /home/vikash/Personal/Workspace/DeveloperNotes2Myself/languages/java/src/topics/camel/P013_a_Input.xml /tmp/input/f2.xml

# Remove files from output directory
rm /tmp/output/*

# List Directories and Content
ll /tmp/input/ /tmp/output/
cat /tmp/input/* /tmp/output/* 
```
