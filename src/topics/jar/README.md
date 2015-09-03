# Description: Creating and Using JAR

### Create JAR Using Eclipse
1. Write java code under some package structure, say JavaNotes2Myself/src/topics/jar/code.
2. Convert the Java code to JAR by Right Clicking on the directory 'code' - Export - Java - JAR File.
3. Follow Eclipse wizard to export JAR and JARDESC files in JavaNotes2Myself/src/topics/jar/gen.

### Create JAR Using Command Line
### TODO

### Use JAR Using Eclipse
1. Create a Java Project and include foo-bar.jar as a library.
2. Create a class, say JavaNotes2Myself/src/topics/jar/client/FooBarClient.java.
3. Create Objects of Foo and Bar and call methods on them.

### Use JAR Using Command Line
```
# Execute default entry point specified in the Manifest file.
cd JavaNotes2Myself/src/topics/jar/gen
java -jar foo-bar.jar

# Execute the static main method NOT specified in the Manifest file
java -cp foo-bar.jar topics.jar.code.Foo
java -cp foo-bar.jar topics.jar.code.Bar

# Executing any other static method apart from main is possible through main method.
```
