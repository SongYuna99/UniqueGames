package com.uniquegames.dao;

import com.uniquegames.vo.IntroVo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class IntroDao extends DBConn {
    /*private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;*/
    /**
    * SQL 쿼리
    * 삽입, 수정, 삭제, 조회, 전체 조회
    * */
    private final String INTRO_INSERT = "INSERT INTO INTRO(NAME,TITLE,CONTENT) VALUES(?,?,?)";
    private final String INTRO_UPDATE = "UPDATE INTRO SET NAME=? WHERE ID=?";
    private final String INTRO_DELETE = "DELETE INTRO WHERE ID=?";
    private final String INTRO_GET = "SELECT * FROM INTRO WHERE ID=?";
    private final String INTRO_LIST = "SELECT * FROM INTRO ORDER BY ID DESC";
  /*  private final String INTRO_LIST_T = "SELECT * FROM INTRO WHERE TITLE LIKE '%'||?||'%' order by seq desc";
    private final String INTRO_LIST_C = "SELECT * FROM INTRO WHERE CONTENT LIKE '%'||?||'%' order by seq desc";*/

    public void insertIntro(IntroVo vo) {
        try {
            pstmt = conn.prepareStatement(INTRO_INSERT);
            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(2, vo.getContent());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void updateIntro(IntroVo vo) {
        try {
            pstmt = conn.prepareStatement(INTRO_UPDATE);
            pstmt.setString(1, vo.getName());
            pstmt.setInt(2, vo.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void deleteIntro(IntroVo vo) {
        try {
            pstmt = conn.prepareStatement(INTRO_DELETE);
            pstmt.setInt(1, vo.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public IntroVo getIntro(int introId) {
        System.out.println("===> JDBC로 getGame() 기능 처리");
        IntroVo intro = null;
        try {
            pstmt = conn.prepareStatement(INTRO_GET);
            pstmt.setInt(1, introId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                intro = new IntroVo();
                intro.setId(rs.getInt("ID"));
                intro.setName(rs.getString("NAME"));
                intro.setTitle(rs.getString("TITLE"));
                intro.setContent(rs.getString("CONTENT"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return intro;
    }

    public List<IntroVo> getGameList() {
        System.out.println("===> JDBC로 getGameList() 기능 처리");
        List<IntroVo> gameList = new ArrayList<>();
        try {
            /*if(vo.getSearchCondition().equals("TITLE")){
                pstmt = conn.prepareStatement(INTRO_LIST_T);
            } else if (vo.getSearchCondition().equals("CONTENT")) {
                pstmt = conn.prepareStatement(INTRO_LIST_C);
            }*/
            pstmt = conn.prepareStatement(INTRO_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                IntroVo intro = new IntroVo();
                intro.setId(rs.getInt("ID"));
                intro.setName(rs.getString("NAME"));
                intro.setTitle(rs.getString("TITLE"));
                intro.setContent(rs.getString("CONTENT"));
                gameList.add(intro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return gameList;
    }
}
