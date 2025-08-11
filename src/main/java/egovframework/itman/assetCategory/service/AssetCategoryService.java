package egovframework.itman.assetCategory.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface AssetCategoryService {
    List<AssetCategoryVO> selectAssetCategoriesByGroup(String groIdx) throws Exception;
    List<AssetCategoryVO> selectAssetCategoryList(Pagination pagination) throws Exception;
    AssetCategoryVO selectAssetCategory(AssetCategoryVO vo) throws Exception;
    void insertAssetCategory(AssetCategoryVO vo) throws Exception;
    void updateAssetCategory(AssetCategoryVO vo) throws Exception;
    void deleteAssetCategory(AssetCategoryVO vo) throws Exception;
    int selectAssetCategoryListCnt(Pagination pagination) throws Exception;

    List<AssetCategoryVO> findAll(String groIdx) throws Exception;

}
