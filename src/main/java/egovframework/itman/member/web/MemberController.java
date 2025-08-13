package egovframework.itman.member.web;

import egovframework.itman.member.service.MemberVO;
import egovframework.itman.member.service.impl.MemberServiceImpl;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Resource(name = "memberService")
    private MemberServiceImpl memberService;
    @Resource(name = "passwordEncoder")
    private BCryptPasswordEncoder passwordEncoder;

    @RequestMapping("/itman/user/join.do")
    public String join() {
        return "itman/public/html/user/join01";
    }

    @RequestMapping("/itman/user/writeUserInfo.do")
    public String writeUserInfo() {
        return "itman/public/html/user/join02";
    }

    @PostMapping(value = "/itman/checkMail.do", produces = "application/json;charset=UTF-8" )
    @ResponseBody
    public String checkMail(@RequestParam("email") String email) {
        boolean valid = email != null && email.matches(
                "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        );
        if(!valid)
            return "2";
        //        반환값 의미: 0=사용 가능, 1=이미 존재, 2=형식 오류
       boolean exist = memberService.existsByEmail(email);

        return exist ? "1" : "0";

    }

    @RequestMapping(value = "/itman/sendMailCode.do", method = RequestMethod.POST)
//    @ResponseBody
    public String sendMailCode(@ModelAttribute MemberVO vo, @RequestParam("memMail") String email, HttpSession session) throws Exception {
        session.setAttribute("member", vo);
        String code = String.valueOf((int)((Math.random() * 900000) + 100000)); //6자리 랜덤 숫자
        memberService.sendAuthMail(email, code);
        session.setAttribute("authCode", code);

        return "itman/public/html/user/certPass";
    }

    @RequestMapping(value = "/itman/checkMailCode.do", method = RequestMethod.POST)
//    @ResponseBody
    public String checkMailCode(@RequestParam("inputCode") String inputCode, HttpSession session, Model model) {
        String savedCode = (String) session.getAttribute("authCode");
        model.addAttribute("authCode", savedCode);
        if(savedCode != null && savedCode.equals(inputCode)) {
            MemberVO vo = (MemberVO) session.getAttribute("member");

            String rawPassword = vo.getMemPw();
            String encodedPassword = passwordEncoder.encode(rawPassword);
            vo.setMemPw(encodedPassword);

            memberService.insertMember(vo);
            model.addAttribute("member", vo);

            session.removeAttribute("authCode");
            session.removeAttribute("member");
            return "itman/public/html/user/join03";
        } else {
            return "fail";
        }
    }

    @RequestMapping("/itman/user/login.do")
    public String login() {
        return "itman/public/html/user/login";
    }

    @PostMapping("/itman/user/authUser.do")
    public String authUser(@ModelAttribute MemberVO vo, HttpSession session,
    @RequestParam("inputMail") String inputMail,
    @RequestParam("inputPw") String inputPw ,
                           Model model) {
        MemberVO member = memberService.selectMemberByEmail(inputMail);
        if(member == null || !passwordEncoder.matches(inputPw, member.getMemPw())) {
            model.addAttribute("msg", "존재하지않는 회원이거나 아이디 또는 비밀번호가 일치하지않습니다.");
            return "itman/public/html/user/login";
        }
        System.err.println("memberName: " + member.getMemName());
        System.err.println("memberMail: " + member.getMemMail());
        session.setAttribute("loginUser", member);
        session.setAttribute("userIdx", member.getMemIdx());
        return "redirect:/itman/index.do";
    }


    @GetMapping("/itman/logout.do")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 비우기
        return "redirect:/itman/index.do";    }


}
