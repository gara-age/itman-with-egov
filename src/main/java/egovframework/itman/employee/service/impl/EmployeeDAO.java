package egovframework.itman.employee.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.common.Searching;
import egovframework.itman.employee.service.EmployeeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class EmployeeDAO  {
    @Autowired
    private SqlSession sqlSession;

    public List<EmployeeVO> selectEmployeeList(EmployeeVO vo) throws Exception {

        return sqlSession.selectList("employeeDAO.selectEmployeeList", vo);
    }

    public List<EmployeeVO> selectEmployeeList(Pagination pagination) throws Exception {

        return sqlSession.selectList("employeeDAO.selectEmployeeList", pagination);
    }

    public List<EmployeeVO> selectEmployeeList(int listCnt) throws Exception {

        return sqlSession.selectList("employeeDAO.selectEmployeeList", listCnt);
    }

    public int selectEmployeeListCnt() throws Exception{
        return sqlSession.selectOne("employeeDAO.selectEmployeeListCnt");
    }

    public int selectEmployeeListCnt(Pagination pagination) throws Exception{
        return sqlSession.selectOne("employeeDAO.selectEmployeeListCnt", pagination);
    }

    public int selectEmployeeListCnt(EmployeeVO employeeVO) throws Exception{
        return sqlSession.selectOne("employeeDAO.selectEmployeeListCnt", employeeVO);
    }

    public EmployeeVO selectEmployeeView(EmployeeVO vo) {
        return sqlSession.selectOne("employeeDAO.selectEmployeeView", vo);
    }

    public void insertEmployee(EmployeeVO vo) {
        sqlSession.insert("employeeDAO.insertEmployee", vo);
    }

    public void deleteEmployee(EmployeeVO vo) {
        sqlSession.update("employeeDAO.deleteEmployee", vo);
    }

    public void updateEmployee(EmployeeVO vo) {

        sqlSession.update("employeeDAO.updateEmployee", vo);
    }

    //update functions

    public void updateEmploTelInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploTelInfo", vo);
    }
    public void updateEmploNumInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploNumInfo", vo);
    }
    public void updateEmploDivisionInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploDivisionInfo", vo);
    }
    public void updateEmploPosInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploPosInfo", vo);
    }
    public void updateEmploMailInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploMailInfo", vo);
    }
    public void updateEmploNameInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploNameInfo", vo);
    }
    public void updateEmploStateInfo(EmployeeVO vo){
        sqlSession.update("employeeDAO.updateEmploStateInfo", vo);
    }

}
