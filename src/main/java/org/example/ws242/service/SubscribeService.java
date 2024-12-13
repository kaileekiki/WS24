package org.example.ws242.service;

import org.example.ws242.dao.SubscribeDAO;
import org.example.ws242.vo.SubscribeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubscribeService {
    @Autowired
    private SubscribeDAO subscribeDAO;

    public List<SubscribeVO> getSubscribeList() {
        return subscribeDAO.getSubsList();
    }

    public SubscribeVO getSubscribeById(int id) {
        return subscribeDAO.getSubscribeById(id);
    }

    // Retrieve subscriptions by user ID
    public List<SubscribeVO> getSubscribesByUserId(String userId) {
        return subscribeDAO.getSubscribesByUserId(userId);
    }
}
