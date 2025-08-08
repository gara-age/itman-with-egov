package egovframework.itman.empState.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface EmpStateService {
    List<EmpStateVO> selectEmpStatesByGroup(String groIdx);
    List<EmpStateVO> selectEmpStateList(Pagination pagination) throws Exception;
    EmpStateVO selectEmpStateView(EmpStateVO vo) throws Exception;
    int selectEmpStateListCnt(Pagination pagination) throws Exception;
    void insertEmployeeState(EmpStateVO vo);
    void updateEmployeeState(EmpStateVO vo);
    void deleteEmployeeState(EmpStateVO vo);
}
