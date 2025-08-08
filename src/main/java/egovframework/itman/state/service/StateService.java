package egovframework.itman.state.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface StateService {
    List<StateVO> selectAssetStateList(Pagination pagination) throws Exception;
    int selectAssetStateListCnt(Pagination pagination) throws Exception;
    StateVO selectAssetStateView(StateVO vo) throws Exception;
    List<StateVO> selectStatesByGroup(String groIdx) throws Exception;
    void insertAssetState(StateVO vo) throws Exception;
    void updateAssetState(StateVO vo) throws Exception;
    void deleteAssetState(StateVO vo) throws Exception;
}
