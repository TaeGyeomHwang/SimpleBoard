<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
List boardList = (List) request.getAttribute("boardlist");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>

<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="./resources/css/styles.css" />
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>&pageNum=<%=pageNum%>"
	}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<header class="masthead bg-secondary" style="background-image: url('./resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>Simple Community.</h1>
						<form class="subheading"
							action="<c:url value="./BoardListAction.do"/>" method="post">
							<div style="padding-top: 50px">
								<table
									class="table table-hover  table-light table-striped align-middle">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성일</th>
											<th>조회</th>
											<th>글쓴이</th>
										</tr>
									</thead>
									<tbody class="table-group-divider">
										<%
										for (int j = 0; j < boardList.size(); j++) {
											BoardDTO notice = (BoardDTO) boardList.get(j);
										%>

										<tr>
											<td><%=notice.getNum()%></td>
											<td><a
												href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
											<td><%=notice.getRegist_day()%></td>
											<td><%=notice.getHit()%></td>
											<td><%=notice.getName()%></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
							<div align="center" class="mb-3">
								<c:set var="pageNum" value="<%=pageNum%>" />
								<c:forEach var="i" begin="1" end="<%=total_page%>">
									<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
										<c:choose>
											<c:when test="${pageNum==i}">
												<font color='#fff'><b> [${i}]</b></font>
											</c:when>
											<c:otherwise>
												<font color='#000'> [${i}]</font>

											</c:otherwise>
										</c:choose>
									</a>
								</c:forEach>
							</div>
							<div align="left">
								<table>
									<tr>
										<td width="100%" align="left">&nbsp;&nbsp; <select
											name="items" class="txt">
												<option value="subject">제목으로</option>
												<option value="content">본문으로</option>
												<option value="name">글쓴이로</option>
										</select> <input name="text" type="text" /> <input type="submit"
											id="btnAdd" class="btn btn-sm btn-primary mb-1"
											value="SEARCH" />
										</td>
										<td width="100%" align="right"><a href="#"
											onclick="checkForm(); return false;"
											class="btn btn-sm btn-primary mb-1 me-3">WRITE</a></td>
									</tr>
								</table>
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



