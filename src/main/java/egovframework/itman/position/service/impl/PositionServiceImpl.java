package egovframework.itman.position.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.position.service.PositionService;
import egovframework.itman.position.service.PositionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("positionService")
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionDAO positionDAO;

    @Override
    public List<PositionVO> selectPositionsByGroup(String groIdx) {

        return positionDAO.selectPositionsByGroup(groIdx);
    }

    @Override
    public List<PositionVO> selectPositionList(Pagination pagination) {
        return positionDAO.selectPositionList(pagination);
    }

    @Override
    public PositionVO selectPositionView(PositionVO positionVO) {
        return positionDAO.selectPositionView(positionVO);
    }

    @Override
    public void insertPosition(PositionVO positionVO) {
        positionDAO.insertPosition(positionVO);
    }

    @Override
    public void updatePosition(PositionVO positionVO) {
        positionDAO.updatePosition(positionVO);
    }

    @Override
    public void deletePosition(PositionVO positionVO) {
        positionDAO.deletePosition(positionVO);
    }

    @Override
    public int selectPositionListCnt(Pagination pagination) {
        return positionDAO.selectPositionListCnt(pagination);
    }

    @Override
    public PositionVO checkDuplicate(PositionVO vo){
        return positionDAO.checkDuplicate(vo);
    }
}
