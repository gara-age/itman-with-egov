package egovframework.itman.employee.service;


import java.util.List;

public interface EmployeeService {
    List<EmployeeVO> selectEmployeeList(EmployeeVO vo);
    EmployeeVO selectEmployeeView(EmployeeVO vo);
    void insertEmployee(EmployeeVO vo);
    void deleteEmployee(EmployeeVO vo);
    void updateEmployee(EmployeeVO vo);


}
