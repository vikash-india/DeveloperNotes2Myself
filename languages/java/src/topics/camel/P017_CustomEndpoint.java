package topics.camel;

import org.apache.camel.Consumer;
import org.apache.camel.Processor;
import org.apache.camel.Producer;
import org.apache.camel.impl.DefaultEndpoint;

/**
 * Represents a Custom endpoint.
 */
public class P017_CustomEndpoint extends DefaultEndpoint {

    public P017_CustomEndpoint() {
    }

    public P017_CustomEndpoint(String uri, P017_CustomComponent component) {
        super(uri, component);
    }

    public P017_CustomEndpoint(String endpointUri) {
        super(endpointUri);
    }

    public Producer createProducer() throws Exception {
        return new P017_CustomProducer(this);
    }

    public Consumer createConsumer(Processor processor) throws Exception {
        return new P017_CustomConsumer(this, processor);
    }

    public boolean isSingleton() {
        return true;
    }
}
