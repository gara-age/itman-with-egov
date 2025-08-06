package egovframework.itman.empState.service.impl;

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

    public void insertEmployeeState(EmpStateVO vo) {
        sqlSession.insert("empStateDAO.insertEmployeeState", vo);
    }
}
