package org.example.ws242.controller;


import org.example.ws242.service.ItemService;
import org.example.ws242.service.SubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    @Autowired
    private ItemService itemService;
    @Autowired
    private SubscribeService subscribeService;

    @RequestMapping("/")
    public String home() {
        return "index";
    }
    @RequestMapping("/home")
    public String homepage() {
        return "main";
    }
    @RequestMapping("/mypage")
    public String mypage() {
        return "home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("itemlist", itemService.getItemList());
        model.addAttribute("subscribelist", subscribeService.getSubscribeList());
        return "main";
    }
}