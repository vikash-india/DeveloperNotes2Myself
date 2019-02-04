package topics.logging;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * Note
 * 1. Running the below code will give the following warning because, it can't find a binding in the class path. By
 *    default, if it can't find a binding in the class path, it will bind to no-op logger implementation.
 *      SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
 *      SLF4J: Defaulting to no-operation (NOP) logger implementation
 *      SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
 * 2. One way to avoid this problem is to use the binding for java.util.logging in your code by linking to
 *    'slf4j-jdk14.jar'.
 */

public class P003_LoggerUsingSLF4J {
    private static final Logger logger = LoggerFactory.getLogger(P003_LoggerUsingSLF4J.class);

    public static void main(String[] args) {
        // This code will generate warning but will not print any log.
        logger.info("Start logging...");
    }
}