package egovframework.itman.state.service;

import java.util.List;

public interface StateService {
    List<StateVO> selectStatesByGroup(String groIdx) throws Exception;
}
