package com.sz.ft.hmy.biz.controller;

import com.sz.ft.hmy.biz.service.IParkingRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ParkingRegistrationCtrl {
    @Autowired
    private IParkingRegistrationService parkingRegistrationService;
}
