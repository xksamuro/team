<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/28 0028
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach items="${list}" var="user">
        <table>
            <tr>
                <td>${user.name}</td>
                <td>${user.password}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td>${user.id}</td>
            </tr>
        </table>
    </c:forEach>
</body>
</html>
