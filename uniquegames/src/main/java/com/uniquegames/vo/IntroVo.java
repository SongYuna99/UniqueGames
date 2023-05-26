package com.uniquegames.vo;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;


//VO(Value Object)
@Getter
@Setter
@ToString
public class IntroVo {
    /**
     * 회사(팀) 소개글 저장 객체
     * id 식별자
     * name 회사(팀) 이름
     * title 회사(팀) 소개글 제목
     * content 회사(팀) 소개글 내용
     * uploadFile 대표 이미지
     */
    private int id;
    private String name;
    private String title;
    private String content;
    private MultipartFile uploadFile;
}