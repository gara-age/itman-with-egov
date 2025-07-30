package egovframework.itman.employee.web;


import egovframework.itman.common.Pagination;
import egovframework.itman.division.service.impl.DivisionServiceImpl;
import egovframework.itman.employee.service.EmployeeVO;
import egovframework.itman.employee.service.impl.EmployeeServiceImpl;
import egovframework.itman.position.service.impl.PositionServiceImpl;
import egovframework.itman.empState.service.impl.EmpStateServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class EmployeeController {
    @Resource(name = "employeeService")
    private EmployeeServiceImpl employeeService;
    @Resource(name = "divisionService")
    private DivisionServiceImpl divisionService;
    @Resource(name = "empStateService")
    private EmpStateServiceImpl empStateService;
    @Resource(name = "positionService")
    private PositionServiceImpl positionService;

    private void addCommonLists(String groIdx, Model model) {
        model.addAttribute("divisionList", divisionService.selectDivisionsByGroup(groIdx));
        model.addAttribute("empStateList", empStateService.selectEmpStatesByGroup(groIdx));
        model.addAttribute("positionList", positionService.selectPositionsByGroup(groIdx));
    }

    @RequestMapping("/itman/employeeList.do")
    public String selectEmployeeList(EmployeeVO vo, Pagination pagination, Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range
    ) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";
        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = employeeService.selectEmployeeListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        //그룹별 부서, 상태, 직위 조회
        addCommonLists(groIdx, model);
        pagination.setSearching(pagination.getSearching());
        //검색 결과에 따른 총 목록의 길이를 반환
        List<EmployeeVO> list = employeeService.selectEmployeeList(pagination);
        //페이징 구현
        model.addAttribute("pagination", pagination);
        model.addAttribute("listCnt", listCnt); // 전체 건수 조회
        model.addAttribute("resultList", list);
        return "itman/public/html/ingroup/emploList";
    }


    @RequestMapping("/itman/employeeView.do")
    public String selectEmployeeView(EmployeeVO vo, Model model) {

        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("employee", resultVO);
        return "itman/public/html/ingroup/emploView";
    }

    @RequestMapping("/itman/employeeEdit.do")
    public String employeeForm(EmployeeVO vo, Model model) {
        String groIdx = vo.getGroIdx();
        if (vo.getEmpIdx() != null) {
            EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
            model.addAttribute("employee", resultVO);
            groIdx = resultVO.getGroIdx();
        } else {
            groIdx = "1";
        }
        addCommonLists(groIdx, model);


        return "itman/public/html/ingroup/emploWrite";
    }

    @RequestMapping("/itman/update.do")
    public String updateEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "수정되었습니다.");
        return "redirect:/itman/employeeView.do?empIdx=" + vo.getEmpIdx();
    }


    @RequestMapping("/itman/insert.do")
    public String insertEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "추가되었습니다.");
        return "redirect:/itman/employeeList.do";
    }


    @RequestMapping("/itman/delete.do")
    public String deleteEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.deleteEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "삭제되었습니다.");
        return "redirect:/itman/employeeList.do";
    }

    @RequestMapping("/popup/searchPop.do")
    public String searchPop(EmployeeVO vo, Pagination pagination, Model model
            , @RequestParam(required = false, defaultValue = "1") int page
            , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
        String groIdx = vo.getGroIdx() != null ? vo.getGroIdx() : "1";

        pagination.setSearchingGroIdx(pagination.getSearching(), groIdx);

        int listCnt = employeeService.selectEmployeeListCnt(pagination);
        pagination.pageInfo(page, range, listCnt);
        pagination.setSearching(pagination.getSearching());
        //검색 결과에 따른 총 목록의 길이를 반환
        List<EmployeeVO> list = employeeService.selectEmployeeList(pagination);
        //페이징 구현
        model.addAttribute("pagination", pagination);
        model.addAttribute("listCnt", listCnt); // 전체 건수 조회

        model.addAttribute("employeeList", list);
        return "itman/public/html/popup/searchPop";
    }
}
