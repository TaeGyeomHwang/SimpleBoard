<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="../resources/css/styles.css" />
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<header class="masthead bg-secondary" style="background-image: url('../resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading" align="center">
						<%
						String msg = request.getParameter("msg");

						if (msg != null) {
							if (msg.equals("0")) {
								out.println(" <h2 class='alert alert-danger'>Update compelete!</h2>");
						%>
						<span class="subheading mt-5"><a
							class="btn btn-primary text-uppercase"
							href="/BlogPractice/member/loginMember.jsp">Click here
								to login!</a></span>
						<%
						} else if (msg.equals("1")) {
						out.println("<h2 class='alert alert-danger'>Succeed to Sign up!</h2>");
						%>
						<span class="subheading mt-5"><a
							class="btn btn-primary text-uppercase"
							href="/BlogPractice/member/loginMember.jsp">Click here
								to login!</a></span>
						<%
						} else if (msg.equals("2")) {
						String loginId = (String) session.getAttribute("sessionId");
						out.println(" <h2 class='alert alert-danger'>Welcome, " + loginId + "!</h2>");
						%>
						<span class="subheading mt-5"><a
							class="btn btn-primary text-uppercase"
							href="/BlogPractice/BoardListAction.do?pageNum=1">Click here
								to start!</a></span>
						<%
						}
						} else {
						out.println("<h2 class='alert alert-danger'>Delete complete!</h2>");
						%>
						<span class="subheading mt-5"><a
							class="btn btn-primary text-uppercase"
							href="/BlogPractice/BoardListAction.do?pageNum=1">Click here
								to start!</a></span>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="/footer.jsp" />
</body>
</html>