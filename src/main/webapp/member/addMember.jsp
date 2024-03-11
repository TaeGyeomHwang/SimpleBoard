<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="../resources/css/styles.css" />
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<header class="masthead bg-secondary" style="background-image: url('../resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1 class="form-signin-heading ">Sign up</h1>
						<form name="newMember" class="form-signin subheading"
							action="processAddMember.jsp" method="post"
							onsubmit="return checkForm()">
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">ID</label> <input name="id" type="text"
									class="form-control" placeholder="id">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">PW</label>
									<input name="password" type="text" class="form-control"
										placeholder="password">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-4 mb-2 text-start">PW confirm</label> <input
									name="password_confirm" type="text" class="form-control"
									placeholder="password confirm">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-2 mb-2">Name</label>
									<input name="name" type="text" class="form-control"
										placeholder="name">
							</div>
							<div class="form-group row m-3">
								<div class="col-sm-offset-4">
									<input type="submit" class="btn btn-primary" value="SIGN UP">
									<input type="reset" class="btn btn-danger" value="RESET"
										onclick="reset()">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="/footer.jsp" />
</body>
</html>