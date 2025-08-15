package egovframework.itman.division.service.impl;

import egovframework.itman.common.Pagination;
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

    @Override
    public List<DivisionVO> selectDivisionList(Pagination pagination) throws Exception {
        return divisionDAO.selectDivisionList(pagination);
    }

    @Override
    public DivisionVO selectDivisionView(DivisionVO divisionVO) {
        return divisionDAO.selectDivisionView(divisionVO);
    }
    @Override
    public int selectDivisionListCnt(Pagination pagination) throws Exception {
        return divisionDAO.selectDivisionListCnt(pagination);
    }
    @Override
    public void insertDivision(DivisionVO vo) {
         divisionDAO.insertDivision(vo);
    }

    @Override
    public void updateDivision(DivisionVO divisionVO) {
        divisionDAO.updateDivision(divisionVO);
    }

    @Override
    public void deleteDivision(DivisionVO divisionVO) {
        divisionDAO.deleteDivision(divisionVO);
    }

    @Override
    public DivisionVO checkDuplicate(DivisionVO vo){
        return divisionDAO.checkDuplicate(vo);
    }
}
