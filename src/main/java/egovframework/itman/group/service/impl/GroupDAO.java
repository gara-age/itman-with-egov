package egovframework.itman.group.service.impl;

import egovframework.itman.group.service.GroupVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDAO {
    @Autowired
    SqlSession sqlSession;

    public GroupVO getHeaderData(GroupVO vo) throws Exception{
      return sqlSession.selectOne("groupDAO.getHeaderData", vo);
    }
}
