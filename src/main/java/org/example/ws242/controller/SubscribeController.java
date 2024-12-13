package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.example.ws242.service.SubscribeService;
import org.example.ws242.vo.SubscribeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
}