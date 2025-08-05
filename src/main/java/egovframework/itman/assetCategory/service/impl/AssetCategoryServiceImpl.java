package egovframework.itman.assetCategory.service.impl;

import egovframework.itman.assetCategory.service.AssetCategoryService;
import egovframework.itman.assetCategory.service.AssetCategoryVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("assetCategoryService")
public class AssetCategoryServiceImpl implements AssetCategoryService {
    @Resource(name = "assetCategoryDAO")
    private AssetCategoryDAO assetCategoryDAO;

    public List<AssetCategoryVO> selectAssetCategoriesByGroup(String groIdx) throws Exception{
        return assetCategoryDAO.selectAssetCategoriesByGroup(groIdx);
    }
}
