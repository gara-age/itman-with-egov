package egovframework.itman.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @RequestMapping("itman/user/join.do")
    public String join() {

        return "itman/public/html/user/join01";
    }
}
