package egovframework.itman.web;


import egovframework.itman.service.EmployeeVO;
import egovframework.itman.service.impl.EmployeeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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

    @RequestMapping("/itman/employeeList.do")
    public String selectEmployeeList(EmployeeVO vo, Model model) {
        List<EmployeeVO> list = employeeService.selectEmployeeList(vo);
        model.addAttribute("resultList",list);
        return "itman/employeeList";
    }

    @RequestMapping("/itman/employeeView.do")
    public String selectEmployeeView(EmployeeVO vo, Model model) {
        vo.getEmpIdx();
        EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
        model.addAttribute("result", resultVO);
        return "itman/employeeView";
    }

    @RequestMapping("/itman/employeeForm.do")
    public String  employeeForm(EmployeeVO vo, Model model) {
        if(vo.getEmpIdx() != null) {
            EmployeeVO resultVO = employeeService.selectEmployeeView(vo);
            model.addAttribute("resultVO", resultVO);
        }
        return "itman/employeeForm";
    }

    @RequestMapping("/itman/update.do")
    public String  updateEmployee(EmployeeVO vo, Model model, RedirectAttributes redirectAttributes) {
        employeeService.updateEmployee(vo);
        redirectAttributes.addFlashAttribute("msg", "수정되었습니다.");
        return "redirect:/itman/employeeView,do?empIdx=" + vo.getEmpIdx();
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
