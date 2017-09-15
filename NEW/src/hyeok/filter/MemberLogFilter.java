package hyeok.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(
		urlPatterns = { "/Member/*" }, 
		initParams = { 
				@WebInitParam(name = "logPath", value = "/log/")
		})
public class MemberLogFilter implements Filter {
	private SimpleDateFormat dateTime;
	private PrintWriter pw;
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		chain.doFilter(request, response);
		
	}

	

	public void destroy() {}

		
}
