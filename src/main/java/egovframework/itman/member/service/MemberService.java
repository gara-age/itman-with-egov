package egovframework.itman.member.service;

public interface MemberService {
    boolean existsByEmail(String email);
    void insertMember(MemberVO vo);
    MemberVO selectMemberByEmail(String inputMail);
    void updateMemTel(MemberVO vo);
    void updateMemPw(MemberVO vo);
    void deleteMember(MemberVO vo);
    MemberVO findMail(MemberVO vo);
    MemberVO findPass(MemberVO vo);
}
