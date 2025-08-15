package egovframework.itman.state.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.state.service.StateVO;
import egovframework.itman.state.service.impl.StateServiceImpl;
import egovframework.usr.com.EgovframeworkCommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StateController {
    @Resource(name = "stateService")
    private StateServiceImpl stateService;

    @RequestMapping("/itman/assetStateList.do")
    public String selectAssetStateList(StateVO vo, Pagination pagination, Model model
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range
    , @RequestParam(value = "id", defaultValue = "7")int id
    , HttpSession session) throws Exception {
        model.addAttribute("pageNumDepth01", id);
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = stateService.selectAssetStateListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());

        List<StateVO> list = stateService.selectAssetStateList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/aStatList";
    }

    @RequestMapping("/itman/editAssetState.do")
    public String editAssetState(StateVO vo, Model model) throws Exception {
        StateVO resultVO = stateService.selectAssetStateView(vo);
        model.addAttribute("state", resultVO);
        return "itman/public/html/popup/contWrite";
    }

    @PostMapping("/itman/updateState.do")
    public String updateAssetState(StateVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        stateService.updateAssetState(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "자산 상태가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/confirmAssetStateDel.do")
    public String confirmAssetStateDel(StateVO vo, Model model) {
        model.addAttribute("state", vo);
        return "itman/public/html/popup/contDel";
    }

    @RequestMapping("/itman/deleteAssetState.do")
    public String deleteAssetState(StateVO vo, Model model, HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setDelIdx(delIdx);
        stateService.deleteAssetState(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "자산 상태가 삭제되었습니다", "<script>window.opener.location.reload(); window.close();</script>");
    }
}
