<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.copyright" var="copyright" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
</head>
<body>
<div style="text-align:center;">${copyright}.</div>
</body>
</html>