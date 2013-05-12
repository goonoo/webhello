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
public class BoardRemoveServlet extends HttpServlet{

    BoardRepository boardRepository = BoardMemoryRepository.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        //1. model에서 데이터 조회
        Board board = boardRepository.getBoard(id);

        //2. request에 데이터 셋팅
        request.setAttribute("board",board);

        //3. jsp찾아서 이동
        RequestDispatcher view = request.getRequestDispatcher("/board/boardRemove.jsp");
        view.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String pw = request.getParameter("pw");

        Board board = boardRepository.getBoard(id);
        if (board.getPw().equals(pw)) {
            boardRepository.removeBoard(board);
            response.sendRedirect("/board/list?result=Board+Removed.");
        } else {
            response.sendRedirect("/board/list?result=Board+did+not+removed.+Password+was+wrong.");
        }
    }
}
