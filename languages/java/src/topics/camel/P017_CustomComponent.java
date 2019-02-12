package topics.camel;

import java.util.Map;

import org.apache.camel.Endpoint;
import org.apache.camel.impl.DefaultComponent;

/**
 * Represents the component that manages {@link P017_CustomEndpoint}.
 */
public class P017_CustomComponent extends DefaultComponent {

    protected Endpoint createEndpoint(String uri, String remaining, Map<String, Object> parameters) throws Exception {
        Endpoint endpoint = new P017_CustomEndpoint(uri, this);
        setProperties(endpoint, parameters);
        return endpoint;
    }
}
