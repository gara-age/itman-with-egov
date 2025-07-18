package egovframework.usr.com;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

public class EgovframeworkUserDetailsSessionServiceImpl extends EgovAbstractServiceImpl implements EgovframeworkUserDetailsService {

	@Override
	public Object getAuthenticatedUser() {
		// TODO Auto-generated method stub
		if (RequestContextHolder.getRequestAttributes() == null) {
				return null;
			}
	
		return RequestContextHolder.getRequestAttributes().getAttribute("sessionVo", RequestAttributes.SCOPE_SESSION);
		}

//	public List<String> getAuthorities() {
//
//		// 권한 설정을 리턴한다.
//		List<String> listAuth = new ArrayList<String>();
//
//		return listAuth;
//	}
//
//	public Boolean isAuthenticated() {
//		// 인증된 유저인지 확인한다.
//
//		if (RequestContextHolder.getRequestAttributes() == null) {
//			return false;
//		} else {
//
//			if (RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION) == null) {
//				return false;
//			} else {
//				return true;
//			}
//		}
//
//	}
//
//	
//	
//	public Object getAuthenticatedUsrInfo() {
//		if (RequestContextHolder.getRequestAttributes() == null) {
//			return null;
//		}
//		return RequestContextHolder.getRequestAttributes().getAttribute("usrSessionVo", RequestAttributes.SCOPE_SESSION);
//
//	}
//	
//	public Object getAuthenticatedSiteInfo() {
//		if (RequestContextHolder.getRequestAttributes() == null) {
//			return null;
//		}
//		return RequestContextHolder.getRequestAttributes().getAttribute("siteSessionVo", RequestAttributes.SCOPE_SESSION);
//
//	}
//	
//	public Object getAuthenticatedAdmisUserInfo() {
//		if (RequestContextHolder.getRequestAttributes() == null) {
//			return null;
//		}
//		return RequestContextHolder.getRequestAttributes().getAttribute("admissionSessionVo", RequestAttributes.SCOPE_SESSION);
//
//	}
//	
//	public Object getSpeakersAuthenticatedUser() {
//		if (RequestContextHolder.getRequestAttributes() == null) {
//			return null;
//		}
//		return RequestContextHolder.getRequestAttributes().getAttribute("speakersSessionVo", RequestAttributes.SCOPE_SESSION);
//
//	}
//	
//	public List<String> getAdminAuthorities() {
//
//		// 권한 설정을 리턴한다.
//		List<String> listAuth = new ArrayList<String>();
//
//		return listAuth;
//	}
//
//	public Boolean isAdminAuthenticated() {
//		// 인증된 유저인지 확인한다.
//
//		if (RequestContextHolder.getRequestAttributes() == null) {
//			return false;
//		} else {
//
//			if (RequestContextHolder.getRequestAttributes().getAttribute("adminSessionVo", RequestAttributes.SCOPE_SESSION) == null) {
//				return false;
//			} else {
//				return true;
//			}
//		}
//
//	}

	

}
