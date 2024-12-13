package org.example.ws242.login;

import org.example.ws242.dao.UserDAO;
import org.example.ws242.service.UserService;
import org.example.ws242.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO userDAO;
    public UserVO getUser(UserVO vo) {
        return userDAO.getUser(vo);
    }

    @Override
    public void addUser(UserVO user) {
        userDAO.insertUser(user);
    }
}