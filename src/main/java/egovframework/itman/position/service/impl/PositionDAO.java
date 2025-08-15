package egovframework.itman.position.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.position.service.PositionVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PositionDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<PositionVO> selectPositionsByGroup(String groIdx) {
        return sqlSession.selectList(
                "positionDAO.selectPositionsByGroup", groIdx);
    }
    public List<PositionVO> selectPositionList(Pagination pagination) {
        return sqlSession.selectList("positionDAO.selectPositionList", pagination);
    }
    public PositionVO selectPositionView(PositionVO positionVO) {
        return sqlSession.selectOne("positionDAO.selectPositionView", positionVO);
    }
    public void insertPosition(PositionVO positionVO) {
        sqlSession.insert("positionDAO.insertPosition", positionVO);
    }
    public void updatePosition(PositionVO positionVO) {
        sqlSession.update("positionDAO.updatePosition", positionVO);
    }
    public void deletePosition(PositionVO positionVO) {
        sqlSession.delete("positionDAO.deletePosition", positionVO);
    }
    public int selectPositionListCnt(Pagination pagination) {
        return sqlSession.selectOne("positionDAO.selectPositionListCnt", pagination);
    }
    public PositionVO checkDuplicate(PositionVO vo){
        return sqlSession.selectOne("positionDAO.checkDuplicate", vo);
    }
}
