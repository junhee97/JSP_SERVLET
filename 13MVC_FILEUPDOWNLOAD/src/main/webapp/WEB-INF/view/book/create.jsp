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
			<h1>BOOK CREATE</h1>
			<form action="${pageContext.request.contextPath}/book/create" method="post">
				<div>
					<label for="">bookCode : </label><span>${bookCode}</span><br/>
					<input name="bookCode" placeHolder="bookCode"><br/>
				</div>
				<div>
					<label for="">bookName : </label><span>${bookName}</span><br/>
					<input name="bookName" placeHolder="bookName"><br/>
				</div>
				<div>
					<label for="">publisher : </label><span>${publisher}</span><br/>
					<input name="publisher" placeHolder="publisher"><br/>
				</div>
				<div>
					<label for="">isbn : </label><span>${isbn}</span><br/>
					<input name="isbn" placeHolder="isbn"><br/>
				</div>
				<div>
					<button>등록</button>
				</div>
			</form>
	
		</main>
		
		
		<!-- footer -->
		<%@include file="/resources/layouts/footer.jsp" %>
	</div>

	
</body>
</html>







