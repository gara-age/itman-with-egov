package egovframework.itman.state.service;

public class StateVO {
    private String staIdx; //자산상태IDX
    private String groIdx; //소속그룹IDX
    private String staCode; //자산상태 코드번호
    private String staName; //자산상태 이름
    private String staYn; //직원 소유가능 여부
    private String staNote; //자산상태 설명
    private String regDate; //생성일시
    private String regIdx; //생성자IDX
    private String modDate; //수정일시
    private String modIdx; //수정자IDX
    private String delYn; //삭제여부
    private String delIdx; //삭제자IDX
    private String delDate; //삭제일시
    private String staCnt;

    public String getStaCnt() {
        return staCnt;
    }

    public void setStaCnt(String staCnt) {
        this.staCnt = staCnt;
    }

    public String getStaIdx() {
        return staIdx;
    }

    public void setStaIdx(String staIdx) {
        this.staIdx = staIdx;
    }

    public String getGroIdx() {
        return groIdx;
    }

    public void setGroIdx(String groIdx) {
        this.groIdx = groIdx;
    }

    public String getStaCode() {
        return staCode;
    }

    public void setStaCode(String staCode) {
        this.staCode = staCode;
    }

    public String getStaName() {
        return staName;
    }

    public void setStaName(String staName) {
        this.staName = staName;
    }

    public String getStaYn() {
        return staYn;
    }

    public void setStaYn(String staYn) {
        this.staYn = staYn;
    }

    public String getStaNote() {
        return staNote;
    }

    public void setStaNote(String staNote) {
        this.staNote = staNote;
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

    public String getModDate() {
        return modDate;
    }

    public void setModDate(String modDate) {
        this.modDate = modDate;
    }

    public String getModIdx() {
        return modIdx;
    }

    public void setModIdx(String modIdx) {
        this.modIdx = modIdx;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public String getDelIdx() {
        return delIdx;
    }

    public void setDelIdx(String delIdx) {
        this.delIdx = delIdx;
    }

    public String getDelDate() {
        return delDate;
    }

    public void setDelDate(String delDate) {
        this.delDate = delDate;
    }
}
