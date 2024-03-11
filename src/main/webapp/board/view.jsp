<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="mvc.model.CommentDTO"%>

<%
BoardDTO notice = (BoardDTO) request.getAttribute("board");
List<CommentDTO> commentList = (List<CommentDTO>) request.getAttribute("commentlist");
int num = ((Integer) request.getAttribute("num")).intValue();
int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
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
<html>
<head>
<jsp:include page="/head.jsp" />
<link rel="stylesheet" href="./resources/css/styles.css" />
<title>Board</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<header class="masthead bg-secondary" style="background-image: url('./resources/images/home-bg.jpg');">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1 class="form-signin-heading ">Post</h1>
						<form name="newUpdate"
							action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
							class="form-signin subheading" method="post" enctype="multipart/form-data">
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Name</label> <input name="name"
									class="form-control" value="<%=notice.getName()%>">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Title</label> <input name="subject"
									class="form-control" value="<%=notice.getSubject()%>">
							</div>
							<%
							if (notice.getFileName() != null) {
							%>
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Image</label> <img name="image"
									src="/upload/<%=notice.getFileName()%>" style="width: 100%"></img>
							</div>
							<%
							}
							%>
							<div class="orm-group row m-3">
								<label class="col-sm-1 mb-2">Image</label> <input type="file"
									name="image" class="form-control">
							</div>
							<div class="form-group row m-3">
								<label class="col-sm-1 mb-2">Content</label>
								<textarea name="content" class="form-control" cols="50" rows="5"
									style="word-break: break-all;"><%=notice.getContent()%></textarea>
							</div>
							<div class="form-group row m-3">
								<div class="col-sm-offset-4 ">
									<c:set var="userId" value="<%=notice.getId()%>" />
									<c:if test="${sessionId==userId}">
										<input type="submit" class="btn btn-success" value="UPDATE">
										<a
											href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
											class="btn btn-danger" style="text-decoration: none;">
											DELETE</a>
									</c:if>
									<a href="./BoardListAction.do?pageNum=<%=nowpage%>"
										class="btn btn-primary" style="text-decoration: none;">
										LIST</a>
								</div>
							</div>
						</form>
						<h1 class="form-signin-heading mt-5">Comments</h1>
						<c:if test="${not empty resultSet.rows}">
							<c:forEach var="row" items="${resultSet.rows}">
								<div class="site-heading">
									<form name="newComment"
										action="CommentUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
										class="form-signin subheading" method="post">
										<input name="cid" type="hidden" class="form-control"
											value='${row.id }'> <input name="cname" type="hidden"
											class="form-control" value='${row.name }'>
										<c:if test="${sessionId!=null}">
											<div class="form-group row m-3">
												<label class="col-sm-1 mb-2">Comment</label> <input
													name="comment" class="form-control">
											</div>
											<div class="form-group row m-3">
												<div class="col-sm-offset-4 ">
													<input type="submit" class="btn btn-success"
														value="ADD COMMENT">
												</div>
											</div>
										</c:if>
									</form>
								</div>
							</c:forEach>
						</c:if>
						<table
							class="table table-hover table-light table-striped align-middle">
							<thead>
								<tr>
									<th>Names</th>
									<th>Comments</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<%
								for (CommentDTO comment : commentList) {
								%>
								<tr>
									<td><%=comment.getName()%></td>
									<td><%=comment.getContent()%></td>
									<td>
										<%
										if (sessionId != null && sessionId.equals(comment.getId())) {
										%> <a
										href="./CommentDeleteAction.do?cnum=<%=comment.getCNum()%>"
										class="btn btn-danger btn-sm">DELETE</a> <%
 }
 %>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</header>
	<jsp:include page="/footer.jsp" />
</body>
</html>