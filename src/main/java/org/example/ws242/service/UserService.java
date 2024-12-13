package org.example.ws242.service;

import org.example.ws242.dao.UserDAO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserDAO userDAO;

    public int addUser(UserVO user) {
        return userDAO.insertUser(user);
    }

    public int checkId(String id) {
        return userDAO.checkId(id);
    }

}