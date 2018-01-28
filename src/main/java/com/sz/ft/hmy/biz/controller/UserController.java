package com.sz.ft.hmy.biz.controller;

import com.sz.ft.hmy.biz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
    @Autowired
    private IUserService userService;
}
