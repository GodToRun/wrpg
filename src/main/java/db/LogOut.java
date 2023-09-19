 
package db;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException {
		try {
		    response.setContentType("text/html;charset=utf-8");
		    request.getSession().setAttribute("CurrentAcc", null);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
			requestDispatcher.forward(request, response);
		} catch(Exception e) { e.printStackTrace(); }
    }
}
    

