package egovframework.itman.position.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.position.service.PositionVO;
import egovframework.itman.position.service.impl.PositionServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.swing.text.Position;
import java.util.List;

@Controller
public class PositionController {
    @Resource(name = "positionService")
    public PositionServiceImpl positionService;

    @RequestMapping("/itman/spotList.do")
    public String selectPositionList(PositionVO vo, Model model, Pagination pagination
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int listCnt = positionService.selectPositionListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        List<PositionVO> list = positionService.selectPositionList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/spotList";

    }

}
