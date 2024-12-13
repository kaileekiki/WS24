package org.example.ws242.controller;

import org.example.ws242.service.UserService;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserService userService;

    // 회원가입 폼 이동
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addUserForm() {
        return "adduser";
    }

    // 회원가입 처리
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute UserVO user) {
        userService.addUser(user);
        return "redirect:/login/login"; // 회원가입 후 로그인 페이지로 이동
    }
}
