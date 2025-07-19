package egovframework.itman.division.service.impl;

import egovframework.itman.division.service.DivisionVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DivisionDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<DivisionVO> selectDivisionsByGroup(String groIdx) {
        return sqlSession.selectList(
                "divisionDAO.selectDivisionsByGroup", groIdx);
    }
}