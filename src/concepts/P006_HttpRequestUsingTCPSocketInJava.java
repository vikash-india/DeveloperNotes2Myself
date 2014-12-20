/* Description: Send an HTTP Request Using TCP Socket in Java
 *
 * Note
 * Compile using the command    : javac P006_HttpRequestUsingTCPSocketInJava.java
 * Run using the command        : java P006_HttpRequestUsingTCPSocketInJava
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;

public class P003_HttpRequestUsingTCPSocketInJava {

    public static void main(String[] args) throws Exception {

        // Create a TCP connection to the server on port 80.
        Socket tcpSocket = new Socket(InetAddress.getByName("www.posttestserver.com"), 80);

        // Create an HTTP GET Request message strictly adhering to the HTTP RFC 2616.
        String httpRequestMessage = "GET /post.php HTTP/1.1\n" +
                                    "Host: posttestserver.com\n" +
                                    "Connection: close\n" +
                                    "User-Agent: CPython/2.7.6 Linux/3.13.0-43-generic\n" +
                                    "\n";

        // Write the HTTP Request message to the socket.
        PrintWriter printWriter = new PrintWriter(tcpSocket.getOutputStream());
        printWriter.print(httpRequestMessage);
        printWriter.flush();

        // Read HTTP Response message from the socket.
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(tcpSocket.getInputStream()));
        String line;
        while ((line = bufferedReader.readLine()) != null)
            System.out.println(line);
        bufferedReader.close();

        // The output of the above code snippet will be an HTTP Response message similar to the one below
        // HTTP/1.1 200 OK
        // Date: Tue, 16 Dec 2014 07:52:56 GMT
        // Server: Apache
        // Access-Control-Allow-Origin: *
        // Vary: Accept-Encoding
        // Content-Length: 141
        // Connection: close
        // Content-Type: text/html
        //
        // Successfully dumped 0 post variables.
        // View it at http://www.posttestserver.com/data/2014/12/15/23.52.561861530692
        // Post body was 0 chars long.
    }
}
