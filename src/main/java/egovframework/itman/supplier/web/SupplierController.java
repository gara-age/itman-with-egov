package egovframework.itman.supplier.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.supplier.service.SupplierVO;
import egovframework.itman.supplier.service.impl.SupplierServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class SupplierController {
    @Resource(name = "supplierService")
    SupplierServiceImpl supplierService;

    @RequestMapping("/popup/supplierPop.do")
    public String supplierPop(SupplierVO vo, Pagination pagination, Model model
    , @RequestParam(required = false, defaultValue = "1") int page
    , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int listCnt = supplierService.selectSupplierListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());

        List<SupplierVO> list = supplierService.selectSupplierList(pagination);

        model.addAttribute("pagination", pagination);
        model.addAttribute("listCnt", listCnt); // 전체 건수 조회

        model.addAttribute("supplierList", list);
        return "itman/public/html/popup/supplierPop";
    }
}
