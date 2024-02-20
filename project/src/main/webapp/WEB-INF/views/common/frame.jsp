<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- WEB-INF/views -->
<c:set var="path" value="/WEB-INF/views" />

<c:import url="${path}/common/header.jsp"/>
<main>
	${content}
</main>
<c:import url="${path}/common/footer.jsp"/>