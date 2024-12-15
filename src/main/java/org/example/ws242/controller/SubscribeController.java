package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.example.ws242.service.SubscribeService;
import org.example.ws242.vo.SubscribeVO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/subscribe")
public class SubscribeController {
    @Autowired
    private SubscribeService subscribeService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String subscribeList(Model model) {
        model.addAttribute("subscribelist", subscribeService.getSubscribeList());
        return "subslist";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewSubscribe(@RequestParam("id") int id, Model model) {
        // 구독 상품 ID로 조회
        SubscribeVO subscribe = subscribeService.getSubscribeById(id);
        model.addAttribute("subscribe", subscribe);
        return "viewsubs";  // 해당 상품의 상세 보기 페이지로 이동
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addSubsForm() {
        return "addsubs";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addSubscribe(SubscribeVO subscribe, @SessionAttribute(value = "login", required = false) UserVO loggedInUser) {
        if (loggedInUser == null) {
            // 로그인이 안 된 경우 처리 (예: 로그인 페이지로 리다이렉트)
            System.out.println("로그인이 필요합니다.");
            return "redirect:/login/login";
        }

        // 세션에서 user_id 설정
        subscribe.setUserVO(loggedInUser);

        // 구독 추가 처리
        int result = subscribeService.addSubscribe(subscribe);
        if (result > 0) {
            System.out.println("구독 추가 성공");
        } else {
            System.out.println("구독 추가 실패");
        }
        return "redirect:/subscribe/list"; // 구독 목록으로 이동
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteSubscribe(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        subscribeService.deleteSubscribe(id); // 삭제 처리
        redirectAttributes.addFlashAttribute("message", "구독 상품이 성공적으로 삭제되었습니다.");
        return "redirect:/mypage";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editSubscribeForm(@RequestParam("id") int id, Model model) {
        SubscribeVO subscribe = subscribeService.getSubscribeById(id);
        model.addAttribute("subscribe", subscribe);
        return "editSubscribeForm"; // JSP 파일로 연결
    }

    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editSubscribe(@ModelAttribute SubscribeVO subscribe) {
        subscribeService.updateSubscribe(subscribe);
        return "redirect:/mypage";
    }

}