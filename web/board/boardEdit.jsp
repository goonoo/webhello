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
    <title>Board Edit - <%= board.getTitle() %></title>
  </head>
  <body>
    <h1>Board Edit - <%= board.getTitle() %></h1>
    <form action="/board/edit" method="post">
        <input type="hidden" name="id" value="<%= board.getId() %>">
        <fieldset>
            <legend>글 내용 수정</legend>
            <p><label>작성자명: <input type="text" name="writer" value="<%= board.getWriter() %>" required></label></p>
            <p><label>비밀번호: <input type="password" name="pw" required></label>
                (글 등록 시 입력했던 비밀번호를 입력하세요.)</p>
            <p><label>제목: <input type="text" name="title" value="<%= board.getTitle() %>" required></label></p>
            <p><label>내용: <textarea name="content" rows="10" cols="50" required><%= board.getContent() %></textarea></label></p>
        </fieldset>
        <div><button type="submit">수정하기</button></div>
    </form>

    <p><a href="/board/list">목록으로 돌아가기</a></p>
  </body>
</html>