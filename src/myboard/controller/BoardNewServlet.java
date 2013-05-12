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
public class BoardNewServlet extends HttpServlet{

    BoardRepository boardRepository = BoardMemoryRepository.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // jsp찾아서 이동
        RequestDispatcher view = request.getRequestDispatcher("/board/boardNew.jsp");
        view.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String writer = request.getParameter("writer");
        String pw = request.getParameter("pw");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Board board = new Board();
        board.setWriter(writer);
        board.setPw(pw);
        board.setTitle(title);
        board.setContent(content);

        boardRepository.addBoard(board);

        response.sendRedirect("/board/list?result=Board+Added.");
    }
}
