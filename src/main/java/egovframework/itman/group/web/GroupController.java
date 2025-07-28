package egovframework.itman.group.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {
    @RequestMapping("/itman/index.do")
    public String index(Model model) {
        return "itman/public/html/index";
    }
    @RequestMapping("/itman/group.do")
    public String group(Model model) {
        return "itman/public/html/group";
    }
    @RequestMapping("/itman/addGroup.do")
    public String addGroup(Model model) {
        return "itman/public/html/popup/addGroup";
    }
}
