<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="myboard.entity.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
Board board = (Board) request.getAttribute("board");
%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Board View - <%= board.getTitle() %></title>
  </head>
  <body>
    <h1>View: <%= board.getTitle() %></h1>
    <p>작성자: <%= board.getWriter() %></p>
    <div><%= board.getContent() %></div>

    <p><a href="/board/list">목록으로 돌아가기</a></p>
  </body>
</html>