package egovframework.itman.employee.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.employee.service.EmployeeService;
import egovframework.itman.employee.service.EmployeeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Resource(name = "employeeDAO")
    private EmployeeDAO employeeDAO;

    @Override
    public List<EmployeeVO> selectEmployeeList(EmployeeVO vo) throws Exception {

        return employeeDAO.selectEmployeeList(vo);
    }

    public List<EmployeeVO> selectEmployeeList(Pagination pagination) throws Exception {

        return employeeDAO.selectEmployeeList(pagination);
    }

    @Override
    public int selectEmployeeListCnt() throws Exception{
        return employeeDAO.selectEmployeeListCnt();
    }

    public int selectEmployeeListCnt(Pagination pagination) throws Exception{
        return employeeDAO.selectEmployeeListCnt(pagination);
    }

    public int selectEmployeeListCnt(EmployeeVO employeeVO) throws Exception{
        return employeeDAO.selectEmployeeListCnt(employeeVO);
    }


    @Override
    public EmployeeVO selectEmployeeView(EmployeeVO vo) {

        return employeeDAO.selectEmployeeView(vo);
    }

    @Override
    public void insertEmployee(EmployeeVO vo) {

        employeeDAO.insertEmployee(vo);
    }

    @Override
    public void deleteEmployee(EmployeeVO vo) {

        employeeDAO.deleteEmployee(vo);
    }
//update functions
    @Override
    public void updateEmployee(EmployeeVO vo) {

        employeeDAO.updateEmployee(vo);
    }

    @Override
    public void updateEmploTelInfo(EmployeeVO vo) {
        employeeDAO.updateEmploTelInfo(vo);
    }

    @Override
    public void updateEmploNumInfo(EmployeeVO vo) {
        employeeDAO.updateEmploNumInfo(vo);
    }

    @Override
    public void updateEmploDivisionInfo(EmployeeVO vo) {
        employeeDAO.updateEmploDivisionInfo(vo);
    }

    @Override
    public void updateEmploPosInfo(EmployeeVO vo) {
        employeeDAO.updateEmploPosInfo(vo);
    }

    @Override
    public void updateEmploMailInfo(EmployeeVO vo) {
        employeeDAO.updateEmploMailInfo(vo);
    }

    @Override
    public void updateEmploNameInfo(EmployeeVO vo) {
        employeeDAO.updateEmploNameInfo(vo);
    }

    @Override
    public void updateEmploStateInfo(EmployeeVO vo) {
        employeeDAO.updateEmploStateInfo(vo);
    }
}
