# Description: Create and Use JAR

### Create JAR Using Eclipse
1. Write java code under some package structure, say JavaNotes2Myself/src/topics/jar/code.
2. Convert the Java code to JAR by Right Clicking on the directory 'code' - Export - Java - JAR File.
3. Follow Eclipse wizard to export JAR and JARDESC files in JavaNotes2Myself/src/topics/jar/gen.

### Use JAR Using Eclipse
1. Create a Java Project and include foo-bar.jar as a library.
2. Create a class, say JavaNotes2Myself/src/topics/jar/client/FooBarClient.java.
3. Create Objects of Foo and Bar and call methods on them.

### Create JAR Using Command Line
1. Use the c option to create a JAR file.
2. Use the f option output the content to a file rather than to stdout.
3. The foo-bar.jar is the name of the resulting JAR file. By convention, JAR filenames are given a .jar extension,
   though this is not required.
4. The /path/to/input/file(s) argument is a space-separated list of one or more files that should be included in the
   JAR file. The /path/to/input/file(s) argument can contain the wildcard * symbol. If any of the "input/files" are
   directories, the contents of those directories are added to the JAR archive recursively.

```
jar cf foo-bar.jar /path/to/input/class/file(s) # Create a JAR file. Default MANIFEST file will be created.
jar cmf MANIFEST.MF foo-bar.jar code/*.class    # Use the option m to specify existing MANIFEST file.

jar tf foo-bar.jar                              # View the contents of a JAR file.
jar xf foo-bar.jar                              # Extract the contents of a JAR file.
jar xf foo-bar.jar META-INF/MANIFEST.MF         # Extract specific files from a JAR file.
```

### Use JAR Using Command Line
```
# Run an application packaged as a JAR file
# 1. This will require the Main-class manifest header.
# 2. This will execute the main() method in the default entry point specified as the Main-class in the Manifest file.
cd JavaNotes2Myself/src/topics/jar/gen
java -jar foo-bar.jar

# Execute the static main method NOT specified as the Main-class in the Manifest file.
# 1. Executing any other static method apart from main() is possible by calling it through the main() method.
java -cp foo-bar.jar topics.jar.code.Foo
java -cp foo-bar.jar topics.jar.code.Bar
```
