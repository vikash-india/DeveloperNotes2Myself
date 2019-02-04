# Description: Introduction to Logging

### Introduction to slf4j
* SLF4J stands for Simple Logging Facade for Java. 
* It serves as a simple facade or abstraction for various logging frameworks.
* It allows us to code while depending on just one dependency, namely 'slf4j-api.jar' and then the desired logging 
  framework can be plugged in at runtime.
* One can use any underlying logging framework to do the acutal logging
    - Bind to java.util.logging 
    - Bind to log4j

### Introduction to log4j
* One can use the binding for log4j as the logging framework for the slf4j facade.
* In order to use slf4j and log4j, following jar files must be available on classpath
    - slf4j-api-1.7.25.jar
    - slf4j-log4j12-1.7.25.jar
    - log4j-1.2.17.jar
* The log4j is a reliable, fast and flexible logging framework (APIs) written in Java.
* The log4j has been ported to the C, C++, C#, Perl, Python, Ruby, and Eiffel languages.

### Components of log4j
* The loggers: Responsible for capturing logging information.
* The appenders: Responsible for publishing logging information to various preferred destinations.
* The layouts: Responsible for formatting logging information in different styles.

### Features of log4j
* It is thread-safe.
* It is optimized for speed.
* It is based on a named logger hierarchy.
* It supports multiple output appenders per logger.
* It supports internationalization.
* It is not restricted to a predefined set of facilities.
* Logging behavior can be set at runtime using a configuration file.
* It is designed to handle Java Exceptions from the start.
* It uses multiple levels, namely ALL, TRACE, DEBUG, INFO, WARN, ERROR and FATAL.
* The format of the log output can be easily changed by extending the Layout class.
* The target of the log output as well as the writing strategy can be altered by implementations of the Appender interface.
* It is fail-stop. However, although it certainly strives to ensure delivery, log4j does not guarantee that each log statement will be delivered to its destination.

### TODO
* None
