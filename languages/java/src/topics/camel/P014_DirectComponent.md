# Description: Direct Component With ProducerTemplate

### Direct Component
* There are times when messages have to be routed from one route to another manually using a bridge. This bridge is a 
  'direct' component.
* Example: There is a route called ROUTE1 which polls a directory, and then based on the name of the file found, sends 
  it to either to SPECIAL ROUTE2 or NORMAL ROUTE3. Since ROUTE1, ROUTE2 and ROUTE3 are separated, there is a need for a 
  bridge channel to pass the messages through. This is done through 'direct' component. 
* The 'direct' component can be used by simply providing a unique name within theCamelContext, and it will serve as a 
  direct memory queue to pass messages. 
* Message can be read from or sent to these queues.
* The direct component can help in breaking up a complex route workflow into smaller parts.

### Producer Template
* ProducerTemplate is a Camel core features. 
* Within a CamelContext, create an instance of ProducerTemplate and it can be used to send any messages to any endpoints 
  dynamically at runtime. 
* Usually producer object should stored as member field instead of per each message processing in a real world 
  application.

### TODO
* None
