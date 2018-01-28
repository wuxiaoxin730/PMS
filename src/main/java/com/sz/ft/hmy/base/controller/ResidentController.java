package com.sz.ft.hmy.base.controller;

import com.sz.ft.hmy.base.service.IResidentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ResidentController {
    @Autowired
    private IResidentService residentService;
}
