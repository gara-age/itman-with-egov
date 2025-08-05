package egovframework.itman.assetCategory.service;

import java.util.List;

public interface AssetCategoryService {
    List<AssetCategoryVO> selectAssetCategoriesByGroup(String groIdx) throws Exception;
    void insertAssetCategory(AssetCategoryVO vo) throws Exception;
}
