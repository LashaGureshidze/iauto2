package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * გადაეცემა მანქანის ID და სურათის ID. 
	 * სურათის ID აქვს შემდეგი სახე: photo1 , photo2   და ა.შ.
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("id") == null || request.getParameter("id").isEmpty()) return;
		if(request.getParameter("photoId") == null || request.getParameter("photoId").isEmpty()) return;
		
		PersistenceService service = (PersistenceService)request.getServletContext().getAttribute("persistenceService");
		byte[] img = service.findPhoto(Long.parseLong(request.getParameter("id")), request.getParameter("photoId"));
		ServletOutputStream out = response.getOutputStream();
		response.setContentType("image/gif");
		if (img != null ) {
			out.write(img);
		}
	}
}
