package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.ProducerTemplate;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.main.Main;
import org.apache.log4j.PropertyConfigurator;

import java.io.File;

public class P015_ContentBasedRoutingUsingDirectComponent extends Main {

    public static void main(String[] args) throws Exception {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        // Content Based Routing
        P015_ContentBasedRoutingUsingDirectComponent main = new P015_ContentBasedRoutingUsingDirectComponent();
        main.enableHangupSupport();
        main.addRouteBuilder(new CustomRoute1());
        main.addRouteBuilder(new CustomRoute2());
        main.addRouteBuilder(new CustomRoute3());
        main.run(args);
    }
}

class CustomRoute1 extends RouteBuilder {
    public void configure() {
        from("file:/tmp/input?noop=true")
                .process(new Processor() {
                    public void process(Exchange exchange) {
                        CamelContext camelContext = exchange.getContext();
                        ProducerTemplate producer = camelContext.createProducerTemplate();
                        File file = exchange.getIn().getBody(File.class);
                        boolean specialFile = file.getName().toString().endsWith("_SPECIAL.txt");
                        if (specialFile)
                            producer.send("direct:specialRoute", exchange);
                        else
                            producer.send("direct:normalRoute", exchange);
                    }
                });
    }
}

class CustomRoute2 extends RouteBuilder {
    public void configure() {
        from("direct:specialRoute")
                .process(new Processor() {
                    public void process(Exchange exchange) {
                        System.out.println("Processing special file: " + exchange);
                    }
                })
                .to("file:/tmp/output_special");
    }
}

class CustomRoute3 extends RouteBuilder {
    public void configure() {
        from("direct:normalRoute")
                .process(new Processor() {
                    public void process(Exchange exchange) {
                        System.out.println("Processing normal file: " + exchange);
                    }
                })
                .to("file:/tmp/output_normal");
    }
}
