package egovframework.usr.com;

public class EgovframeworkSessionUtil {
	
	   public static String getId() {
		   
		   EgovframeworkSessionVO sessionVO = (EgovframeworkSessionVO) EgovframeworkUserDetailsHelper.getAuthenticatedUser();
	    	if(sessionVO != null) {
	    		return sessionVO.getDpid();
	    	}
	    	else {
	    		return null;
	    	}
	    }
	   
	   public static String getPw() {
		   
		   EgovframeworkSessionVO sessionVO = (EgovframeworkSessionVO) EgovframeworkUserDetailsHelper.getAuthenticatedUser();
		   if(sessionVO != null) {
			   return sessionVO.getDppw();
		   }
		   else {
			   return null;
		   }
	   }
	  
}