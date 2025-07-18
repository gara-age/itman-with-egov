package egovframework.com.cmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.com.cmm.service.EgovUserDetailsService;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

public class EgovUserDetailsSessionServiceImpl extends EgovAbstractServiceImpl implements EgovUserDetailsService {

	@Override
	public Object getAuthenticatedUser() {
		return RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
	}

	@Override
	public List<String> getAuthorities() {

		// 권한 설정을 리턴한다.
		List<String> listAuth = new ArrayList<String>();

		return listAuth;
	}

	@Override
	public Boolean isAuthenticated() {
		// 인증된 유저인지 확인한다.
		if (RequestContextHolder.getRequestAttributes() == null) {
			return false;
		} else {

			if (RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION) == null) {
				return false;
			} else {
				return true;
			}
		}

	}

}
