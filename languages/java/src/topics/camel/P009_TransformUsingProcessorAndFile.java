package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.file.GenericFile;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class P009_TransformUsingProcessorAndFile {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            // Use Customer RouteBuilder
            context.addRoutes(new CustomCamelFileProcessorRouteBuilder());

            context.start();
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Inside Exception : " + e);
        }
    }
}

// Implement Custom Camel Processor
class CustomCamelFileProcessor implements Processor {
    String newLine = "";
    private String inputLine;

    public void process(Exchange exchange) throws Exception {
        System.out.println("Exchange in Processor is: " + exchange.getIn().getBody());

        GenericFile<File> file = (GenericFile) exchange.getIn().getBody();
        String readLine = null;

        if (file != null) {
            FileReader file1 = new FileReader(file.getFile());
            BufferedReader reader = new BufferedReader(file1);

            while ((readLine = reader.readLine()) != null) {
                String oldLine = readLine;

                newLine = newLine.concat(oldLine.replace(",", ":")).concat("\n");

                System.out.println("Input Line: " + readLine);
                System.out.println("Old Line: " + oldLine);
                System.out.println("New Line: " + newLine);

                exchange.getIn().setBody(newLine);
            }
        }
    }
}

// Implement Custom Camel RouteBuilder
class CustomCamelFileProcessorRouteBuilder extends RouteBuilder {

    public void configure() throws Exception {
        from("file:/tmp/input?noop=true")
                // Use Custom Camel Processor
                .process(new CustomCamelFileProcessor())
                .log("Received Message is ${body} and Headers are ${headers}")
                .to("file:/tmp/output?fileName=output.txt")
                .to("mock:output");
    }
}