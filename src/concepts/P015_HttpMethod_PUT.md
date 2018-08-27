# Description: HTTP Operation - PUT

### The HTTP PUT Method
- The HTTP PUT Request messages requests the server to store the enclosed message-body under the supplied Request-URI.
- If the Request-URI does not point to an existing resource, and that URI is capable of being defined as a new resource by the requesting user agent, the origin server can create the resource with that Request-URI.
- If the Request-URI refers to an already existing resource, the enclosed entity SHOULD be considered as a modified version of the one residing on the origin server.
- If a new resource is created, the origin server MUST inform the user agent via the '201 (Created)' response.
- If an existing resource is modified, either the '200 (OK)' or '204 (No Content)' response codes SHOULD be sent to indicate successful completion of the request.
- If the resource could not be created or modified with the Request-URI, an appropriate error response SHOULD be given that reflects the nature of the problem.
- The recipient of the entity MUST NOT ignore any Content-* (e.g. Content-Range) headers that it does not understand or implement and MUST return a 501 (Not Implemented) response in such cases.
- Unless otherwise specified for a particular entity-header, the entity-headers in the PUT request SHOULD be applied to the resource created or modified by the PUT.
- The difference between POST and PUT is in how the server interprets the Request-URI. With a POST, the Request-URI identifies an object on the server that can process the included data. With a PUT, on the other hand, the Request-URI identifies an object in which the server should place the data.
- Another difference between POST and PUT is while a POST Request-URI generally indicates a program or script, the PUT Request-URI is usually the path and name for a file.
- Many web servers require users to be logged in with a password before (s)he can issue an HTTP PUT Requests to the server because PUT allows the user to change content.
- Responses to this method are not cacheable.

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.posttestserver.com 80
```

### Send an HTTP Request message to the server.
```
---
PUT /post.php HTTP/1.1
Host: posttestserver.com
Connection: close
Accept: */*
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic
Content-Type: text/html
Content-Length: 48

A Quick Brown Fox Jumps Right Over The Lazy Dog.
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The above message should create a file named /post.php with the content 'A Quick Brown Fox Jumps Right Over The Lazy Dog.'.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Date: Mon, 29 Dec 2014 17:31:53 GMT
Server: Apache
Access-Control-Allow-Origin: *
Vary: Accept-Encoding
Content-Length: 140
Content-Type: text/html
Connection: close

Successfully dumped 0 post variables.
View it at http://www.posttestserver.com/data/2014/12/29/09.31.53733765053
Post body was 0 chars long.
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The first line in the HTTP Response is the HTTP Status code.
