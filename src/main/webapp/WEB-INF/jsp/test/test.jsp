<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Index Page</title>
    <style>
        table { border-collapse: collapse; width: 50%; }
        th, td { border: 1px solid #999; padding: 8px; }
    </style>
</head>
<body>
    <h1>test</h1>

    <table>
        <thead>
            <tr>
                <th>Column1</th>
                <th>Column2</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${testList}">
                <tr>
                    <td>${row.column1}</td>
                    <td>${row.column2}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
