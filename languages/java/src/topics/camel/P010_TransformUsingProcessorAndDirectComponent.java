package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

// Check P010_README.md
public class P010_TransformUsingProcessorAndDirectComponent {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            // Use Customer RouteBuilder
            context.addRoutes(new CustomCamelFileProcessorRouteBuilder2());

            context.start();
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Inside Exception : " + e);
        }
    }
}

// Implement Custom Camel Processor On a Direct Component
class CustomCamelFileProcessor2 implements Processor {
    public void process(Exchange exchange) throws Exception {
        System.out.println("Exchange in Processor: " + exchange.getIn().getBody());

        try {
            String oldLine = (String) exchange.getIn().getBody();
            String newLine = oldLine.replace(",", ":");

            System.out.println("Old Line: " + oldLine);
            System.out.println("New Line: " + newLine);

            exchange.getIn().setBody(newLine);
        } catch (Exception e) {
            System.out.println("Exception in processor is : " + e);
        }
    }
}

// Implement Custom Camel RouteBuilder Using Direct Component
class CustomCamelFileProcessorRouteBuilder2 extends RouteBuilder {

    public void configure() throws Exception {
        // TODO:
        // 1. Figure out how to use "direct:processorInput" instead of "file:..."
        // 2. Figure out how to given an input to direct component instead of convertBodyTo so that
        //    each line is processed separately instead of a single string.
        from("file:/tmp/input?noop=true")
                // Convert File to a String
                .convertBodyTo(String.class)
                .log("Message BEFORE process is ${body} and Headers are ${headers}")
                // Use Custom Camel Processor 2
                .process(new CustomCamelFileProcessor2())
                .log("Message AFTER process is ${body} and Headers are ${headers}")
                .to("file:/tmp/output?fileName=output.txt");
    }
}