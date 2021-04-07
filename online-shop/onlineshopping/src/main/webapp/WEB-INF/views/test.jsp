<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

</head>
<body>
<h1>we are here</h1>
	<table>
    <c:forEach items="${mem}" var="mem">
        <tr>
            <td>${mem.id}</td>
            
        </tr>
    </c:forEach>
</table>
</body>
</html>            