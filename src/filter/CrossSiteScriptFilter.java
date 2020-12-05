package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.josephoconnell.html.HTMLInputFilter;
import request.XSSRequestWrapper;

public class CrossSiteScriptFilter implements Filter {

	private List<String> crossParamNames = new ArrayList<String>();
	private List<String> includeURLs = new ArrayList<String>();
	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest)request;
		
		String url = httpReq.getRequestURI();
		
		for(String includeURL : includeURLs) {
			if(url.contains(includeURL)) {
				XSSRequestWrapper requestWrapper = new XSSRequestWrapper((HttpServletRequest)request);
				requestWrapper.inputXSSFilter(crossParamNames);
				
				chain.doFilter(requestWrapper, response);
				return;
			}
		}
		
		chain.doFilter(request, response);
	
	
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		String includeURLsParams = fConfig.getInitParameter("includeURLs");
		StringTokenizer token = new StringTokenizer(includeURLsParams, ",");
		
		while(token.hasMoreTokens()) {
			
			includeURLs.add(token.nextToken());
		}
		
		
		String paramNames = fConfig.getInitParameter("XSSParameter");
		token = new StringTokenizer(paramNames, ",");
		
		while(token.hasMoreTokens()) {
			
			crossParamNames.add(token.nextToken());
		}
		
		
	}

}
