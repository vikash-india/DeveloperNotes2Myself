package topics.servlet;

import java.io.*;

import javax.servlet.http.*;
import javax.servlet.*;

// Extend HttpServlet class
public class HelloWorldServlet extends HttpServlet {

    public void doGet (HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        out.println("Hello, world!");
        out.close();
    }
}
