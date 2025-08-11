package egovframework.itman.supplier.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.supplier.service.SupplierVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SupplierDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<SupplierVO> selectSupplierList(Pagination pagination) throws Exception {
        return sqlSession.selectList("supplierDAO.selectSupplierList", pagination);
    }

    public SupplierVO selectSupplyView(SupplierVO vo) throws Exception {
        return sqlSession.selectOne("supplierDAO.selectSupplyView", vo);
    }

    public void updateSupply(SupplierVO vo) throws Exception {
        sqlSession.update("supplierDAO.updateSupply", vo);
    }

    public void deleteSupply(SupplierVO vo) throws Exception {
        sqlSession.update("supplierDAO.deleteSupply", vo);
    }

    public List<SupplierVO> selectSuppliersByGroup(String groIdx) throws Exception {
        return sqlSession.selectList("supplierDAO.selectSuppliersByGroup", groIdx);
    }
    public int selectSupplierListCnt(Pagination pagination) throws Exception {
        return sqlSession.selectOne("supplierDAO.selectSupplierListCnt", pagination);
    }
    public void insertAssetSupplier(SupplierVO vo) throws Exception {
        sqlSession.insert("supplierDAO.insertAssetSupplier", vo);
    }
}
