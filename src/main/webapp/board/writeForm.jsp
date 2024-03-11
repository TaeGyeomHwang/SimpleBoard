<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String name = (String) request.getAttribute("name");
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
%>
<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="./resources/css/styles.css" />
<title>Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
<body>
	<jsp:include page="../menu.jsp" />
	<header class="masthead bg-secondary" style="background-image: url('./resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1 class="form-signin-heading ">Write</h1>
						<form name="newWrite" action="./BoardWriteAction.do"
							class="form-signin subheading" method="post"
							enctype="multipart/form-data" onsubmit="return checkForm()">
							<input name="id" type="hidden" class="form-control"
								value="${sessionId}">
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Name</label> <input name="name"
									type="text" class="form-control" value="<%=name%>"
									placeholder="name">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Title</label> <input name="subject"
									type="text" class="form-control" placeholder="title">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Content</label>
								<textarea name="content" cols="50" rows="5" class="form-control"
									placeholder="content"></textarea>
							</div>
							<div class="orm-group row m-3">
								<label class="col-sm-1 mb-2">Image</label> <input type="file"
									name="image" class="form-control">
							</div>
							<div class="form-group row m-3">
								<div class="col-sm-offset-4">
									<input type="submit" class="btn btn-success " value="SUBMIT">
									<input type="reset" class="btn btn-danger " value="RESET">
									<a href="./BoardListAction.do?pageNum=<%=pageNum%>"
										class="btn btn-primary"> LIST</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="../footer.jsp" />
</body>
</html>



