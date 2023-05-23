package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailController {
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String goDetail(){
        return "detail/detail";
    }
}
