package egovframework.itman.assLog.service.impl;

import egovframework.itman.assLog.service.AssLogVO;
import egovframework.itman.common.Pagination;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AssLogDAO {
    @Autowired
    SqlSession sqlSession;

    public void insertAssLog(AssLogVO assLogVO){
        sqlSession.insert("assLogDAO.insertAssLog", assLogVO);
    }

    public List<AssLogVO> selectAssLogList(String assIdx){
        return sqlSession.selectList("assLogDAO.selectAssLogList", assIdx);
    }

    public List<AssLogVO> selectAllAssLogList(Pagination pagination){
        return sqlSession.selectList("assLogDAO.selectAllAssLogList", pagination);
    }

    public int selectAssLogListCnt(Pagination pagination){
        return sqlSession.selectOne("assLogDAO.selectAssLogListCnt", pagination);
    }

}
