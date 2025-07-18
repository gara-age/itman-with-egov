package egovframework.com.cmm.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import egovframework.com.cmm.ComDefaultVO;

@Controller
@SessionAttributes(types = {ComDefaultVO.class})
public class EgovCommonController {
	
  @RequestMapping(value = "/index.do")
  public String login(HttpServletRequest request, ModelMap model) throws Exception {
    System.err.println("herere index");
    return "/index";
  }
}
