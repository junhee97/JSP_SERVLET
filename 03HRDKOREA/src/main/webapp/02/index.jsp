<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
:root {
	
}

* {
	box-sizing: border-box;
}

body {
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

.wrapper {
	
}

.wrapper>header {
	height: 80px;
}

.wrapper>nav {
	height: 50px;
}

.wrapper>main {
	height: calc(100vh - 80px - 50px - 80px);
	overflow : auto;
	background-color : lightgray;
}

.wrapper>main>h2 {
	text-align: center;
	font-size: 1.8rem;
	font-weight: 600;
}

.wrapper>main table {
	border: 1px solid;
	border-collapse: collapse;
	min-width: 500px;
	min-height: 200px;
	margin: 0 auto;
}

.wrapper>main table th, .wrapper>main table td {
	min-width: 80px !import;
	min-height: 25px !import;
	border: 1px solid;
	text-align : center;
}

.wrapper>main table td {
	text-align : left;
}

.wrapper>footer {
	height: 80px;
}
</style>

</head>
<body>

	<%@ page import="Utils.*,java.util.*"%>
	<%
		// 모든 회원정보 가져오기
		List<MemberDto2> member_list = DBUtils.getInstance().selectAllMember2();
	%>

	<div class="wrapper">
	
		<%@ include file = "/layouts/Header.jsp" %>
		<%@ include file = "/layouts/Nav.jsp" %>
		
		<main>
			<h2>수강신청</h2>
			<form name="regist_from" action="./create.jsp" method="post" >
				<table style="width: 600px;">
					<tr>
						<th>수강월</th>
						<td><input type="text" name="regist_month" />예) 2022년03월 -> 202203</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td>
							<select name="c_name" style="width : 177px; height : 21px;" >
								<option value="">회원명</option>
								<option value="10001">홍길동</option>
								<option value="10002">장발장</option>
								<option value="10003">임꺽정</option>
								<option value="20001">성춘향</option>
								<option value="20002">이몽룡</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="c_no" readonly style="background-color : #ededed;" />예) 10001</td>
					</tr>
					<tr>
						<th>강의장소</th>
						<td><input type="text" name="class_area" /></td>
					</tr>
					<tr>
						<th>강의명</th>
						<td>
							<select name="teacher_code" style="width : 177px; height : 21px;" >
								<option value="">강의신청</option>
								<option value="100">초급반</option>
								<option value="200">중급반</option>
								<option value="300">고급반</option>
								<option value="400">심화반</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수강료</th>
						<td><input type="text" name="tuition" readonly style="background-color : #ededed;" />원</td>
					</tr>
					<tr>
						<th colspan = 2>
							<button type="submit" onclick ="isValid(); return false;">수강신청</button>
							<button type="button" onclick="resetFunc();">다시쓰기</button>
						</th>
					</tr>
				</table>
			</form>
		</main>
				
		<%@ include file = "/layouts/Footer.jsp" %>
	
	</div>

	<script>
		function isValid () {
			if(form.regist_month.value === "") {
				alert('수강월을 입력하세요');
				form.regist_month.focus();
				return false;
			}
			if(form.c_name.value === "") {
				alert('회원명을 선택하세요');
				form.c_name.focus();
				return false;
			}
			if(form.class_area.value === "") {
				alert('강의 장소를 입력해주세요');
				form.class_area.focus();
				return false;
			}
			if(form.teacher_code.value === "") {
				alert('강의을 선택하세요');
				form.teacher_code.focus();
				return false;
			}
			isValid();
		}
		
		function resetFunc() {
			alert('모든 정보를 지우고 처음부터 다시 입력합니다!');
			form.reset();
		}
	
		const form = document.regist_from;
		form.c_name.addEventListener('change', function(e){
			form.tuition.value="";
			form.teacher_code.options[0].selected = true;
			form.c_no.value = form.c_name.value;
		})
		form.teacher_code.addEventListener('change', function(e){
			var price = form.teacher_code.value*1000;
			var c_no = form.c_no.value;
			if(c_no >= 20000)
				price*=0.5;
			form.tuition.value = price;
		})
	</script>

</body>
</html>