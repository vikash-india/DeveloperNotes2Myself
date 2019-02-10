package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

/*
 * ERROR: This code will give ERROR.
 * Experiment with direct:BeanInput instead of file to make it work.
 */

// Check P012_README.md
public class P012_TransformUsingBeanMethod {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            // Use Customer RouteBuilder
            context.addRoutes(new CustomCamelFileProcessorRouteBuilder4());

            context.start();
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }
    }
}

class CamelBean4 {

    public String map(String input) {
        String newBody = input.replace(",", ":");

        return newBody;
    }

    // It can be any method name
    public String map2(String input) {
        String newBody = input.replace(",", "*");

        return newBody;
    }
}

// Implement Custom Camel RouteBuilder Using Bean Method
class CustomCamelFileProcessorRouteBuilder4 extends RouteBuilder {

    public void configure() throws Exception {
        // ERROR: Figure out how to use direct:beanInput or some equivalent to make it work
        from("file:/tmp/input?noop=true")
                .log("Message BEFORE process is ${body} and Headers are ${headers}")
                // Default method is map
                .bean(new CamelBean4())
                // Specify the map2 method if method name is different
                // .bean(new CamelBean4(), "map2")
                .log("Message AFTER process is ${body} and Headers are ${headers}")
                .to("file:/tmp/output?fileName=output.txt");
    }
}