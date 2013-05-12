package myboard.repository;

import myboard.entity.Board;

import java.util.List;

/**
 * User: HolyEyE
 * Date: 13. 2. 27. Time: 오후 5:22
 */
public interface BoardRepository {

    List<Board> getBoards();

    Board getBoard(int id);

    void addBoard(Board board);
    void removeBoard(Board board);
}
