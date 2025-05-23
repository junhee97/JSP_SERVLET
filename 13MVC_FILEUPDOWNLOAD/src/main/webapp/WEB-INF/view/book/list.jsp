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
	<%
		PageDto pageDto = request.getAttribute("pageDto") != null ? (PageDto) request.getAttribute("pageDto") : null;
		String type = null;
		String keyword = null;
		if(pageDto != null) {
			type = pageDto.getCriteria().getType();
			keyword = pageDto.getCriteria().getKeyword();			
		}
	%>
	<div class="wrapper">
		<header>
			<!-- topHeader -->
			<%@include file="/resources/layouts/topHeader.jsp" %>
			<!-- nav -->
			<%@include file="/resources/layouts/nav.jsp" %>
		</header>
		<main  class="layout">
			<h1>BOOK LIST</h1>
			<!-- 게시물 필터처리(전체/이름/출판사/ISBN) -->
			<section>
			
			</section>
			
			<!-- 게시물 표시 -->
			<section>
				<div>
					TOTAL : <%=pageDto.getTotalCount()%> <br>
					PAGE : <span><%=pageDto.getCriteria().getPageno()%></span> / <span><%=pageDto.getTotalpage()%></span> (현재페이지 / 전체페이지)
				</div>
				<table class="table">
					<thead>
						<tr>
							<th class="bg-dark text-light">도서코드</th>
							<th class="bg-dark text-light">도서명</th>
							<th class="bg-dark text-light">출판사</th>
							<th class="bg-dark text-light">ISBN</th>
						</tr>			
					</thead>
					<tbody>
						<%@ page import = "java.util.*, Domain.Dto.*" %>
						<%
							List<BookDto> list = request.getAttribute("list") != null ? (List<BookDto>) request.getAttribute("list") : null;
							if (list == null)
								out.println("<td colspan=4>조회할 데이터가 없습니다.</td>");
							else {
								for(BookDto book : list) {
						%>
									<tr>
										<td><%=book.getBookCode()%></td>
										<td><a href="${pageContext.request.contextPath}/book/read?bookCode=<%=book.getBookCode()%>&pageno=<%=pageDto.getCriteria().getPageno()%>"><%=book.getBookName()%></a></td>
										<td><%=book.getPublisher()%></td>
										<td><%=book.getIsbn()%></td>
									</tr>								
						<%
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan=3>
								<nav aria-label="Page navigation example">
								  <ul class="pagination">
								    <%-- <%
								    	PageDto pageDto = request.getAttribute("pageDto") != null ? (PageDto) request.getAttribute("pageDto") : null;
								    %> --%>
								    <%
								    	if(pageDto != null && pageDto.isPrev()) {
								    %>
									  <!-- 이전버튼 -->
									    <li class="page-item">
									      <a class="page-link" href="${pageContext.request.contextPath}/book/list?pageno=<%=pageDto.getStartPage()-pageDto.getPagePerBlock()%>" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
								    <%
								    	}
								    %>
								    
								    <%
								    	if(pageDto != null) {
								    		int startNo = pageDto.getStartPage();
								    		int endNo = pageDto.getEndPage();
								    		for(int i=startNo; i<=endNo;i++) {
								    			if(type == null || type.isEmpty()) {
								    %>
								    
									    			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/book/list?pageno=<%=i%>"><%=i%></a></li>
								    
								    <%
								    			} else {
								    %>
								    
									    			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/book/list?pageno=<%=i%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a></li>
								    
								    <%				
								    			}
								    		}
								    	}
								    %>
								    
								    
								    <%
								    	if(pageDto != null && pageDto.isNext()) {
								    %>
									    <!-- 이후버튼 -->
									    <li class="page-item">
									      <a class="page-link" href="${pageContext.request.contextPath}/book/list?pageno=<%=pageDto.getEndPage()+1%>" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
								    <%
								    	}
								    %>
								    
								  </ul>
								</nav>
							</td>
							<td>
								<!-- 글쓰기 -->
								<a href="${pageContext.request.contextPath}/book/create" class="btn btn-success">도서등록</a>
								<!-- 처음으로 -->
								<a href="javascript:void(0)" class="btn btn-secondary">처음으로</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</section>
	
		</main>
		
		
		<!-- footer -->
		<%@include file="/resources/layouts/footer.jsp" %>
	</div>

	
</body>
</html>







