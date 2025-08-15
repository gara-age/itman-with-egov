package egovframework.itman.empState.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.empState.service.EmpStateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmpStateDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<EmpStateVO> selectEmpStatesByGroup(String groIdx) {
        return sqlSession.selectList(
                "empStateDAO.selectEmpStatesByGroup", groIdx);
    }
    public List<EmpStateVO> selectEmpStateList(Pagination pagination) throws Exception {
        return sqlSession.selectList("empStateDAO.selectEmpStateList", pagination);
    }
    public EmpStateVO selectEmpStateView(EmpStateVO vo) throws Exception {
        return sqlSession.selectOne("empStateDAO.selectEmpStateView", vo);
    }

    public int selectEmpStateListCnt(Pagination pagination) throws Exception {
        return sqlSession.selectOne("empStateDAO.selectEmpStateListCnt", pagination);
    }


    public void insertEmployeeState(EmpStateVO vo) {
        sqlSession.insert("empStateDAO.insertEmployeeState", vo);
    }
    public void updateEmployeeState(EmpStateVO vo) {
        sqlSession.update("empStateDAO.updateEmployeeState", vo);
    }
    public void deleteEmployeeState(EmpStateVO vo) {
        sqlSession.update("empStateDAO.deleteEmployeeState", vo);
    }
    public EmpStateVO checkDuplicate(EmpStateVO vo){
        return sqlSession.selectOne("empStateDAO.checkDuplicate", vo);
    }
}
