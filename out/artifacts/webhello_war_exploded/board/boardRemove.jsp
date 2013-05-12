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
    <title>Board Remove - <%= board.getTitle() %></title>
  </head>
  <body>
    <h1>Board Remove - <%= board.getTitle() %></h1>
    <form action="/board/remove" method="post">
        <input type="hidden" name="id" value="<%= board.getId() %>">
        <fieldset>
            <legend>글 삭제</legend>
            <p><label>비밀번호: <input type="password" name="pw" required></label>
                (글 등록 시 입력했던 비밀번호를 입력하세요.)</p>
        </fieldset>
        <div><button type="submit">삭제하기</button></div>
    </form>

    <p><a href="/board/list">목록으로 돌아가기</a></p>
  </body>
</html>