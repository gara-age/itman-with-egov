package egovframework.itman.asset.web;

import egovframework.itman.assLog.service.AssLogService;
import egovframework.itman.assLog.service.AssLogVO;
import egovframework.itman.assLog.service.impl.AssLogServiceImpl;
import egovframework.itman.asset.service.AssetVO;
import egovframework.itman.asset.service.impl.AssetServiceImpl;
import egovframework.itman.assetCategory.service.AssetCategoryVO;
import egovframework.itman.assetCategory.service.impl.AssetCategoryServiceImpl;
import egovframework.itman.common.Pagination;
import egovframework.itman.employee.service.EmployeeVO;
import egovframework.itman.employee.service.impl.EmployeeServiceImpl;
import egovframework.itman.group.service.GroupVO;
import egovframework.itman.hardware.service.impl.HardwareServiceImpl;
import egovframework.itman.location.service.LocationVO;
import egovframework.itman.location.service.impl.LocationServiceImpl;
import egovframework.itman.software.service.impl.SoftwareServiceImpl;
import egovframework.itman.state.service.StateVO;
import egovframework.itman.state.service.impl.StateServiceImpl;
import egovframework.itman.supplier.service.SupplierVO;
import egovframework.itman.supplier.service.impl.SupplierServiceImpl;
import org.springframework.http.MediaType;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.stream.Location;
import java.io.File;
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
    @Resource(name = "employeeService")
    EmployeeServiceImpl employeeService;
    @Resource(name= "hardwareService")
    HardwareServiceImpl hardwareService;
    @Resource(name= "softwareService")
    SoftwareServiceImpl softwareService;
    @Resource(name= "assLogService")
    AssLogServiceImpl assLogService;


    private void selectByGroup(String groIdx, Model model) throws Exception {
        model.addAttribute("categories", assetCategoryService.selectAssetCategoriesByGroup(groIdx));
        model.addAttribute("states", stateService.selectStatesByGroup(groIdx));
        model.addAttribute("suppliers", supplierService.selectSuppliersByGroup(groIdx));
        model.addAttribute("locations", locationService.selectLocationsByGroup(groIdx));
        model.addAttribute("groIdx", groIdx);
    }

    private void selectByAssIdx(String assIdx, Model model) throws Exception {
        System.err.println("assIdx = " + assIdx);
        model.addAttribute("hardware", hardwareService.selectHardwareView(assIdx));
        model.addAttribute("software", softwareService.selectSoftwareList(assIdx));
        System.err.println("software size = " + softwareService.selectSoftwareList(assIdx).size());
    }

    private void setInsertAssLog(AssLogVO assLogVO, AssetVO vo) {
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(vo.getAssName());
        assLogVO.setAlType("생성");
        assLogVO.setAlCat("자산");
    }

    private void setUpdateAssLog(AssLogVO assLogVO, AssetVO vo, String flag) {
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(vo.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("자산");
    }

    //-------------------------------------조회-----------------------------------------
    @RequestMapping("/itman/assetsList.do")
    public String selectAssetsList(AssetVO vo, Pagination pagination , Model model
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range
    , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
//        if(session.getAttribute("groIdx") != null) {
//            System.err.println("groidx is not null");
//        } else {
//            System.err.println("groidx is null");
//        }

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = assetService.selectAssetListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);

        selectByGroup(groIdx, model);

        List<AssetVO> list = assetService.selectAssetList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/assetsList";
    }
    @RequestMapping("/itman/assetsView.do")
    public String selectAssetView(AssetVO vo, Model model) throws Exception {
        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByAssIdx(assetVO.getAssIdx(), model);
        List<AssLogVO> list = assLogService.selectAssLogList(assetVO.getAssIdx());
        model.addAttribute("assLogList", list);

        return "itman/public/html/ingroup/assetsView";
    }

    @RequestMapping("/itman/dashboard.do")
    public String selectAssetDashboard(StateVO stateVO , Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        List<AssLogVO> historyList = assLogService.selectDashBoardAssLogList(groIdx);
    List<StateVO> stateList = stateService.selectDashBoardAssetStateList(groIdx);
    model.addAttribute("historyList", historyList);
    model.addAttribute("stateList", stateList);
        return "itman/public/html/ingroup/dashboard";
    }

    //-------------------------------------생성-----------------------------------------

    @RequestMapping("/itman/assetsWrite.do")
    public String assetForm(AssetVO vo, Pagination pagination ,Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int inGroupCnt = assetService.selectInGroupAssetListCnt(pagination);
        selectByGroup(groIdx, model);
        model.addAttribute("inGroupCnt", inGroupCnt);
        return "itman/public/html/ingroup/assetsWrite";
    }

    @RequestMapping("/itman/assetInsert.do")
    public String insertAsset(@ModelAttribute AssLogVO assLogVO, AssetVO vo,
                              @RequestParam(value = "assImgFile", required = false) MultipartFile file,
                              HttpServletRequest request,
                              Model model, RedirectAttributes redirectAttributes,
                              HttpSession session) throws Exception {
       if(!file.isEmpty()){
           String uploadDir = "/upload/assImg/";
           String realDir = request.getServletContext().getRealPath(uploadDir);
           File dir = new File(realDir);
           if(!dir.exists()){
               dir.mkdirs();
           }

           String originalFileName = file.getOriginalFilename();
           String ext = (originalFileName != null && originalFileName.lastIndexOf('.') != -1) ? originalFileName.substring(originalFileName.lastIndexOf('.')) : "";
           String prefix = "assImg";
           String datePart = new java.text.SimpleDateFormat("yyyyMMdd_HHmmss").format(new java.util.Date());
           String randomPart = java.util.UUID.randomUUID().toString().replace("-", "").substring(0,8).toUpperCase();
           String savedName = prefix + "_" + datePart + "_" + randomPart + ext;

           File img = new File(dir, savedName);
           file.transferTo(img);
           vo.setImage(savedName);
       }
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        assLogVO.setRegIdx(regIdx);
        assetService.insertAsset(vo);
        setInsertAssLog(assLogVO, vo);
        assLogService.insertAssLog(assLogVO);
        redirectAttributes.addFlashAttribute("msg", "추가되었습니다.");
        return "redirect:/itman/assetsList.do";
    }

    @RequestMapping("/itman/asset/contWriteAssetCategory.do")
    public String writeAssetCategory() throws Exception {
        return "itman/public/html/popup/contWriteAssetCategory";
    }

    @PostMapping("/itman/asset/insertAssetCategory.do")
    public String insetAssetCategory(AssetCategoryVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        System.err.println("vo.assCatName" + vo.getAssCatName());
        assetCategoryService.insertAssetCategory(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/contWriteAssetState.do")
    public String writeAssetState() throws Exception {
        return "itman/public/html/popup/contWriteItmState";
    }

    @PostMapping("/itman/asset/insertAssetState.do")
    public String insetAssetState(StateVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        stateService.insertAssetState(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/contWriteAssetLocation.do")
    public String writeAssetLocation() throws Exception {
        return "itman/public/html/popup/contWriteItmLocation";
    }

    @PostMapping("/itman/asset/insertAssetLocation.do")
    public String insetAssetLocation(LocationVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        locationService.insertAssetLocation(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/contWriteSupplier.do")
    public String writeAssetSupplier() throws Exception {
        return "itman/public/html/popup/contWriteItmSupplier";
    }

    @PostMapping("/itman/asset/insertSupplier.do")
    public String insetAssetSupplier(SupplierVO  vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        supplierService.insertAssetSupplier(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    //-------------------------------------수정-----------------------------------------

    @RequestMapping("/itman/asset/assetNameInfoEdit.do")
    public String assetNameInfoEdit(AssetVO vo, Model model) throws Exception {
        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);

        return "itman/public/html/popup/asset/assetNameInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetNameInfo.do")
    public String updateAssetNameInfo(@ModelAttribute AssLogVO assLogVO, AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldName = assetVO.getAssName();
        String newName = vo.getAssName();
        assetService.updateAssetNameInfo(vo);
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(newName);
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("자산 이름");
        assLogVO.setAlCont(oldName + "->" + newName);
        System.err.println("assLogVO.getAlNote() = " + assLogVO.getAlNote());
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetCategoryInfoEdit.do")
    public String assetCategoryInfoEdit(AssetVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByGroup(groIdx, model);
        return "itman/public/html/popup/asset/assetCategoryInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetCategoryInfo.do")
    public String updateAssetCategoryInfo(@ModelAttribute AssLogVO assLogVO, AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldCatName = assetVO.getAssCatName();
        assetService.updateAssetCategoryInfo(vo);
        String newCatName = assetService.selectAssetView(vo).getAssCatName();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("자산 분류");
        assLogVO.setAlCont(oldCatName + "->" + newCatName);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetStateInfoEdit.do")
    public String assetStateInfoEdit(AssetVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByGroup(groIdx, model);


        return "itman/public/html/popup/asset/assetStateInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetStateInfo.do")
    public String updateAssetStateInfo(@ModelAttribute AssLogVO assLogVO  ,AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldStaName = assetVO.getAssStaName();
        assetService.updateAssetStateInfo(vo);
        String newStaName = assetService.selectAssetView(vo).getAssStaName();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("자산 상태");
        assLogVO.setAlCont(oldStaName + "->" + newStaName);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetLocationInfoEdit.do")
    public String assetLocationInfoEdit(AssetVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByGroup(groIdx, model);


        return "itman/public/html/popup/asset/assetLocationInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetLocationInfo.do")
    public String updateAssetLocationInfo(@ModelAttribute AssLogVO assLogVO ,AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldLocName = assetVO.getAssLocName();
        assetService.updateAssetLocationInfo(vo);
        String newLocName = assetService.selectAssetView(vo).getAssLocName();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("자산 위치");
        assLogVO.setAlCont(oldLocName + "->" + newLocName);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetEmployeeInfoEdit.do")
    public String assetEmployeeInfoEdit(EmployeeVO vo, AssetVO assetVO ,Model model, Pagination pagination
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
    , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        AssetVO targetVO = assetService.selectAssetView(assetVO);
        model.addAttribute("asset", assetVO);

        int listCnt = employeeService.selectEmployeeListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());
        //검색 결과에 따른 총 목록의 길이를 반환
        List<EmployeeVO> list = employeeService.selectEmployeeList(pagination);
        //페이징 구현
        model.addAttribute("pagination", pagination);
        model.addAttribute("asset", targetVO);
        model.addAttribute("employeeList", list);

        return "itman/public/html/popup/asset/assetEmployeeInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetEmployeeInfo.do")
    public String updateAssetEmployeeInfo(@ModelAttribute AssLogVO assLogVO , AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldEmpName = assetVO.getAssEmpName();
        assetService.updateAssetEmployeeInfo(vo);
        String newEmpName = assetService.selectAssetView(vo).getAssEmpName();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("사용직원");
        assLogVO.setAlCont(oldEmpName + "->" + newEmpName);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetSupplyInfoEdit.do")
    public String assetSupplyInfoEdit(AssetVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByGroup(groIdx, model);


        return "itman/public/html/popup/asset/assetSupplyInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetSupplyInfo.do")
    public String updateAssetSupplyInfo(@ModelAttribute AssLogVO assLogVO ,AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);

        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldSupName = assetVO.getAssSupName();
        if(oldSupName == null || oldSupName.equals("")) {
            oldSupName = " ";
        }
        assetService.updateAssetSupplyInfo(vo);
        String newSupName = assetService.selectAssetView(vo).getAssSupName();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("자산 구매처");
        assLogVO.setAlCont(oldSupName + "->" + newSupName);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetBuyDateInfoEdit.do")
    public String assetBuyDateInfoEdit(AssetVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByGroup(groIdx, model);


        return "itman/public/html/popup/asset/assetBuyDateInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetBuyDateInfo.do")
    public String updateAssetBuyDateInfo(@ModelAttribute AssLogVO assLogVO ,AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);

        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldBuyDate = assetVO.getBuyDate();
        if (oldBuyDate == null || oldBuyDate.equals("")) {
            oldBuyDate = "0000-00-00";
        }
        assetService.updateAssetBuyDateInfo(vo);
        String newBuyDate = assetService.selectAssetView(vo).getBuyDate();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("최초 구매일");
        assLogVO.setAlCont(oldBuyDate + "->" + newBuyDate);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/asset/assetPriceInfoEdit.do")
    public String assetPriceInfoEdit(AssetVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        AssetVO assetVO = assetService.selectAssetView(vo);
        model.addAttribute("asset", assetVO);
        selectByGroup(groIdx, model);


        return "itman/public/html/popup/asset/assetPriceInfoEdit";
    }

    @PostMapping("/itman/asset/updateAssetPriceInfo.do")
    public String updateAssetPriceInfo(@ModelAttribute AssLogVO assLogVO, AssetVO vo, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);

        AssetVO assetVO = assetService.selectAssetView(vo);
        String oldPrice = assetVO.getPrice();
        if (oldPrice == null || oldPrice.equals("")) {
            oldPrice = "0";
        }
        assetService.updateAssetPriceInfo(vo);
        String newPrice = assetService.selectAssetView(vo).getPrice();
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("수정");
        assLogVO.setAlCat("구매 가격");
        assLogVO.setAlCont(oldPrice + "->" + newPrice);
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @PostMapping("/itman/asset/updateAssetPictureInfo.do")
    public String updateAssetPictureInfo(@ModelAttribute AssLogVO assLogVO, AssetVO vo,
                                         @RequestParam(value = "assImgFile", required = false) MultipartFile file,
                                         HttpServletRequest request,
                                         Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {
        if(!file.isEmpty()){
            String uploadDir = "/upload/assImg/";
            String realDir = request.getServletContext().getRealPath(uploadDir);
            File dir = new File(realDir);
            if(!dir.exists()){
                dir.mkdirs();
            }

            String originalFileName = file.getOriginalFilename();
            String ext = (originalFileName != null && originalFileName.lastIndexOf('.') != -1) ? originalFileName.substring(originalFileName.lastIndexOf('.')) : "";
            String prefix = "assImg";
            String datePart = new java.text.SimpleDateFormat("yyyyMMdd_HHmmss").format(new java.util.Date());
            String randomPart = java.util.UUID.randomUUID().toString().replace("-", "").substring(0,8).toUpperCase();
            String savedName = prefix + "_" + datePart + "_" + randomPart + ext;

            File img = new File(dir, savedName);
            file.transferTo(img);
            vo.setImage(savedName);
        }
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        assetService.updateAssetPictureInfo(vo);

        return "redirect:/itman/assetsView.do?assIdx=" + vo.getAssIdx() ;
    }

    //-------------------------------삭제------------------------------------------
    @RequestMapping("/itman/asset/confirmAssetDel.do")
    public String confirmAssetDel(AssetVO vo, Model model) throws Exception {
        model.addAttribute("asset", vo);
        return "itman/public/html/popup/asset/contAssetDel";
    }

    @PostMapping("/itman/asset/deleteAsset.do")
    public String deleteAsset(@ModelAttribute AssLogVO assLogVO ,AssetVO  vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(delIdx);

        AssetVO assetVO = assetService.selectAssetView(vo);
        assetService.deleteAsset(vo);
        assLogVO.setAssIdx(vo.getAssIdx());
        assLogVO.setAssNameLog(assetVO.getAssName());
        assLogVO.setAlType("삭제");
        assLogVO.setAlCat("자산");
        assLogService.insertAssLog(assLogVO);
        model.addAttribute("script", "<script>window.opener.location.href=\"/itman/assetsList.do\"; window.close();</script>");
        return "itman/common/scriptResponse";
    }
}
