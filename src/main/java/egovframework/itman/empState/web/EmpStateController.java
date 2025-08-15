package egovframework.itman.empState.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.empState.service.EmpStateVO;
import egovframework.itman.empState.service.impl.EmpStateServiceImpl;
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
public class EmpStateController {
    @Resource(name = "empStateService")
    EmpStateServiceImpl empStateService;

    @RequestMapping("/itman/employeeStateList.do")
    public String selectEmpStateList(EmpStateVO vo, Pagination pagination, Model model
    , @RequestParam(defaultValue = "1") int page
    , @RequestParam(defaultValue = "1") int range
    , @RequestParam(value = "id", defaultValue = "8")int id
    , HttpSession session) throws Exception {
        model.addAttribute("pageNumDepth01", id);
        String groIdx = (String) session.getAttribute("groIdx");

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = empStateService.selectEmpStateListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());
        List<EmpStateVO> list = empStateService.selectEmpStateList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);


        return "itman/public/html/ingroup/eStatList";
    }

    @RequestMapping("/itman/editEmploState.do")
    public String editEmployeeState(EmpStateVO vo, Model model) throws Exception {
        EmpStateVO resultVO = empStateService.selectEmpStateView(vo);
        model.addAttribute("empState", resultVO);
        return "itman/public/html/popup/employee/emploStateWrite";
    }
    @PostMapping("/itman/updateEmploState.do")
    public String updateEmployeeState(EmpStateVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        empStateService.updateEmployeeState(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 상태가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @RequestMapping("/itman/confirmEmploStateDel.do")
    public String confirmEmployeeStateDel(EmpStateVO vo, Model model) {
        model.addAttribute("empState", vo);
        return "itman/public/html/popup/contEmpDel";
    }
    @PostMapping("/itman/deleteEmploState.do")
    public String deleteEmployeeState(EmpStateVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setDelIdx(delIdx);
        empStateService.deleteEmployeeState(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "직원 상태가 삭제되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }
}
