package egovframework.itman.member.web;

import egovframework.itman.member.service.MemberVO;
import egovframework.itman.member.service.impl.MemberServiceImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.net.UnknownHostException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;

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
    public String sendMailCode(@ModelAttribute MemberVO vo, @RequestParam("memMail") String email, HttpSession session) throws Exception {
        session.setAttribute("member", vo);
        String code = String.valueOf((int)((Math.random() * 900000) + 100000)); //6자리 랜덤 숫자
        memberService.sendAuthMail(email, code);
        session.setAttribute("authCode", code);

        return "itman/public/html/user/certPass";
    }

    @RequestMapping(value = "/itman/checkMailCode.do", method = RequestMethod.POST)
    public String checkMailCode(@RequestParam("inputCode") String inputCode, HttpSession session, Model model) {
        String savedCode = (String) session.getAttribute("authCode");
        model.addAttribute("authCode", savedCode);
        if(savedCode != null && savedCode.equals(inputCode)) {
            if(session.getAttribute("state") != null || session.getAttribute("state").equals("findPass")){
                session.removeAttribute("authCode");
                session.removeAttribute("state");
                return "itman/public/html/user/compPass";
            } else {
                MemberVO vo = (MemberVO) session.getAttribute("member");

                String rawPassword = vo.getMemPw();
                String encodedPassword = passwordEncoder.encode(rawPassword);
                vo.setMemPw(encodedPassword);

                memberService.insertMember(vo);
                model.addAttribute("member", vo);

                session.removeAttribute("authCode");
                session.removeAttribute("member");
                return "itman/public/html/user/join03";
            }
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
                           HttpServletRequest request,
                           Model model) {
        MemberVO member = memberService.selectMemberByEmail(inputMail);
        if(member == null || !passwordEncoder.matches(inputPw, member.getMemPw())) {
            model.addAttribute("msg", "존재하지않는 회원이거나 아이디 또는 비밀번호가 일치하지않습니다.");
            return "itman/public/html/user/login";
        }
        String ip = getClientIPv4(request);
        session.setAttribute("userIp", ip);
        System.err.println("Client IP: " + ip);
        session.setAttribute("loginUser", member);
        session.setAttribute("userIdx", member.getMemIdx());
        return "redirect:/itman/index.do";
    }

    @RequestMapping("/itman/myPage.do")
    public String myPage(HttpSession session, Model model) {
        String userMail = ((MemberVO) session.getAttribute("loginUser")).getMemMail();
        MemberVO vo = memberService.selectMemberByEmail(userMail);
        model.addAttribute("member", vo);
        session.setAttribute("member", vo);
        return "itman/public/html/user/mypage";
    }

    @RequestMapping("/itman/phoneEdit.do")
    public String phoneEdit(HttpSession session, Model model) {
        MemberVO vo = (MemberVO) session.getAttribute("member");
        model.addAttribute("memTel", vo.getMemTel());
        return "itman/public/html/popup/phoneEdit";
    }

    @PostMapping("/itman/updatePhone.do")
    public String updatePhone(@RequestParam("memTel") String memTel,HttpSession session, Model model) {
        MemberVO vo = (MemberVO) session.getAttribute("member");
        session.removeAttribute("member");
        vo.setMemTel(memTel);
        memberService.updateMemTel(vo);
        session.setAttribute("member", vo);
        model.addAttribute("script", "<script>window.opener.location.reload(); window.close();</script>");
        return "itman/common/scriptResponse";
    }

    @PostMapping(value = "/itman/authPassword.do", produces = "application/json;charset=UTF-8" )
    @ResponseBody
    public String updatePassword(@RequestParam("inputPw") String inputPw,
                                  HttpSession session) {
        MemberVO vo = (MemberVO) session.getAttribute("member");
        if(inputPw != null && passwordEncoder.matches(inputPw, vo.getMemPw())) {
            return "1";
        }

        return "0";
    }

    @RequestMapping("/itman/changePass.do")
    public String changePass() {
        return "itman/public/html/user/changePass";
    }

    @PostMapping("/itman/updatePass.do")
    public String updatePass(@RequestParam("newPw") String newPw, HttpSession session) {
        MemberVO vo = (MemberVO) session.getAttribute("member");
        String encodedPassword = passwordEncoder.encode(newPw);
        vo.setMemPw(encodedPassword);
        session.removeAttribute("member");
        memberService.updateMemPw(vo);
        session.setAttribute("member", vo);
        return "redirect:/itman/myPage.do";
    }

    @RequestMapping("/itman/privacy.do")
    public String privacy() {
        return "itman/public/html/user/privacy";
    }

    @RequestMapping("/itman/accDel.do")
    public String accDel(HttpSession session, Model model) {

        return "itman/public/html/user/accDel";
    }

    @PostMapping("/itman/accDel_proc.do")
    public String accDelProc(HttpSession session) {
        MemberVO vo = (MemberVO) session.getAttribute("member");
        memberService.deleteMember(vo);
        session.invalidate();
        return "redirect:/itman/index.do";
    }

    @GetMapping("/itman/logout.do")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 비우기
        return "redirect:/itman/index.do";
    }

    @RequestMapping("/itman/user/findEmail.do")
    public String findEmail() {
        return "itman/public/html/user/findEmail";
    }

    @PostMapping(value = "/itman/findEmail_proc.do",  produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String findEmailProc(@RequestParam("memName") String memName,
                                @RequestParam("memTel") String memTel,
                                HttpSession session) {
        MemberVO vo = new MemberVO();
        vo.setMemName(memName);
        vo.setMemTel(memTel);
        MemberVO foundedUser = memberService.findMail(vo);
        if(foundedUser != null) {
            session.setAttribute("foundedUser", foundedUser);
            return "1";
        }
        return "0";
    }

    @RequestMapping("/itman/compEmail.do")
    public String compEmail(HttpSession session,Model model) {
        MemberVO vo = (MemberVO) session.getAttribute("foundedUser");
        model.addAttribute("memMail", vo.getMemMail());
        return "itman/public/html/user/compEmail";
    }

    @RequestMapping("/itman/user/findPass.do")
    public String findPass(HttpSession session, Model model) {
        return "itman/public/html/user/findPass";
    }

    @PostMapping(value = "/itman/findPass_proc.do",  produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String findPassProc(@RequestParam("memName") String memName,
                                @RequestParam("memMail") String memMail,
                                @RequestParam("memTel") String memTel,
                                HttpSession session) {
        MemberVO vo = new MemberVO();
        vo.setMemName(memName);
        vo.setMemMail(memMail);
        vo.setMemTel(memTel);
        MemberVO foundedUser = memberService.findPass(vo);
        if(foundedUser != null) {
            String state = "findPass";
            session.setAttribute("state", state);
            session.setAttribute("foundedUser", foundedUser);
            return "1";
        }
        return "0";
    }

    @PostMapping("/itman/changePass_proc.do")
    public String changePassProc(@RequestParam("newPw") String newPw, HttpSession session) {
        MemberVO vo = (MemberVO) session.getAttribute("foundedUser");
        MemberVO user = memberService.selectMemberByEmail(vo.getMemMail());
        String encodedPassword = passwordEncoder.encode(newPw);
        user.setMemPw(encodedPassword);
        session.removeAttribute("member");
        memberService.updateMemPw(user);
        return "redirect:/itman/user/login.do";
    }

    public String getClientIPv4(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");

        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        if ("0:0:0:0:0:0:0:1".equals(ip) || "::1".equals(ip)) {
            ip = "127.0.0.1";  // IPv6 loopback을 IPv4로 변환
        }


        // X-Forwarded-For에는 복수 IP가 있을 수 있음
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }

        // IPv6 주소를 IPv4로 변환 시도
        try {
            InetAddress inet = InetAddress.getByName(ip);
            ip = inet.getHostAddress();

            // IPv6 to IPv4 변환 (예: 0:0:0:0:0:ffff:192.168.0.1 → 192.168.0.1)
            if (ip != null && ip.contains(":") && ip.contains(".")) {
                ip = ip.substring(ip.lastIndexOf(":") + 1);
            }
        } catch (UnknownHostException e) {
            ip = "0.0.0.0"; // fallback
        }

        return ip;
    }
}
