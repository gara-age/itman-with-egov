package egovframework.itman.hardware.service.impl;

import egovframework.itman.hardware.service.HardwareVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HardwareDAO {
    @Autowired
    SqlSession sqlSession;

    public HardwareVO selectHardwareView(String assIdx) throws Exception {
        return sqlSession.selectOne("hardwareDAO.selectHardwareView", assIdx);
    }
}
