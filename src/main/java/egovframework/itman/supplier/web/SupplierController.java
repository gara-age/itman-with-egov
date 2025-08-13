package egovframework.itman.supplier.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.supplier.service.SupplierVO;
import egovframework.itman.supplier.service.impl.SupplierServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SupplierController {
    @Resource(name = "supplierService")
    SupplierServiceImpl supplierService;

    @RequestMapping("/itman/supplierList.do")
    public String selectSupplierList(SupplierVO vo, Pagination pagination , Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int listCnt = supplierService.selectSupplierListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);

        List<SupplierVO> list = supplierService.selectSupplierList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);
        return "itman/public/html/ingroup/buyList";
    }

    @RequestMapping("/itman/asset/insertAssetSupplier.do")
    public String supplierPop(SupplierVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int listCnt = supplierService.selectSupplierListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());

        List<SupplierVO> list = supplierService.selectSupplierList(pagination);

        model.addAttribute("pagination", pagination);
        model.addAttribute("supplierList", list);
        return "itman/public/html/popup/supplierPop";
    }

    @RequestMapping("/itman/supplierEdit.do")
    public String supplierEdit(SupplierVO vo, Model model) throws Exception {
        SupplierVO supply = supplierService.selectSupplyView(vo);
        model.addAttribute("supply", supply);
        return "itman/public/html/popup/contEditItmSupplier";
    }

    @PostMapping("/itman/updateSupplier.do")
    public String updateSupply(SupplierVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        supplierService.updateSupply(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/confirmSupplierDel.do")
    public String confirmSupplierDel(SupplierVO vo, Model model) throws Exception {
        model.addAttribute("supply", vo);
        return "itman/public/html/popup/listDelete";
    }

    @PostMapping("/itman/deleteSupplier.do")
    public String deleteSupply(SupplierVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setDelIdx(delIdx);
        supplierService.deleteSupply(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }
}
