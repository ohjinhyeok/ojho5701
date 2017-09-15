package hyeok.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class s
 *
 */
//@WebListener
public class SimpleListener implements ServletRequestListener, HttpSessionListener, ServletContextListener {
	
	
	
	
	public void contextInitialized(ServletContextEvent arg0)  { 
	     System.out.println("contextInitialized");
	     //servletcontext의 insa속성에 hello를 저장
	     arg0.getServletContext().setAttribute("insa", "hello");
	}
  
	public void contextDestroyed(ServletContextEvent arg0)  { 
		 System.out.println("contextDestroyed");
   }

    public void sessionCreated(HttpSessionEvent arg0)  { 
    	System.out.println("sessionCreated");
    }
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
    	System.out.println("sessionDestroyed");
   }
    public void requestInitialized(ServletRequestEvent arg0)  { 
    	System.out.println("requestInitialized");
   }

    public void requestDestroyed(ServletRequestEvent arg0)  { 
    	System.out.println("requestDestroyed");
    }

    
	
    

	
    
	
}
