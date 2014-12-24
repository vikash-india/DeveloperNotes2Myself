# Description: Send HTTP Request Using an HTTP Client GUI Application

### Open an HTTP GUI application like REST-Client.
- There are many HTTP Client GUI application like REST-Client. Choose any one.

### Create an HTTP Request message using the UI.
- URL: Type `http://posttestserver.com/post.php`.
- Method Tab: Select `GET`.
- Header Tab: Add the following headers.
    - Key: Type `Host`, Value: Type `posttestserver.com`.
    - Key: Type `Connection`, Value: Type `Close`.
- Cookie Tab: Leave it blank.
- Body Tab: Leave it blank.
- Auth Tab: Leave it blank.
- SSL Tab: Leave it blank.
- Etc Tab:
    - Select Version 'HTTP 1.1`.
    - Select `Cookie v1`.
- Click on green button `>>` or `Go`.
- Clicking on Go will form an HTTP Request message and send it to the server.
- The HTTP Response received from the server will be displayed within the GUI application.

### Note
- Tools like these can be used to automate testing of HTTP APIs.
