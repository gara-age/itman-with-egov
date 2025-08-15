package egovframework.itman.assLog.web;

import egovframework.itman.assLog.service.AssLogVO;
import egovframework.itman.assLog.service.impl.AssLogServiceImpl;
import egovframework.itman.common.Pagination;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AssLogController {
    @Resource(name = "assLogService")
    private AssLogServiceImpl assLogService;

    @RequestMapping("/itman/assetHistory.do")
    public String selectAssetHistoryList(AssLogVO vo, Pagination pagination, Model model
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range
    , @RequestParam(value = "id", defaultValue = "9")int id ,
                                         HttpSession session) {
        model.addAttribute("pageNumDepth01", id);
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(),groIdx);
        pagination.setListCnt(assLogService.selectAssLogListCnt(pagination));

        pagination.pageInfo(page,range,pagination.getListCnt());
        List<AssLogVO> list = assLogService.selectAllAssLogList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);
        return "itman/public/html/ingroup/ahistory";
    }
}
