package egovframework.itman.asset.service.impl;

import egovframework.itman.asset.service.AssetVO;
import egovframework.itman.common.Pagination;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AssetDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<AssetVO> selectAssetList(Pagination pagination) throws Exception{
        return sqlSession.selectList("assetDAO.selectAssetList", pagination);
    }
    public AssetVO selectAssetView(AssetVO vo){
        return sqlSession.selectOne("assetDAO.selectAssetView", vo);
    }
    public int selectAssetListCnt(Pagination pagination) throws Exception{
        return sqlSession.selectOne("assetDAO.selectAssetListCnt", pagination);
    }
    public void insertAsset(AssetVO vo) throws Exception{
        sqlSession.insert("assetDAO.insertAsset", vo);
    }
    public void updateAsset(AssetVO vo) throws Exception{
        sqlSession.update("assetDAO.updateAsset", vo);
    }
    public void deleteAsset(AssetVO vo) throws Exception{
        sqlSession.update("assetDAO.deleteAsset", vo);
    }
    public int selectInGroupAssetListCnt(Pagination pagination) throws Exception {
        return sqlSession.selectOne("assetDAO.selectInGroupAssetListCnt", pagination);
    }

    public void updateAssetNameInfo(AssetVO vo) throws Exception{
         sqlSession.update("assetDAO.updateAssetNameInfo", vo);
    }
    public void updateAssetCategoryInfo(AssetVO vo) throws Exception{
        sqlSession.update("assetDAO.updateAssetCategoryInfo", vo);
    }
    public void updateAssetStateInfo(AssetVO vo) throws Exception {
        sqlSession.update("assetDAO.updateAssetStateInfo", vo);
    }
    public void updateAssetLocationInfo(AssetVO vo) throws Exception {
        sqlSession.update("assetDAO.updateAssetLocationInfo", vo);
    }

    public void updateAssetEmployeeInfo(AssetVO vo) throws Exception {
        sqlSession.update("assetDAO.updateAssetEmployeeInfo", vo);
    }
    public void updateAssetSupplyInfo(AssetVO vo) throws Exception {
        sqlSession.update("assetDAO.updateAssetSupplyInfo", vo);
    }
    public void updateAssetBuyDateInfo(AssetVO vo) throws Exception {
        sqlSession.update("assetDAO.updateAssetBuyDateInfo", vo);
    }
    public void updateAssetPriceInfo(AssetVO vo) throws Exception {
        sqlSession.update("assetDAO.updateAssetPriceInfo", vo);
    }
    public void updateAssetPictureInfo(AssetVO vo) throws Exception{
        sqlSession.update("assetDAO.updateAssetPictureInfo", vo);
    }

}
