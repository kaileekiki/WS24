package org.example.ws242.controller;

import org.example.ws242.login.UserServiceImpl;
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
    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addUser(UserVO user) {

        int check = userService.checkId(user.getUserid());

        if (check == 0) {
            int result = userService.addUser(user);
            if (result == 0) {
                System.out.println("Adding post failed");
                return "redirect:/user/add";
            } else {
                System.out.println("Post added successfully");
                return "redirect:/login/login";
            }
        } else {
            System.out.println("이미 존재하는 id 입니다.");
            return "redirect:/user/add";
        }
    }
}
