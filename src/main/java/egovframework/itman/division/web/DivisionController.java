package egovframework.itman.division.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.division.service.DivisionService;
import egovframework.itman.division.service.DivisionVO;
import egovframework.itman.division.service.impl.DivisionServiceImpl;
import egovframework.itman.employee.service.EmployeeVO;
import egovframework.itman.location.service.LocationVO;
import egovframework.usr.com.EgovframeworkCommonUtil;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DivisionController {
    @Resource(name = "divisionService")
    private DivisionServiceImpl divisionService;

    @RequestMapping("/itman/departList.do")
    public String selectDivisionList(DivisionVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range
            , @RequestParam(value = "id",defaultValue = "3")int id
            , HttpSession session) throws Exception {
        model.addAttribute("pageNumDepth01", id);
        String groIdx = (String) session.getAttribute("groIdx");


        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = divisionService.selectDivisionListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);

        List<DivisionVO> list = divisionService.selectDivisionList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/departList";
    }

    @RequestMapping("/itman/divisionWrite.do")
    public String writeEmployeeDivision(DivisionVO vo, Model model) {
        if(vo.getDivIdx() != null){
            DivisionVO resultVO = divisionService.selectDivisionView(vo);
            model.addAttribute("division", resultVO);
        }
        return "itman/public/html/popup/contWriteItmDivision";
    }
    @PostMapping(value = "/itman/checkDuplicateEmpDiv.do" ,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkDuplicateEmpDiv(@RequestParam("divCode") String divCode, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        DivisionVO vo = new DivisionVO();
        vo.setDivCode(divCode);
        vo.setGroIdx(groIdx);
        DivisionVO resultVO = divisionService.checkDuplicate(vo);
        if (resultVO != null){
            return "0";
        }
        return "1";
    }

    @PostMapping("/itman/insertDepart.do")
    public String insertDivision(DivisionVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String regIdx = (String) session.getAttribute("userIdx");
        vo.setRegIdx(regIdx);
        divisionService.insertDivision(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "부서가 추가되었습니다","<script>window.opener.location.reload(); window.close();</script>");
    }

    @PostMapping("/itman/updateDepart.do")
    public String updateDivision(@ModelAttribute DivisionVO vo, Model model,HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String modIdx = (String) session.getAttribute("userIdx");
        vo.setModIdx(modIdx);
        divisionService.updateDivision(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "부서가 수정되었습니다","<script>window.opener.location.reload(); window.close();</script>");    }

    @RequestMapping("/itman/confirmDivisionDel.do")
    public String confirmDivisionDel(DivisionVO vo, Model model) {
        model.addAttribute("division", vo);
        return "itman/public/html/popup/contDivisionDel";
    }

    @PostMapping("/itman/deleteDepart.do")
    public String deleteDivision(DivisionVO vo, Model model, HttpSession session) {
        String groIdx = (String) session.getAttribute("groIdx");
        vo.setGroIdx(groIdx);
        String delIdx = (String) session.getAttribute("userIdx");
        vo.setDelIdx(delIdx);
        divisionService.deleteDivision(vo);
        return EgovframeworkCommonUtil.alertMoveWithScript(model, "부서가 삭제되었습니다","<script>window.opener.location.reload(); window.close();</script>");    }



}
