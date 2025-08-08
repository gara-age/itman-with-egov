package egovframework.itman.state.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.state.service.StateVO;
import egovframework.itman.state.service.impl.StateServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class StateController {
    @Resource(name = "stateService")
    private StateServiceImpl stateService;

    @RequestMapping("/itman/assetStateList.do")
    public String selectAssetStateList(StateVO vo, Pagination pagination, Model model
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";
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
    public String updateAssetState(StateVO vo, Model model) throws Exception {
        stateService.updateAssetState(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close()</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/confirmAssetStateDel.do")
    public String confirmAssetStateDel(StateVO vo, Model model) throws Exception {
        model.addAttribute("state", vo);
        return "itman/public/html/popup/contDel";
    }

    @RequestMapping("/itman/deleteAssetState.do")
    public String deleteAssetState(StateVO vo, Model model) throws Exception {
        stateService.deleteAssetState(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close()</script>");
        return "itman/common/scriptResponse";    }
}
