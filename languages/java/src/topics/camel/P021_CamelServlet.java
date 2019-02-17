package topics.camel;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.CamelContext;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.log4j.PropertyConfigurator;

// Check P013_README.md
public class P013_d_XsltTransformationUsingXsltComponent {

    public static void main(String[] args) {
        // Enable log4J Logging
        String log4jPropertiesPath = "src/topics/camel/P004_log4j.properties";
        PropertyConfigurator.configure(log4jPropertiesPath);

        CamelContext context = new DefaultCamelContext();

        try {
            context.addRoutes(new RouteBuilder() {
                @Override
                public void configure() throws Exception {
                    from("file:/tmp/input?noop=true")
                            .to("log:?level=INFO&showBody=true&showHeaders=true")
                            // Path relative to DeveloperNotes2Myself/languages/java/src
                            .to("xslt:topics/camel/P013_b_Transformation.xslt")
                            .to("file:/tmp/output");
                }
            });

            context.start();
            Thread.sleep(5000);
            context.stop();
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }
    }
}