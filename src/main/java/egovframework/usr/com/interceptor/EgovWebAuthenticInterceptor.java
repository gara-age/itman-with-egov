package egovframework.usr.com.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.support.RequestContextUtils;

public class EgovWebAuthenticInterceptor implements HandlerInterceptor {
	
	
	/*@Resource(name="siteService")
	EgovEvalAdmSiteService siteService;*/
	
	private String siteType;
	private String siteLang;

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}
	
	public void setSiteLang(String siteLang) {
		this.siteLang = siteLang;
	}
	
	/**
	 * 세션에 사용자 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("siteType >>>> " + siteType);
		System.out.println("siteLang >>>> " + siteLang);
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
		Locale loc = localeResolver.resolveLocale(request);
		if(!loc.equals(siteLang)) {
			//localeResolver.setLocale(request, response, StringUtils.parseLocaleString(siteLang));
		}
		
		System.out.println(" --리다이렉트 URI 확인-- "+request.getRequestURI());
		

		return true;
	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

}