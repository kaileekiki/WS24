package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.example.ws242.service.JoinedItemService;
import org.example.ws242.service.JoinedSubscribeService;
import org.example.ws242.service.SubscribeService;
import org.example.ws242.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.Objects;

@Controller
@RequestMapping(value = "/joinsubs")
public class JoinedSubsController {

    @Autowired
    private SubscribeService subscribeService;

    @Autowired
    private JoinedSubscribeService joinedSubscribeService;

    @PostMapping("/add")
    public String addJoinSubscribe(@RequestParam("subsId") int subsId,
                              @SessionAttribute(value = "login", required = false) UserVO loggedInUser, Model model) {
        if (loggedInUser == null) {
            // 로그인하지 않은 경우
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }
        // 아이템 정보 조회
        SubscribeVO subs = subscribeService.getSubscribeById(subsId);
        if (subs == null) {
            System.out.println("존재하지 않는 상품입니다.");

            return "redirect:/subscribe/list";
        }

        if (Objects.equals(subs.getUserVO().getUserid(), loggedInUser.getUserid())) {
            System.out.println("자신의 상품은 찜할 수 없습니다.");
            model.addAttribute("errorMessage", "자신의 상품은 찜할 수 없습니다.");
            return "redirect:/subscribe/view?id=" + subs.getId();
        }

        //중복신청 회피
        JoinedSubVO tryfirst =  joinedSubscribeService.getJoinSubscribeById(loggedInUser.getUserid(),subsId);
        if (tryfirst != null) {
            System.out.println("이미 신청한 상품입니다. wishlist에서 확인하실 수 있습니다.");
            model.addAttribute("errorMessage", "이미 신청한 상품입니다. wishlist에서 확인하실 수 있습니다.");
            return "redirect:/subscribe/view?id=" + subs.getId();
        }
        if(subs.getPeopleLimit()<=subs.getPeople()){
            System.out.println("신청이 만료되었습니다 ㅠ");
            model.addAttribute("errorMessage", "신청이 만료되었습니다 ㅠ");
            return "redirect:/subscribe/view?id=" + subs.getId();
        }

        subscribeService.incrementPeople(subsId);
        // JoinedItemVO 객체 생성 및 저장
        JoinedSubVO joinedSubVO = new JoinedSubVO();
        joinedSubVO.setUserVO(loggedInUser);
        joinedSubVO.setSubscribeVO(subs);

        joinedSubscribeService.addJoinedSubscribe(joinedSubVO);


        return "redirect:/subscribe/view?id=" + subs.getId();
    }
}
