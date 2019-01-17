# Description: A HelloWorld Java Servlet

### Introduction
* Servlets are Java classes which service HTTP requests and implement the javax.servlet.Servlet interface.

### Include Servlet JAR to Project
* Add Servlet API Jar to a project sub-directory (if using an IDE)
```
# Create a lib directory under the project
mkdir <project-directory>/lib

# Copy servlet-api.jar from the tomcat installation directory <tomcat-installation-directory>/lib. 
cp <tomcat-installation-directory>/lib/servlet-api.jar <project-directory>/lib/

# Add the lib directory to the Ecliplse Project Lib Directory
```

### Write HelloWorldServelet.java
* Check HelloWorldServlet.java for a reference implementation.
* This class file should implement the doGet() method.

### Compile Java Servlet Using Command Line
```
javac -classpath <tomcat-installation-directory>/lib/servlet-api.jar HelloWorldServlet.java

# Alternatively
javac -classpath <project-directory>/lib/servlet-api.jar HelloWorldServlet.java
```

### Create Servlet Application
* By default, a servlet application is located at the path `<tomcat-installation-directory>/webapps/ROOT/web.xml`.
* Create servlet definition in web.xml which will create the URL /HelloWorldServlet mapped to the servlet name 
  HelloWorldServlet. This servlet name HelloWorldServlet will be serviced by the class HelloWorldServlet.class
```
# Edit the web.xml file
sudo :gvim <tomcat-installation-directory>/webapps/ROOT/WEB-INF/web.xml

# Add the following content before the </web-app> node and save the file.
<servlet>
    <servlet-name>HelloServlet</servlet-name>
    <servlet-class>topics.servlet.HelloWorldServlet</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>HelloServlet</servlet-name>
    <url-pattern>/hello</url-pattern>
</servlet-mapping>
```

### Deploy Servlet
* The .class file resides in `<tomcat-installation-directory>/webapps/ROOT/WEB-INF/classes` directory.
* If the fully qualified class name of the servlet is `topics.servlet.HelloWorldServlet`, then this servlet class must 
  be copied to the location in `WEB-INF/classes/topics/servlet/HelloWorldServlet.class`.
```
# Change to Tomcat
cd <tomcat-installation-directory>/webapps/ROOT/WEB-INF

# Create directory path based on fully qualified class name
mkdir -p classes/topics/servlet/

# Copy .class files
cp <project-directory>/topics/servlet/HelloWorldServlet.class <tomcat-installation-directory>/webapps/ROOT/WEB-INF/classes/topics/servlet/
```

### Restart tomcat
```
# Shutdown tomcat if it is already running
./shutdown.sh

# Start tomcat
./startup.sh
```

### Test Servlet
* Visit `http://127.0.0.1:8080/hello` in a browser.