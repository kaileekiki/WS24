package org.example.ws242.controller;

import org.example.ws242.service.JoinedItemService;
import org.example.ws242.service.ItemService;
import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.JoinedItemVO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Controller
@RequestMapping(value = "/joinitem")
public class JoinedItemController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private JoinedItemService joinedItemService;

    @PostMapping("/add")
    public String addJoinItem(@RequestParam("itemId") int itemId,
                              @SessionAttribute(value = "login", required = false) UserVO loggedInUser, Model model) {
        if (loggedInUser == null) {
            // 로그인하지 않은 경우
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }
        // 아이템 정보 조회
        ItemVO item = itemService.getItemById(itemId);
        if (item == null) {
            System.out.println("존재하지 않는 상품입니다.");

            return "redirect:/item/list";
        }

        if (Objects.equals(item.getUserVO().getUserid(), loggedInUser.getUserid())) {
            System.out.println("자신의 상품은 찜할 수 없습니다.");
            model.addAttribute("errorMessage", "자신의 상품은 찜할 수 없습니다.");
            return "redirect:/item/view?id=" + item.getId();
        }

        //중복신청 회피
        JoinedItemVO tryfirst =  joinedItemService.getJoinItemById(loggedInUser.getUserid(),itemId);
        if (tryfirst != null) {
            System.out.println("이미 신청한 상품입니다. 마이페이지에서 삭제하실 수 있습니다.");
            model.addAttribute("errorMessage", "이미 신청한 상품입니다. 마이페이지에서 삭제하실 수 있습니다.");
            return "redirect:/item/view?id=" + item.getId();
        }
        if(item.getPeopleLimit()<=item.getPeople()){
            System.out.println("신청이 만료되었습니다 ㅠ");
            model.addAttribute("errorMessage", "신청이 만료되었습니다 ㅠ");
            return "redirect:/item/view?id=" + item.getId();
        }

        itemService.incrementPeople(itemId);
        // JoinedItemVO 객체 생성 및 저장
        JoinedItemVO joinedItem = new JoinedItemVO();
        joinedItem.setUserVO(loggedInUser);
        joinedItem.setItemVO(item);

        joinedItemService.addJoinedItem(joinedItem);


        return "redirect:/item/view?id=" + item.getId();
    }
}
