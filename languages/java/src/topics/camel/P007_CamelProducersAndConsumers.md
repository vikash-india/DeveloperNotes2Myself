# Description: Camel Producers and Consumers

### Consumers
* Consumers wrap the payload and creates the exchange.
* Types of consumers
    - Event Driven Consumers
    - Polling Consumers
* Event Driven Consumers
    - These are also called asynchronous consumers.
    - Examples: JMS, Kafka etc.
* Polling Consumers
    - These are also called synchronous consumers. 
    - Polls and reads the content from a source on a regular intervals.
    - Examples: Polling a directory on a regular interval in a FTP server.
        
### Producers
* Producers in camel can create and send a message to an endpoint.
* Producers converts the Exchange according to the endpoint behind the scenes.

### TODO
* None