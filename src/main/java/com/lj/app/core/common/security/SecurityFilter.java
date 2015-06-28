package com.lj.app.core.common.security;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.lj.app.core.common.util.ValidateUtil;

public class SecurityFilter implements Filter {
	
	private static Log logger =  LogFactory.getLog(SecurityFilter.class);

	private String isNeedAuthen;
	
	private Set<String> skipValidatePageSet = new HashSet();
	
	private Set<String> skipValidateDirSet = new HashSet();

	private Set<String> skipSessionValidateDirSet = new HashSet();
	
	private Set<String> needValidateUrlSet;//uap_permission中需要验证的url集合
	
	private Set<String> disabledAccessUrlSet;//uap_permission中不可访问的url集合
	
	public void init(FilterConfig filterConfig) {
		isNeedAuthen = filterConfig.getInitParameter("isNeedAuthen");
		String contextPath = filterConfig.getInitParameter("contextPath");
		
		String skipPrivilegeValidatePage = filterConfig.getInitParameter("skipPrivilegeValidatePage");
		
		if(ValidateUtil.isNotEmpty(skipPrivilegeValidatePage)) {
			String[] urls = skipPrivilegeValidatePage.split(",");
			for (int i = 0; i < urls.length; i++) {
				skipValidatePageSet.add(contextPath + urls[i].trim());
			}
		}
		String skipPrivilegeValidateDir = filterConfig.getInitParameter("skipPrivilegeValidateDir");
		if(ValidateUtil.isNotEmpty(skipPrivilegeValidateDir)) {
			String[] dirs = skipPrivilegeValidateDir.split(",");
			for (int i = 0; i < dirs.length; i++) {
				skipValidateDirSet.add(contextPath + dirs[i].trim());
			}
		}
		String skipSessionValidate = filterConfig.getInitParameter("skipSessionValidate");
		if(ValidateUtil.isNotEmpty(skipSessionValidate)) {
			String[] pages = skipSessionValidate.split(",");
			for (int i = 0; i < pages.length; i++) {
				skipSessionValidateDirSet.add(contextPath + pages[i].trim());
			}
		}
		
		//加载uap_permission中需要验证的url集合
		//SecurityApiService securityApiService = SpringContextHolder.getBean(SecurityApiService.class);
		logger.info("needValidateUrlSet load......");
		//needValidateUrlSet = securityApiService.findPermissionUrlByDomainId(2);
		logger.info("needValidateUrlSet load success");
		//加载uap_permission中不可访问的url集合
		logger.info("disabledAccessUrlSet load......");
		//disabledAccessUrlSet = securityApiService.findDisabledPermissionUrlByDomainId(2);
		logger.info("disabledAccessUrlSet load success");
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain) {
		try {
			HttpServletRequest request = (HttpServletRequest) servletRequest;
			HttpServletResponse response = (HttpServletResponse) servletResponse;
			HttpSession session = request.getSession();
			String requestUri = request.getRequestURI().toString();
			String contextPath = request.getContextPath();
			CMSecurityContext securityContext = (CMSecurityContext) session.getAttribute(SecurityConstants.SECURITY_CONTEXT);
			
			//如果用户已经登录，那么就直接到首页，防止重复登录
			if(requestUri.equals(contextPath + "/login.jsp")) {
				if(securityContext != null) {
					response.sendRedirect(contextPath+ "/index.jsp");
					return;
				}
			}
			
			//session验证
			boolean sessionValidate = validateSession(securityContext, requestUri, contextPath);
			if(!sessionValidate) {
				response.sendRedirect(contextPath + "/jsp/common/sessionexpire.jsp");
				return;
			}
			
			//权限验证
			if(isNeedAuthen.equals("true")) {
				boolean permissionValidate = validatePermission(securityContext, requestUri, contextPath);
				
				if(!permissionValidate) {
					response.sendRedirect(contextPath + "/jsp/common/nopermission.jsp");
					return ;
				}
			}
			
			String queryStr = request.getQueryString();
			String fullRequestUri = contextPath + requestUri;
			if(null != queryStr && !"".equals(queryStr)){
				fullRequestUri += "?" + queryStr;
			}
			/*
			 * 如果访问的地址在uap_permission表中state=1，就不允许访问
			 */
			for (Iterator iter = disabledAccessUrlSet.iterator(); iter.hasNext();) {
				String url = contextPath + (String) iter.next();
				if(fullRequestUri.indexOf(url) != -1){
					response.sendRedirect(contextPath + "/jsp/common/nopermission.jsp");
					return;
				}
			}
			/*
			 * 权限验证(防止在地址栏直接输入)
			 * 1.如果访问地址在uap_permission表中存在，判断当前主帐号没有该权限，没有就跳转到nopermission.jsp页面。
			 * 2.如果访问地址在uap_permission表中不存在，则通过验证。
			*/
			for (Iterator iter = needValidateUrlSet.iterator(); iter.hasNext();) {
				String url = contextPath + (String) iter.next();
				if(fullRequestUri.indexOf(url) != -1){
					if(!securityContext.hasUrlPermission(url)){
						response.sendRedirect(contextPath + "/jsp/common/nopermission.jsp");
						return;
					}
				}
			}
				
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for (Cookie cookie : cookies){
					if (cookie.getName()!=null && cookie.getName().equalsIgnoreCase("JSESSIONID")){
						response.setHeader("SET-COOKIE", String.format("%s=%s; HttpOnly;path=/" + contextPath + "/", cookie.getName(), session.getId() ));
					}else{
						response.setHeader("SET-COOKIE", String.format("%s=%s ;HttpOnly", cookie.getName(), cookie.getValue()));
					}
				}
			}
			
			filterChain.doFilter(servletRequest, servletResponse);

		} catch (ServletException sx) {
			sx.printStackTrace();
			
		} catch (IOException iox) {
			iox.printStackTrace();
		}

	}

	/**功能权限验证
	 * @param securityContext
	 * @return
	 */
	private boolean validatePermission(CMSecurityContext securityContext, String requestUri, String contextPath) {
		if(!isSkipValidate(requestUri, contextPath)){
			if(!securityContext.hasUrlPermission(requestUri)) {
				return false;
			}
		}
		
		return true;
	}

	/**验证session
	 * @param securityContext
	 * @param contextPath 
	 * @param requestUri 
	 * @return
	 */
	private boolean validateSession(CMSecurityContext securityContext, String requestUri, String contextPath) {
		if(!isSkipSessionValidate(requestUri, contextPath)) {
			if(securityContext == null) {
				return false;
			}
		}
		
		return true;
	}

	private boolean isSkipSessionValidate(String requestUri, String contextPath){
		for (Iterator iterator = skipSessionValidateDirSet.iterator(); iterator.hasNext();) {
			String page = (String) iterator.next();
			if(requestUri.indexOf(page) != -1){
				return true ;
			}
			
		}
		
		return false ;
	}	

	private boolean isSkipValidate(String requestUri, String contextPath){
		//先根据目录过滤
		for (Iterator iterator = skipValidateDirSet.iterator(); iterator.hasNext();) {
			String dir = (String) iterator.next();
			if(requestUri.indexOf(dir) != -1){
				return true ;
			}
			
		}
		
		//再过滤具体请求
		if(skipValidatePageSet.contains(requestUri)) {
			return true;
		}
		
		return false ;
	}	
	
	public void destroy() {

	}
}