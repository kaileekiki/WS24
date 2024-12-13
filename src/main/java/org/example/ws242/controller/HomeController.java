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
        return "index";
    }

    @RequestMapping("/home")
    public String homepage() {
        return "main";
    }

    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        UserVO loginUser = (UserVO) session.getAttribute("login");
        if (loginUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("userDetails", userService.getUserDetails(loginUser.getUserid()));
        model.addAttribute("userItems", itemService.getItemsByUserId(loginUser.getUserid()));
        model.addAttribute("userSubscribes", subscribeService.getSubscribesByUserId(loginUser.getUserid()));

        return "home"; // This should be the name of your JSP file.
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("itemlist", itemService.getItemList());
        model.addAttribute("subscribelist", subscribeService.getSubscribeList());
        return "main";
    }
}
