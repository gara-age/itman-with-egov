package egovframework.itman.location.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface LocationService {
    List<LocationVO> selectLocationsByGroup(String groIdx);
    List<LocationVO> selectLocationList(Pagination pagination);
    int selectLocationListCnt(Pagination pagination);
    LocationVO selectLocation(LocationVO vo) throws Exception;
    void insertAssetLocation(LocationVO vo) throws Exception;
    void updateAssetLocation(LocationVO vo) throws Exception;
}
