package egovframework.itman.division.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.division.service.DivisionVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DivisionDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<DivisionVO> selectDivisionsByGroup(String groIdx) {
        return sqlSession.selectList(
                "divisionDAO.selectDivisionsByGroup", groIdx);
    }

    public List<DivisionVO> selectDivisionList(Pagination pagination) throws Exception {
        return sqlSession.selectList(
                "divisionDAO.selectDivisionList", pagination);
    }

    public DivisionVO selectDivisionView(DivisionVO divisionVO) {
        return sqlSession.selectOne("divisionDAO.selectDivisionView", divisionVO);
    }
    public int selectDivisionListCnt(Pagination pagination) throws Exception {
        return sqlSession.selectOne(
                "divisionDAO.selectDivisionListCnt", pagination);
    }
    public void insertDivision(DivisionVO divisionVO){
        sqlSession.insert("divisionDAO.insertDivision", divisionVO);
    }

    public void updateDivision(DivisionVO divisionVO){
        sqlSession.update("divisionDAO.updateDivision", divisionVO);
    }
    public void deleteDivision(DivisionVO divisionVO){
        sqlSession.update("divisionDAO.deleteDivision", divisionVO);
    }
    public DivisionVO checkDuplicate(DivisionVO vo){
        return sqlSession.selectOne("divisionDAO.checkDuplicate", vo);
    }
}