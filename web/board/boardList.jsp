<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="myboard.entity.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Board List</title>
</head>
<body>
    <%
    String result = request.getParameter("result");
    if (result != null) {
        %><p><%= result %></p><%
    }
    %>

    <h1>Board List</h1>
    <table border="1">
        <tr>
            <th scope="col">title</th>
            <th scope="col">writer</th>
            <th scope="col">pw</th>
            <th scope="col">functions</th>
        </tr>
        <%

        List<Board> boards = (List<Board>) request.getAttribute("boards");

        for (Board board : boards) {
        %><tr><%
            out.write("<td><a href='/board/view?id="+ board.getId() +"'>"+board.getTitle()+"</a></td>\n");
            out.write("<td>"+board.getWriter()+"</td>\n");
            out.write("<td>"+board.getPw()+"</td>\n");
            out.write("<td><a href='/board/edit?id="+ board.getId() +"'>수정</a> <a href='/board/remove?id="+ board.getId() +"'>삭제</a></td>\n");
        %></tr><%
        }
        %>
    </table>

  <p><a href="/board/new">등록</a></p>
</body>
</html>