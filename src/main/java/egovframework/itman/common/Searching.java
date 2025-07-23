package egovframework.itman.common;


public class Searching {
    private String orderBy; //정렬 / 이름순, 부서순, 사번순
    private String posIdx; //검색할 직위
    private String stIdx; //검색할 상태
    private String divIdx; //검색할 부서
    private String searchKeyword; //검색어

    public Searching() {}
    public Searching(String orderBy, String posIdx, String stIdx, String divIdx) {
        this.orderBy = orderBy;
        this.posIdx = posIdx;
        this.stIdx = stIdx;
        this.divIdx = divIdx;
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
