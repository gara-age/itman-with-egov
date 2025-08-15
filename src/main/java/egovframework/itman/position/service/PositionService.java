package egovframework.itman.position.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface PositionService {
    List<PositionVO> selectPositionsByGroup(String groIdx);
    List<PositionVO> selectPositionList(Pagination pagination);
    PositionVO selectPositionView(PositionVO positionVO);
    void insertPosition(PositionVO positionVO);
    void updatePosition(PositionVO positionVO);
    void deletePosition(PositionVO positionVO);
    int selectPositionListCnt(Pagination pagination);
    PositionVO checkDuplicate(PositionVO vo);

}
