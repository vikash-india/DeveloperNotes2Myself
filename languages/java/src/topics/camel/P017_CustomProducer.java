package topics.camel;

import org.apache.camel.Exchange;
import org.apache.camel.impl.DefaultProducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The Custom producer.
 */
public class P017_CustomProducer extends DefaultProducer {
    private static final transient Logger LOG = LoggerFactory.getLogger(P017_CustomProducer.class);
    private P017_CustomEndpoint endpoint;

    public P017_CustomProducer(P017_CustomEndpoint endpoint) {
        super(endpoint);
        this.endpoint = endpoint;
    }

    public void process(Exchange exchange) throws Exception {
        System.out.println(exchange.getIn().getBody());
    }
}
