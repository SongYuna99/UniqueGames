package com.uniquegames.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.uniquegames.vo.CommentVo;

@Repository
public interface CommentMapper {

	@Select("SELECT	* FROM COMMENT WHERE POST_ID = #{no} ORDER BY COMMENT_DATE ASC")
	public List<CommentVo> selectComment(String no);

	@Insert("INSERT INTO COMMENT (POST_ID, MEMBER_ID, COMMENT_CONTENT)"
			+ " VALUES (#{post_id}, #{member_id}, #{comment_content})")
	public int insertComment(CommentVo commentVo);

	@Delete("DELETE FROM COMMENT WHERE COMMENT_ID = #{no}")
	public int deleteComment(String no);

}
