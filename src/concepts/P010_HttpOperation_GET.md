# Description: HTTP Operation - GET

### The GET Operation
- The GET operation is a simple two-message exchange.
- The client initiates an HTTP Request to the server & specifies the GET operation as part of HTTP Request message.
- The GET message includes a request for an Uniform Resource Identifier (URI).
- The client can optionally include one or more HTTP parameters (key-value pair) to the server.
- The server returns an HTTP Response message consisting of HTTP Status Code, HTTP Response Header and an optional HTTP Response body.
- The server sends a status code of 200 OK for a successful HTTP Response or sends one of the many error status codes.

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.posttestserver.com 80
```

### Send an HTTP Request message to the server.
```
---
GET /post.php?key1=Value+for+1&key2=Value+for+2 HTTP/1.1
Host: posttestserver.com
Connection: close
Accept: */*
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Date: Mon, 15 Dec 2014 13:23:29 GMT
Server: Apache
Access-Control-Allow-Origin: *
Vary: Accept-Encoding
Content-Length: 141
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
Content-Type: text/html

Successfully dumped 0 post variables.
View it at http://www.posttestserver.com/data/2014/12/15/05.23.291850154350
Post body was 0 chars long.
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The line "HTTP/1.1 200 OK" in the HTTP Response is the HTTP version '1.1', HTTP Status code '200' and HTTP Status Code description 'OK'.
