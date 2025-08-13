package egovframework.itman.group.web;

import egovframework.itman.group.service.GroupVO;
import egovframework.itman.group.service.impl.GroupServiceImpl;
import egovframework.itman.member.service.MemberVO;
import egovframework.itman.member.service.impl.MemberServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@ControllerAdvice
public class GroupCommonDataController {
    @Resource(name = "groupService")
    GroupServiceImpl groupService;
    @Resource(name = "memberService")
    MemberServiceImpl memberService;

    @ModelAttribute("headerData")
    public GroupVO getHeaderData(HttpSession session) throws Exception {
        String groIdx = (String) session.getAttribute("groIdx");
        return  groupService.getHeaderData(groIdx);

    }

    @ModelAttribute("allGroupList")
    public List<GroupVO> getAllGroupData(HttpSession session) throws Exception {
        MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
        String memIdx;
        if (loginUser == null) {
            memIdx = "0";
        } else {
        memIdx = ((MemberVO) session.getAttribute("loginUser")).getMemIdx();
        }
        System.err.println("memIdx = " + memIdx);
        return  groupService.getAllGroupData(memIdx);
    }

    @ModelAttribute
    public void addCommonAttributes(HttpSession session, Model  model){
        MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
        if(loginUser != null){
            model.addAttribute("userName", loginUser.getMemName());
            model.addAttribute("userMail", loginUser.getMemMail());
            model.addAttribute("userIdx", loginUser.getMemIdx());

        }
    }




}
