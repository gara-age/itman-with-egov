package egovframework.itman.asset.service;

public class AssetVO {
    private String assIdx; //자산IDX
    private String groIdx; //소속 그룹 IDX
    private String assUlid; //자산 ULID
    private String assName; //자산 이름
    private String assCatIdx; //자산 분류 IDX
    private String staIdx; //자산 상태 IDX
    private String locIdx; //자산 위치 IDX
    private String empIdx; //소유직원 IDX
    private String supIdx; //구매처 IDX
    private String buyDate; //최초 구매일
    private String price; //가격
    private String regDate; //최초 등록일시
    private String regIdx; //등록자 IDX
    private String modDate; //최종수정일시
    private String modIdx; //수정자 IDX
    private String image; //자산 이미지
    private String delYn;

    public String getAssIdx() {
        return assIdx;
    }

    public void setAssIdx(String assIdx) {
        this.assIdx = assIdx;
    }

    public String getGroIdx() {
        return groIdx;
    }

    public void setGroIdx(String groIdx) {
        this.groIdx = groIdx;
    }

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

    public String getAssCatIdx() {
        return assCatIdx;
    }

    public void setAssCatIdx(String assCatIdx) {
        this.assCatIdx = assCatIdx;
    }

    public String getStaIdx() {
        return staIdx;
    }

    public void setStaIdx(String staIdx) {
        this.staIdx = staIdx;
    }

    public String getLocIdx() {
        return locIdx;
    }

    public void setLocIdx(String locIdx) {
        this.locIdx = locIdx;
    }

    public String getEmpIdx() {
        return empIdx;
    }

    public void setEmpIdx(String empIdx) {
        this.empIdx = empIdx;
    }

    public String getSupIdx() {
        return supIdx;
    }

    public void setSupIdx(String supIdx) {
        this.supIdx = supIdx;
    }

    public String getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(String buyDate) {
        this.buyDate = buyDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }
}
