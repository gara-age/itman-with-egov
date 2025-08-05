package egovframework.itman.location.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.location.service.LocationVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class LocationDAO {
    @Autowired
    SqlSession sqlSession;

    public List<LocationVO> selectLocationsByGroup(String groIdx) {
        return sqlSession.selectList("locationDAO.selectLocationsByGroup", groIdx);
    }

    public List<LocationVO> selectLocationList(Pagination pagination) {
        return sqlSession.selectList("locationDAO.selectLocationList", pagination);
    }

    public int selectLocationListCnt(Pagination pagination) {
        return sqlSession.selectOne("locationDAO.selectLocationListCnt", pagination);
    }


}
