package egovframework.itman.member.service.impl;

import egovframework.itman.member.service.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    @Autowired
    SqlSession sqlSession;

    public boolean countByEmail(String email){
        Integer count = (Integer) sqlSession.selectOne("memberDAO.countByEmail", email);
        return count != null && count > 0;
    }

    public void insertMember(MemberVO vo){
        sqlSession.insert("memberDAO.insertMember", vo);
    }
    public MemberVO selectMemberByEmail(String inputMail){
        return sqlSession.selectOne("memberDAO.selectMemberByEmail", inputMail);
    }
    public void updateMemTel(MemberVO vo){
        sqlSession.update("memberDAO.updateMemTel", vo);
    }

    public void updateMemPw(MemberVO vo){
        sqlSession.update("memberDAO.updateMemPw", vo);
    }
    public void deleteMember(MemberVO vo){
        sqlSession.update("memberDAO.deleteMember", vo);
    }
    public MemberVO findMail(MemberVO vo){
        return  sqlSession.selectOne("memberDAO.findMail", vo);
    }
    public MemberVO findPass(MemberVO vo){
        return  sqlSession.selectOne("memberDAO.findPass", vo);
    }

}
