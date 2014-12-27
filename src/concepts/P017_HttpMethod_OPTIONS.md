# Description: HTTP Operation - OPTIONS

### The HTTP OPTIONS Method
- Clients can send an HTTP OPTIONS Request message to discover the capabilities of a server.
- If the client includes an Request-URI in the HTTP OPTIONS Request message, the server responds with the OPTIONS relevant to that object. If the client sends an asterisk (*) as the Request-URI, the server returns the general options that apply to all objects it maintains.
- HTTP OPTIONS Request message enables a client to determine the HTTP version supported by the server.
- HTTP Options Request message for a specific Request-URI enables the client to determine the encoding methods supported by the server for the Request-URI.
- HTTP Response messages to HTTP OPTIONS Request messages are not cacheable.
- Message body can be added to HTTP Request or HTTP Response message by might be discarded without further processing by the server or client respectively.

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.posttestserver.com 80
```

### Send an HTTP Request message to the server.
```
---
OPTIONS /  HTTP/1.1
Host: posttestserver.com
Connection: close
Accept: *
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- This HTTP OPTIONS Request message has the Request-URI as /. Use * instead of / to know the OPTIONS for all objects available on the server.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Date: Sat, 27 Dec 2014 17:01:00 GMT
Server: Apache
Allow: GET,HEAD,POST,OPTIONS
Vary: Accept-Encoding
Content-Length: 0
Connection: close
Content-Type: text/html

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- A '200 OK' response SHOULD include any header fields that indicate optional features implemented by the server and applicable to that resource.
- This HTTP OPTIONS Response message is applicable for the Request-URI as /.
