package egovframework.itman.supplier.service.impl;

import egovframework.itman.common.Pagination;
import egovframework.itman.supplier.service.SupplierService;
import egovframework.itman.supplier.service.SupplierVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
    @Resource(name = "supplierDAO")
    private SupplierDAO supplierDAO;

    @Override
    public List<SupplierVO> selectSupplierList(Pagination pagination) throws Exception {
        return supplierDAO.selectSupplierList(pagination);
    }

    @Override
    public SupplierVO selectSupplyView(SupplierVO vo) throws Exception {
        return supplierDAO.selectSupplyView(vo);
    }

    @Override
    public void updateSupply(SupplierVO vo) throws Exception {
                supplierDAO.updateSupply(vo);
    }

    @Override
    public void deleteSupply(SupplierVO vo) throws Exception {
                supplierDAO.deleteSupply(vo);
    }


    @Override
    public List<SupplierVO> selectSuppliersByGroup(String groIdx) throws Exception {
        return supplierDAO.selectSuppliersByGroup(groIdx);
    }

    @Override
    public int selectSupplierListCnt(Pagination pagination) throws Exception {
        return supplierDAO.selectSupplierListCnt(pagination);
    }

    @Override
    public void insertAssetSupplier(SupplierVO vo) throws Exception {
        supplierDAO.insertAssetSupplier(vo);
    }
}
