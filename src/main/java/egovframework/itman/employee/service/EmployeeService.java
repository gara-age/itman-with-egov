package egovframework.itman.employee.service;


import egovframework.itman.common.Pagination;
import egovframework.itman.common.Searching;

import java.util.List;

public interface EmployeeService {
    List<EmployeeVO> selectEmployeeList(Pagination pagination) throws Exception;
    int selectEmployeeListTotCnt() throws Exception;
    EmployeeVO selectEmployeeView(EmployeeVO vo);
    void insertEmployee(EmployeeVO vo);
    void deleteEmployee(EmployeeVO vo);
    void updateEmployee(EmployeeVO vo);


}
