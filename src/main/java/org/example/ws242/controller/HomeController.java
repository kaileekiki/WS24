package org.example.ws242.controller;

import org.example.ws242.service.*;
import org.example.ws242.vo.JoinedItemVO;
import org.example.ws242.vo.JoinedSubVO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private ItemService itemService;
    @Autowired
    private SubscribeService subscribeService;
    @Autowired
    private UserService userService;
    @Autowired
    private JoinedItemService joinedItemService;

    @Autowired
    private JoinedSubscribeService joinedSubscribeService;

    @RequestMapping("/")
    public String home() {
        return "redirect:/home";
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

    @GetMapping("/wishlist")
    public String getWishlist(Model model, @SessionAttribute(value = "login", required = false) UserVO loggedInUser) {
        // 예시 사용자 ID로 데이터 가져오기 (실제 구현 시 사용자 ID를 동적으로 받아와야 함)
        String userId = "testuser";

        List<JoinedItemVO> joinedItems = joinedItemService.getJoinedItemsByUserId(loggedInUser.getUserid());
        List<JoinedSubVO> joinedSubs = joinedSubscribeService.getAllJoinedSubscribes(loggedInUser.getUserid());
        // 모델에 데이터를 추가
        model.addAttribute("joinedItems", joinedItems);
        model.addAttribute("joinedSubs", joinedSubs);


        // JSP 페이지 반환
        return "wishlist";
    }
}
