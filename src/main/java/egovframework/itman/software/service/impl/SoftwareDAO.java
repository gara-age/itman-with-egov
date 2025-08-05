package egovframework.itman.software.service.impl;

import egovframework.itman.software.service.SoftwareVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SoftwareDAO {
    @Autowired
    SqlSession sqlSession;

    public List<SoftwareVO> selectSoftwareList(String assIdx) throws Exception{
        return sqlSession.selectList("softwareDAO.selectSoftwareList", assIdx);
    }
}
