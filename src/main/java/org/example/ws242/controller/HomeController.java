package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.example.ws242.service.SubscribeService;
import org.example.ws242.service.UserService;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    private ItemService itemService;
    @Autowired
    private SubscribeService subscribeService;
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String home() {
        return "main";
    }

    @RequestMapping("/home")
    public String homepage() {
        return "main";
    }

    @RequestMapping("/mypage")
    public String mypage(@SessionAttribute(value = "login", required = false) UserVO loggedInUser, Model model) {
        if (loggedInUser == null) {
            // 로그인이 안 된 경우 처리
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }

        model.addAttribute("userDetails", userService.getUserDetails(loggedInUser.getUserid()));
        model.addAttribute("userItems", itemService.getItemsByUserId(loggedInUser.getUserid()));
        model.addAttribute("userSubscribes", subscribeService.getSubscribesByUserId(loggedInUser.getUserid()));

        return "home"; // This should be the name of your JSP file.
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("itemlist", itemService.getItemList());
        model.addAttribute("subscribelist", subscribeService.getSubscribeList());
        return "main";
    }
}
