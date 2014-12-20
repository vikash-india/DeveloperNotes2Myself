# Description: Send HTTP Request Using an HTTP Web Client

### Visit an HTTP Web Client like https://www.hurl.it/ using a Browser.
```
https://www.hurl.it/
```
- There are numerous HTTP Web Clients like https://www.hurl.it/. Choose any one.

### Create an HTTP Request Message Using the UI
- Destination: Select `GET` from the dropdown. Type URL as `posttestserver.com/post.php`.
- Authentication: Leave it blank.
- Headers: Add the following headers.
    - `Host` with value `posttestserver.com`.
    - `Connection` with value `Close`.
- Parameters: Leave it blank.
- Click on Launch Button. This will make an HTTP Request and show the HTTP Response.

### HTTP Request sent to the server.
```
---
Accept: */*
Accept-Encoding: gzip, deflate
Connection: Close
Host: posttestserver.com
User-Agent: runscope/0.1

---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The HTTP Headers Accept, Accept-Encoding and User-Agent were added by the HTTP web client.

### HTTP Response Message Received from the server.
```
---
Access-Control-Allow-Origin: *
Connection: close
Content-Length: 140
Content-Type: text/html
Date: Tue, 16 Dec 2014 18:50:25 GMT
Server: Apache

Successfully dumped 0 post variables.
View it at http://www.posttestserver.com/data/2014/12/16/10.50.25399003028
Post body was 0 chars long.
---
```
- For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
- The HTTP Status code is shown separately instead of as part of the HTTP Response message.
