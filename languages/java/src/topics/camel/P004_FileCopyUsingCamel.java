package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;

/*
 * Requirements
 * 1. Library Needed:
 *      - camel-core
 *      - slf4j-1.7.25/slf4j-api-1.7.25.jar
 *      - apache-log4j-1.2.17/log4j-1.2.17.jar
 * 2. The following directory should exist
 *      - /tmp/input
 *      - /tmp/output
 * 3. The /tmp/input should have a few sample files
 *      - file1.xml
 *      - file2.txt
 */

public class P004_FileCopyUsingCamel {

    public static void main(String[] args) {
        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    from("file:/tmp/input?noop=true")
                            .to("file:/tmp/output");
                }
            });

            context.start();

            Thread.sleep(5000);

            context.stop();
        } catch (Exception e) {
            System.out.println("Inside Exception : " + e);
        }
    }
}
