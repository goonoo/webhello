package myboard.controller;

import myboard.entity.Board;
import myboard.repository.BoardMemoryRepository;
import myboard.repository.BoardRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * User: HolyEyE
 * Date: 13. 2. 22. Time: 오후 4:37
 */
public class BoardEditServlet extends HttpServlet{

    BoardRepository boardRepository = BoardMemoryRepository.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        //1. model에서 데이터 조회
        Board board = boardRepository.getBoard(id);

        //2. request에 데이터 셋팅
        request.setAttribute("board",board);

        //3. jsp찾아서 이동
        RequestDispatcher view = request.getRequestDispatcher("/board/boardEdit.jsp");
        view.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String writer = request.getParameter("writer");
        String pw = request.getParameter("pw");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Board board = boardRepository.getBoard(id);
        if (board.getPw().equals(pw)) {
            board.setWriter(writer);
            board.setPw(pw);
            board.setTitle(title);
            board.setContent(content);

            response.sendRedirect("/board/list?result=Board+Edited.");
        } else {
            response.sendRedirect("/board/list?result=Board+did+not+edited.+Password+was+wrong.");
        }

    }
}
