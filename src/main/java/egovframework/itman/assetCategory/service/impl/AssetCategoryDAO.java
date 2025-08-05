package egovframework.itman.assetCategory.service.impl;

import egovframework.itman.assetCategory.service.AssetCategoryVO;
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
}
