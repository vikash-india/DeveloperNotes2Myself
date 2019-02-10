package topics.logging;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * Note
 * 1. Following jars will be needed in order to use slf4j with log4j
 *      - slf4j-api-1.7.25.jar
 *      - slf4j-log4j12-1.7.25.jar
 *      - log4j-1.2.17.jar
 */

public class P005_LoggerUsingSLF4JUsingLog4J {
    private static final Logger log = LoggerFactory.getLogger(P005_LoggerUsingSLF4JUsingLog4J.class);

    // Relative path to 'java' directory.
    static final String path = "src/topics/logging/P003_log4j.properties";

    public static void main(String[] args) {
        // Load the log4j properties file dynamically.
        PropertyConfigurator.configure(path);

        // Start logging
        log.debug("This is a debug message");
        log.info("This is an info message");
        log.warn("This is a warning message");
        log.error("This is an error message");
        // log.fatal("This is a fatal message. Not available in slf4j");
    }
}