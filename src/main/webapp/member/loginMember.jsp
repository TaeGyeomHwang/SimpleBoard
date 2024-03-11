<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="../resources/css/styles.css" />
<title>Login</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<header class="masthead bg-secondary" style="background-image: url('../resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1 class="form-signin-heading ">Please sign in</h1>
						<%
						String error = request.getParameter("error");
						if (error != null) {
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해주세요");
							out.println("</div>");
						}
						%>
						<form class="form-signin subheading"
							action="processLoginMember.jsp" method="post">
							<div class="mb-3">
								<input type="text" class="form-control"
									placeholder="Enter ID..." name='id' required autofocus>
							</div>
							<div class="mb-3">
								<input type="password" class="form-control"
									placeholder="Enter Password..." name='password' required>
							</div>
							<button class="btn btn btn-lg btn-primary btn-block"
								type="submit">LOGIN</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="/footer.jsp" />
</body>
</html>