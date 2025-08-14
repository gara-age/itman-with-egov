package egovframework.itman.member.service.impl;

import egovframework.itman.member.service.MemberService;
import egovframework.itman.member.service.MemberVO;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Resource(name = "memberDAO")
    private MemberDAO memberDAO;
    @Resource(name = "mailSender")
    private JavaMailSender mailSender;

    @Override
    public boolean existsByEmail(String email){
        return memberDAO.countByEmail(email);
    }

    @Override
    public void insertMember(MemberVO vo){
        memberDAO.insertMember(vo);
    }
    @Override
    public MemberVO selectMemberByEmail(String inputMail){
        return memberDAO.selectMemberByEmail(inputMail);
    }

    @Override
    public void updateMemTel(MemberVO vo){
        memberDAO.updateMemTel(vo);
    }
    @Override
    public void updateMemPw(MemberVO vo){
        memberDAO.updateMemPw(vo);
    }
    @Override
    public void deleteMember(MemberVO vo){
        memberDAO.deleteMember(vo);
    }
    @Override
    public MemberVO findMail(MemberVO vo){
      return  memberDAO.findMail(vo);
    }
    @Override
    public MemberVO findPass(MemberVO vo){
        return memberDAO.findPass(vo);
    }

    public void sendAuthMail(String toEmail, String code) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        helper.setTo(toEmail);
        helper.setSubject("ITman 회원가입 인증번호입니다.");

        helper.setText("인증번호는 " + code + "입니다.");

        mailSender.send(message);
    }
}
