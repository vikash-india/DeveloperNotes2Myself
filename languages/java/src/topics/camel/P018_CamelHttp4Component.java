package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.Exchange;
import org.apache.camel.ProducerTemplate;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.camel.impl.DefaultExchange;
import org.apache.log4j.PropertyConfigurator;

public class P018_CamelHttp4Component {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    from("direct:start")
                            // HTTP4 can be only be in to() route.
                            .to("http4:example.com")
                            .log("Received Message is ${body} and Headers are ${headers}");
                }
            });

            context.start();

            // Send a direct start to begin the route processing
            ProducerTemplate producer = context.createProducerTemplate();
            Exchange exchange = new DefaultExchange(context);
            producer.send("direct:start", exchange);

            Thread.sleep(5000);

            context.stop();
        } catch (Exception e) {
            System.out.println("Exception : " + e);
        }
    }
}
