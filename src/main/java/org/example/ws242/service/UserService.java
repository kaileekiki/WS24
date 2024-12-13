package org.example.ws242.service;

import org.example.ws242.dao.ItemDAO;
import org.example.ws242.dao.SubscribeDAO;
import org.example.ws242.dao.UserDAO;
import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.SubscribeVO;
import org.example.ws242.vo.UserDetailVO;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserDAO userDAO;

    @Autowired
    private ItemDAO itemDAO;
    @Autowired
    private SubscribeDAO subscribeDAO;

    public int addUser(UserVO user) {
        return userDAO.insertUser(user);
    }

    public int checkId(String id) {
        return userDAO.checkId(id);
    }

    public UserDetailVO getUserDetails(String userid) {
        return userDAO.getUserDetails(userid);
    }

    public List<ItemVO> getItemsByUserId(String userid) {
        return itemDAO.getItemsByUserId(userid);
    }

    public List<SubscribeVO> getSubscribesByUserId(String userid) {
        return subscribeDAO.getSubscribesByUserId(userid);
    }

}