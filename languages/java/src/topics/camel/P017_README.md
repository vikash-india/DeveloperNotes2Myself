# Description: Create Custom Component

### Steps
1. CustomBean
    - Create a simple class to handle the custom logic.
2. CustomComponent
    - An endpoint factory which implements createEndpoint().
3. CustomEndpoint
    - Producer/consumer factory which implements createConsumer(), createProducer(), createExchange().
4. CustomConsumer
    - Acts as a service to consumes request at the start of a route.
5. CustomProducer
    - Acts as a service consumer to dispatch outgoing requests and receive incoming replies.
6. Exchange
    - Encapsulate the in/out message payloads and meta data about the data flowing between endpoints.
7. Message
    - Represent the message payload.
    - There is an IN and OUT message for each exchange.  
8. Register Component


### Bash Script
```
# Drop Component Definition as an Alternative to Registering Component Dynamically  
cd <project-directory> 
mkdir -p DeveloperNotes2Myself/languages/java/src/META-INF/services/org/apache/camel/component
cp DeveloperNotes2Myself/languages/java/src/topics/camel/P017_custom DeveloperNotes2Myself/languages/java/src/META-INF/services/org/apache/camel/component/custom
```

### TODO
* None
