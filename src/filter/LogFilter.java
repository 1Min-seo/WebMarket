package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class LogFilter implements Filter{
	
	// init() JSP가 필터를 초기화할 때 호출
	public void init(FilterConfig config) throws ServletException{
		System.out.println("WebMarket 초기화....");
	}
	
	// doFilter() JSP 컨테이너가 필터를 리소스에 적용할 때마다 호출
	public void doFilter(ServletRequest request, ServletResponse response,
		FilterChain chain) throws java.io.IOException, ServletException{
		System.out.println(" 접속한 클라이언트 IP : "+request.getRemoteAddr());
		long start=System.currentTimeMillis();
		System.out.println(" 접근한 URL 경로 : " +getURLPath(request));
		System.out.println(" 요청 처리 시작 시각 : "+getCurrentTime());
		chain.doFilter(request, response);
		
		
		long end=System.currentTimeMillis();
		System.out.println(" 요청 처리 종료 시각 : "+getCurrentTime());
		System.out.println(" 요청 처리 소요 시각 : "+(end-start)+"ms ");
		System.out.println("======================================================================");
	}
	
	// destroy() JSP 컨테이너가 필터 인스턴스를 삭제하기 전에 호출
	public void destroy() {
		
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";
		String queryString="";
		if(request instanceof HttpServletRequest) {
			req=(HttpServletRequest)request;
			currentPath=req.getRequestURI();
			queryString=req.getQueryString();
			queryString=queryString==null ? "":"?"+queryString;
		}
		return currentPath+queryString;
	}
	
	private String getCurrentTime() {
		DateFormat formatter=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar=Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
	
}
