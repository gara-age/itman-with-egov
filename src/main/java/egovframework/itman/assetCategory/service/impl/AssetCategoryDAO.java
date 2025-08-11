package egovframework.itman.assetCategory.service.impl;

import egovframework.itman.assetCategory.service.AssetCategoryVO;
import egovframework.itman.common.Pagination;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AssetCategoryDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<AssetCategoryVO> selectAssetCategoriesByGroup(String groIdx) throws Exception {
        return sqlSession.selectList("assetCategoryDAO.selectAssetCategoriesByGroup", groIdx);
    }

    public List<AssetCategoryVO> selectAssetCategoryList(Pagination pagination) throws Exception{
        return sqlSession.selectList("assetCategoryDAO.selectAssetCategoryList", pagination);
    }

    public int selectAssetCategoryListCnt(Pagination pagination) throws Exception{
        return sqlSession.selectOne("assetCategoryDAO.selectAssetCategoryListCnt", pagination);
    }

    public AssetCategoryVO selectAssetCategory(AssetCategoryVO vo) throws Exception{
        return sqlSession.selectOne("assetCategoryDAO.selectAssetCategory", vo);
    }

    public void insertAssetCategory(AssetCategoryVO vo) throws Exception {
        sqlSession.insert("assetCategoryDAO.insertAssetCategory", vo);
    }
    public void deleteAssetCategory(AssetCategoryVO vo) throws Exception {
        sqlSession.update("assetCategoryDAO.deleteAssetCategory", vo);
    }

    public void updateAssetCategory(AssetCategoryVO vo) throws Exception {
        sqlSession.update("assetCategoryDAO.updateAssetCategory", vo);
    }

    public List<AssetCategoryVO> findAll(String groIdx) throws Exception{
      return sqlSession.selectList("assetCategoryDAO.findAll", groIdx);
    }
}
