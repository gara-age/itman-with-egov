package egovframework.itman.location.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.location.service.LocationVO;
import egovframework.itman.location.service.impl.LocationServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class LocationController {
    @Resource(name = "locationService")
    LocationServiceImpl locationService;

    @RequestMapping("/itman/popup/locationPop.do")
    public String locationPop(LocationVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = locationService.selectLocationListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());

        List<LocationVO> resultList = locationService.selectLocationList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("locations", resultList);
        return "itman/public/html/popup/LocationPop";
    }

}
