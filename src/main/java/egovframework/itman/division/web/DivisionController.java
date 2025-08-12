package egovframework.itman.division.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.division.service.DivisionVO;
import egovframework.itman.division.service.impl.DivisionServiceImpl;
import egovframework.itman.employee.service.EmployeeVO;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class DivisionController {
    @Resource(name = "divisionService")
    private DivisionServiceImpl divisionService;

    @RequestMapping("/itman/departList.do")
    public String selectDivisionList(DivisionVO vo, Pagination pagination, Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(defaultValue = "1") int range) throws Exception {

        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = divisionService.selectDivisionListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);

        List<DivisionVO> list = divisionService.selectDivisionList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("resultList", list);

        return "itman/public/html/ingroup/departList";
    }

    @RequestMapping("/itman/divisionWrite.do")
    public String writeEmployeeDivision(DivisionVO vo, Model model) throws Exception {
        if(vo.getDivIdx() != null){
            DivisionVO resultVO = divisionService.selectDivisionView(vo);
            model.addAttribute("division", resultVO);
        }
        return "itman/public/html/popup/contWriteItmDivision";
    }

    @PostMapping("/itman/insertDepart.do")
    public String insertDivision(DivisionVO vo, Model model, RedirectAttributes redirectAttributes) {
        divisionService.insertDivision(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @PostMapping("/itman/updateDepart.do")
    public String updateDivision(@ModelAttribute DivisionVO vo, Model model, RedirectAttributes redirectAttributes) {
        divisionService.updateDivision(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @RequestMapping("/itman/confirmDivisionDel.do")
    public String confirmDivisionDel(DivisionVO vo, Model model, RedirectAttributes redirectAttributes) {
        model.addAttribute("division", vo);
        return "itman/public/html/popup/contDivisionDel";
    }

    @PostMapping("/itman/deleteDepart.do")
    public String deleteDivision(DivisionVO vo, Model model) {
        divisionService.deleteDivision(vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }



}
