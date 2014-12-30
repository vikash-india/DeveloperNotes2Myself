# Description: HTTP Operation - DELETE

### The HTTP DELETE Method
- The HTTP DELETE Request message requests the origin server to delete the resource identified by the Request-URI.
- This method MAY be overridden by human intervention (or other means) on the origin server. The client cannot be guaranteed that the operation has been carried out, even if the status code returned from the origin server indicates that the action has been completed successfully. However, the server SHOULD NOT indicate success unless, at the time the response is given, it intends to delete the resource or move it to an inaccessible location.
- A successful response SHOULD be '200 (OK)' if the response includes an entity describing the status, '202 (Accepted)' if the action has not yet been enacted, or '204 (No Content)' if the action has been enacted but the response does not include an entity.
- If the request passes through a cache and the Request-URI identifies one or more currently cached entities, those entries SHOULD be treated as stale.
- Responses to this method are not cacheable.

### Connect to an HTTP Server on port 80 using any telnet client.
```
telnet www.httpbin.org 80
```

### Send an HTTP Request message to the server.
```
---
DELETE /delete HTTP/1.1
Host: httpbin.org
Connection: close
Accept: */*
User-Agent: telnet/0.17-36build2 Linux/3.13.0-43-generic

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.

### Receive an HTTP Response message from the server.
```
---
HTTP/1.1 403 Access Denied
Date: Tue, 30 Dec 2014 05:01:54 GMT
Connection: close
Cache-Control: no-store
Content-Type: text/html
Content-Language: en
Content-Length: 249

<HTML>
<HEAD>
<TITLE>Access Denied</TITLE>
</HEAD>

<BODY BGCOLOR="white" FGCOLOR="black">
<H1>Access Denied</H1>
<HR>

<FONT FACE="Helvetica,Arial"><B>
Description: You are not allowed to access the document you requested.
</B></FONT>
<HR>
</BODY>
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The first line in the HTTP Response is the HTTP Status code.
