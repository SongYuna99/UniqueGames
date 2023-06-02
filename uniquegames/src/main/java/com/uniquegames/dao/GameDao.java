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
    private final String GAME_INSERT = "INSERT INTO GAME(NAME,IMAGE_PATH,GAME_GENRE,DONATION_STATUS,DESCRIPTION) VALUES(?,?,?,?,?)";
    private final String GAME_UPDATE = "UPDATE GAME SET NAME=? WHERE ID=?";
    private final String GAME_DELETE = "DELETE GAME WHERE ID=?";
    private final String GAME_GET = "SELECT * FROM GAME WHERE ID=?";
    private final String GAME_LIST = "SELECT * FROM GAME ORDER BY ID DESC";
    private final String LIKE_LIST = "SELECT COUNT(*) FROM LIKE_INFO WHERE G_ID=?";
    private final String LIKE_ADD = "UPDATE GAME G set G.LIKE_COUNT = (SELECT COUNT(*) FROM LIKE_INFO L WHERE L.G_ID = G.ID)";
    private final String DONATION_LIST = "SELECT * FROM GAME WHERE DONATION_STATUS = 1";
    private final String RANKING_LIST = "SELECT @ROWNUM:= @ROWNUM + 1 AS RNO, G.*, COUNT(L.ID) AS LIKE_COUNT FROM GAME G LEFT JOIN LIKE_INFO L ON G.ID = L.G_ID GROUP BY G.ID ORDER BY LIKE_COUNT DESC";
    
  /*  private final String GAME_LIST_T = "SELECT * FROM GAME WHERE TITLE LIKE '%'||?||'%' order by seq desc";
    private final String GAME_LIST_C = "SELECT * FROM GAME WHERE CONTENT LIKE '%'||?||'%' order by seq desc";*/
    public ArrayList<GameVo> select_ranking() {
    	ArrayList<GameVo> gameList = new ArrayList<GameVo>();
    	try {
    		pstmt = conn.prepareStatement(RANKING_LIST);
	 		rs = pstmt.executeQuery();
            while (rs.next()) {
                GameVo game = new GameVo();
                game.setRno(rs.getInt("RNO"));
                game.setId(rs.getInt("ID"));
                game.setName(rs.getString("NAME"));
                game.setImage_path(rs.getString("IMAGE_PATH"));
                game.setGame_genre(rs.getString("GAME_GENRE"));
                game.setDonation_status(rs.getInt("DONATION_STATUS"));
                game.setDescription(rs.getString("DESCRIPTION"));
                game.setLike_count(rs.getInt("LIKE_COUNT"));
                gameList.add(game);
            }
    	}catch(Exception e) {
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
                game.setLike_count(rs.getInt("LIKE_COUNT"));
                gameList.add(game);
            }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
        return gameList;
    	
    }
    public int select_like(int gid) {
    	int count = 0;
    	try {
    		pstmt = conn.prepareStatement(LIKE_LIST);
    		pstmt.setInt(1, gid);
	 		rs = pstmt.executeQuery();
	 		if (rs.next()) {
	 			count = rs.getInt(1);
	 		}
    		 
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
        return count;
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
                gameList.add(game);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gameList;
    }
}
