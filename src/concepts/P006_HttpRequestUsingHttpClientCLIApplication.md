# Description: Send HTTP Request Using Command Line Tool curl.

### Create an HTTP Request message using appropriate command line options.
```
curl --verbose \
--http1.1 \
--header "Host: posttestserver.com" \
--header "Connection: close" \
--header "User-Agent: curl/7.35.0 Linux/3.13.0-43-generic" \
--header "Accept: text/html" \
www.posttestserver.com/post.php
```
- Use the switch --verbose to display HTTP Request message and HTTP Response message.
- Use the switch --http1.1 to explicitly use HTTP version 1.1.
- Use the switch --header multiple times to define multiple HTTP Headers.
- There are many HTTP command line tools like curl but curl is one of the most versatile tool.

### HTTP Request message sent to the server.
```
---
GET /post.php HTTP/1.1
Host: posttestserver.com
Connection: close
User-Agent: curl/7.35.0 Linux/3.13.0-43-generic
Accept: text/html

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Date: Mon, 20 Dec 2014 16:35:52 GMT
Server: Apache
Access-Control-Allow-Origin: *
Vary: Accept-Encoding
Content-Length: 140
Connection: close
Content-Type: text/html

Successfully dumped 0 post variables.
View it at http://www.posttestserver.com/data/2014/12/15/10.35.52907067027
Post body was 0 chars long.
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
