package com.uniquegames.dao;

import com.uniquegames.vo.GameVo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class GameDao extends DBConn {
    /*private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;*/
    /**
    * SQL 쿼리
    * 삽입, 수정, 삭제, 조회, 전체 조회
    * */
    private final String GAME_INSERT = "INSERT INTO GAME(NAME,GENRE) VALUES(?,?)";
    private final String GAME_UPDATE = "UPDATE GAME SET NAME=? WHERE ID=?";
    private final String GAME_DELETE = "DELETE GAME WHERE ID=?";
    private final String GAME_GET = "SELECT * FROM GAME WHERE ID=?";
    private final String GAME_LIST = "SELECT * FROM GAME ORDER BY ID DESC";
  /*  private final String GAME_LIST_T = "SELECT * FROM GAME WHERE TITLE LIKE '%'||?||'%' order by seq desc";
    private final String GAME_LIST_C = "SELECT * FROM GAME WHERE CONTENT LIKE '%'||?||'%' order by seq desc";*/

    public void insertGame(GameVo vo) {
        System.out.println("===> JDBC로 insertGame() 기능 처리");
        try {
            pstmt = conn.prepareStatement(GAME_INSERT);
            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getImages());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void updateGame(GameVo vo) {
        System.out.println("===> JDBC로 updateGame() 기능 처리");
        try {
            pstmt = conn.prepareStatement(GAME_UPDATE);
            pstmt.setString(1, vo.getName());
            pstmt.setInt(2, vo.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void deleteGame(GameVo vo) {
        System.out.println("===> JDBC로 deleteGame() 기능 처리");
        try {
            pstmt = conn.prepareStatement(GAME_DELETE);
            pstmt.setInt(1, vo.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public GameVo getGame(int gameId) {
        System.out.println("===> JDBC로 getGame() 기능 처리");
        GameVo game = null;
        try {
            pstmt = conn.prepareStatement(GAME_GET);
            pstmt.setInt(1, gameId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                game = new GameVo();
                game.setId(rs.getInt("ID"));
                game.setName(rs.getString("NAME"));
                game.setLike_cnt(rs.getInt("LIKE_CNT"));
                game.setImages(rs.getString("GENRE"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return game;
    }

    public List<GameVo> getGameList() {
        System.out.println("===> JDBC로 getGameList() 기능 처리");
        List<GameVo> gameList = new ArrayList<>();
        try {
            /*if(vo.getSearchCondition().equals("TITLE")){
                pstmt = conn.prepareStatement(GAME_LIST_T);
            } else if (vo.getSearchCondition().equals("CONTENT")) {
                pstmt = conn.prepareStatement(GAME_LIST_C);
            }*/
            pstmt = conn.prepareStatement(GAME_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                GameVo game = new GameVo();
                game.setId(rs.getInt("ID"));
                game.setName(rs.getString("NAME"));
                game.setLike_cnt(rs.getInt("LIKE_CNT"));
                game.setImages(rs.getString("GENRE"));
                gameList.add(game);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return gameList;
    }
}
