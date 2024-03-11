<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="./resources/css/styles.css" />
<title>Welcome</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<header class="masthead bg-secondary"
		style="background-image: url('./resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>Simple Community.</h1>
						<span class="subheading mt-5"><a
							class="btn btn-primary text-uppercase"
							href="/BlogPractice/BoardListAction.do?pageNum=1">Click here
								to start!</a></span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="/footer.jsp" />
</body>
</html>