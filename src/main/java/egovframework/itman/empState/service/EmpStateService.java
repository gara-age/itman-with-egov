package egovframework.itman.empState.service;

import java.util.List;

public interface EmpStateService {
    List<EmpStateVO> selectEmpStatesByGroup(String groIdx);
    void insertEmployeeState(EmpStateVO vo);
}
