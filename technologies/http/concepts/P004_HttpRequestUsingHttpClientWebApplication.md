# Description: Send HTTP Request Using an HTTP Web Client

### Open an HTTP Web Client
* There are many HTTP Web Clients like `https://www.apirequest.io/`. Choose any one.
* Open the HTTP web client in a web browser.
```
https://www.apirequest.io/
```

### Create an HTTP Request
* Destination: Select `GET` from the drop down. Type URL as `http://ptsv2.com/`.
* Headers: Add the following headers.
    - `Host` with value `http://ptsv2.com/`.
    - `Connection` with value `Close`.
* Parameters: Leave it blank.
* Request Bodu: Leave it blank.

- Click on Launch Button. This will make an HTTP Request and show the HTTP Response.
* Click on 'Generate curl command
```
curl -X GET -H 'Host: http://ptsv2.com/' -H 'Connection: Close' -v -i 'http://ptsv2.com/'
```

### HTTP Request message sent to the server.
```
---
Accept: */*
Accept-Encoding: gzip, deflate
Connection: Close
Host: ptsv2.com
User-Agent: runscope/0.1

---
```

* For clarity, the beginning & end of HTTP message is marked with '---' above but it is NOT a part of actual HTTP message protocol.
* The HTTP Headers Accept, Accept-Encoding and User-Agent were added by the HTTP web client.

### HTTP Response message received from the server.
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
