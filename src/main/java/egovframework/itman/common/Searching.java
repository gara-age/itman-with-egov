package egovframework.itman.common;


public class Searching {
    private String orderBy; //정렬 / 이름순, 부서순, 사번순
    private String posIdx; //검색할 직위
    private String stIdx; //검색할 상태
    private String divIdx; //검색할 부서
    private String searchCondition;
    private String searchKeyword; //검색어
    private String divYn;
    private String groIdx;
    private String memIdx;
    private String assCatIdx;
    private String staIdx;
    private String supIdx;

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

    public String getSupIdx() {
        return supIdx;
    }

    public void setSupIdx(String supIdx) {
        this.supIdx = supIdx;
    }

    public String getGroIdx() {
        return groIdx;
    }

    public void setGroIdx(String groIdx) {
        this.groIdx = groIdx;
    }

    public String getMemIdx() {
        return memIdx;
    }

    public void setMemIdx(String memIdx) {
        this.memIdx = memIdx;
    }

    public Searching() {
    }
    public Searching(String groIdx, String memIdx) {
        this.groIdx = groIdx;
        this.memIdx = memIdx;
    }
    public Searching(String groIdx) {
        this.groIdx = groIdx;
    }
    public Searching(String orderBy, String posIdx, String stIdx, String divIdx, String searchCondition, String divYn) {
        this.orderBy = orderBy;
        this.posIdx = posIdx;
        this.stIdx = stIdx;
        this.divIdx = divIdx;
        this.searchCondition = searchCondition;
        this.divYn = divYn;

    }

    public String getDivYn() {
        return divYn;
    }

    public void setDivYn(String divYn) {
        this.divYn = divYn;
    }

    public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getPosIdx() {
        return posIdx;
    }

    public void setPosIdx(String posIdx) {
        this.posIdx = posIdx;
    }

    public String getStIdx() {
        return stIdx;
    }

    public void setStIdx(String stIdx) {
        this.stIdx = stIdx;
    }

    public String getDivIdx() {
        return divIdx;
    }

    public void setDivIdx(String divIdx) {
        this.divIdx = divIdx;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }
}
