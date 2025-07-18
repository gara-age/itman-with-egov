package egovframework.test.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

public interface EgovTestService {

    /**
     * 테스트 목록을 조회한다.
     * @return List<EgovMap> - 테스트 목록
     * @throws Exception
     */
    List<EgovMap> selectTestList() throws Exception;
}
