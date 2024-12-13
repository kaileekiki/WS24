package org.example.ws242.service;

import org.example.ws242.dao.ItemDAO;
import org.example.ws242.dao.SubscribeDAO;
import org.example.ws242.vo.ItemVO;
import org.example.ws242.vo.SubscribeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubscribeService {

    @Autowired
    SubscribeDAO subscribeDAO;

    public List<SubscribeVO> getSubscribeList() {
        return subscribeDAO.getSubsList();
    }

    public SubscribeVO getSubscribeById(int id) {
        return subscribeDAO.getSubscribeById(id);
    }
}