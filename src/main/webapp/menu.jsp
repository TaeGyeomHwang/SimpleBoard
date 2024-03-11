<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/BlogPractice/welcome.jsp"><h3>Home</h3></a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
							href="<c:url value="/member/loginMember.jsp"/>">Login</a></li>
						<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
							href='<c:url value="/member/addMember.jsp"/>'>Sign Up</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
							href="<c:url value="/member/updateMember.jsp"/>">Welcome, <%=sessionId%>!
						</a></li>
						<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
							href="<c:url value="/member/logoutMember.jsp"/>">Logout </a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="<c:url value="/BoardListAction.do?pageNum=1"/>">Community</a></li>
			</ul>
		</div>
	</div>
</nav>
