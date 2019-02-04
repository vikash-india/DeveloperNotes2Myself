package topics.logging;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import java.io.IOException;
import java.sql.SQLException;

/*
 * Compile and Execute
 * - Make sure you have set PATH and CLASSPATH appropriately before compilation and execution of code.
 * - All the libraries should be available in CLASSPATH.
 * - The P004_log4j.properties file should be available in PATH. Alternatively load the log4j properties file
 *   during runtime.
 */
public class P004_LoggerUsingLog4J {

    // Get actual class name to be printed on
    static Logger log = Logger.getLogger(P004_LoggerUsingLog4J.class.getName());

    // Relative path to 'java' directory.
    static final String path = "src/topics/logging/P004_log4j.properties";

    public static void main(String[] args) throws IOException, SQLException {
        // Load the log4j properties file dynamically.
        PropertyConfigurator.configure(path);

        // Start logging
        log.debug("This is a debug message");
        log.info("This is an info message");
        log.warn("Sample warn message");
        log.error("Sample error message");
        log.fatal("Sample fatal message");
    }
}
