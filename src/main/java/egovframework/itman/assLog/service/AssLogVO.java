package egovframework.itman.assLog.service;

public class AssLogVO {
    private String alIdx; //로그 IDX
    private String assNameLog;
    private String assIdx; //로그 파생 자산 IDX
    private String alType; //활동 구분
    private String alCat; //활동 분류
    private String alCont; //활동 내용
    private String alNote; //활동 비고
    private String regDate; //생성 일시
    private String regIdx; //생성자 IDX
    private String memName;
    private String regIp; //생성자IP
    private String assUlid;
    private String assName;

    public String getAssUlid() {
        return assUlid;
    }

    public void setAssUlid(String assUlid) {
        this.assUlid = assUlid;
    }

    public String getAssName() {
        return assName;
    }

    public void setAssName(String assName) {
        this.assName = assName;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getAlIdx() {
        return alIdx;
    }

    public void setAlIdx(String alIdx) {
        this.alIdx = alIdx;
    }

    public String getAssNameLog() {
        return assNameLog;
    }

    public void setAssNameLog(String assNameLog) {
        this.assNameLog = assNameLog;
    }

    public String getAssIdx() {
        return assIdx;
    }

    public void setAssIdx(String assIdx) {
        this.assIdx = assIdx;
    }

    public String getAlType() {
        return alType;
    }

    public void setAlType(String alType) {
        this.alType = alType;
    }

    public String getAlCat() {
        return alCat;
    }

    public void setAlCat(String alCat) {
        this.alCat = alCat;
    }

    public String getAlCont() {
        return alCont;
    }

    public void setAlCont(String alCont) {
        this.alCont = alCont;
    }

    public String getAlNote() {
        return alNote;
    }

    public void setAlNote(String alNote) {
        this.alNote = alNote;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getRegIdx() {
        return regIdx;
    }

    public void setRegIdx(String regIdx) {
        this.regIdx = regIdx;
    }

    public String getRegIp() {
        return regIp;
    }

    public void setRegIp(String regIp) {
        this.regIp = regIp;
    }
}
