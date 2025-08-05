package egovframework.itman.software.service;

public class SoftwareVO {
    private String swIdx; //소프트웨어IDX
    private String assIdx; //소속자산 IDX
    private String swName; //소프트웨어 이름
    private String swCom; //소프트웨어 회사 이름
    private String swVer; //소프트웨어 버전

    public String getSwIdx() {
        return swIdx;
    }

    public void setSwIdx(String swIdx) {
        this.swIdx = swIdx;
    }

    public String getAssIdx() {
        return assIdx;
    }

    public void setAssIdx(String assIdx) {
        this.assIdx = assIdx;
    }

    public String getSwName() {
        return swName;
    }

    public void setSwName(String swName) {
        this.swName = swName;
    }

    public String getSwCom() {
        return swCom;
    }

    public void setSwCom(String swCom) {
        this.swCom = swCom;
    }

    public String getSwVer() {
        return swVer;
    }

    public void setSwVer(String swVer) {
        this.swVer = swVer;
    }
}
