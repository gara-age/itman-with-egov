package egovframework.usr.com;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class EgovframeworkSessionVO extends ComDefaultVO {
	private String dpid="";
	private String dppw="";
	
	
	
	public String getDpid() {
		return dpid;
	}
	public void setDpid(String dpid) {
		this.dpid = dpid;
	}
	public String getDppw() {
		return dppw;
	}
	public void setDppw(String dppw) {
		this.dppw = dppw;
	}	
}
