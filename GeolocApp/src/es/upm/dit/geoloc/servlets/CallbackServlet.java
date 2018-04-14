package es.upm.dit.geoloc.servlets;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.auth.RequestToken;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.h2.command.ddl.CreateUser;
import org.hibernate.Session;

import java.io.IOException;
import es.upm.dit.geoloc.dao.model.User;
import es.upm.dit.geoloc.dao.SessionFactoryService;
import es.upm.dit.geoloc.dao.UserDAOImplementation;



public class CallbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1657390011452788111L;
    
    public static void main (String [ ] args) {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
        RequestToken requestToken = (RequestToken) request.getSession().getAttribute("requestToken");
        String verifier = request.getParameter("oauth_verifier");
        try {
            twitter.getOAuthAccessToken(requestToken, verifier);
            request.getSession().removeAttribute("requestToken");
        } catch (TwitterException e) {
            throw new ServletException(e);
        }
    	Session session = SessionFactoryService.get().openSession();
        User user = new User();
        user.setEmail("Prueba@gmail.com");
		try {
		            	session.beginTransaction();
		            	session.save(user);
		            	session.getTransaction().commit();
		} catch (Exception e) {
		            	// manejar excepciones
		} finally {
		            	session.close();
		}
        response.sendRedirect(request.getContextPath() + "/Index.jsp");
    }
}
