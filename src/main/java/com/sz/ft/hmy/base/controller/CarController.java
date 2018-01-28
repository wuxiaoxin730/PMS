package com.sz.ft.hmy.base.controller;

import com.sz.ft.hmy.base.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CarController {
    @Autowired
    private ICarService carService;
}
