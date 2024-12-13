package org.example.ws242.controller;

import org.example.ws242.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
