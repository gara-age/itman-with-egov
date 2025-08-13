package egovframework.itman.position.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.position.service.PositionVO;
import egovframework.itman.position.service.impl.PositionServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.text.Position;
import java.util.List;

@Controller
public class PositionController {
    @Resource(name = "positionService")
    public PositionServiceImpl positionService;

    @RequestMapping("/itman/spotList.do")
    public String selectPositionList(PositionVO vo, Model model, Pagination pagination
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range
    , HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);
        int listCnt = positionService.selectPositionListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        List<PositionVO> list = positionService.selectPositionList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/spotList";

    }
    @RequestMapping("/itman/positionWrite.do")
    public String writePosition(PositionVO vo, Model model) throws Exception{
        if(vo.getPosIdx() !=null){
            PositionVO resultVO = positionService.selectPositionView(vo);
            model.addAttribute("position",resultVO);
        }
        return "itman/public/html/popup/contWriteItmPosition";
    }

    @RequestMapping("/itman/positionEdit.do")
    public String editPosition(PositionVO vo, Model model) throws Exception{
            PositionVO resultVO = positionService.selectPositionView(vo);
            model.addAttribute("position",resultVO);
        return "itman/public/html/popup/contEditItmPosition";
    }

    @PostMapping("/itman/insertPosition.do")
    public String insertPosition(PositionVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        positionService.insertPosition(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @PostMapping("/itman/updatePosition.do")
    public String updatePosition(PositionVO vo, Model model){
        positionService.updatePosition(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";

    }

    @RequestMapping("/itman/confirmPositionDel.do")
    public String confirmPositionDel(PositionVO vo, Model model){
        PositionVO resultVO = positionService.selectPositionView(vo);
        model.addAttribute("position",resultVO);
        return "itman/public/html/popup/listDelete";
    }

    @PostMapping("/itman/deletePosition.do")
    public String deletePosition(PositionVO vo, Model model) {
        positionService.deletePosition(vo);
        model.addAttribute("script","<script>window.opener.location.reload(); window.close();</script>");
        return"itman/common/scriptResponse";
    }

}
