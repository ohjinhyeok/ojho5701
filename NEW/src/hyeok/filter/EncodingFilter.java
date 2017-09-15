package hyeok.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter {
	private String charSet;
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("EncodingFilter init()");
		charSet = fConfig.getInitParameter("KR");
	}

	public void doFilter(ServletRequest request, 
						 ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(charSet);
		response.setContentType("text/html; charset="+charSet);
		System.out.println("EncodingFilter - 한글 인코딩 처리 완료");
		chain.doFilter(request, response);
		
		HttpServletRequest httpRequest 
		= (HttpServletRequest)request;
		
	}

	public void destroy() {	}
	
	
	
	
}
