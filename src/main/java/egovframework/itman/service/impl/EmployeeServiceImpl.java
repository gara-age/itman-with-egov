package egovframework.itman.service.impl;

import egovframework.itman.service.EmployeeService;
import egovframework.itman.service.EmployeeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Resource(name = "employeeDAO")
    private EmployeeDAO employeeDAO;


    @Override
    public List<EmployeeVO> selectEmployeeList(EmployeeVO vo) {

        return employeeDAO.selectEmployeeList(vo);
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
