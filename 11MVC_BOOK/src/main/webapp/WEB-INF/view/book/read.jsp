<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- link -->
	<%@include file="/resources/layouts/link.jsp" %>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="wrapper">
		<header>
			<!-- topHeader -->
			<%@include file="/resources/layouts/topHeader.jsp" %>
			<!-- nav -->
			<%@include file="/resources/layouts/nav.jsp" %>
		</header>
		<main  class="layout">
			<h1>BOOK READ</h1>
			<form action="${pageContext.request.contextPath}/book/update" method="post">
				<div>
					<label for="">bookCode : </label><span>${bookCode}</span><br/>
					<input name="bookCode" placeHolder="bookCode" value="${bookDto.bookCode}" readonly ><br/>
				</div>
				<div>
					<label for="">bookName : </label><span>${bookName}</span><br/>
					<input name="bookName" placeHolder="bookName" value="${bookDto.bookName}"><br/>
				</div>
				<div>
					<label for="">publisher : </label><span>${publisher}</span><br/>
					<input name="publisher" placeHolder="publisher" value="${bookDto.publisher}"><br/>
				</div>
				<div>
					<label for="">isbn : </label><span>${isbn}</span><br/>
					<input name="isbn" placeHolder="isbn" value="${bookDto.isbn}"><br/>
				</div>
				<input type="hidden" name="pageno" value="${pageno}" />
				<div>
					<button>수정</button>
					<a href="${pageContext.request.contextPath}/book/delete?bookCode=${bookDto.bookCode}&pageno=${pageno}">삭제</a>
				</div>
			</form>
			<div>
				${message}
			</div>
		</main>
		
		
		<!-- footer -->
		<%@include file="/resources/layouts/footer.jsp" %>
	</div>

	
</body>
</html>







