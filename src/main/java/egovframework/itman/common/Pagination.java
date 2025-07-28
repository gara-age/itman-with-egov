package egovframework.itman.common;

public class Pagination {
    private int listSize = 10; //한 페이지당 보여질 리스트의 개수
    private int rangeSize = 10; //한 페이지 범위에 보여질 페이지의 개수
    private int page; //현재 목록의 페이지 번호
    private int range; //각 페이지 범위 시작 번호
    private int listCnt; //전체 게시물의 개수
    private int pageCnt; //전체 페이지 범위의 개수
    private int startPage; //각 페이지 범위 시작 번호
    private int startList;
    private int endPage; //각 페이지 범위 끝 번호
    private boolean prev; //이전 페이지 여부
    private boolean next; //다음 페이지 여부
    private Searching searching;
    private String rowNum;

    public void setOrderBy(String orderBy) {
        this.searching.setOrderBy(orderBy);
    }
    public void setPosIdx(String posIdx) {
        this.searching.setPosIdx(posIdx);
    }
    public void setStIdx(String stIdx) {
        this.searching.setStIdx(stIdx);
    }
    public void setDivIdx(String divIdx) {
        this.searching.setDivIdx(divIdx);
    }
    public void setSearchKeyword(String searchKeyword) {
        this.searching.setSearchKeyword(searchKeyword);
    }

    public String getRowNum() {
        return rowNum;
    }

    public void setRowNum(String rowNum) {
        this.rowNum = rowNum;
    }

    public Pagination() {
        this.searching = new Searching();
    }

    public Searching getSearching() {
        return searching;
    }

    public void setSearching(Searching searching) {
        this.searching = searching;
    }
    public void setSearchingGroIdx(Searching searching, String groIdx) {
        this.searching = searching;
        this.searching.setGroIdx(groIdx);
    }

    public Pagination(Searching searching) {
        this.searching = searching;
    }

    public int getListSize() {
        return listSize;
    }

    public void setListSize(int listSize) {
        this.listSize = listSize;
    }

    public int getRangeSize() {
        return rangeSize;
    }

    public void setRangeSize(int rangeSize) {
        this.rangeSize = rangeSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRange() {
        return range;
    }

    public void setRange(int range) {
        this.range = range;
    }

    public int getListCnt() {
        return listCnt;
    }

    public void setListCnt(int listCnt) {
        this.listCnt = listCnt;
    }

    public int getPageCnt() {
        return pageCnt;
    }

    public void setPageCnt(int pageCnt) {
        this.pageCnt = pageCnt;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getStartList() {
        return startList;
    }

    public void setStartList(int startList) {
        this.startList = startList;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public void pageInfo(int page, int range, int listCnt) {
        this.page = page; //현재 페이지 정보
        this.range = range; //현재 페이지 범위 정보
        this.listCnt = listCnt; //게시물의 총 갯수

        //전체 페이지 수
        this.pageCnt = (int) Math.ceil((double)listCnt / listSize);

        //시작 페이지
        this.startPage = (range - 1) * rangeSize + 1;

        //끝 페이지
        this.endPage = range * rangeSize;

        //게시판 시작 번호
        this.startList = (page -1 ) * listSize;

        //이전 버튼 상태
        this.prev = range == 1 ? false : true;

        //다음 버튼 상태
        this.next = endPage > pageCnt ? false : true;
        if(this.endPage > this.pageCnt){
            this.endPage = this.pageCnt;
            this.next = false;
        }
    }
}
