package egovframework.itman.assetCategory.service.impl;

import egovframework.itman.assetCategory.service.AssetCategoryService;
import egovframework.itman.assetCategory.service.AssetCategoryVO;
import egovframework.itman.common.Pagination;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("assetCategoryService")
public class AssetCategoryServiceImpl implements AssetCategoryService {
    @Resource(name = "assetCategoryDAO")
    private AssetCategoryDAO assetCategoryDAO;

    @Override
    public List<AssetCategoryVO> selectAssetCategoriesByGroup(String groIdx) throws Exception{
        return assetCategoryDAO.selectAssetCategoriesByGroup(groIdx);
    }

    @Override
    public List<AssetCategoryVO> selectAssetCategoryList(Pagination pagination) throws Exception{
        return assetCategoryDAO.selectAssetCategoryList(pagination);
    }

    @Override
    public int selectAssetCategoryListCnt(Pagination pagination) throws Exception{
        return assetCategoryDAO.selectAssetCategoryListCnt(pagination);
    }

    @Override
    public AssetCategoryVO selectAssetCategory(AssetCategoryVO vo) throws Exception{
        return assetCategoryDAO.selectAssetCategory(vo);
    }

    @Override
    public void insertAssetCategory(AssetCategoryVO vo) throws Exception {
         assetCategoryDAO.insertAssetCategory(vo);
    }

    @Override
    public void deleteAssetCategory(AssetCategoryVO vo) throws Exception {
        assetCategoryDAO.deleteAssetCategory(vo);
    }

    @Override
    public void updateAssetCategory(AssetCategoryVO vo) throws Exception {
        assetCategoryDAO.updateAssetCategory(vo);
    }

    @Override
    public List<AssetCategoryVO> findAll(String groIdx) throws Exception{
        return assetCategoryDAO.findAll(groIdx);
    }
    @Override
    public AssetCategoryVO checkDuplicate(AssetCategoryVO vo){
        return assetCategoryDAO.checkDuplicate(vo);
    }
}
