package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.example.ws242.service.SubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/subscribe")
public class SubscribeController {
    @Autowired
    private SubscribeService subscribeService;

}