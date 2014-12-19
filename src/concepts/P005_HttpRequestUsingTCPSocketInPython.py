# Description: Send an HTTP Request Using a TCP Socket Code in Python

import socket

# Create a TCP Connection to the HTTP Server on port 80.
tcpSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcpSocket.connect(('www.posttestserver.com', 80))

# Create an HTTP GET Request message strictly adhering to the HTTP RFC 2616.
httpRequestMessage = """GET /post.php HTTP/1.1
Host: posttestserver.com
Connection: close
User-Agent: CPython/2.7.6 Linux/3.13.0-43-generic
\n"""

tcpSocket.send(httpRequestMessage)
while 1:
    data = tcpSocket.recv(1024)
    if not len(data):
        break
    print(data)

# Close the TCP Connection
tcpSocket.close()

# The output of the above code snippet will be as follows
# HTTP/1.1 200 OK
# Date: Tue, 16 Dec 2014 07:36:01 GMT
# Server: Apache
# Access-Control-Allow-Origin: *
# Vary: Accept-Encoding
# Content-Length: 140
# Connection: close
# Content-Type: text/html
#
# Successfully dumped 0 post variables.
# View it at http://www.posttestserver.com/data/2014/12/15/23.36.01167058517
# Post body was 0 chars long.
