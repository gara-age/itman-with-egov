package egovframework.itman.member.service;

public class MemberVO {
    private String memIdx; //사용자 IDX
    private String memName; //사용자 이름
    private String memMail; //이메일
    private String memPw; //비밀번호
    private String memTel; //휴대폰
    private String regDate; //생성일시
    private String modDate; //수정일시
    private String delYn; //삭제 여부
    private String delDate; //삭제 일시

    public String getMemIdx() {
        return memIdx;
    }

    public void setMemIdx(String memIdx) {
        this.memIdx = memIdx;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemMail() {
        return memMail;
    }

    public void setMemMail(String memMail) {
        this.memMail = memMail;
    }

    public String getMemPw() {
        return memPw;
    }

    public void setMemPw(String memPw) {
        this.memPw = memPw;
    }

    public String getMemTel() {
        return memTel;
    }

    public void setMemTel(String memTel) {
        this.memTel = memTel;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getModDate() {
        return modDate;
    }

    public void setModDate(String modDate) {
        this.modDate = modDate;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public String getDelDate() {
        return delDate;
    }

    public void setDelDate(String delDate) {
        this.delDate = delDate;
    }
}
