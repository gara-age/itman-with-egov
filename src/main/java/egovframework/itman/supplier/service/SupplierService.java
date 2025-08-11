package egovframework.itman.supplier.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface SupplierService {
    List<SupplierVO> selectSupplierList(Pagination pagination) throws Exception;
    List<SupplierVO> selectSuppliersByGroup(String groIdx) throws Exception;
    SupplierVO selectSupplyView(SupplierVO vo) throws Exception;
    void updateSupply(SupplierVO vo) throws Exception;
    void deleteSupply(SupplierVO vo) throws Exception;
    int selectSupplierListCnt(Pagination pagination) throws Exception;
    void insertAssetSupplier(SupplierVO vo) throws Exception;
}
