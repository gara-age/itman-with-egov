package egovframework.itman.employee.web;


import egovframework.itman.division.service.DivisionVO;
import egovframework.itman.division.service.impl.DivisionServiceImpl;
import egovframework.itman.employee.service.EmployeeVO;
import egovframework.itman.employee.service.impl.EmployeeServiceImpl;
import egovframework.itman.position.service.PositionVO;
import egovframework.itman.position.service.impl.PositionServiceImpl;
import egovframework.itman.empState.service.EmpStateVO;
import egovframework.itman.empState.service.impl.EmpStateServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/itman/employeeList.do")
    public String selectEmployeeList(EmployeeVO vo, Model model) {
        List<EmployeeVO> list = employeeService.selectEmployeeList(vo);
        model.addAttribute("resultList",list);
        return "itman/employee/employeeList";
    }

    @RequestMapping("/itman/employeeView.do")
    public String selectEmployeeView(EmployeeVO vo, Model model) {
        vo.getEmpIdx();
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("result", resultVO);
        return "itman/employee/employeeView";
    }

    @RequestMapping("/itman/employeeForm.do")
    public String  employeeForm(EmployeeVO vo, Model model) {
        String groIdx = vo.getGroIdx();
        if (vo.getEmpIdx() != null) {
            EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
            model.addAttribute("resultVo", resultVO);
            groIdx = resultVO.getGroIdx();
            System.err.println(resultVO.getGroIdx());
            System.err.println("resultVO.getDivIdx" + resultVO.getDivIdx());
            System.err.println("resultVO.getPosIdx" + resultVO.getPosIdx());
            System.err.println("resultVO.getEmpStIdx" + resultVO.getEmpStIdx());

        }
        if(vo.getEmpIdx() == null){
            groIdx = "1";
        }
        List<DivisionVO> divisions = divisionService.selectDivisionsByGroup(groIdx);
        List<EmpStateVO> empStates = empStateService.selectEmpStatesByGroup(groIdx);
        List<PositionVO> positions = positionService.selectPositionsByGroup(groIdx);
        model.addAttribute("divisionList", divisions);
        model.addAttribute("empStateList", empStates);
        model.addAttribute("positionList", positions);


        return "itman/employee/employeeForm";
    }

    @RequestMapping("/itman/update.do")
    public String  updateEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "수정되었습니다.");
        return "redirect:/itman/employee/employeeView.do?empIdx=" + vo.getEmpIdx();
    }


    @RequestMapping("/itman/insert.do")
    public String  insertEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.insertEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "추가되었습니다.");
        return "redirect:/itman/employeeList.do";
    }


    @RequestMapping("/itman/delete.do")
    public String  deleteEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.deleteEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "삭제되었습니다.");
        return "redirect:/itman/employeeList.do";
    }


}
