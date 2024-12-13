//package org.example.ws242.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//@Controller
//@RequestMapping(value="/item")
//public class ItemController {
//    @Autowired
//    private BoardService boardService;
//    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
//    public String boardList(Model model) {
//        model.addAttribute("list", boardService.getBoardList());
//        return "posts";
//    }
//}
