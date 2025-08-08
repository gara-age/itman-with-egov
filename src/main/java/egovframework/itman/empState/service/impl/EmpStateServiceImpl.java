package egovframework.itman.empState.service.impl;

import egovframework.itman.common.Pagination;
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
    public EmpStateVO selectEmpStateView(EmpStateVO vo) throws Exception {
        return empStateDAO.selectEmpStateView(vo);
    }
    @Override
    public List<EmpStateVO> selectEmpStateList(Pagination pagination) throws Exception {
        return empStateDAO.selectEmpStateList(pagination);
    }
    @Override
    public int selectEmpStateListCnt(Pagination pagination) throws Exception {
        return empStateDAO.selectEmpStateListCnt(pagination);
    }
    @Override
    public void insertEmployeeState(EmpStateVO vo) {
        empStateDAO.insertEmployeeState(vo);
    }

    @Override
    public void updateEmployeeState(EmpStateVO vo) {
        empStateDAO.updateEmployeeState(vo);
    }

    @Override
    public void deleteEmployeeState(EmpStateVO vo) {
        empStateDAO.deleteEmployeeState(vo);
    }
}
