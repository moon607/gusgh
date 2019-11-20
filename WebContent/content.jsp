<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시 글 읽기</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		try{
			BoardDBBean dbPro = BoardDBBean.getInstance();
			BoardDataBean article = dbPro.getArticle(num);
			int ref = article.getRef();
			int reStep = article.getReStep();
			int reLevel = article.getReLevel();
	%>
	<p>글 내용 보기</p>
	<form>
	<table>
			<tr>
				<td align="center" bgcolor="<%= value_c %>">
					글 번호
				</td>
				<td align="center"><%= article.getNum() %>
				</td>
				<td align="center" bgcolor="<%= value_c %>">
					조회수
				</td>
				<td><%= article.getNum() %>
				</td>	
			</tr>
			
			<tr>
				<td bgcolor="<%= value_c %>">
					작성자
				</td>
				<td align="center"><%= article.getWriter() %>
				</td>
				<td align="center" bgcolor="<%= value_c %>">
					작성일
				</td>
				<td><%= sdf.format(article.getRegDate()) %>
				</td>	
			</tr>
			
			<tr>
				<td bgcolor="<%= value_c %>">제 목</td>
				<td align="center" colspan="3"><%= article.getSubject() %>
				</td>
			</tr>
			
			<tr>
				<td bgcolor="<%= value_c %>">내 용</td>
				<td align="center" colspan="3">
					<pre><%= article.getContent() %></pre>
				</td>
			</tr>
			
			<tr>
				<td colspan="4" bgcolor="<%= value_c %>">
					<input type="button" value="수정" 
					onclick="doucment.location.href='updateForm.jsp?num=<%= article.getNum() %>'">
					<input type="button" value="삭제" 
					onclick="doucment.location.href='deleteForm.jsp?num=<%= article.getNum() %>'">
					<input type="button" value="답글" 
					onclick="doucment.location.href='writeForm.jsp?num=<%= article.getNum() %>&ref=<%= ref %>
					&reStep<%= reStep %>&reLevel<%= reLevel %>'">
					<input type="button" value="목록" 
					onclick="doucment.location.href='list.jsp?pageNum=<%= pageNum %>'">
				</td>
			</tr>
		</table>
		
	
	
	
	</form>
	<%
		}
		catch(Exception e){
			
		}
	%>
	
	
</body>
</html>