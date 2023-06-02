package com.uniquegames.dao;

import org.springframework.stereotype.Repository;

@Repository
public class LikeInfoDao extends DBConn {
	public void addLikeInfo(int mid, int gid) {
		String sql = " INSERT INTO LIKE_INFO (M_ID, G_ID) VALUES (?, ?) ";
		getPreparedStatement(sql);
        try {
        	pstmt.setInt(1, mid);
        	pstmt.setInt(2, gid);
        	pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 좋아요 정보 삭제
    public void removeLikeInfo(int mid, int gid) {
    	String sql = " DELETE FROM LIKE_INFO WHERE M_ID = ? AND G_ID = ? ";
    	getPreparedStatement(sql);
        try {
        	pstmt.setInt(1, mid);
        	pstmt.setInt(2, gid);
        	pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // 해당 회원이 해당 게임에 좋아요를 눌렀는지 확인
    public boolean hasLiked(int mid, int gid) {
        String sql = "SELECT COUNT(*) FROM LIKE_INFO WHERE M_ID = ? AND G_ID = ?";
        getPreparedStatement(sql);
        try {
            pstmt.setInt(1, mid);
            pstmt.setInt(2, gid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return false;
    }
}
