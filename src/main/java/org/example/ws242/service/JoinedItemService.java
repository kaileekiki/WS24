package org.example.ws242.service;


import org.example.ws242.dao.JoinedItemDAO;
import org.example.ws242.dao.JoinedSubscribeDAO;
import org.example.ws242.vo.JoinedItemVO;
import org.example.ws242.vo.JoinedSubVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JoinedItemService  {

    @Autowired
    private JoinedItemDAO joinedItemDAO;
    @Autowired
    private JoinedSubscribeDAO joinedSubscribeDAO;

    public void addJoinedItem(JoinedItemVO joinedItem) {
        joinedItemDAO.insertJoinedItem(joinedItem);
    }

    public JoinedItemVO getJoinItemById(String userid, int itemid) {
        return joinedItemDAO.getJoinItemById(userid, itemid);
    }

    public List<JoinedItemVO> getJoinedItemsByUserId(String userid) {
        return joinedItemDAO.getJoinedItemsByUserId(userid);
    }



}