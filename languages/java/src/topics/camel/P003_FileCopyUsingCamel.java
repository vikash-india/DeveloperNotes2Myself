package topics.camel;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;

public class P003_FileCopyUsingCamel {

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
            // Change this value to run this route for a longer period of time.
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Inside Exception : " + e);
        }
    }
}
