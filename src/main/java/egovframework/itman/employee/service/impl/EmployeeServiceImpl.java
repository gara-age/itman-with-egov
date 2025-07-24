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

    @Override
    public void updateEmployee(EmployeeVO vo) {

        employeeDAO.updateEmployee(vo);
    }
}
