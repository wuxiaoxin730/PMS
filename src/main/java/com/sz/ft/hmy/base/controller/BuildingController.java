package com.sz.ft.hmy.base.controller;

import com.sz.ft.hmy.base.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BuildingController {
    @Autowired
    private IBuildingService buildingService;
}
