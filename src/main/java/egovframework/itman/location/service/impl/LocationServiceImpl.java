package egovframework.itman.location.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.location.service.LocationService;
import egovframework.itman.location.service.LocationVO;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("locationService")
public class LocationServiceImpl implements LocationService {
    @Resource
    LocationDAO locationDAO;

    @Override
    public List<LocationVO> selectLocationsByGroup(String groIdx) {
        return locationDAO.selectLocationsByGroup(groIdx);
    }

    @Override
    public List<LocationVO> selectLocationList(Pagination pagination){
        return locationDAO.selectLocationList(pagination);
    }

    @Override
    public LocationVO selectLocation(LocationVO vo) throws Exception{
        return locationDAO.selectLocation(vo);
    }

    @Override
    public int selectLocationListCnt(Pagination pagination){
        return locationDAO.selectLocationListCnt(pagination);
    }

    @Override
    public void insertAssetLocation(LocationVO vo) throws Exception {
         locationDAO.insertAssetLocation(vo);
    }

    @Override
    public void updateAssetLocation(LocationVO vo) throws Exception{
        locationDAO.updateAssetLocation(vo);
    }
}
