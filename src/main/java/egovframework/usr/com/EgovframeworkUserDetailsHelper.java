package egovframework.usr.com;

public class EgovframeworkUserDetailsHelper {

	static EgovframeworkUserDetailsService EgovUserDetailsService;

	public EgovframeworkUserDetailsService getEgovUserDetailsService() {
		return EgovUserDetailsService;
	}

	public void setEgovUserDetailsService(EgovframeworkUserDetailsService egovUserDetailsService) {
		EgovframeworkUserDetailsHelper.EgovUserDetailsService = egovUserDetailsService;
	}

	/**
	 * 인증된 사용자객체를 VO형식으로 가져온다.
	 * @return Object - 사용자 ValueObject
	 */
	public static Object getAuthenticatedUser() {
		return EgovUserDetailsService.getAuthenticatedUser();
	}

	
}
