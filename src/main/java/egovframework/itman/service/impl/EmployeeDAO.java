package egovframework.itman.service.impl;

import egovframework.itman.service.EmployeeVO;
import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDAO  {
    @Autowired
    private SqlSession sqlSession;
    
    public List<EmployeeVO> selectEmployeeList(EmployeeVO vo) {
        return sqlSession.selectList("employeeDAO.selectEmployeeList", vo);
    }

    public EmployeeVO selectEmployeeView(EmployeeVO vo) {
        return sqlSession.selectOne("employeeDAO.selectEmployeeView", vo);
    }
    public void insertEmployee(EmployeeVO vo) {
        sqlSession.insert("employeeDAO.insertEmployee", vo);
    }
    public void deleteEmployee(EmployeeVO vo) {
        sqlSession.delete("employeeDAO.deleteEmployee", vo); }
    public void updateEmployee(EmployeeVO vo) {

        sqlSession.update("employeeDAO.updateEmployee", vo);
    }

}
