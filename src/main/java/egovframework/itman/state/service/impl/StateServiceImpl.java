package egovframework.itman.state.service.impl;

import egovframework.itman.state.service.StateService;
import egovframework.itman.state.service.StateVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("stateService")
public class StateServiceImpl implements StateService {
    @Resource(name = "stateDAO")
    private StateDAO stateDAO;

    public List<StateVO> selectStatesByGroup(String groIdx) throws Exception {
        return stateDAO.selectStatesByGroup(groIdx);
    }
}
