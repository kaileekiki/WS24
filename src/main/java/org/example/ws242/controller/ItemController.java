package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.example.ws242.vo.ItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/item")
public class ItemController {
    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String itemList(Model model) {
        model.addAttribute("itemlist", itemService.getItemList());
        return "itemlist";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewItem(@RequestParam("id") int id, Model model) {
        // id에 해당하는 상품 정보를 가져와서 model에 담음
        ItemVO item = itemService.getItemById(id);
        model.addAttribute("item", item);  // 상품 상세 정보를 JSP로 전달
        return "viewitem";  // JSP의 viewitem.jsp로 이동
    }
}
