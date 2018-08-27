# Description: HTTP Operation - POST

### The HTTP POST Method
- The POST method is a way for clients to send HTTP message body as part of HTTP Request messages.
- The POST method allows client to send lot more information to the server as compared to HTTP GET Request messages.
- The POST method allows client to send information to the server in many more formats rather than just key-value pairs as in GET method.
- The most common use of POST method is to send HTML Forms to web servers.
- The action performed by the POST method might not result in a resource that can be identified by a URI. In this case, either HTTP Status Code '200 (OK)' or '204 (No Content)' is sent.
- If a resource has been created on the origin server, the response SHOULD be '201 (Created)' and contain an entity which describes the status of the request and refers to the new resource, and a Location header.
- HTTP Response messages to the POST method are not cacheable, unless the response includes appropriate HTTP Headers like Cache-Control or Expires. However, the '303 (See Other)' response can be used to direct the user agent to retrieve a cacheable resource.

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.posttestserver.com 80
```

### Send an HTTP Request message to the server.
```
---
POST /post.php HTTP/1.1
Host: posttestserver.com
Connection: close
Accept: */*
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic
Content-Type: application/x-www-form-urlencoded
Content-Length: 23

Key1=Value1&Key2=Value2
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The HTTP Header 'Content-Type' specifies that the HTTP Request contains POST parameters in form of one or more key=value pairs. If Content-Type Header is omitted, the POST parameters will be treated as part of HTTP POST Message body.
- The HTTP Header 'Content-Length' is used by the server to decide the end of the HTTP POST message body. It includes the length of POST parameters (23 in the above message), length of POST message body (0 in the above message) and any new lines(0 in the above message).

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Date: Thu, 25 Dec 2014 21:53:43 GMT
Server: Apache
Access-Control-Allow-Origin: *
Vary: Accept-Encoding
Content-Length: 140
Content-Type: text/html
Connection: close

Successfully dumped 2 post variables.
View it at http://www.posttestserver.com/data/2014/12/25/13.53.43751344231
Post body was 0 chars long.
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The first line in the HTTP Response is the HTTP Status code along with HTTP Version.
