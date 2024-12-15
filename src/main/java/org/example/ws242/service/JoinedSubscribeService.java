package org.example.ws242.service;


import org.example.ws242.dao.JoinedItemDAO;
import org.example.ws242.dao.JoinedSubscribeDAO;
import org.example.ws242.vo.JoinedItemVO;
import org.example.ws242.vo.JoinedSubVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JoinedSubscribeService {

    @Autowired
    private JoinedSubscribeDAO joinedSubscribeDAO;

    public void addJoinedSubscribe(JoinedSubVO joinedSubVO) {
        joinedSubscribeDAO.insertJoinedSubscribe(joinedSubVO);
    }

    public JoinedSubVO getJoinSubscribeById(String userid, int subscribeid) {
        return joinedSubscribeDAO.getJoinSubscribeById(userid, subscribeid);
    }
    public List<JoinedSubVO> getAllJoinedSubscribes(String userId) {
        return joinedSubscribeDAO.getJoinedSubscribesByUserId(userId);
    }

}