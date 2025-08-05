package egovframework.itman.assetCategory.service;

public class AssetCategoryVO {
    private String assCatIdx; //자산분류IDX
    private String groIdx; //소속그룹IDX
    private String assCatCode; //자산분류코드
    private String assCatName; //자산분류이름
    private String regDate; //생성일시
    private String regIdx; //생성자IDX
    private String modDate; //수정일시
    private String modIdx; //수정자IDX
    private String delYn; //삭제여부
    private String delIdx; //삭제자IDX
    private String delDate; //삭제일시
    private String slNote; //비고

    public String getAssCatIdx() {
        return assCatIdx;
    }

    public void setAssCatIdx(String assCatIdx) {
        this.assCatIdx = assCatIdx;
    }

    public String getGroIdx() {
        return groIdx;
    }

    public void setGroIdx(String groIdx) {
        this.groIdx = groIdx;
    }

    public String getAssCatCode() {
        return assCatCode;
    }

    public void setAssCatCode(String assCatCode) {
        this.assCatCode = assCatCode;
    }

    public String getAssCatName() {
        return assCatName;
    }

    public void setAssCatName(String assCatName) {
        this.assCatName = assCatName;
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

    public String getSlNote() {
        return slNote;
    }

    public void setSlNote(String slNote) {
        this.slNote = slNote;
    }
}
