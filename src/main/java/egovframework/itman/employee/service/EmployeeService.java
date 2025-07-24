package egovframework.itman.employee.service;


import egovframework.itman.common.Pagination;

import java.util.List;

public interface EmployeeService {
    List<EmployeeVO> selectEmployeeList(EmployeeVO vo) throws Exception;
    List<EmployeeVO> selectEmployeeList(Pagination pagination) throws Exception;
    int selectEmployeeListCnt() throws Exception;
    int selectEmployeeListCnt(Pagination pagination) throws Exception;
    EmployeeVO selectEmployeeView(EmployeeVO vo);
    void insertEmployee(EmployeeVO vo);
    void deleteEmployee(EmployeeVO vo);
    void updateEmployee(EmployeeVO vo);


}
