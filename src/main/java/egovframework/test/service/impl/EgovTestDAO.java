package egovframework.test.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;

@Repository("egovTestDAO")
public class EgovTestDAO extends EgovAbstractMapper {

	 /**
     * testlist 조회
     * @return List<EgovMap>
     * @throws Exception
     */
    public List<EgovMap> selectTestList() throws Exception {
        return selectList("egovTestDAO.selectTestList");
    }
}
