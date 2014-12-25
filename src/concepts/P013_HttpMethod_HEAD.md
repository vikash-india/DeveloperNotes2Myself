# Description: HTTP Operation - HEAD

### The HTTP HEAD Method
- The HEAD operation is similar to GET except that the server MUST NOT return a HTTP Response message-body.
- The HTTP Header information contained in the HTTP Response message should be SAME as the HTTP GET Response message.
- The HTTP Response message also contains HTTP Status Code along with HTTP Headers.
- This operation is often used for testing hypertext links for validity, accessibility, and recent modification.
- The cache servers can use the HEAD operation to cache HTTP Response based on HTTP Headers - Content-Length, Content-MD5, ETag or Last-Modified.

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.posttestserver.com 80
```

### Send an HTTP Request message to the server.
```
---
HEAD /post.php HTTP/1.1
Host: posttestserver.com
Connection: close
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Date: Tue, 25 Dec 2014 02:14:54 GMT
Server: Apache
Access-Control-Allow-Origin: *
Vary: Accept-Encoding
Connection: close
Content-Type: text/html

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The HTTP Response message does not contain any message-body.
