package egovframework.itman.asset.web;

import egovframework.itman.asset.service.AssetVO;
import egovframework.itman.asset.service.impl.AssetServiceImpl;
import egovframework.itman.assetCategory.service.impl.AssetCategoryServiceImpl;
import egovframework.itman.common.Pagination;
import egovframework.itman.location.service.impl.LocationServiceImpl;
import egovframework.itman.state.service.impl.StateServiceImpl;
import egovframework.itman.supplier.service.impl.SupplierServiceImpl;
import org.springframework.http.MediaType;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AssetController {
    @Resource(name = "assetService")
    AssetServiceImpl assetService;
    @Resource(name = "assetCategoryService")
    AssetCategoryServiceImpl assetCategoryService;
    @Resource(name = "stateService")
    StateServiceImpl stateService;
    @Resource(name = "supplierService")
    SupplierServiceImpl supplierService;
    @Resource(name = "locationService")
    LocationServiceImpl locationService;

    private void selectByGroup(String groIdx, Model model) throws Exception {
        model.addAttribute("categories", assetCategoryService.selectAssetCategoriesByGroup(groIdx));
        model.addAttribute("states", stateService.selectStatesByGroup(groIdx));
        model.addAttribute("groIdx", groIdx);
    }

    @RequestMapping("/itman/assetsList.do")
    public String selectAssetsList(AssetVO vo, Pagination pagination , Model model
    , @RequestParam(required = false, defaultValue = "1") int page
    , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = assetService.selectAssetListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);

        selectByGroup(groIdx, model);

        List<AssetVO> list = assetService.selectAssetList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/assetsList";
    }

    @RequestMapping("/itman/assetsWrite.do")
    public String assetForm(AssetVO vo, Pagination pagination ,Model model) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";
        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int inGroupCnt = assetService.selectInGroupAssetListCnt(pagination);
        selectByGroup(groIdx, model);
        model.addAttribute("inGroupCnt", inGroupCnt);
        return "itman/public/html/ingroup/assetsWrite";
    }

    @RequestMapping("/itman/assetInsert.do")
    public String insertAsset(AssetVO vo, Model model, RedirectAttributes redirectAttributes) throws Exception {
        assetService.insertAsset(vo);
        redirectAttributes.addFlashAttribute("msg", "추가되었습니다.");
        return "redirect:/itman/assetsList.do";
    }

}
