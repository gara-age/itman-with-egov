package egovframework.itman.supplier.service;

import egovframework.itman.common.Pagination;

import java.util.List;

public interface SupplierService {
    List<SupplierVO> selectSupplierList(Pagination pagination) throws Exception;
    List<SupplierVO> selectSuppliersByGroup(String groIdx) throws Exception;
    int selectSupplierListCnt(Pagination pagination) throws Exception;

}
