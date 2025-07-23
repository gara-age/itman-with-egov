package egovframework.itman.division.service.impl;

import egovframework.itman.division.service.DivisionService;
import egovframework.itman.division.service.DivisionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("divisionService")
public class DivisionServiceImpl implements DivisionService {
    @Autowired
    private DivisionDAO divisionDAO;

    public List<DivisionVO> selectDivisionsByGroup(String groIdx) {

        return divisionDAO.selectDivisionsByGroup(groIdx);
    }
}
