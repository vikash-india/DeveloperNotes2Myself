# Description: HTTP Informational Status Code - 100 - WriteHere

### Connect to an HTTP Server on port 80 using any Telnet client.
```
telnet www.httpbin.org 80
```

### Send an HTTP Request message to the server.
```
---
GET /status/200 HTTP/1.1
Host: httpbin.org
Connection: close
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 200 OK
Connection: close
Server: gunicorn/18.0
Date: Sun, 11 Jan 2015 18:45:41 GMT
Content-Type: text/html; charset=utf-8
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
Content-Length: 0
Via: 1.1 vegur

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
