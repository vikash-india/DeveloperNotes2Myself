package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

// Check P011_README.md
public class P011_TransformUsingTransformMethod {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            // Use Customer RouteBuilder
            context.addRoutes(new CustomCamelFileProcessorRouteBuilder3());

            context.start();
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Inside Exception : " + e);
        }
    }
}

// Implement Custom Camel RouteBuilder Using Transform Method
class CustomCamelFileProcessorRouteBuilder3 extends RouteBuilder {

    public void configure() throws Exception {
        from("file:/tmp/input?noop=true")
                .log("Message BEFORE process is ${body} and Headers are ${headers}")
                // Use Transform Method Directly
                .transform(body().regexReplaceAll(",", ":"))
                .log("Message AFTER process is ${body} and Headers are ${headers}")
                .to("file:/tmp/output?fileName=output.txt");
    }
}