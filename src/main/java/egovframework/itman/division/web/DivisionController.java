package egovframework.itman.division.web;

import egovframework.itman.common.Pagination;
import egovframework.itman.division.service.DivisionVO;
import egovframework.itman.division.service.impl.DivisionServiceImpl;
import egovframework.itman.employee.service.EmployeeVO;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    , @RequestParam(required = false, defaultValue = "1") int page
    , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {

        String groIdx;
        if(vo.getDivIdx() != null){
            DivisionVO resultVO = divisionService.selectDivisionView(vo);
            model.addAttribute("division", resultVO);
            groIdx = resultVO.getGroIdx();
//            groIdx = "126";
        } else {
            groIdx = "1";
//            groIdx = "126";
        }
        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = divisionService.selectDivisionListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);

        List<DivisionVO> list = divisionService.selectDivisionList(pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("resultList", list);
        for(int i = 0; i < listCnt; i++){
            System.err.println("resultList : " + list.get(i).getDivName());
        }

        return "itman/public/html/ingroup/departList";
    }

    @RequestMapping("/itman/departView.do")
    public String selectDivisionView(DivisionVO vo, Model model){
    DivisionVO resultVO = divisionService.selectDivisionView(vo);
    model.addAttribute("division", resultVO);
        return "itman/public/html/ingroup/departView";
    }

    @RequestMapping("/itman/departEdit.do")
    public String divisionForm(DivisionVO vo, Model model){
        String groIdx = vo.getGroIdx();
        if(vo.getDivIdx() != null){
            DivisionVO resultVO = divisionService.selectDivisionView(vo);
            model.addAttribute("division", resultVO);
            groIdx = resultVO.getGroIdx();
        } else {
            groIdx = "1";
        }

        return "itman/public/html/ingroup/departWrite";
    }
    @RequestMapping("/itman/departInsert.do")
    public String insertDivision(DivisionVO vo, Model model, RedirectAttributes redirectAttributes) {
        divisionService.insertDivision(vo);
        redirectAttributes.addFlashAttribute("msg", "추가되었습니다.");
        return "redirect:/itman/departList.do";
    }

    @RequestMapping("/itman/departUpdate.do")
    public String updateDivision(DivisionVO vo, Model model, RedirectAttributes redirectAttributes) {
        divisionService.updateDivision(vo);
        redirectAttributes.addFlashAttribute("msg", "수정되었습니다.");
        return "redirect:/itman/departList.do";
    }

    @RequestMapping("/itman/departDelete.do")
    public String deleteDivision(DivisionVO vo, RedirectAttributes redirectAttributes) {
        divisionService.deleteDivision(vo);
        redirectAttributes.addFlashAttribute("msg","삭제되었습니다.");
        return "redirect:/itman/departList.do";
    }



}
