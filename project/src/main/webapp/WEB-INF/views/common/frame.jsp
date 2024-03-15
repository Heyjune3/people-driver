<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!-- WEB-INF/views -->
<c:set var="path1" value="/WEB-INF/views" />

<c:import url="${path1}/common/header.jsp"/>
<main>
	${content}
</main>
<c:import url="${path1}/common/footer.jsp"/>