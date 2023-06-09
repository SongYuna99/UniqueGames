package com.uniquegames.dao;

import com.uniquegames.vo.GameVo;
import java.util.ArrayList;
import java.util.List;

import com.uniquegames.vo.MemberVo;
import org.springframework.stereotype.Repository;

@Repository
public class GameDao extends DBConn {
    /*private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;*/
    /**
     * SQL 쿼리
     * 삽입, 수정, 삭제, 조회, 전체 조회
     */
    private final String GAME_INSERT = "INSERT INTO GAME(NAME,IMAGE_PATH,GAME_GENRE,DONATION_STATUS,DESCRIPTION,LIKELIST) VALUES(?,?,?,?,?,0)";
    private final String GAME_UPDATE = "UPDATE GAME SET NAME=? WHERE ID=?";
    private final String GAME_DELETE = "DELETE GAME WHERE ID=?";
    private final String GAME_GET = "SELECT * FROM GAME WHERE ID=?";
    private final String GAME_LIST = "SELECT G.ID, G.NAME, G.IMAGE_PATH, G.GAME_GENRE, G.DONATION_STATUS, G.DESCRIPTION, L.LIKE_COUNT FROM GAME G"
            + " INNER JOIN (SELECT ID, LENGTH(LIKELIST) - LENGTH(REPLACE(LIKELIST, ',', '')) AS LIKE_COUNT FROM GAME) L ON G.ID = L.ID";
    private final String LIKE_GET = "SELECT COUNT(*) FROM GAME WHERE CONCAT(',', LIKELIST, ',') LIKE '%,?,%' AND ID = ?";
    private final String LIKE_ADD = "UPDATE GAME SET LIKELIST = CONCAT(IFNULL(LIKELIST, ''), ',?') WHERE ID = ?";
    private final String LIKE_DELETE = "SET @gameId = ?" +
            "SET @targetMid = '?'" +
            "UPDATE GAME SET LIKELIST = (CASE WHEN FIND_IN_SET(@targetMid, LIKELIST) > 0 THEN TRIM(BOTH ',' FROM REPLACE(CONCAT(',', LIKELIST, ','), CONCAT(',', @targetMid, ','), ','))" +
            "WHEN FIND_IN_SET(@targetMid, LIKELIST) = 1 THEN TRIM(BOTH ',' FROM REPLACE(CONCAT(@targetMid, ',', LIKELIST), CONCAT(@targetMid, ','), ''))" +
            "WHEN FIND_IN_SET(@targetMid, LIKELIST) = LENGTH(LIKELIST) - LENGTH(REPLACE(LIKELIST, ',', '')) + 1 THEN TRIM(BOTH ',' FROM REPLACE(CONCAT(LIKELIST, ',', @targetMid), CONCAT(',', @targetMid), ''))" +
            "ELSE LIKELIST END)WHERE ID = @gameId";
    private final String DONATION_LIST = "SELECT * FROM GAME WHERE DONATION_STATUS = 1";
    //    private final String RANKING_LIST = "SELECT @ROWNUM := IFNULL(@ROWNUM, 0) + 1 AS RNO, G.*, (SELECT LENGTH(LIKELIST) - LENGTH(REPLACE(LIKELIST, ',', '')) + 1 FROM GAME WHERE ID = G.ID) - 1 AS LIKE_COUNT" +
//            "FROM GAME G CROSS JOIN (SELECT @ROWNUM := 0) R ORDER BY LIKE_COUNT DESC";
    private final String RANKING_LIST = "SELECT G.ID, G.NAME, G.IMAGE_PATH, G.GAME_GENRE, G.DONATION_STATUS, G.DESCRIPTION, L.LIKE_COUNT FROM GAME G"
            + " INNER JOIN (SELECT ID, LENGTH(LIKELIST) - LENGTH(REPLACE(LIKELIST, ',', '')) + 1 AS LIKE_COUNT FROM GAME) L ON G.ID = L.ID ORDER BY LIKE_COUNT DESC";


    /*  private final String GAME_LIST_T = "SELECT * FROM GAME WHERE TITLE LIKE '%'||?||'%' order by seq desc";
      private final String GAME_LIST_C = "SELECT * FROM GAME WHERE CONTENT LIKE '%'||?||'%' order by seq desc";*/
    public ArrayList<GameVo> select_ranking() {
        ArrayList<GameVo> gameList = new ArrayList<GameVo>();
        try {
            pstmt = conn.prepareStatement(RANKING_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                GameVo game = new GameVo();
                game.setId(rs.getInt("ID"));
                game.setName(rs.getString("NAME"));
                game.setImage_path(rs.getString("IMAGE_PATH"));
                game.setGame_genre(rs.getString("GAME_GENRE"));
                game.setDonation_status(rs.getInt("DONATION_STATUS"));
                game.setDescription(rs.getString("DESCRIPTION"));
                gameList.add(game);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gameList;
    }

    public ArrayList<GameVo> select_donation() {
        ArrayList<GameVo> gameList = new ArrayList<GameVo>();
        try {
            pstmt = conn.prepareStatement(DONATION_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                GameVo game = new GameVo();
                game.setId(rs.getInt("ID"));
                game.setName(rs.getString("NAME"));
                game.setImage_path(rs.getString("IMAGE_PATH"));
                game.setGame_genre(rs.getString("GAME_GENRE"));
                game.setDonation_status(rs.getInt("DONATION_STATUS"));
                game.setDescription(rs.getString("DESCRIPTION"));
                gameList.add(game);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gameList;

    }

    public void insertGame(GameVo vo) {
        System.out.println("===> JDBC로 insertGame() 기능 처리");
        try {
            pstmt = conn.prepareStatement(GAME_INSERT);
            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getImage_path());
            pstmt.setString(3, vo.getGame_genre());
            pstmt.setInt(4, vo.getDonation_status());
            pstmt.setString(5, vo.getDescription());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
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
                game.setImage_path(rs.getString("GENRE"));
                game.setGame_genre(rs.getString("GAME_GENRE"));
                game.setDonation_status(rs.getInt("DONATION_STATUS"));
                game.setDescription(rs.getString("DESCRIPTION"));
            }
        } catch (Exception e) {
            e.printStackTrace();
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
                game.setImage_path(rs.getString("IMAGE_PATH"));
                game.setGame_genre(rs.getString("GAME_GENRE"));
                game.setDonation_status(rs.getInt("DONATION_STATUS"));
                game.setDescription(rs.getString("DESCRIPTION"));
                game.setLike_count(rs.getInt("LIKE_COUNT"));
                gameList.add(game);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gameList;
    }

    public int hasLiked(int gid, int mid) {
        int result = 0;
        try {
            pstmt = conn.prepareStatement(GAME_GET);
            pstmt.setInt(1, mid);
            pstmt.setInt(2, gid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    result = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public void removeLikeInfo(int gid, int mid) {
        System.out.println("===> JDBC로 LIKE_DELETE() 기능 처리");
        try {
            pstmt = conn.prepareStatement(LIKE_DELETE);
            pstmt.setInt(1, mid);
            pstmt.setInt(2, gid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addLikeInfo (int gid, int mid) {
        System.out.println("===> JDBC로 LIKE_UPDATE() 기능 처리");
        try {
            pstmt = conn.prepareStatement(LIKE_ADD);
            pstmt.setInt(1, mid);
            pstmt.setInt(2, gid);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
