package org.example.ws242.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {
        return "index";
    }
    @RequestMapping("/home")
    public String homepage() {
        return "main";
    }
}