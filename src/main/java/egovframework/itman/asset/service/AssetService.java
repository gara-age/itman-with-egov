package egovframework.itman.asset.service;

import egovframework.itman.common.Pagination;
import egovframework.itman.employee.service.EmployeeVO;

import java.util.List;

public interface AssetService {
    List<AssetVO> selectAssetList(Pagination pagination) throws Exception;
    List<AssetVO> selectEmpAssetList(EmployeeVO employeeVO) throws Exception;
    AssetVO selectAssetView(AssetVO vo);
    int selectAssetListCnt(Pagination pagination) throws Exception;
    int selectInGroupAssetListCnt(Pagination pagination) throws Exception;

    void insertAsset(AssetVO vo) throws Exception;

    void updateAsset(AssetVO vo) throws Exception;
    void updateAssetNameInfo(AssetVO vo) throws Exception;
    void updateAssetCategoryInfo(AssetVO vo) throws Exception;
    void updateAssetStateInfo(AssetVO vo) throws Exception;
    void updateAssetLocationInfo(AssetVO vo) throws Exception;
    void updateAssetEmployeeInfo(AssetVO vo) throws Exception;
    void updateAssetSupplyInfo(AssetVO vo) throws Exception;
    void updateAssetBuyDateInfo(AssetVO vo) throws Exception;
    void updateAssetPriceInfo(AssetVO vo) throws Exception;
    void updateAssetPictureInfo(AssetVO vo) throws Exception;
    void deleteAsset(AssetVO vo) throws Exception;

}
