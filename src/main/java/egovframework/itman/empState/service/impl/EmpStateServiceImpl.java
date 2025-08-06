package egovframework.itman.empState.service.impl;

import egovframework.itman.empState.service.EmpStateService;
import egovframework.itman.empState.service.EmpStateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("empStateService")
public class EmpStateServiceImpl implements EmpStateService {
    @Autowired
    private EmpStateDAO empStateDAO;

    @Override
    public List<EmpStateVO> selectEmpStatesByGroup(String groIdx) {
        return empStateDAO.selectEmpStatesByGroup(groIdx);
    }

    @Override
    public void insertEmployeeState(EmpStateVO vo) {
        empStateDAO.insertEmployeeState(vo);
    }
}
