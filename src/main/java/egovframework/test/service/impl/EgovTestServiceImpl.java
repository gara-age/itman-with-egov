package egovframework.test.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.test.service.EgovTestService;

@Service("egovTestService")
public class EgovTestServiceImpl implements EgovTestService {

    @Resource(name = "egovTestDAO")
    private EgovTestDAO egovTestDAO;

    @Override
    public List<EgovMap> selectTestList() throws Exception {
        return egovTestDAO.selectTestList();
    }
}
