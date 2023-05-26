package com.uniquegames.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameVo {
    private int id;
    private String name = "";
    private int like_cnt;
    private String images = "";
}
