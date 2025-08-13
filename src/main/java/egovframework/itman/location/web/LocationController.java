package egovframework.itman.location.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.location.service.LocationVO;
import egovframework.itman.location.service.impl.LocationServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LocationController {
    @Resource(name = "locationService")
    LocationServiceImpl locationService;

    @RequestMapping("/itman/popup/locationPop.do")
    public String locationPop(LocationVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = locationService.selectLocationListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());

        List<LocationVO> resultList = locationService.selectLocationList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("locations", resultList);
        return "itman/public/html/popup/LocationPop";
    }

    @RequestMapping("/itman/assetLocationList.do")
    public String locationList(LocationVO vo, Pagination pagination , Model model
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range
    , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

    pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

    int listCnt = locationService.selectLocationListCnt(pagination);
    pagination.pageInfo(page, range, listCnt);
    pagination.setSearching(pagination.getSearching());

    List<LocationVO> list = locationService.selectLocationList(pagination);
    model.addAttribute("pagination", pagination);
    model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/locList";
    }

    @RequestMapping("/itman/editLocation.do")
    public String editLocation(LocationVO vo, Model model) throws Exception {
        LocationVO resultVO = locationService.selectLocation(vo);
        model.addAttribute("location", resultVO);
        return "itman/public/html/popup/contEditItmLocation";
    }

    @PostMapping("/itman/updateLocation.do")
    public String updateLocation(LocationVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        locationService.updateAssetLocation(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/confirmLocationDel.do")
    public String confirmLocationDel(LocationVO vo, Model model) throws Exception {
        model.addAttribute("location", vo);
        return "itman/public/html/popup/listDelete";
    }


    @PostMapping("/itman/deleteLocation.do")
    public String deleteLocation(LocationVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setDelIdx(delIdx);
        locationService.deleteAssetLocation(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

}
