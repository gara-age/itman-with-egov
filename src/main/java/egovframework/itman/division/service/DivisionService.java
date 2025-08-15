package egovframework.itman.division.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface DivisionService {
    List<DivisionVO> selectDivisionsByGroup(String groIdx);
    List<DivisionVO> selectDivisionList(Pagination pagination) throws Exception;
    DivisionVO selectDivisionView(DivisionVO divisionVO);
    int selectDivisionListCnt(Pagination pagination) throws Exception;
    void insertDivision(DivisionVO divisionVO);
    void updateDivision(DivisionVO divisionVO);
    void deleteDivision(DivisionVO divisionVO);
    DivisionVO checkDuplicate(DivisionVO vo);
}