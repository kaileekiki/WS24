package org.example.ws242.service;

import org.example.ws242.dao.UserDetailDAO;
import org.example.ws242.vo.UserDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDetailService {

    @Autowired
    private UserDetailDAO userDetailDAO;

    public UserDetailVO getUserDetailByUserId(String userId) {
        return userDetailDAO.getUserDetailByUserId(userId);
    }

    public int insertUserDetail(UserDetailVO userDetail) {
        return userDetailDAO.insertUserDetail(userDetail);
    }
}
