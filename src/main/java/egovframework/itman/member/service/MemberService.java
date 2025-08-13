package egovframework.itman.member.service;

public interface MemberService {
    boolean existsByEmail(String email);
    void insertMember(MemberVO vo);
    MemberVO selectMemberByEmail(String inputMail);



}
