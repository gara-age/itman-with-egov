package egovframework.itman.state.service.impl;

import egovframework.itman.state.service.StateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StateDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<StateVO> selectStatesByGroup(String groIdx) throws Exception {
        return sqlSession.selectList("stateDAO.selectStatesByGroup", groIdx);
    }

    public void insertAssetState(StateVO vo) throws Exception {
        sqlSession.insert("stateDAO.insertAssetState", vo);
    }
}
