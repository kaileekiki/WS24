package org.example.ws242.service;


import org.example.ws242.dao.JoinedItemDAO;
import org.example.ws242.vo.JoinedItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinedItemService  {

    @Autowired
    private JoinedItemDAO joinedItemDAO;

    public void addJoinedItem(JoinedItemVO joinedItem) {
        joinedItemDAO.insertJoinedItem(joinedItem);
    }

    public JoinedItemVO getJoinItemById(String userid, int itemid) {
        return joinedItemDAO.getJoinItemById(userid, itemid);
    }

}