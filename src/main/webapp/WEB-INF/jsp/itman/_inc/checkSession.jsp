<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  // 세션에서 로그인 사용자 정보 가져오기
  Object loginUser = session.getAttribute("loginUser");
  boolean isLogin = (loginUser != null);
%>

<script>
  const isLogin = <%= isLogin %>;

  if (!isLogin) {
    alert("세션이 만료되었습니다. 다시 로그인해주세요.");
    location.href = "<c:url value='/itman/user/login.do' />";
  }
</script>
