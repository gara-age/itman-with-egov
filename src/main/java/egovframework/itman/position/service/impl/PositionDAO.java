package egovframework.itman.position.service.impl;

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
}
