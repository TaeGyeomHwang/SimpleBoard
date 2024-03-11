<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="../resources/css/styles.css" />
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BlogPracticeDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>
<title>회원 수정</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<header class="masthead bg-secondary"
		style="background-image: url('../resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1 class="form-signin-heading ">Edit UserInfo</h1>
						<c:forEach var="row" items="${resultSet.rows}">
							<form name="newMember" class="form-signin subheading"
								action="processUpdateMember.jsp" method="post"
								onsubmit="return checkForm()">
								<div class="form-group row m-3">
									<label class="col-sm-1 mb-2">ID</label> <input name="id"
										type="text" class="form-control" placeholder="id"
										value="<c:out value='${row.id }'/>" />
								</div>
								<div class="form-group row m-3">
									<label class="col-sm-1 mb-2">PW</label> <input name="password"
										type="text" class="form-control" placeholder="password"
										value="<c:out value='${row.password }'/>">
								</div>
								<div class="form-group row m-3">
									<label class="col-sm-4 mb-2 text-start">PW confirm</label> <input
										name="password_confirm" type="text" class="form-control"
										placeholder="password_confirm">
								</div>
								<div class="form-group row m-3">
									<label class="col-sm-2 mb-2">Name</label> <input name="name"
										type="text" class="form-control" placeholder="name"
										value="<c:out value='${row.name }'/>">
								</div>
								<div class="form-group row m-3">
									<div class="col-sm-offset-4">
										<input type="submit" class="btn btn-success" value="UPDATE">
										<a href="deleteMember.jsp" class="btn btn-danger">RESIGN</a>
									</div>
								</div>
							</form>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="/footer.jsp" />
</body>
</html>
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