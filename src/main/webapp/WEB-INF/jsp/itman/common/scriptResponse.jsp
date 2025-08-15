<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${!empty message}">
    <script>alert("${message}");</script>
</c:if>
<c:if test="${!empty returnUrl}">
    <script>location.replace("${returnUrl}");</script>
</c:if>
<c:if test="${!empty script}">
    ${script}
</c:if>