# Description: Send an HTTP GET Request and Receive HTTP Response

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.posttestserver.com 80
```

### Send an HTTP Request Message to the server.
```
---
GET /post.php?key2=Value+for+2&key1=Value+for+1 HTTP/1.1
Host: posttestserver.com
Connection: close
Accept: */*
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.

### Receive an HTTP Response Message from the server.
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
- The first line in the HTTP Response is the HTTP Status code.
