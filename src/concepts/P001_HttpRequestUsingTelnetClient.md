# Description: Send HTTP Request Using a Telnet Client

### Connect to an HTTP Server on port 80 using any Telnet client.
```
telnet www.posttestserver.com 80

# Other valid examples
telnet www.google.com 80
telnet www.httpbin.org 80
telnet 192.168.1.20 8080
```
- Specify port 80 explicitly otherwise telnet will connect to port 23 by default.

### Send an HTTP Request Message to the server.
```
---
GET /post.php HTTP/1.1
Host: posttestserver.com
Connection: close
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- The beginning & end of HTTP message is marked with '---' above only for clarity. It is NOT a part of actual HTTP protocol.
- Type or paste the above HTTP Request message on telnet command prompt.
- An empty line at the end of the HTTP Header is mandatory.

### Receive an HTTP Response Message from the server.
```
---
HTTP/1.1 200 OK
Date: Mon, 15 Dec 2014 18:35:52 GMT
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
- The beginning & end of HTTP message is marked with '---' above only for clarity. It is NOT a part of actual HTTP protocol.
