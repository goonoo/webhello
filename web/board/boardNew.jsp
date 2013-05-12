<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="myboard.entity.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Board New</title>
  </head>
  <body>
    <h1>Board New</h1>
    <form action="/board/new" method="post">
        <fieldset>
            <legend>글 내용 입력</legend>
            <p><label>작성자명: <input type="text" name="writer" required></label></p>
            <p><label>비밀번호: <input type="password" name="pw" required></label></p>
            <p><label>제목: <input type="text" name="title" required></label></p>
            <p><label>내용: <textarea name="content" rows="10" cols="50" required></textarea></label></p>
        </fieldset>
        <div><button type="submit">등록하기</button></div>
    </form>

    <p><a href="/board/list">목록으로 돌아가기</a></p>
  </body>
</html>